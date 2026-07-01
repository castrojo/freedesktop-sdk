kind: meson

(@):
- elements/include/git.yml

build-depends:
- components/_private/meson.bst
- components/expat.bst
- components/gcc.bst
- components/gettext.bst
- components/grep.bst
- components/ninja.bst
- components/openssl.bst
- components/pkg-config.bst
- components/_private/python3-minimal.bst
- components/sed.bst
- components/stripper.bst
- components/tar.bst

depends:
- bootstrap/zlib-ng.bst
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
