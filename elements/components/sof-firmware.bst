kind: manual

build-depends:
- bootstrap-import.bst

config:
  install-commands:
  - |
    install -d -m755 '%{install-root}%{indep-libdir}/firmware/intel'
    cp -aT sof-v* '%{install-root}%{indep-libdir}/firmware/intel/sof'
    cp -aT sof-tplg-v* '%{install-root}%{indep-libdir}/firmware/intel/sof-tplg'

sources:
- kind: tar
  url: github_files:thesofproject/sof-bin/releases/download/v2.2.6/sof-bin-v2.2.6.tar.gz
  ref: 9322c2a7636d02845c3b26984d58ab8f78d63ff4c766d084c3196a585e000905
