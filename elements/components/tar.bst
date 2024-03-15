kind: autotools

depends:
- filename: bootstrap-import.bst

environment:
  FORCE_UNSAFE_CONFIGURE: '1'

public:
  cpe:
    patches:
    - CVE-2022-48303

sources:
- kind: tar
  url: ftp_gnu_org:tar/tar-1.34.tar.xz
  ref: 63bebd26879c5e1eea4352f0d03c991f966aeb3ddeb3c7445c902568d5411d28
