kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-certifi.bst
- components/python3-urllib3.bst

# We don't use git because we can't mirror the repository as it contains
# invalid commits (that don't pass git fsck)
sources:
- kind: pypi
  name: dulwich
  ref:
    sha256sum: a9e9c66833cea580c3ac12927e4b9711985d76afca98da971405d414de60e968
    suffix: 
      2b/e2/788910715b4910d08725d480278f625e315c3c011eb74b093213363042e0/dulwich-0.21.7.tar.gz
