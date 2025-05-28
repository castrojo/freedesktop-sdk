kind: pyproject

build-depends:
- components/python3-build.bst
- components/python3-installer.bst

depends:
- components/python3.bst
- components/python3-hatchling.bst
- components/python3-setuptools-scm.bst

sources:
- kind: pypi
  name: hatch-vcs
  ref:
    sha256sum: 0395fa126940340215090c344a2bf4e2a77bcbe7daab16f41b37b98c95809ff9
    suffix: 
      6b/b0/4cc743d38adbee9d57d786fa496ed1daadb17e48589b6da8fa55717a0746/hatch_vcs-0.5.0.tar.gz
