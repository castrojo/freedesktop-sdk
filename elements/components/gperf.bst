kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  autogen: autoreconf -ivf

config:
  configure-commands:
    (<):
    - |
      cp gnulib/build-aux/{install-sh,mkinstalldirs,compile,ar-lib} build-aux/
      cp -v gnulib/lib/filename.h %{build-root}/src/filename.h

sources:
- kind: git_repo
  url: savannah:gperf.git
  track: v*
  ref: v3.3-0-gd2aeec9b9c1fd04dbf747afe4ada8e772d315ccd
- kind: git_repo
  url: savannah:gnulib.git
  directory: gnulib
  ref: v1.0-1692-gff657b72826c90b7a0247156c302d3600f9f2594
- kind: patch
  path: patches/gperf/disable-tests.patch
- kind: patch
  path: patches/gperf/partial-doc.patch
