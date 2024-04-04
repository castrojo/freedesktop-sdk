kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/gdbm.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/git-minimal.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpipeline.so'

variables:
  autogen: ./bootstrap --no-git --gnulib-srcdir=gnulib-src

sources:
- kind: git_repo
  url: gitlab:libpipeline/libpipeline.git
  track: '*.*.*'
  ref: 1.5.7-0-gc9662e67d575299df2b87bc70f0e4865f04a8f01
- kind: git_repo
  url: savannah:gnulib.git
  # Use the exact commit from variable GNULIB_REVISION in bootstrap.conf
  directory: gnulib-src
  ref: 1eae0f7ea3c220d054025f2c9211700665f9f4a0
