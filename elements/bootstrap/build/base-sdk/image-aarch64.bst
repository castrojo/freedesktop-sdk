kind: import
description: Import the base freedesktop SDK

sources:
- kind: ostree
  url: flathub:repo/
  gpg-key: keys/flathub.gpg
  # track: runtime/org.freedesktop.Sdk/aarch64/20.08
  # Due to subsummaries get ref manually through flatpak remote-ls -c flathub <ref>
  ref: aee8ea4206e423793761f4055ec5a51fe9da8faf22923e8f6c2ad07cde7cf7f6

config:
  source: files
  target: usr

public:
  bst:
    split-rules:
      filter:
      - "/usr/share/gnu-config/**"
