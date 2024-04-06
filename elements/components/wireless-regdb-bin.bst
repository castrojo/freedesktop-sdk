kind: manual

depends:
- bootstrap-import.bst

config:
  install-commands:
  - install -Dm644 -t "%{install-root}%{indep-libdir}/firmware" regulatory.{db,db.p7s,bin}

sources:
- kind: git_repo
  url: kernel:linux/kernel/git/sforshee/wireless-regdb.git
  track: master-*
  ref: master-2023-09-01-0-g991b1ef696b7a034a5bf001cf31ab7735888c6e1
