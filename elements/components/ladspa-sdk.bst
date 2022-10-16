kind: make

depends:
- bootstrap-import.bst
- components/sndfile.bst

variables:
  install-conf: |
    INSTALL_PLUGINS_DIR=%{install-root}%{libdir}/ladspa \
    INSTALL_INCLUDE_DIR=%{install-root}%{includedir} \
    INSTALL_BINARY_DIR=%{install-root}%{bindir}

  command-subdir: src

  make: |
    make %{make-args} CFLAGS="-I. ${CFLAGS} ${LDFLAGS} -DDEFAULT_LADSPA_PATH=%{install-root}%{libdir}/ladspa"
  make-install: make -j1 %{make-install-args} %{install-conf}

sources:
- kind: tar
  url: tar_https:www.ladspa.org/download/ladspa_sdk_1.17.tgz
  ref: 27d24f279e4b81bd17ecbdcc38e4c42991bb388826c0b200067ce0eb59d3da5b
