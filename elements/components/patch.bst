kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst
- components/git-minimal.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  autogen: ./bootstrap --no-git --gnulib-srcdir=%{build-root}/gnulib

public:
  cpe:
    ignored:
    - CVE-2026-56288   # patched
    - CVE-2026-56289   # patched

sources:
- kind: git_repo
  url: savannah:patch.git
  track: v*
  ref: v2.8.1-0-gc2910144fe782b76222a694e59ae3d3fb94bca70
- kind: git_module
  path: gnulib
  url: savannah:gnulib.git
  ref: c09a5a45db5ef37297712ba2417ae2c16eface76
- kind: patch_queue
  path: patches/patch
