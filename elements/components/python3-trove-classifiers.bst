kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/git-minimal.bst
- components/python3-calver.bst

depends:
- components/python3.bst

config:
  build-commands:
    (<):
    - |
      echo "Version: $(git describe --tags)" > PKG-INFO

sources:
- kind: git_repo
  url: github:pypa/trove-classifiers.git
  track: '*.*.*'
  ref: 2024.10.11-0-g3ceadd042b11569b990dfbf64639e9b0e2dc70e3
