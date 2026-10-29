# THIS IS A HACK NEVER USE IT EVER
kind: manual

build-depends:
- public-stacks/runtime-gnu.bst
- components/stripper.bst

config:
  install-commands:
  - |
    install -Dt "%{install-root}%{bindir}" osv-scanner

sources:
- kind: remote
  filename: "osv-scanner"
  executable: True
  (?):
  - target_arch == "x86_64":
      url: github_files:google/osv-scanner/releases/download/v2.4.0/osv-scanner_linux_amd64
      ref: 15314940c10d26af9c6649f150b8a47c1262e8fc7e17b1d1029b0e479e8ed8a0
  - target_arch == "aarch64":
      url: github_files:google/osv-scanner/releases/download/v2.4.0/osv-scanner_linux_arm64
      ref: 44e580752910f0ff36ec99aff59af20f65df1e859aa31e5605a8f0d055b496e9
