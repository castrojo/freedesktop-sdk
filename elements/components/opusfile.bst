kind: autotools

depends:
- bootstrap-import.bst
- components/opus.bst
- components/libogg.bst
- components/openssl.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/git-minimal.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libopusfile.so'
        - '%{libdir}/libopusurl.so'
  cpe:
    patches:
    - CVE-2022-47021

sources:
- kind: git_tag
  url: xiph:opusfile.git
  track: master
  ref: v0.12-0-ga55c164e9891a9326188b7d4d216ec9a88373739
- kind: patch
  path: patches/opusfile/CVE-2022-47021.patch
