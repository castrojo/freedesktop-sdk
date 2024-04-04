kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

config:
  configure-commands:
    (<):
    - |
      cp gnulib/build-aux/{install-sh,mkinstalldirs,compile,ar-lib} build-aux/

    #FIXME: Explain *why* we cannot build the docs.
    # We need this hack to not build the docs
    - |
      sed -i 's/AC_CONFIG_SUBDIRS(\[lib src tests doc\])/AC_CONFIG_SUBDIRS(\[lib src tests\])/' configure.ac
      #FIXME: Use a patch
      sed -i '45d;46d;47d;48d;49d' configure.ac

sources:
- kind: git_repo
  url: savannah:gperf.git
  track: v*
  ref: v3.1-0-g165bba235b2e3289967e505411500e08151f63e9
- kind: git_repo
  url: savannah:gnulib.git
  directory: gnulib
  ref: v0.1-2785-gc01635497d830f181a2607279135b3fff041b936
