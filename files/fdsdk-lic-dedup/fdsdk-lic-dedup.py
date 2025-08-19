#!/usr/bin/env python3

import argparse
import hashlib
import logging
import os
import shutil


def compute_license_hashes(license_dir: str, common_dir: str) -> dict[str, list[str]]:
    hash_map: dict[str, list[str]] = {}

    for dirpath, _, files in os.walk(license_dir):
        for file in files:
            file_path = os.path.realpath(os.path.join(dirpath, file))

            if os.path.commonpath([file_path, common_dir]) == common_dir:
                continue

            try:
                with open(file_path, "rb") as f:
                    content = f.read()
                h = hashlib.sha256(file.encode("utf-8") + content).hexdigest()
            except (OSError, FileNotFoundError, PermissionError) as err:
                logging.warning(
                    "Unexpected error while computing hash of %s: %s", file_path, err
                )
                continue

            hash_map.setdefault(h, []).append(file_path)

    if not any(len(files) > 1 for files in hash_map.values()):
        logging.warning(
            "No duplicate license files found. There is nothing to deduplicate"
        )
        return {}

    return hash_map


def deduplicate_licenses(
    hash_dict: dict[str, list[str]], common_dir: str, dry_run: bool = False
) -> bool:
    if not hash_dict:
        logging.warning("The license file hash dict is empty")
        return True

    total_bytes_saved = 0

    try:
        if not dry_run:
            os.makedirs(common_dir, exist_ok=True)
        for h, files in sorted(hash_dict.items()):
            files.sort()
            if len(files) > 1:
                src_file = files[0]
                dest_file = os.path.join(common_dir, f"LICENSE_{h[:12]}")
                if not dry_run:
                    shutil.move(src_file, dest_file)
                    logging.info("Moved %s to %s", src_file, dest_file)

                for f in files:
                    if os.path.exists(f):  # files[0] dosn't exist since it was moved
                        total_bytes_saved += os.path.getsize(f)
                        if not dry_run:
                            os.remove(f)
                    if not dry_run:
                        os.symlink(dest_file, f)
                        logging.info("Created symlink from %s to %s", f, dest_file)

        mb_saved = total_bytes_saved / (1024 * 1024)
        logging.info("Space saved by deduplicating license files: %.2f MB", mb_saved)
        return True
    except (OSError, FileNotFoundError, shutil.Error, PermissionError) as err:
        logging.error("Unexpected error while deduplicating: %s", err)
        return False


def cleanup_unused_licenses(license_dir: str, common_dir: str) -> bool:
    referenced_files = set()

    if not (os.path.isdir(license_dir) and os.path.isdir(common_dir)):
        logging.error(
            "License directory or common directory does not exist while cleanup"
        )
        return False

    try:
        for dirpath, _, files in os.walk(license_dir):
            for file in files:
                file_path = os.path.join(dirpath, file)
                if os.path.islink(file_path):
                    real_path = os.path.realpath(file_path)
                    if (
                        os.path.exists(real_path)
                        and os.path.commonpath([real_path, common_dir]) == common_dir
                    ):
                        referenced_files.add(real_path)

        for file in os.listdir(common_dir):
            file_path = os.path.join(common_dir, file)
            if os.path.isfile(file_path) and file_path not in referenced_files:
                os.remove(file_path)
                logging.info(
                    "Cleaned up unused file from common directory %s", file_path
                )

        for dirpath, _, files in os.walk(license_dir):
            for file in files:
                file_path = os.path.join(dirpath, file)
                if os.path.islink(file_path):
                    real_path = os.path.realpath(file_path)
                    if not os.path.exists(real_path):
                        os.remove(file_path)
                        logging.info("Cleaned up dangling symlink %s", file_path)

    except (OSError, FileNotFoundError, PermissionError) as err:
        logging.error("Unexpected error while cleanup: %s", err)
        return False

    return True


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Deduplicate license files", usage=argparse.SUPPRESS, add_help=False
    )
    parser.add_argument(
        "-h", "--help", action="help", help="Show this help message and exit"
    )
    parser.add_argument(
        "--usr-root", type=str, default="/usr", help="Root path (default: /usr)"
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Do not modify the filesystem, just report space that would be saved",
    )
    args = parser.parse_args()

    logging.basicConfig(level=logging.INFO, format="%(levelname)s: %(message)s")

    license_dir = os.path.join(args.usr_root, "share", "licenses")
    common_dir = os.path.join(license_dir, "common")

    if not os.path.isdir(license_dir):
        logging.error("The license directory does not exist: %s", license_dir)
        return 1

    if not deduplicate_licenses(
        compute_license_hashes(license_dir, common_dir),
        common_dir,
        dry_run=args.dry_run,
    ):
        logging.error("Deduplication encountered errors")
        return 1

    if not (args.dry_run or cleanup_unused_licenses(license_dir, common_dir)):
        return 1

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
