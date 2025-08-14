kind: manual

depends:
- bootstrap-import.bst

runtime-depends:
- components/python3.bst

config:
  install-commands:
  - install -Dm0755 fdsdk-lic-dedup.py "%{install-root}%{bindir}/fdsdk-lic-dedup"

public:
  bst:
    integration-commands:
    - fdsdk-lic-dedup

sources:
- kind: local
  path: files/fdsdk-lic-dedup/fdsdk-lic-dedup.py
