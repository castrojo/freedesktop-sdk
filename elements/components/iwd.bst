kind: autotools

depends:
- bootstrap-import.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/python3-docutils.bst
- components/dbus.bst
- components/systemd.bst

variables:
  build-dir: ''
  conf-local: >-
    --enable-wired
    --enable-hwsim
    --enable-tools
    --enable-ofono
    --enable-sim-hardcoded
  make: make -C iwd
  make-install: make -C iwd -j1 DESTDIR="%{install-root}" install

config:
  configure-commands:
  - |
    cd iwd
    %{autogen}
    ./%{configure}

sources:
- directory: iwd
  kind: git_tag
  url: kernel:network/wireless/iwd.git
  track: master
  ref: 2.7-0-g0be288c5aa183d53e5e54ed0df8e565a062855f0
- directory: ell
  kind: git_tag
  url: kernel:libs/ell/ell.git
  track: master
  ref: 0.57-0-g104d49638e3668bcc2935099a59f2ab2caf6b27f
