kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:mesonbuild/meson.git
  ref: 1.7.2-0-g082917b40c8416bde925c64d22a2e60b2c059120
