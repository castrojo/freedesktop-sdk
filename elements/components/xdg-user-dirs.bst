kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  conf-link-args: ''
  conf-local: |
    --disable-documentation
  make-args: SUBDIRS=po

sources:
- kind: git_tag
  url: freedesktop:xdg/xdg-user-dirs.git
  track: master
  ref: 0.17-0-gec015cdd345dec8025948533e7a6f18680e7f70c
