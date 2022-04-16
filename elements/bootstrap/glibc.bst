kind: autotools
description: GNU C Library

depends:
- filename: bootstrap/glibc-build-deps.bst
  type: build
- filename: bootstrap/symlinks.bst
  type: runtime
- filename: bootstrap/linux-headers.bst
  type: runtime

config:
  configure-commands:
  - |
    mkdir "%{builddir}"
    cd "%{builddir}"

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

# Move the dynamic linker into the prefix
    - |
      rtlddir=$(echo '@libc_cv_rtlddir@' | %{builddir}/config.status --file=-)
      sourcedir="%{install-root}${rtlddir}"
      targetdir="%{install-root}%{prefix}${rtlddir}"

      for f in "${sourcedir}"/*; do
        if [ -h "$f" ]; then
          [ -d "${targetdir}" ] || mkdir -p "${targetdir}"
          targetpath="${targetdir}/$(basename "$f")"
          sourcepath="${sourcedir}/$(readlink "$f")"
          relsourcepath="$(realpath "${sourcepath}" --relative-to="${targetdir}")"

          ln -s "${relsourcepath}" "${targetpath}"
          rm "$f"
        fi
      done

      rm -r "${sourcedir}"

      if [ "${rtlddir}" != '/lib' ]; then
        ln -s "$(realpath "${targetdir}" --relative-to='%{install-root}')" "${sourcedir}"
      fi

# ldconfig shows a warning if /etc/ld.so.conf doesn't exist
    - |
      touch '%{install-root}%{sysconfdir}/ld.so.conf'

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
      arch_options: --enable-static-pie --enable-cet
  - target_arch == "aarch64":
      arch_options: --enable-static-pie
  - target_arch == "arm" or target_arch == "ppc64le":
    # --enable-static-pie breaks arm build
      arch_options: ''

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
        - '%{debugdir}%{libdir}/lib*.so.debug'
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

      static-blocklist:
        (=):
        - '%{libdir}/libanl.a'
        - '%{libdir}/libBrokenLocale.a'
        - '%{libdir}/libcrypt.a'
        - '%{libdir}/libdl.a'
        - '%{libdir}/libg.a'
        - '%{libdir}/libm-*.a'
        - '%{libdir}/libm.a'
        - '%{libdir}/libmcheck.a'
        - '%{libdir}/libmvec.a'
        - '%{libdir}/libpthread.a'
        - '%{libdir}/libresolv.a'
        - '%{libdir}/librt.a'
        - '%{libdir}/libutil.a'

      # Not actually used, included for completeness
      static-allowlist:
        - '%{libdir}/libc_nonshared.a'
        - '%{libdir}/libmvec_nonshared.a'
        - '%{libdir}/libc.a'

  cpe:
    patches:
    - CVE-2022-23218
    - CVE-2022-23219
    - CVE-2021-27645
    - CVE-2021-33574
    - CVE-2021-38604
    ignored:
    - CVE-2010-4756
