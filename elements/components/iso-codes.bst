kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
  type: build

sources:
- kind: git_tag
  url: debian_salsa:iso-codes-team/iso-codes.git
  track: main
  ref: v4.15.0-0-g69ba16daef3c5c5e3c18f2d919e25296a4b946be
