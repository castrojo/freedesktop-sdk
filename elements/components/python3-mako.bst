kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst
- components/python3-markupsafe.bst

sources:
- kind: pypi
  name: mako
  ref:
    sha256sum: 9a7c7e922b87db3686210cf49d5d767033a41d4010b284e747682c92bddd8b39
    suffix: 50/ec/1d687348f0954bda388bfd1330c158ba8d7dea4044fc160e74e080babdb9/Mako-1.2.0.tar.gz
