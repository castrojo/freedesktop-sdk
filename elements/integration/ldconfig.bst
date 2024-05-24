kind: manual

depends:
- bootstrap-import.bst

config:
  install-commands:
    - |
      mkdir -p %{install-root}%{sysconfdir}
      echo 'include ld.so.conf.d/*.conf' > %{install-root}%{sysconfdir}/ld.so.conf
      mkdir -p %{install-root}%{sysconfdir}/ld.so.conf.d

public:
  bst:
    integration-commands:
    - ldconfig
    overlap-whitelist:
    - "%{sysconfdir}/ld.so.conf"
