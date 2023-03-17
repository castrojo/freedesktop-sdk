kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
  type: build

sources:
- kind: git_tag
  url: debian_salsa:iso-codes-team/iso-codes.git
  track: main
  ref: v4.12.0-0-g5e4dddbd1f8902ab0252ccbb19b783cc0359505a
