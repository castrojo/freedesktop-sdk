kind: autotools
description: GNU C Library

build-depends:
- bootstrap/base-sdk/bison.bst
- bootstrap/base-sdk/gettext.bst
- bootstrap/base-sdk/texinfo.bst
- bootstrap/build/gcc-stage1.bst
- bootstrap/build/debug-utils.bst
- bootstrap/build/python3.bst
- bootstrap/gnu-config.bst
- filename: bootstrap/linux-headers.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/symlinks.bst
- bootstrap/linux-headers.bst

config:
  configure-commands:
  - |
    mkdir "%{build-dir}"
    cd "%{build-dir}"

    echo slibdir=%{libdir} >configparms
    echo complocaledir=%{indep-libdir}/locale >>configparms
    echo gconvdir=%{libdir}/gconv >>configparms
    echo rootsbindir=%{sbindir} >>configparms
    echo sbindir=%{sbindir} >>configparms
    ../%{configure}

  install-commands:
    (>):
    - install -dDm755 "%{install-root}%{includedir}/%{gcc_triplet}"
    - |
      for i in bits gnu sys fpu_control.h a.out.h ieee754.h; do
         mv "%{install-root}%{includedir}/${i}" \
            "%{install-root}%{includedir}/%{gcc_triplet}/"
      done

    - |
      rm -r "%{install-root}%{libexecdir}/getconf"

# Move the dynamic linker into the arch prefix
    - |
      set -x
      rtlddir=$(echo '@libc_cv_rtlddir@' | %{build-dir}/config.status --file=-)
      dynamic_linker="$(sed "/^ld.so-version=/{;s///;q;};d" "%{build-dir}/soversions.mk")"
      libdir=$(echo '@libdir@' | %{build-dir}/config.status --file=-)
      sourcedir="%{install-root}${rtlddir}"
      targetdir="%{install-root}${libdir}"

      [ -d "${targetdir}" ] || mkdir -p "${targetdir}"
      mv "${sourcedir}/${dynamic_linker}" "${targetdir}/${dynamic_linker}"
      rmdir "${sourcedir}"
      prefixdir="%{install-root}%{prefix}${rtlddir}"
      [ -d "${prefixdir}" ] || mkdir -p "${prefixdir}"
      ln -sr "${targetdir}/${dynamic_linker}" "${prefixdir}/${dynamic_linker}"
      case "${rtlddir}" in
        /lib)
          ;;
        *)
          ln -sr "${prefixdir}" "${sourcedir}"
          ;;
      esac

    - |
       echo 'include ld.so.conf.d/*.conf' > '%{install-root}%{sysconfdir}/ld.so.conf'

    - |
      rm "%{install-root}%{infodir}/dir"

(@):
- elements/bootstrap/include/target.yml
- elements/bootstrap/include/glibc-source.yml

variables:
  # -D_FORTIFY_SOURCE=2 breaks building glibc
  target_flags_fortify_source: ''
  arch_options: ''

  (?):
  - target_arch == "i686" or target_arch == "x86_64":
      arch_options: --enable-cet

  conf-local: |
    CFLAGS="$CFLAGS" \
    --with-headers=%{sysroot}%{includedir}/%{gcc_triplet}:%{sysroot}%{includedir} \
    --enable-stackguard-randomization \
    --enable-stack-protector=strong \
    --enable-bind-now \
    --disable-werror \
    %{arch_options}

public:
  bst:
    split-rules:
      # We keep the debuginfo for the dynamic loader only because
      # valgrind needs it.
      debug:
        - '%{sourcedir}/**'
        - '%{sourcedir}'
        - '%{debugdir}%{bindir}'
        - '%{debugdir}%{bindir}/**'
        - '%{debugdir}%{libdir}/lib*.so*.debug'
        - '%{debugdir}%{libdir}/audit'
        - '%{debugdir}%{libdir}/audit/**'
        - '%{debugdir}%{libdir}/gconv'
        - '%{debugdir}%{libdir}/gconv/**'
      devel:
        (>):
        - '%{debugdir}%{libdir}/ld-*.so.debug'
        - '%{libdir}/*.o'
        - '%{libdir}/libdl.so'
        - '%{libdir}/libnsl.so'
        - '%{libdir}/libpthread.so'
        - '%{libdir}/libBrokenLocale.so'
        - '%{libdir}/libthread_db.so'
        - '%{libdir}/librt.so'
        - '%{libdir}/libcrypt.so'
        - '%{libdir}/libnss_dns.so'
        - '%{libdir}/libanl.so'
        - '%{libdir}/libnss_files.so'
        - '%{libdir}/libresolv.so'
        - '%{libdir}/libmvec.so'
        - '%{libdir}/libcidn.so'
        - '%{libdir}/libnss_hesiod.so'
        - '%{libdir}/libnss_db.so'
        - '%{libdir}/libutil.so'
        - '%{libdir}/libnss_compat.so'
        - '%{libdir}/libm.so'
        - '%{libdir}/libc_malloc_debug.so'

      static-blocklist:
        (=):
        - '%{libdir}/libBrokenLocale.a'
        - '%{libdir}/libcrypt.a'
        - '%{libdir}/libg.a'
        - '%{libdir}/libm-*.a'
        - '%{libdir}/libm.a'
        - '%{libdir}/libmcheck.a'
        - '%{libdir}/libmvec.a'
        - '%{libdir}/libresolv.a'

      # Not actually used, included for completeness
      static-allowlist:
        - '%{libdir}/libc_nonshared.a'
        - '%{libdir}/libmvec_nonshared.a'
        - '%{libdir}/libc.a'
        # Empty compat libraries
        - '%{libdir}/libanl.a'
        - '%{libdir}/libdl.a'
        - '%{libdir}/libpthread.a'
        - '%{libdir}/librt.a'
        - '%{libdir}/libutil.a'

  cpe:
    ignored:
    - CVE-2010-4756
    - CVE-2021-3998
    - CVE-2022-39046
