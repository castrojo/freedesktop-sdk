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
  ref: 2023.11.14-0-g0b8493fc1fdbbf96c3ab78ca2d30f8f9e637a06c
