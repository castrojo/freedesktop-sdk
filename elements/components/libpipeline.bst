kind: autotools

depends:
- public-stacks/runtime-minimal.bst
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
  exclude:
  - "*-pre*"
  # legacy weird tags
  - "2.*"
  ref: 1.5.8-0-gdd37cf76496b4b999509bd133657c1fc021e3a5f
- kind: git_repo
  url: savannah:gnulib.git
  directory: gnulib-src
  # Track the exact commit from variable GNULIB_REVISION in bootstrap.conf
  ref: v1.0-487-g0ba13435a9362bec0ff5fd0830907b9fac723e41
