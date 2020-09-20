kind: import
description: Import the base freedesktop SDK

sources:
- kind: ostree
  url: freedesktop-sdk:releases/
  # Do not verify repo: Workaround for https://gitlab.com/BuildStream/buildstream/issues/524
  #gpg-key: keys/freedesktop-sdk.gpg
  track: runtime/org.freedesktop.Sdk.PreBootstrap/aarch64/19.08
  ref: 293b281dc6ef74e0d19ec4c894571b2f988cec2cc1ce703e477ffe4976a016ff

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
