#!/bin/bash

# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

set -eu

# This scans for symbolic link .so libraries that have a SONAME which
# is not the name of the symbolic link. Those files should not appear in
# platform runtimes, only in SDKs.

command -v objdump > /dev/null || { echo >&2 "objdump not found"; exit 1; }

find "$1" -type l -name "lib*.so" -print0 |
while IFS= read -r -d '' file; do
    dirname="$(dirname "${file}")"
    basedir="$(basename "${dirname}")"
    if [ "${basedir}" = engines-3 ]; then
        continue
    fi
    if [ "${basedir}" = sasl2 ]; then
        continue
    fi
    if [ "${basedir}" = vdpau ]; then
        continue
    fi
    basename="$(basename "${file}")"
    soname="$(objdump -p "${file}" | sed "/ *SONAME */{;s///;q;};d")"
    if [ -n "${soname}" ] && [ "x${soname}" != "x${basename}" ]; then
        realpath -s --relative-to="$1" "${file}"
    fi
done

# "*.pc" and "usr/bin/*-config" scan for pkgconfig files left in the platform.
# This happens when an element installs them in the wrong directory (e.g !488)

# "*.h" and "${1}/usr/include" scan for C/C++ library headers left in the
# platform. This happens when an element incorrectly modifies its split-rules
# (e.g !502)

# The rest scan for miscellaneous development files spread all over the runtime

find "$1" \
        -not \( -path "${1}/usr/lib/debug" -prune \) \
        -not \( -path "${1}/usr/share/runtime/docs/doc" -prune \) \
        -not \( -path "${1}/usr/share/gettext" -prune \) \
        -not -path "${1}/var/db/Makefile" \
        \( -path "${1}/usr/bin/*-config" \
           -o -path "${1}/usr/include/*" \
           -o -name "*.h" \
           -o -name "*.pc" \
           -o -name "*.o" \
           -o -name "*.c" \
           -o -name "*.spec" \
           -o -name "*.supp" \
           -o -name "Makefile*" \
           -o -name "*.cmake" \)
