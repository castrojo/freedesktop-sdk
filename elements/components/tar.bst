kind: autotools

build-depends:
- bootstrap/gawk.bst
- bootstrap/gcc.bst
- bootstrap/grep.bst
- bootstrap/make.bst
- bootstrap/sed.bst
- bootstrap/stripper.bst

depends:
- public-stacks/runtime-minimal.bst

(@):
- elements/include/tar-source.yml
