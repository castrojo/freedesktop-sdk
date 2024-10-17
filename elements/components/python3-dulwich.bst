kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst
- components/python3-setuptools-rust.bst

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
    sha256sum: 7968c7b8a877b614c46b5ee7c1b28411772123004d7cf6357e763ad2cbeb8254
    suffix: 
      da/47/c8bf38f8874829730775fbe5510b54087ff8529dbb9612bd144b76376ea7/dulwich-0.22.3.tar.gz
- kind: patch
  path: patches/dulwich/fix-missing-import.patch
