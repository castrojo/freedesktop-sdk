kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/ghostscript.bst
- components/mutool.bst

depends:
- components/dejavu-fonts.bst
- components/libppd.bst

variables:
  local_flags: -std=gnu17

public:
  cpe:
    ignored:
    - CVE-2025-64503   # Patched
    - CVE-2025-64524   # Introduced after tag

sources:
- kind: git_repo
  url: github:OpenPrinting/cups-filters.git
  track: '*.*.*'
  ref: 2.0.1-0-g5a73330fbd0cde494d984141f9add1565aef8171
- kind: patch_queue
  path: patches/cups-filters
