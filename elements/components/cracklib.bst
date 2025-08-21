kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/curl.bst

depends:
- bootstrap-import.bst

variables:
  autogen: |
    cd src
    autopoint -f
    cd m4
    echo EXTRA_DIST = *.m4 > Makefile.am
    cd ..
    autoreconf -f -v -i
  conf-cmd: src/configure
  conf-local: >-
    --without-python

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
- kind: git_repo
  url: github:cracklib/cracklib.git
  ref: v2.9.11-0-g4cf5125250c6325ef0a2dc085eabff875227edc3
