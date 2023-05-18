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
  ref: master-2023-05-03-0-g43f81b4d0819ae1f9f6e31af7f563e9135aec9b6
