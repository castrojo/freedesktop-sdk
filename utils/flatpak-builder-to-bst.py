#!/usr/bin/env python3

# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

# SPDX-FileCopyrightText: 2025-2026 Aleix Pol Gonzalez <aleix.pol@codethink.co.uk>
# SPDX-License-Identifier: MIT

import argparse
import json
import os
import shutil
import subprocess

import gi
import yaml

gi.require_version("Json", "1.0")
from gi.repository import (  # type: ignore[attr-defined] # noqa: E402, I001, RUF100
    GLib,
    Json,
)


class OurException(Exception):
    """Raised when we fail."""


output_dir = None
generating_id = None
flatpak_manifest_path = None
previously_built_modules = []
aliases = {}
runtime = None
sdk = None

CLEANUP_PLATFORM_DOMAIN_PREFIXES = {
    "/share/runtime/docs": "docs",
    "/share/runtime/locale": "locale",
}


def resolve_alias(url: str):
    for name, aliasUrl in aliases.items():
        if url.startswith(aliasUrl):
            return url.replace(aliasUrl, name + ":")
    return url


def archive_kind(url):
    if url.endswith(("zip", "7z")):
        return "zip"
    else:
        return "tar"


def relativise_path(path):
    gendir = os.path.dirname(flatpak_manifest_path)
    if gendir == "":
        return path
    flatpak_manifest_reldir = os.path.relpath(gendir, os.getcwd())
    return os.path.join(flatpak_manifest_reldir, path)


def cleanup_platform_split_rules(pattern):
    base = "%{prefix}" + pattern if pattern.startswith("/") else "**/" + pattern
    if any(char in pattern for char in "*?[]"):
        return [base]
    return [base, f"{base}/**"]


def append_split_rules(bst_data, domain, patterns):
    if not patterns:
        return

    split_rules = (
        bst_data.setdefault("public", {})
        .setdefault("bst", {})
        .setdefault("split-rules", {})
    )
    existing = split_rules.setdefault(domain, {"(>)": []})["(>)"]
    for pattern in patterns:
        for rule in cleanup_platform_split_rules(pattern):
            if rule not in existing:
                existing.append(rule)


def convert_source_to_bst(source, bst_data, name):
    source_type = source["type"]

    if source_type == "git":
        bstSource = None
        gitSource = None
        if "url" in source:
            gitSource = source["url"]
            bstSource = {"url": resolve_alias(gitSource)}
        elif "path" in source:
            gitSource = relativise_path(source["path"])
            bstSource = {"path": gitSource}
        else:
            raise ValueError("Unsupported git source: no url or path")

        if "branch" in source:
            bstSource.update({"kind": "git", "track": source["branch"]})
        elif "tag" in source:
            bstSource.update({"kind": "git", "track": source["tag"]})
        elif "commit" in source:
            bstSource.update(
                {"kind": "git_repo", "ref": source["commit"], "ref-format": "sha1"}
            )
        else:
            raise ValueError(f"Unsupported git source: {gitSource}")

        # provide the ref when available
        if "ref" not in bstSource:
            if "commit" in source:
                bstSource.update({"ref": source["commit"], "ref-format": "sha1"})
            else:
                ref = git_ls_remote(gitSource, bstSource.get("track", "HEAD"))
                bstSource.update({"ref": ref, "ref-format": "sha1"})

        bst_data["sources"].append(bstSource)
    elif source_type == "archive" and "url" in source:
        archive_url = source.get("url")
        checksum = source["sha256"]
        bst_source = {
            "kind": archive_kind(archive_url),
            "url": resolve_alias(archive_url),
            "ref": checksum,
        }
        if "dest" in source:
            bst_source["directory"] = source["dest"]
        bst_data["sources"].append(bst_source)
    elif source_type == "archive" and "path" in source:
        archive_path = relativise_path(source.get("path"))
        checksum = source["sha256"]
        bst_source = {
            "kind": archive_kind(archive_path),
            "path": archive_path,
            "ref": checksum,
        }
        if "dest" in source:
            bst_source["directory"] = source["dest"]
        bst_data["sources"].append(bst_source)

    elif source_type == "dir":
        local_dir = source["path"]
        bst_data["sources"].append(
            {"kind": "local", "path": relativise_path(local_dir)}
        )

    elif source_type == "patch":
        paths = []
        if "path" in source:
            paths.append(source["path"])
        if "paths" in source:
            paths.extend(source["paths"])
        for path in paths:
            bst_data["sources"].append({"kind": "patch", "path": relativise_path(path)})

    elif source_type == "shell":
        if "config" not in bst_data:
            bst_data["config"] = {"configure-commands": {"(>)": []}}
        bst_data["config"]["configure-commands"]["(>)"].extend(source["commands"])

    elif source_type == "script":
        moduleDir = os.path.join(output_dir, name)
        os.makedirs(moduleDir, exist_ok=True)
        dest = os.path.join(moduleDir, source.get("dest-filename", "autogen.sh"))
        with open(dest, "w", encoding="utf-8") as f:
            f.write("#!/bin/sh\n\n")
            for command in source["commands"]:
                f.write(command)
                f.write("\n")
        os.chmod(dest, 0o755)
        bst_data["sources"].append({"kind": "local", "path": dest})

    elif source_type == "file":
        if "path" in source:
            dest = relativise_path(source["path"])
            orig = dest
            if "dest-filename" in source:
                moduleDir = os.path.join(output_dir, name)
                os.makedirs(moduleDir, exist_ok=True)
                dest = os.path.join(moduleDir, source["dest-filename"])
                shutil.copy(orig, dest)

            bst_data["sources"].append({"kind": "local", "path": dest})
        elif "url" in source:
            bst_data["sources"].append(
                {"kind": "remote", "url": source["url"], "ref": source["sha256"]}
            )
        else:
            raise ValueError(f"Unsupported file source: {source_type}")
    elif source_type == "inline":
        moduleDir = os.path.join(output_dir, name)
        os.makedirs(moduleDir, exist_ok=True)
        source_dir = source.get("dest", "")
        dest_filename = source.get("dest-filename", None)
        dest = os.path.join(moduleDir, source_dir, dest_filename)
        os.makedirs(os.path.dirname(dest), exist_ok=True)
        with open(dest, "w", encoding="utf-8") as f:
            f.write(source["contents"])
        local_source = {"kind": "local", "path": dest}
        if source_dir:
            local_source["directory"] = source_dir
        bst_data["sources"].append(local_source)
    else:
        raise ValueError(f"Unsupported source type: {source_type}")


def read_args(bst_data, module, bs, prefix=""):
    name = ""
    match bs:
        case "cmake" | "cmake-ninja":
            name = "cmake-local"
        case "meson":
            name = "meson-local"
        case "autotools":
            name = "conf-local"

    if name and "config-opts" in module:
        if "variables" not in bst_data:
            bst_data["variables"] = {}
        args = " ".join(module.get("config-opts", []))
        if prefix == "" and "arch-" + name in bst_data["variables"]:
            args += " %{arch-" + name + "}"
        bst_data["variables"].update({prefix + name: args})


def bst_sort(bst_data):
    priority = ["kind", "build-depends", "depends", "runtime-depends", "variables"]

    def sort_key(key):
        if key in priority:
            return (
                priority.index(key),
                key,
            )  # give priority based on index in the list
        else:
            return (len(priority), key)  # everything else comes alphabetically

    return dict(sorted(bst_data.items(), key=lambda item: sort_key(item[0])))


skipModules = {}


def git_ls_remote(url, pattern):
    result = subprocess.run(
        ["git", "ls-remote", url, pattern], capture_output=True, text=True
    )

    if result.returncode != 0:
        raise OurException(f"Error: {result.stderr}")

    lines = result.stdout.strip().split("\n")
    if lines:
        sha = lines[0].split()[0].split("\t")[0]
        return sha
    else:
        raise OurException("Branch not found or invalid URL.")


def path_to_dict(path):
    if path.endswith(".json"):
        parser = Json.Parser()
        try:
            parser.load_from_file(path)
        except GLib.Error as err:
            print("Failed to load JSON Flatpak manifest:", err.message)
        return json.loads(Json.to_string(parser.get_root(), False))
    elif path.endswith((".yaml", ".yml")):
        with open(path, "r", encoding="utf-8") as inputFile:
            return yaml.safe_load(inputFile)
    else:
        raise OurException("Unknown format in", path)


def process_modules(flatpak_data):
    for _module in flatpak_data["modules"]:
        module = None
        if isinstance(_module, str):
            module = path_to_dict(relativise_path(_module))
        else:
            module = _module
        name = module["name"]
        if name in skipModules:
            previously_built_modules.append(skipModules[name])
            continue

        if "modules" in module:
            process_modules(module)

        bstFile = os.path.join(output_dir, f"{name}.bst")
        bst_data = {
            "build-depends": [sdk] + previously_built_modules,
            "sources": [],
            "environment": {
                "INSTALL_ROOT": "%{install-root}",
                "FLATPAK_DEST": "%{prefix}",
            },
        }

        if name == "os-release":
            bst_data["build-depends"].append(
                "freedesktop-sdk.bst:components/appstream.bst"
            )

        buildsystem = module.get("buildsystem")
        if "build-options" in module:
            mod = []
            if "arch" in module["build-options"]:
                for arch, elements in module["build-options"]["arch"].items():
                    stuff = {}
                    read_args(stuff, elements, buildsystem, "arch-")
                    if stuff:
                        mod.append({f"arch == '{arch}'": stuff})
                        for key in stuff["variables"]:
                            bst_data.update({"variables": {key: ""}})
            if len(mod) > 0:
                bst_data["(?)"] = mod

        match buildsystem:
            case "cmake" | "cmake-ninja":
                bst_data.update({"kind": "cmake"})
                read_args(bst_data, module, buildsystem)
            case "meson":
                bst_data.update({"kind": "meson"})
                read_args(bst_data, module, buildsystem)
            case "simple":
                bst_data.update(
                    {
                        "kind": "manual",
                        "config": {
                            "install-commands": module["build-commands"]
                            # 'strip-commands': [],
                        },
                        "variables": {"cwd": os.path.abspath(output_dir)},
                    }
                )
            case None | "autotools":
                bst_data.update({"kind": "autotools", "variables": {}})

                if module.get("no-autogen", False):
                    bst_data["variables"].update(
                        {"autogen": 'echo "echo $@" > configure; chmod +x configure'}
                    )

                if "subdir" in module:
                    bst_data["variables"].update({"command-subdir": module["subdir"]})

                read_args(bst_data, module, buildsystem)

                if not bst_data["variables"]:
                    del bst_data["variables"]
            case _:
                print("Unknown buildsystem", module.get("buildsystem"))

        if "sources" in module:
            for source in module["sources"]:
                if isinstance(source, str):
                    for included_source in path_to_dict(relativise_path(source)):
                        convert_source_to_bst(included_source, bst_data, name)
                else:
                    convert_source_to_bst(source, bst_data, name)

        for pattern in module.get("cleanup-platform", []):
            append_split_rules(
                bst_data,
                CLEANUP_PLATFORM_DOMAIN_PREFIXES.get(pattern, "devel"),
                [pattern],
            )

        append_split_rules(bst_data, "cleanup", module.get("cleanup", []))

        bst_data = bst_sort(bst_data)

        with open(bstFile, "w", encoding="utf-8") as f:
            f.write(f"# File generated by {os.path.basename(__file__)}\n\n")
            yaml.dump(
                bst_data,
                f,
                default_flow_style=False,
                sort_keys=False,
                allow_unicode=True,
            )
        previously_built_modules.append(f"{generating_id}/{name}.bst")


def generate_runtime_data(flatpak_data, name):
    postfix = "/%{arch}/" + flatpak_data["runtime-version"]
    runtime_data = {
        "kind": "flatpak_image",
        "config": {
            "directory": "%{prefix}",
            "exclude": ["debug", "docs", "locale"],
            "metadata": {
                "Runtime": {
                    "name": name,
                    "runtime": flatpak_data["runtime"] + postfix,
                    "sdk": flatpak_data["sdk"] + postfix,
                },
                "Environment": {},
            },
        },
    }

    for arg in flatpak_data["finish-args"]:
        if arg.startswith("--env="):
            env = arg.split("=")
            runtime_data["config"]["metadata"]["Environment"][env[1]] = env[2]

    for extension_name, extension in flatpak_data["add-extensions"].items():
        runtime_data["config"]["metadata"][f"Extension {extension_name}"] = extension
    return runtime_data


def generate_runtime(flatpak_data, output_dir):
    os.makedirs(output_dir, exist_ok=True)
    runtime_data = generate_runtime_data(flatpak_data, flatpak_data["id-platform"])
    runtime_data["build-depends"] = [
        "flatpak-images/platform-image.bst",
        "integration/platform-integration.bst",
        "freedesktop-sdk.bst:tests/check-dev-files.bst",
        "freedesktop-sdk.bst:tests/check-rpath.bst",
    ]
    with open(
        os.path.abspath(os.path.join(output_dir, "platform.bst")), "w", encoding="utf-8"
    ) as f:
        f.write(f"# File generated by {os.path.basename(__file__)}\n\n")
        yaml.dump(
            runtime_data,
            f,
            default_flow_style=False,
            sort_keys=False,
            allow_unicode=True,
        )

    runtime_data = generate_runtime_data(flatpak_data, generating_id)
    runtime_data["build-depends"] = [
        "flatpak-images/sdk-image.bst",
        "freedesktop-sdk.bst:integration/sdk-integration.bst",
        "freedesktop-sdk.bst:flatpak-images/copy-ld-debug.bst",
        "freedesktop-sdk.bst:integration/app-debug-link.bst",
    ]
    with open(os.path.abspath(output_dir + "/sdk.bst"), "w", encoding="utf-8") as f:
        f.write(f"# File generated by {os.path.basename(__file__)}\n\n")
        yaml.dump(
            runtime_data,
            f,
            default_flow_style=False,
            sort_keys=False,
            allow_unicode=True,
        )


def flatpak_ref(ref):
    result = subprocess.run(
        ["flatpak", "info", "-c", ref], capture_output=True, text=True
    )

    if result.returncode != 0:
        raise OurException(f"Error: {result.stderr}")

    lines = result.stdout.strip().split("\n")
    if lines:
        return lines[0]
    else:
        raise OurException("Branch not found or invalid URL.")


def generate_runtime_dependency(data, output_dir):
    platform_name = data["runtime"]
    platform_bst = os.path.join(output_dir, platform_name + ".bst")
    platform_version = data["runtime-version"]
    arch = "%{arch}"
    with open(platform_bst, "w", encoding="utf-8") as f:
        runtime_data = {
            "kind": "import",
            "sources": [
                {
                    "kind": "ostree",
                    "url": resolve_alias("https://dl.flathub.org/repo/"),
                    "track": f"runtime/{platform_name}/{arch}/{platform_version}",
                    "ref": flatpak_ref(f"runtime/{platform_name}//{platform_version}"),
                }
            ],
            # "runtime-depends": ["symlinks.bst"],
            "config": {"source": "/files", "target": "/usr"},
        }
        f.write(f"# File generated by {os.path.basename(__file__)}\n\n")
        yaml.dump(
            runtime_data,
            f,
            default_flow_style=False,
            sort_keys=False,
            allow_unicode=True,
        )
    sdk_name = data["sdk"]
    sdk_bst = os.path.join(output_dir, sdk_name + ".bst")
    with open(sdk_bst, "w", encoding="utf-8") as f:
        runtime_data = {
            "kind": "import",
            "sources": [
                {
                    "kind": "ostree",
                    "url": resolve_alias("https://flathub.org/repo/"),
                    "track": f"runtime/{sdk_name}/{arch}/{platform_version}",
                    "ref": flatpak_ref(f"runtime/{sdk_name}//{platform_version}"),
                }
            ],
            # "runtime-depends": ["symlinks.bst"],
            "config": {"source": "/files", "target": "/usr"},
        }

        f.write(f"# File generated by {os.path.basename(__file__)}\n\n")
        yaml.dump(
            runtime_data,
            f,
            default_flow_style=False,
            sort_keys=False,
            allow_unicode=True,
        )


def generate_bst(name, flatpak_data):
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    process_modules(flatpak_data)

    with open(name, "w", encoding="utf-8") as f:
        f.write(f"# File generated by {os.path.basename(__file__)}\n\n")
        data = {
            "kind": "stack",
            "description": f"Build all modules from {flatpak_manifest_path} in {output_dir}/",
            "depends": [sdk] + previously_built_modules,
        }
        yaml.dump(
            data, f, default_flow_style=False, sort_keys=False, allow_unicode=True
        )


def generate_cleanup_platform_split_rules(flatpak_data, generating_id):
    split_rules = {}
    if flatpak_data.get("cleanup", []):
        existing = split_rules.setdefault("cleanup", [])
        for pattern in flatpak_data.get("cleanup", []):
            for rule in cleanup_platform_split_rules(pattern):
                if rule not in existing:
                    existing.append(rule)
    for pattern in flatpak_data.get("cleanup-platform", []):
        domain = CLEANUP_PLATFORM_DOMAIN_PREFIXES.get(pattern, "devel")
        if domain == "devel":
            continue
        existing = split_rules.setdefault(domain, [])
        for rule in cleanup_platform_split_rules(pattern):
            if rule not in existing:
                existing.append(rule)

    with open(f"include/{generating_id}-split-rules.yml", "w", encoding="utf-8") as f:
        f.write(f"# File generated by {os.path.basename(__file__)}\n\n")
        yaml.dump(
            split_rules,
            f,
            default_flow_style=False,
            sort_keys=False,
            allow_unicode=True,
        )


def resolve_sdk(dep):
    if dep == "org.freedesktop.Sdk":
        return "freedesktop-sdk.bst:sdk.bst"
    else:
        return f"{dep}.bst"


def resolve_platform(dep):
    if dep == "org.freedesktop.Platform":
        return "freedesktop-sdk.bst:platform.bst"
    else:
        return f"{dep}.bst"


def generate_app(data, generating_id):
    with open(
        os.path.join("elements", generating_id + ".flatpak_image.bst"),
        "w",
        encoding="utf-8",
    ) as f:
        f.write(f"# File generated by {os.path.basename(__file__)}\n\n")
        bst_data = {
            "kind": "flatpak_image",
            "build-depends": [f"{generating_id}.bst"],
            "config": {
                "directory": "%{prefix}",
                "metadata": {
                    "Application": {
                        "name": f"{generating_id}",
                        "runtime": data["runtime"]
                        + "/%{arch}/"
                        + data["runtime-version"],
                        "sdk": data["sdk"] + "/%{arch}/" + data["runtime-version"],
                        "command": f"{data['command']}",
                    },
                    "Context": {},
                    "Environment": {},
                },
            },
        }
        ctx = {}
        key_mapping = {
            "share": ("shared", True),
            "unshare": ("shared", False),
            "socket": ("sockets", True),
            "nosocket": ("sockets", False),
            "filesystem": ("filesystems", True),
            "nofilesystem": ("filesystems", False),
            "persist": ("persistent", True),
            "device": ("devices", True),
            "nodevice": ("devices", False),
            "allow": ("features", True),
            "disallow": ("features", False),
            "unset-env": ("unset-environment", True),
        }
        for item in data["finish-args"]:
            key, value = item.removeprefix("--").split("=", maxsplit=1)
            if key == "env":
                name, content = value.split("=", maxsplit=1)
                bst_data["config"]["metadata"]["Environment"][name] = content
            if key not in key_mapping:
                print(f"Error analysing 'finish-args': {key}")
            else:
                mapped, add = key_mapping[key]
                val = ctx.get(mapped, "")
                if add:
                    val += value + ";"
                else:
                    val.replace(value + ";", "")
                ctx[mapped] = val

        bst_data["config"]["metadata"]["Context"] = ctx

        yaml.dump(
            bst_data, f, default_flow_style=False, sort_keys=False, allow_unicode=True
        )


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Generates BuildStream recipes out of flatpak-builder ones."
    )

    parser.add_argument("file", type=str, help="The file to process.")
    parser.add_argument(
        "--aliases",
        help="The file that specifies the aliases entry, e.g. include/aliases.yml",
    )
    parser.add_argument(
        "--skip",
        help="A yaml file with flatpak module names as key and the bst counter-part to use as the values",
    )
    args = parser.parse_args()
    flatpak_manifest_path = args.file
    if args.aliases:
        with open(args.aliases, "r", encoding="utf-8") as inputFile:
            aliasesData = yaml.safe_load(inputFile)

        if isinstance(aliasesData, dict):
            if "aliases" in aliasesData and isinstance(aliasesData["aliases"], dict):
                aliases = aliasesData["aliases"]
            else:
                aliases = aliasesData

    if args.skip:
        with open(args.skip, "r", encoding="utf-8") as inputFile:
            skipModules = yaml.safe_load(inputFile)
    data = path_to_dict(flatpak_manifest_path)
    generating_id = data.get("id") or data.get("app-id")
    filename = os.path.join("elements", generating_id + ".bst")
    output_dir = os.path.join("elements", generating_id)
    sdk = resolve_sdk(data["sdk"])
    runtime = resolve_platform(data["runtime"])
    generate_bst(filename, data)
    generate_cleanup_platform_split_rules(data, generating_id)
    if "base" in data:
        print("Bringing base apps is not yet supported")
    if "add-build-extensions" in data:
        print("Bringing build extensions is not yet supported")
    if "sdk-extensions" in data:
        print("Bringing SDK extensions is not yet supported")

    if data.get("build-runtime", False):
        generate_runtime(data, output_dir + "/flatpak-images/")
        with open(
            os.path.join("elements", data["id-platform"] + ".bst"),
            "w",
            encoding="utf-8",
        ) as f:
            f.write(f"# File generated by {os.path.basename(__file__)}\n\n")
            platform_data = {
                "kind": "stack",
                "description": f"Runtime representation of {runtime}",
                "depends": [runtime] + previously_built_modules,
            }
            yaml.dump(
                platform_data,
                f,
                default_flow_style=False,
                sort_keys=False,
                allow_unicode=True,
            )
    elif data.get("build-extension", False):
        print("Building extensions is not yet supported")
    elif ":" not in sdk:
        # only pull the runtime from flathub if we're not building it here already
        if not os.path.exists(os.path.join("elements", sdk)):
            generate_runtime_dependency(data, "elements")
        generate_app(data, generating_id)
