kind: manual

depends:
- filename: bootstrap-import.bst

variables:
  fontdir: '%{install-root}%{datadir}/fonts'
  confdir: '%{install-root}%{sysconfdir}/fonts'
  fontname: google-crosextra-caladea

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
  url: tar_https:gsdview.appspot.com/chromeos-localmirror/distfiles/crosextrafonts-20130214.tar.gz
  ref: c48d1c2fd613c9c06c959c34da7b8388059e2408d2bb19845dc3ed35f76e4d09
- kind: local
  path: files/font-conf/google-crosextra-caladea
  directory: config
