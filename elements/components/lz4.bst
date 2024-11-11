kind: make

depends:
- bootstrap-import.bst

variables:
  make-args: >-
    PREFIX="%{prefix}"
    LIBDIR="%{libdir}"
    CFLAGS="${CFLAGS}"
    BUILD_STATIC=no
  make-install: make %{make-args} DESTDIR="%{install-root}" install

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/liblz4.so'

  cpe:
    vendor: lz4_project

sources:
- kind: git_repo
  url: github:lz4/lz4.git
  track: v1.9.*
  ref: v1.9.4-0-g5ff839680134437dbf4678f3d0c7b371d84f4964
