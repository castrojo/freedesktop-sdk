kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-pyyaml.bst

sources:
- kind: git_repo
  url: gitlab:buildstream/buildstream-sbom.git
  track: main
  ref: 1.0-4-g866b2ddfb70517d5d2d6f70a47abc0545459e1fd
