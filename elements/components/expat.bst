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
- kind: git_repo
  url: github:libexpat/libexpat.git
  track: R_*
  ref: R_2_6_0-0-g849da3e3fe727fccef5e96ef35482d66447f06a2
