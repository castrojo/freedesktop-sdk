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
  ref: 2022.06.26-0-g3268d8acf2c345f32a1c5f08ba25dc67f76cca81
