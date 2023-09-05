kind: autotools

depends:
- public-stacks/runtime-minimal.bst
- filename: components/hunspell.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libmythes-1.2.so'

sources:
- kind: git_repo
  url: github:hunspell/mythes.git
  track: v*
  ref: v1.2.5-0-g289a66571116dcc68346864de7492a55752e26ec
