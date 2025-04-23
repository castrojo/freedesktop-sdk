kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst
- components/python3-setuptools.bst
- components/git-minimal.bst
- components/python3-typing-extensions.bst
- components/python3-packaging.bst

sources:
- kind: pypi
  name: setuptools_scm
  ref:
    sha256sum: 360bc58c97e73d3db34f9052937454195ed5c29057a529b324cecbfc324509b3
    suffix: 
      ae/c1/0eb89ad8a0aa7033bbd0cc9fb44a0090c20edaba495f291e31be010e6ec1/setuptools_scm-8.3.0.tar.gz
