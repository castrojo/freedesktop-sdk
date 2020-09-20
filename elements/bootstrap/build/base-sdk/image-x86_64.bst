kind: import
description: Import the base freedesktop SDK

sources:
- kind: ostree
  url: freedesktop-sdk:releases/
  # Do not verify repo: Workaround for https://gitlab.com/BuildStream/buildstream/issues/524
  #gpg-key: keys/freedesktop-sdk.gpg
  track: runtime/org.freedesktop.Sdk.PreBootstrap/x86_64/19.08
  ref: 3fbd964cf6c7f6a0da617cfc11434265924ced591e9c43d742d631253233f40f

config:
  source: files
  target: usr

public:
  bst:
    split-rules:
      filter:
      - "/usr/share/gnu-config/**"
      - "/usr/bin/dwz"
      - "/usr/share/man/man1/dwz.1"
