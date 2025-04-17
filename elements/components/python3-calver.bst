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
  ref: 2025.04.02-0-ge9c8017caf3e3aff214fbb581ee7f366de55f629
