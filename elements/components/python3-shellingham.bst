kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: shellingham
  ref:
    sha256sum: 8dbca0739d487e5bd35ab3ca4b36e11c4078f3a234bfce294b0a0291363404de
    suffix: 
      58/15/8b3609fd3830ef7b27b655beb4b4e9c62313a4e8da8c676e142cc210d58e/shellingham-1.5.4.tar.gz
