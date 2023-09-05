kind: make

build-depends:
- public-stacks/buildsystem-make.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  make-args: >-
    prefix="%{prefix}"
    sbindir="%{sbindir}"
    mandir="%{mandir}"

sources:
- kind: git_repo
  url: savannah:dmidecode.git
  track: dmidecode-*
  ref: dmidecode-3-6-0-g51b1ecc262e4d0a45994f7a736ca1ab77b10480b
