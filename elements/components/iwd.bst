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
  kind: git_repo
  url: kernel:network/wireless/iwd.git
  track: '*.*'
  ref: 3.3-0-g4b535cee1f88734c982c0a5d0bc89109c888dd0c
- directory: ell
  kind: git_repo
  url: kernel:libs/ell/ell.git
  track: '*.*'
  ref: 0.71-0-gf99041d01b29bdd4cc099e5227ad3a0d832329dc
