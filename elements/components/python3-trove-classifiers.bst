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
  ref: 2024.7.1-0-g932aaf217853f8b171521cd20f2a4c7dad052016
