kind: check_forbidden

depends:
- filename: platform.bst
  type: build

config:
  forbidden:
  - components/desktop-file-utils.bst
  - components/gtk-doc.bst
  - components/itstool.bst
  - components/jq.bst
  - components/xorg-util-macros.bst
  - components/autoconf-archive.bst
  - components/autoconf.bst
  - components/automake.bst
  - components/bison.bst
  - components/ccache.bst
  - components/cmake.bst
  - components/cpio.bst
  - components/docbook-xml.bst
  - components/docbook-xsl.bst
  - components/doxygen.bst
  - components/flex.bst
  - components/gdb.bst
  - components/git.bst
  - components/gperf.bst
  - components/groff.bst
  - components/help2man.bst
  - components/libpipeline.bst
  - components/libsoup2.bst
  - components/m4.bst
  - components/man-db.bst
  - components/man-pages.bst
  - components/meson.bst
  - components/nasm.bst
  - components/ninja.bst
  - components/perf.bst
  - components/perl.bst
  - components/perl-xml-parser.bst
  - components/patch.bst
  - components/pkg-config.bst
  - components/python3-pip.bst
  - components/python3-wheel.bst
  - components/ruby.bst
  - components/rust.bst
  - components/strace.bst
  - components/texinfo.bst
  - components/valgrind-maybe.bst
  - components/vulkan-validation-layers.bst
  - components/abseil-cpp.bst
  - components/protobuf-base.bst
