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
  ref: 0.18-0-g52e71ff04416f2ca3adaf6d73193de4b8b83de46
