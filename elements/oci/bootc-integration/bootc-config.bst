# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

depends:
- public-stacks/runtime-gnu.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - install -Dm644 -t "%{install-root}%{indep-libdir}/ostree/" prepare-root.conf
  - install -Dm644 -t "%{install-root}%{indep-libdir}/tmpfiles.d" 10-bootc.conf
  - "%{install-extra}"

public:
  bst:
    integration-commands:
      # Required for bootc to create the image
    - mkdir /boot
    - mkdir /sysroot
    - mkdir /sysroot/ostree
    - ln -s sysroot/ostree ostree

    - rm --verbose --recursive --force /root

      # It doesn't exist but it will get created
      # by the 10-bootc.conf tmpfiles
    - ln -s /var/home /home
    - ln -s /var/roothome /root
    - touch /etc/machine-id

sources:
- kind: local
  path: files/oci-bootc
