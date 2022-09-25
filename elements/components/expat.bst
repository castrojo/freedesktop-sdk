kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libexpat.so'

  cpe:
    version-match: '(\d+)_(\d+)_(\d+)'

config:
  configure-commands:
  - |
    cd expat
    %{autogen}

  - |
    mkdir %{build-dir}
    cd %{build-dir}
    ../expat/%{configure}

sources:
- kind: git_tag
  url: github:libexpat/libexpat.git
  track: master
  ref: R_2_4_9-0-gd77291a4824d78e697c5dc2b8024fd65ab31e209
