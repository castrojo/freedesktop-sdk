kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/curl.bst

depends:
- bootstrap-import.bst

variables:
  conf-local: >-
    --without-python

config:
  configure-commands:
  - |
    cd src
    autopoint -f
    cd m4
    echo EXTRA_DIST = *.m4 > Makefile.am
    cd ..
    autoreconf -f -v -i

  - |
    mkdir build
    cd build
    ../src/%{configure}

  build-commands:
  - |
    cd build
    %{make}

  install-commands:
  - |
    cd build
    %{make-install}

  - |
    %{delete_libtool_files}

public:
  bst:
    integration-commands:
    - |
      rm -f "%{datadir}/cracklib/pw_dict"{,.pwd,.pwi}
      "%{sbindir}/create-cracklib-dict" -o "%{datadir}/cracklib/pw_dict" "%{datadir}/cracklib/cracklib-small"

    split-rules:
      devel:
        (>):
        - '%{libdir}/libcrack.so'

sources:
- kind: git_tag
  url: github:cracklib/cracklib.git
  track: master
  ref: v2.9.8-0-gd9e8f9f47718539aeba80f90f4e072549926dc9c
