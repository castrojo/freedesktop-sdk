import argparse
import compileall
import os
import shutil
import sysconfig

parser = argparse.ArgumentParser()
parser.add_argument("--destdir", required=True)
parser.add_argument("wheels", nargs="+")

if __name__ == "__main__":
    site_packages = sysconfig.get_path("purelib").lstrip("/")
    arguments = parser.parse_args()
    full_path = os.path.join(arguments.destdir, site_packages)
    for wheel in arguments.wheels:
        shutil.unpack_archive(wheel, full_path, "zip")
    compileall.compile_dir(full_path, optimize=(0, 1, 2))
