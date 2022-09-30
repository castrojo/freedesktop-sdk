kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
  type: build

sources:
- kind: git_tag
  url: debian_salsa:iso-codes-team/iso-codes.git
  track: main
  ref: v4.11.0-0-g2651d7fe65582263c57385a852b0c6d8a49f6985
