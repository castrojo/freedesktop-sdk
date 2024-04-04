kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  conf-link-args: ''
  conf-local: |
    --disable-documentation

config:
  build-commands:
  - |
    cd "%{build-dir}"
    %{make} SUBDIRS=po

  install-commands:
  - |
    cd "%{build-dir}"
    %{make-install} SUBDIRS=po

sources:
- kind: git_repo
  url: freedesktop:xdg/xdg-user-dirs.git
  track: '*.*'
  ref: 0.17-0-gec015cdd345dec8025948533e7a6f18680e7f70c
