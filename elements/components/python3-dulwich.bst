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
    sha256sum: e19fd864f10f02bb834bb86167d92dcca1c228451b04458761fc13dabd447758
    suffix: 
      2b/f3/13a3425ddf04bd31f1caf3f4fa8de2352700c454cb0536ce3f4dbdc57a81/dulwich-0.24.1.tar.gz
- kind: patch
  path: patches/dulwich/fix-missing-import.patch
