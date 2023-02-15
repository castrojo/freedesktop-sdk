kind: junction
sources:
- kind: tar
  url: pypi:bf/b7/f4d473350ed9d5373f61fd4dfc2ef40b4a3f31350e2981fe7213e613d27f/buildstream-plugins-2.0.0.tar.gz
  ref: d97c8d04027998e0e39d9ea8cef98f4b661273c638cca1e02e2f9db96c4ef91b
- kind: patch
  path: patches/buildstream-plugins/0001-Fix-Docker-source-plugin-to-accept-architecture-conf.patch
- kind: patch
  path: patches/buildstream-plugins/0002-Architecture-and-os-are-mandatory-parameters.patch
- kind: patch
  path: patches/buildstream-plugins/0003-Don-t-fail-if-manifest-has-multiple-images.patch
- kind: patch
  path: patches/buildstream-plugins/0004-Also-support-os.patch
