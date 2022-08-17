kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

variables:
  # Using build-dir is documented not to be supported. Don't try.
  command-subdir: ''
  notparallel: true

sources:
- kind: tar
  url: tar_https:www.jedsoft.org/releases/slang/slang-2.3.2.tar.bz2
  ref: fc9e3b0fc4f67c3c1f6d43c90c16a5c42d117b8e28457c5b46831b8b5d3ae31a
