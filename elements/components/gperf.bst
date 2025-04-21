kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

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
  ref: v0.1-2785-gc01635497d830f181a2607279135b3fff041b936
- kind: patch
  path: patches/gperf/disable-tests.patch
- kind: patch
  path: patches/gperf/partial-doc.patch
