kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/python3.bst
- components/libxml2.bst

variables:
  autogen: ./autogen.sh --no-configure

sources:
- kind: git_repo
  url: github:dell/libsmbios.git
  track: v*
  ref: v2.4.3-0-g5b72244ca0d09c7f228d571ec2d5d20183486c11
