kind: autotools

build-depends:
- filename: components/python3.bst
- filename: public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/cracklib.bst
- components/gzip.bst
- components/linux-pam-base.bst

variables:
  # Python package built as part of project does not support
  # build-dir
  build-dir: ''
  conf-local: >-
    --with-python-binary=python3
    --with-securedir=%{libdir}/security

sources:
- kind: git_repo
  url: github:libpwquality/libpwquality.git
  track: libpwquality-*
  ref: libpwquality-1.4.5-0-g5490e96a3dd6ed7371435ca5b3ccef98bdb48b5a
