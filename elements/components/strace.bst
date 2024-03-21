kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libunwind.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  conf-local: --enable-mpers=check

public:
  cpe:
    ignored:
    - CVE-2000-0006

sources:
- kind: git_tag
  url: github:strace/strace.git
  track: master
  ref: v6.8-0-ga592648ae7d380b79ffb65275ec153b9e4844a57
