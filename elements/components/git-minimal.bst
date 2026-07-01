kind: meson

(@):
- elements/include/git.yml

build-depends:
- components/gcc.bst
- components/stripper.bst
- components/gettext.bst
- components/grep.bst
- components/meson.bst
- components/ninja.bst
- components/pkg-config.bst
- components/sed.bst
- components/tar.bst

depends:
- bootstrap/zlib.bst
- public-stacks/runtime-minimal.bst

variables:
  meson-local: >-
    -Dauto_features=disabled
    -Dtests=false
    -Dcurl=disabled
    -Drust=disabled

config:
  install-commands:
  - |
    cd %{build-dir}
    install -m 755 -D -t "%{install-root}%{bindir}" git
  - |
    %{install-extra}

public:
  cpe:
    vendor: git-scm
