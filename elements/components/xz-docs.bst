kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/po4a.bst
- components/doxygen.bst

depends:
- bootstrap-import.bst

config:
  build-commands: []
  install-commands:
  - |
    for makefile in $(find "%{build-dir}" -name Makefile); do
      dir="$(dirname "${makefile}")"
      if grep install-data-hook: "${makefile}"; then
        make -C "${dir}" install-data-hook DESTDIR="%{install-root}"
      fi
    done

(@):
- elements/include/xz-source.yml
