kind: make

(@):
- elements/include/efitools.yml

config:
  install-commands:
    (>):
    - rm -rvf "%{install-root}%{datadir}/efitools/efi/"
