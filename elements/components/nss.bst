kind: manual

# NOTE:
#
# This element installs nss without installing the cryptographic signatures
# of the libraries which are required for nss's "FIPS 140" mode, due to the
# non-reproducible nature of these signature files.
#
# An upstream explanation of these files, and FIPS 140 mode, can be found here:
#
#   https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Tech_Notes/nss_tech_note6
#   https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/FIPS_Mode_-_an_explanation
#
# If you need to use FIPS 140 mode, we recommend running the following commands
# at deployment time in order to generate the required chk files:
#
#   shlibsign -v -i %{libdir}/libsoftokn3.so
#   shlibsign -v -i %{libdir}/libfreebl3.so
#   shlibsign -v -i %{libdir}/libfreeblpriv3.so
#
# The shlibsign program is also built and installed by this element.
#

depends:
- bootstrap-import.bst
- components/nspr.bst
- components/sqlite.bst
- components/p11-kit.bst

build-depends:
- components/gyp.bst
- components/pkg-config.bst
- components/perl.bst
- enable-shm.bst

variables:
  (?):
  - target_arch == 'x86_64':
      gyp-arch: x64
  - target_arch == 'i686':
      gyp-arch: ia32
  - target_arch == 'arm':
      gyp-arch: arm
  - target_arch == 'aarch64':
      gyp-arch: aarch64
  - target_arch == 'ppc64le':
      gyp-arch: ppc64le
  - target_arch == 'riscv64':
      gyp-arch: riscv64

  build-args: >-
    --opt
    --system-nspr
    --system-sqlite
    --disable-tests
    --enable-libpkix
    --target=%{gyp-arch}

environment:
  MAXJOBS: "%{max-jobs}"
  (?):
  - target_arch == 'riscv64':
      CFLAGS: "%{target_common_flags} -DNSS_USE_64"

environment-nocache:
- MAXJOBS

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/*'
  cpe:
    product: network_security_services
    version-match: '(\d+)_(\d+)'
    ignored:
    - CVE-2013-0791
    - CVE-2013-1620
    patches:
    - CVE-2022-3479

config:
  build-commands:
  - |
    cd nss
    ./build.sh -j "${MAXJOBS}" -v %{build-args}

  - |
    gcc ${CFLAGS} ${LDFLAGS} -Wall load-p11-kit-trust.c -shared $(pkg-config --libs --cflags p11-kit-1) -o load-p11-kit-trust.so

  install-commands:
  - |
    cd dist
    for lib in Release/lib/*; do
      case "${lib}" in
        *.a) ;;
        */*.so.TOC) ;;
        */libnssckbi.so) ;;
        *.chk) ;;

        *.so)
          install -Dm644 -t "%{install-root}%{libdir}/" "${lib}"
        ;;
        *)
          echo "What to do with ${lib}?" 1>&2
          exit 1
        ;;
      esac
    done
    install -Dm755 -t "%{install-root}%{bindir}/" Release/bin/*
    install -Dm644 -t "%{install-root}%{includedir}/nss/" public/nss/*.h

  - |
    NSPR_VERSION="$(/usr/bin/nspr-config --version)"
    NSS_VERSION="$(grep NSS_VERSION dist/public/nss/nss.h | sed -e 's/[^"]*"//' -e 's/".*//' -e 's/ .*//')"
    MOD_MAJOR_VERSION="$(echo "${NSS_VERSION}" | cut -d. -f1)"
    MOD_MINOR_VERSION="$(echo "${NSS_VERSION}" | cut -d. -f2)"
    MOD_PATCH_VERSION="$(echo "${NSS_VERSION}" | cut -d. -f3)"

    for f in nss/pkg/pkg-config/*.in; do
      sed -f - "${f}" <<EOF >"$(basename "${f}" .in)"
    s,%,@,g
    s,@prefix@,%{prefix},g
    s,@exec_prefix@,%{exec_prefix},g
    s,@libdir@,%{libdir},g
    s,@includedir@,%{includedir}/nss,g
    s,@NSS_VERSION@,${NSS_VERSION},g
    s,@NSPR_VERSION@,${NSPR_VERSION},g
    s,@MOD_MAJOR_VERSION@,${MOD_MAJOR_VERSION},g
    s,@MOD_MINOR_VERSION@,${MOD_MINOR_VERSION},g
    s,@MOD_PATCH_VERSION@,${MOD_PATCH_VERSION},g
    EOF
    done
    install -m 644 -D -t "%{install-root}/%{libdir}/pkgconfig" nss.pc
    install -m 755 -D -t "%{install-root}/%{bindir}" nss-config

  - |
    install -Dm644 -t "%{install-root}%{libdir}/" load-p11-kit-trust.so
    ln -s load-p11-kit-trust.so "%{install-root}%{libdir}/libnssckbi.so"

sources:
- kind: git_repo
  url: github:nss-dev/nss.git
  track: 'NSS_3_79_*_RTM'
  ref: NSS_3_79_4_RTM-0-g033b99629659db93c56e0533a2db57e62828d22a
  directory: nss
- kind: patch
  path: patches/nss/pkg-config-libdir.patch
- kind: patch
  path: patches/nss/CVE-2022-3479.patch
- kind: local
  path: files/nss/load-p11-kit-trust.c
