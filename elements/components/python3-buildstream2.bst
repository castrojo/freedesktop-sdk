kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst
- components/git-minimal.bst
- components/python3-packaging.bst

depends:
- components/python3.bst

runtime-depends:
- components/buildbox-casd.bst
- components/buildbox-run-bubblewrap.bst
- components/buildbox-fuse.bst
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
  ref: 2.2.0-0-gb0b7231fd0fe803463db3ea1f0e827082404306a
- kind: patch
  path: patches/buildstream/keepalive-timeout.patch
