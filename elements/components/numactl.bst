kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

# When downloading through the git repo, the build does not succeed.
sources:
- kind: tar
  url: github:numactl/numactl/releases/download/v2.0.18/numactl-2.0.18.tar.gz
  ref: b4fc0956317680579992d7815bc43d0538960dc73aa1dd8ca7e3806e30bc1274
