kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/docbook-xsl.bst
- components/libxslt.bst
- components/systemd.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  autogen: autoreconf -ivf -I %{datadir}/gettext/m4
  conf-link-args: ''

sources:
- kind: git_repo
  url: freedesktop:xdg/xdg-user-dirs.git
  track: 'v*.*'
  ref: v0.20-0-gcd05b6d29da1abdb3cd253ef496ae7fd1593e4bb
- kind: patch
  path: patches/xdg-user-dirs/gettext.patch
