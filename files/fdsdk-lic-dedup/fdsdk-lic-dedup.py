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

    return hash_map


def deduplicate_licenses(
    hash_dict: dict[str, list[str]], common_dir: str, dry_run: bool = False
) -> bool:
    if not hash_dict:
        logging.warning("The license file hash dict is empty")
        return True

    if not dry_run:
        try:
            if os.path.exists(common_dir):
                try:
                    shutil.rmtree(common_dir)
                except (OSError, PermissionError) as err:
                    logging.error("Failed to remove %s: %s", common_dir, err)
                    return False
            os.makedirs(common_dir)
        except PermissionError as err:
            logging.error("No permission to create %s: %s", common_dir, err)
            return False

    total_bytes_saved = 0

    try:
        for h, files in hash_dict.items():
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

    hash_dict = compute_license_hashes(license_dir, common_dir)

    if not deduplicate_licenses(hash_dict, common_dir, dry_run=args.dry_run):
        logging.error("Deduplication encountered errors")
        return 1

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
