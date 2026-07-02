kind: manual

build-depends:
- components/go.bst

config:
  build-commands:
  - go build ./cmd/cosign

  - |
    %{install-extra}

sources:
- kind: git_repo
  url: github:sigstore/cosign.git
  track: main
  ref: v3.1.1-0-g7914231b348c4057891edeb321772aad3ed04fce
