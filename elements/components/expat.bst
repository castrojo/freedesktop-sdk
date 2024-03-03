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
  track: R_2_5_*
  ref: R_2_5_0-0-g654d2de0da85662fcc7644a7acd7c2dd2cfb21f0
