kind: manual

depends:
- filename: bootstrap-import.bst

config:
  build-commands:
  - |
    make

  install-commands:
  - |
    make -j1 DESTDIR="%{install-root}" ZFLAGS='-b fat' install

# We're really only interested in the timezone data
  - |
    rm -rf "%{install-root}%{bindir}"
  - |
    rm -rf "%{install-root}/etc"
  - |
    rm -rf "%{install-root}%{indep-libdir}"
  - |
    rm -rf "%{install-root}%{prefix}/sbin"

# Man pages are provided by Linux's man-pages
# sdk/elements/components/man-pages.bst
  - |
    rm -rf "%{install-root}%{mandir}"

# Set up a default timezone, for when Flatpak can't use the host one
  - |
    mkdir -p "%{install-root}%{sysconfdir}"
  - |
    ln -sf "%{datadir}/zoneinfo/UTC" "%{install-root}%{sysconfdir}/localtime"

sources:
- kind: git_tag
  url: github:eggert/tz.git
  track: main
  ref: 2022c-0-gce4d77644d2793027bb27f095dec7b530edcd947
