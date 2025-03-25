kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst
- components/git-minimal.bst
- components/python3-packaging.bst

depends:
- components/python3.bst

runtime-depends:
- components/buildbox.bst
- components/python3-arpy.bst
- components/python3-blessings.bst
- components/python3-click.bst
- components/python3-dulwich.bst
- components/python3-grpcio.bst
- components/python3-jinja2.bst
- components/python3-pluginbase.bst
- components/python3-psutil.bst
- components/python3-pyroaring.bst
- components/python3-ruamel-yaml.bst
- components/python3-ujson.bst

sources:
- kind: git_repo
  url: github:apache/buildstream.git
  track: '*.*.*'
  exclude:
  - '*.dev*'
  ref: 2.4.1-0-ge8e9dff5906b59a9c7e85470da94dc48131f7c6e
