kind: autotools

depends:
- bootstrap-import.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/docbook-xsl.bst
- components/docbook-xml.bst
- components/libxslt.bst

variables:
  conf-local: |
    --with-xz \
    --with-zlib \
    --enable-tools

config:
  install-commands:
    (>):
    - |
      for tool in insmod rmmod lsmod modprobe modinfo depmod; do
        ln -s kmod "%{install-root}%{bindir}/${tool}"
      done

sources:
- kind: git_tag
  url: kernel:utils/kernel/kmod/kmod.git
  track: master
  ref: v31-0-gaff617ea871d0568cc491bd116c0be1e857463bb
