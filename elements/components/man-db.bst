kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/git-minimal.bst
- components/flex.bst
- components/systemd.bst

depends:
- public-stacks/runtime-minimal.bst
- components/less.bst
- components/groff.bst
- components/libpipeline.bst
- components/libseccomp.bst
- components/gzip.bst
- components/lzip.bst
# Uses the `col` program
- components/util-linux.bst

variables:
  autogen: ./bootstrap --skip-po --no-git --gnulib-srcdir=%{build-root}/gnulib
  conf-local: >-
    --disable-cache-owner

config:
  configure-commands:
    (<):
    - |
      set -eu
      GNULIB_REV_NEEDED=$(XGETTEXT_OPTIONS= . %{build-root}/bootstrap.conf; echo "$GNULIB_REVISION")
      GNULIB_REV_FOUND=$(git -C gnulib rev-parse HEAD)
      if [ "$GNULIB_REV_NEEDED" != "$GNULIB_REV_FOUND" ]; then
        echo "Error: GNULIB revision mismatch!"
        echo "Needed: $GNULIB_REV_NEEDED"
        echo "Found:  $GNULIB_REV_FOUND"
        exit 1
      fi

sources:
- kind: git_repo
  url: gitlab:man-db/man-db.git
  track: '*.*.*'
  ref: 2.13.1-0-g349ce503a3594b91ad08229f83a0015fe4595ddc
- kind: git_module
  url: savannah:gnulib.git
  path: gnulib
  ref: 0ba13435a9362bec0ff5fd0830907b9fac723e41
