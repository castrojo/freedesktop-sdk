kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  conf-link-args: ''
  conf-local: >-
    --disable-documentation

sources:
- kind: git_repo
  url: freedesktop:xdg/xdg-user-dirs.git
  track: '*.*'
  ref: 0.18-0-g52e71ff04416f2ca3adaf6d73193de4b8b83de46
