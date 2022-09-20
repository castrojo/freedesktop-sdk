kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: importlib-resources
  ref:
    sha256sum: 5481e97fb45af8dcf2f798952625591c58fe599d0735d86b10f54de086a61681
    suffix: 38/b6/bc58f9261c70abb5fd670f9ad5d84445a402b4b473f308c5bf699cd379e0/importlib_resources-5.9.0.tar.gz
