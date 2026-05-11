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
  ref: 2026.5.7.17-0-ga1105aa00670c8fc241e0bc2149a236b8be43b7a
