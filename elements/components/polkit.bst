kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/gtk-doc.bst
- components/perl-xml-parser.bst
- components/gobject-introspection.bst
- components/strace.bst

depends:
- components/mozjs.bst
- components/linux-pam.bst
- components/systemd.bst

variables:
  conf-local: >-
    --enable-libsystemd-login=yes
  local_flags: -std=gnu++17

environment:
  XDG_DATA_DIRS: "%{datadir}:%{install-root}%{datadir}"

config:
  build-commands:
    (<):
    - |
      cd "%{builddir}/data"
      make -j1 install DESTDIR="%{install-root}"

  install-commands:
    (>):
    - |
      SYSUSERSDIR=$(pkg-config --variable sysusersdir systemd)
      install -D -m 644 data/sysusers.conf %{install-root}/$SYSUSERSDIR/polkit.conf

public:
  initial-script:
    script: |
      #!/bin/bash
      sysroot="${1}"
      chmod 4755 "${sysroot}%{indep-libdir}/polkit-1/polkit-agent-helper-1"
      chmod 4755 "${sysroot}%{bindir}/pkexec"
  cpe:
    patches:
    - CVE-2021-4034

sources:
- kind: git_tag
  url: freedesktop:polkit/polkit.git
  ref: 0.120-0-g92b910ce2273daf6a76038f6bd764fa6958d4e8e
- kind: patch
  path: patches/polkit/pkexec-local-privilege-escalation-CVE-2021-4034.patch
- kind: local
  path: files/polkit/sysusers.conf
  directory: data
