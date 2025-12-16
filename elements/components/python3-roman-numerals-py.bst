kind: pyproject

build-depends:
- public-stacks/buildsystem-python-flit.bst
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

config:
  build-commands:
  - |
    mv -v LICENCE.rst python/LICENCE.rst
    %{python} -mbuild %{build-args} python

  - |
    %{python} -mbuild %{build-args} python/roman-numerals-py

  install-commands:
  - |
    for whl in %{dist-dir}/*.whl; do
      %{python} -minstaller "$whl" --destdir %{install-root}
    done

sources:
- kind: git_repo
  url: github:AA-Turner/roman-numerals.git
  track: v*
  ref: v4.0.0-0-gc3e1b6b4e6e02e5e19c26dc6f72bbb7b1060cca5
