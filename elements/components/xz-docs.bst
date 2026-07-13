# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

(@):
- elements/include/xz-source.yml

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/po4a.bst
- components/doxygen.bst

depends:
- public-stacks/runtime-minimal.bst

config:
  build-commands: []
  install-commands:
  - |
    make -C %{build-dir}/src/liblzma/api install-data-local DESTDIR="%{install-root}"
    for makefile in $(find "%{build-dir}" -name Makefile); do
      dir="$(dirname "${makefile}")"
      if grep install-data-hook: "${makefile}"; then
        make -C "${dir}" install-data-hook DESTDIR="%{install-root}"
      fi
    done
