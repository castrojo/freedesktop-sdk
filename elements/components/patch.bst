kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst
- components/git-minimal.bst

depends:
- bootstrap-import.bst

variables:
  autogen: ./bootstrap --no-git --gnulib-srcdir=%{build-root}/gnulib


public:
  cpe:
    patches:
    - CVE-2018-6951
    - CVE-2018-6952
    - CVE-2018-20969 # same fix as CVE-2019-13638
    - CVE-2018-1000156
    - CVE-2019-13636
    - CVE-2019-13638

sources:
- kind: git_repo
  url: savannah:patch.git
  track: v*
  ref: v2.8-0-g48ceda8200aaf30c3ce42c31cd70ff6087db2425
- kind: git_module
  path: gnulib
  url: savannah:gnulib.git
  ref: 9829f0a93c40492875f67ee738e000611bdcf0e7
- kind: patch
  path: patches/patch/CVE-2018-6951.patch
- kind: patch
  path: patches/patch/CVE-2018-6952.patch
- kind: patch
  path: patches/patch/allow-input-files-to-be-missing-for-ed-style-patches.patch
- kind: patch
  path: patches/patch/CVE-2018-1000156.patch
- kind: patch
  path: patches/patch/CVE-2019-13636.patch
- kind: patch
  path: patches/patch/CVE-2019-13638.patch
- kind: patch
  path: patches/patch/Do_not_leak_temporary_file.patch
- kind: patch
  path: patches/patch/Do_not_leak_temporary_file_on_failed_multi-file.patch
