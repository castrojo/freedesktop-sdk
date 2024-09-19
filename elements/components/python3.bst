kind: filter

build-depends:
- components/python3-base.bst

runtime-depends:
- bootstrap-import.bst
- components/expat.bst
- components/libffi.bst
- components/gdbm.bst
- components/openssl.bst
- components/sqlite.bst
- components/python3-manifest.bst

(@):
- elements/include/python3-variables.yml

variables:
  # Upstream default is -O3 and we should not override this
  local_flags: "-O3"

config:
  exclude:
  - tkinter
  
  include-orphans: True

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/2to3*'
        - '%{bindir}/python%{version_short}-config'
        - '%{bindir}/python%{version_long}-config'
        - '%{libdir}/libpython%{version_long}.so'
        - '%{indep-libdir}/python%{version_long}/lib2to3'
        - '%{indep-libdir}/python%{version_long}/lib2to3/**'