from ast import mod
from pathlib import Path
import logging

defconfig_file = Path("starfive_visionfive2_defconfig")
fdsdk_file = Path("fdsdk-config.sh")

with defconfig_file.open() as f:
    defconfig_data = f.readlines()

defconfig = {}
for line in defconfig_data:
    if line.startswith("CONFIG"):
        (key,value) = line.strip().removeprefix("CONFIG_").split("=", maxsplit=1)
        defconfig[key]=value
    elif line.startswith("# CONFIG"):
        (key,value) = line.strip().removeprefix("# CONFIG_").split(" ", maxsplit=1)
        defconfig[key]=None
    else:
        logging.warning(f"Line not processed {line}")

with fdsdk_file.open() as f:
    fdsdk_data= f.readlines()

fdsdk = {}
for line in fdsdk_data:
    line = line.strip()
    if line.startswith("module"):
        key = line.removeprefix("module ")
        fdsdk[key] = "m"
    elif line.startswith("enable"):
        key = line.removeprefix("enable ")
        fdsdk[key] = "y"
    elif line.startswith("value_str"):
        (key,value) = line.removeprefix("value_str ").split(" ", maxsplit=1)
        fdsdk[key] = value
    elif line.startswith("remove"):
        key = line.removeprefix("remove ")
        logging.warning(f"What do I do with remove: {key}")
    else:
        pass # Hopefully nothing else is important

new = set()
for (key, value) in defconfig.items():
    if key not in fdsdk and value is not None:
        new.add(key)

new = list(new)
new.sort()
for key in new:
    print("enable" if defconfig[key] == "y" else "module" if defconfig[key] == "m" else "value_str", key, (defconfig[key] if defconfig[key] not in ["m","y"] else ""))

print(len(new))
