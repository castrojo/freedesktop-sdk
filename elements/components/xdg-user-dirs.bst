kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/docbook-xsl.bst
- components/libxslt.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  autogen: autoreconf -ivf
  conf-link-args: ''

sources:
- kind: git_repo
  url: freedesktop:xdg/xdg-user-dirs.git
  track: '*.*'
  ref: 0.18-0-g52e71ff04416f2ca3adaf6d73193de4b8b83de46
- kind: patch
  path: patches/xdg-user-dirs/gettext.patch
