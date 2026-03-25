kind: stack

depends:
- components/flat-manager-client-base.bst
- components/ostree.bst

public:
  bst:
    integration-commands:
    - |
      flat-manager-client --help > /dev/null
