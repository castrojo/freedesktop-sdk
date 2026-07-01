# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/git-minimal.bst
- components/_private/gnu-efi.bst
- components/help2man.bst

depends:
- components/openssl.bst
# Uses libuuid only
- components/util-linux-libs.bst
# Requires getopt
- components/util-linux.bst
- public-stacks/runtime-minimal.bst

variables:
  local_flags: -Wno-error=unused-but-set-variable
  conf-local: >-
    CRTPATH=%{libdir}
    CPPFLAGS="-DOPENSSL_API_COMPAT=0x10100000L"

sources:
- kind: git_repo
  url: kernel:linux/kernel/git/jejb/sbsigntools.git
  track: v*.*.*
  ref: v0.9.5-0-g9cfca9fe7aa7a8e29b92fe33ce8433e212c9a8ba
- kind: git_module
  path: lib/ccan.git
  url: git_https:git.ozlabs.org/ccan
  ref: b1f28e17227f2320d07fe052a8a48942fe17caa5
