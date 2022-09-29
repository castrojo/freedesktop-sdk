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
  ref: v30-0-g5d46434a63ae0160150a0efdde1914873697e273
