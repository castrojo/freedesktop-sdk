kind: autotools

build-depends:
- bootstrap/bootstrap.bst
- components/autoconf.bst

depends:
- bootstrap/bootstrap-base.bst
- components/openssl.bst

variables:
  install-conf: COMPILEALL_OPTS=-j1  # Used for deterministic compiling

config:
  install-commands:
  - |
    if [ -n "%{build-dir}" ]; then
    cd %{build-dir}
    fi
    %{make-install} %{install-conf} DESTSHARED=/usr/lib/python%{version_long}/lib-dynload

(@):
- elements/include/python3.yml
