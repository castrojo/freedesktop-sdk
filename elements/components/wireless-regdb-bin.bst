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
  ref: master-2023-02-13-0-g7f7a9f7bc6011b072b5427eced1ff19261764e95
