kind: autotools

build-depends:
- bootstrap/base-sdk/base-sdk.bst
- bootstrap/build/python3.bst
- bootstrap/gnu-config.bst

(@):
- elements/bootstrap/include/build.yml
- elements/bootstrap/include/glibc-source.yml

variables:
  prefix: /glibc
  sysconfdir: /glibc/etc
  localstatedir: /glibc/var

  conf-local: |
    --disable-werror

config:
  install-commands:
    (>):
    - |
      rm -r "%{install-root}%{libexecdir}/getconf"

    - |
      rm "%{install-root}%{infodir}/dir"
