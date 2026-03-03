kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/_private/git-minimal.bst
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
  ref: 2026.1.14.14-0-g05cc151733645d6fe075147ae47cf5cc11aaa84e
