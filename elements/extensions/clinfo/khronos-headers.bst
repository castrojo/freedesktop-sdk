kind: manual

depends:
- filename: bootstrap-import.bst

config:
  install-commands:
  - |
    mkdir --parents %{install-root}%{includedir}
    cp -r CL/ %{install-root}%{includedir}

sources:
- kind: git_repo
  url: github:KhronosGroup/OpenCL-Headers.git
  # No tags exist, track HEAD of the branch
  ref: 0d5f18c6e7196863bc1557a693f1509adfcee056
  # Because we do not ship headers and they are just headers, we do
  # not need to track it unless we require a newer version to build.
  #track: master
