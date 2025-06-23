kind: autotools-recc

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/docbook-xsl.bst
- components/libxslt.bst
- components/systemd.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst

variables:
  autogen: autoreconf -ivf -I %{datadir}/gettext/m4
  conf-link-args: ''

sources:
- kind: git_repo
  url: freedesktop:xdg/xdg-user-dirs.git
  track: 'v*.*'
  ref: v0.19-0-g0577968675b9d7d660b3715cf6b2e00c6d491d67
- kind: patch
  path: patches/xdg-user-dirs/gettext.patch
