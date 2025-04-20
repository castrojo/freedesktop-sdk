kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/git-minimal.bst

depends:
- components/python3.bst

config:
  build-commands:
    (<):
    - |
      echo "Version: $(git describe --tags)" > PKG-INFO

sources:
- kind: git_repo
  url: github:di/calver.git
  track: '*.*.*'
  ref: 2025.04.17-0-g3b74bdce35f2814eb2b65db39a133d5c849ddea7
- kind: patch
  path: patches/python3-calver/pyproject-license.patch
