kind: import
description: Import the base freedesktop SDK

(@):
- elements/bootstrap/include/build.yml

sources:
- kind: ostree
  url: flathub:repo/
  gpg-key: keys/flathub.gpg
  # track: runtime/org.freedesktop.Sdk/x86_64/20.08
  # Due to subsummaries get ref manually through flatpak remote-ls -c flathub <ref>
  ref: a5463d287dd60541d42855de3cf54f350593b4bbef0bdc80219e925970311473

config:
  source: files
  target: usr

public:
  bst:
    split-rules:
      filter:
      - "/usr/share/gnu-config/**"
