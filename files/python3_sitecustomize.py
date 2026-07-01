# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

import sys
import sysconfig

fmt = "/app/{platlibdir}/python{py_version_short}/site-packages"
path = fmt.format(**sysconfig.get_config_vars())

for position, item in enumerate(sys.path):  # noqa: B007
    if item.startswith(sys.base_prefix) and item.endswith("site-packages"):
        break
else:
    position = -1

sys.path.insert(position, path)
