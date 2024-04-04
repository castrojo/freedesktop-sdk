kind: manual

build-depends:
- bootstrap-import.bst

config:
  install-commands:
  - |
    install -Dm644 registries.conf "%{install-root}%{sysconfdir}/containers/registries.conf"

  - |
    cat <<EOF >policy.json
    {
      "default": [{"type": "insecureAcceptAnything"}],
      "transports": {}
    }
    EOF
    install -Dm644 policy.json "%{install-root}%{sysconfdir}/containers/policy.json"

sources:
- kind: git_repo
  url: github:projectatomic/registries.git
  ref: da9a9c87781823f45401ca49da04e269c9e3100e
