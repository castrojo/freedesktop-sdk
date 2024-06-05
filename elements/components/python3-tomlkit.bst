kind: pyproject

build-depends:
- public-stacks/buildsystem-python-poetry.bst

depends:
- components/python3.bst

# Don't convert to git
# See https://github.com/sdispater/tomlkit/issues/322
sources:
- kind: pypi
  name: tomlkit
  ref:
    sha256sum: eef34fba39834d4d6b73c9ba7f3e4d1c417a4e56f89a7e96e090dd0d24b8fb3c
    suffix: 
      2b/ab/18f4c8f2bec75eb1a7aebcc52cdb02ab04fd39ff7025bb1b1c7846cc45b8/tomlkit-0.12.5.tar.gz
