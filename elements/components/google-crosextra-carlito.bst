kind: manual

depends:
- filename: bootstrap-import.bst

variables:
  fontdir: '%{install-root}%{datadir}/fonts'
  confdir: '%{install-root}%{sysconfdir}/fonts'
  fontname: google-crosextra-carlito

config:
  install-commands:
  - |
    install -d -m 0755 "%{confdir}/conf.avail" "%{confdir}/conf.d" "%{fontdir}/%{fontname}"
    install -p -m 0644 ./*.ttf "%{fontdir}/%{fontname}"
    install -p -m 0644 "config/%{fontname}.conf" "%{confdir}/conf.avail/62-%{fontname}.conf"
    ln -s "../conf.avail/62-%{fontname}.conf" "%{confdir}/conf.d/62-%{fontname}.conf"

  - |
    install -m 0644 -p "config/30-0-%{fontname}.conf" "%{confdir}/conf.avail/30-0-%{fontname}.conf"; \
    ln -s "../conf.avail/30-0-%{fontname}.conf" "%{confdir}/conf.d/30-0-%{fontname}.conf"

  - |
    %{install-extra}

sources:
- kind: tar
  url: tar_https:gsdview.appspot.com/chromeos-localmirror/distfiles/crosextrafonts-carlito-20130920.tar.gz
  ref: 4bd12b6cbc321c1cf16da76e2c585c925ce956a08067ae6f6c64eff6ccfdaf5a
- kind: local
  path: files/font-conf/google-crosextra-carlito
  directory: config
