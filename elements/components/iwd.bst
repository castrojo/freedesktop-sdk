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
  ref: 1.30-0-g881807d14b7ee2a71f53c872303f6c05c4ee487a
- directory: ell
  kind: git_tag
  url: kernel:libs/ell/ell.git
  track: master
  ref: 0.53-0-g408f6a8150c5e5dfc812146f9f8a3f9f149f727a
