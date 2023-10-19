kind: manual
description: Fedora CA certificates

variables:
  p11_format_bundle: ca-bundle.trust.p11-kit
  classic_tls_bundle: ca-bundle.crt
  openssl_format_trust_bundle: ca-bundle.trust.crt
  legacy_default_bundle: ca-bundle.legacy.default.crt
  legacy_disable_bundle: ca-bundle.legacy.disable.crt
  java_bundle: java/cacerts
  catrustdir: "%{sysconfdir}/pki/ca-trust"
  pkidir: "%{sysconfdir}/pki"
  usr-store: "%{pkidir}/ca-trust-store"
  manpage-xsl: "%{datadir}/xml/docbook/xml/xsl-stylesheets/manpages/docbook.xsl"

build-depends:
- components/asciidoc.bst
- components/python3.bst
- components/docbook-xsl.bst
- components/libxslt.bst

depends:
- components/p11-kit.bst

runtime-depends:
- components/util-linux.bst  # Integration command depends on this

config:
  build-commands:
  - |
    mkdir certs
    cd certs
    cp ../certdata.txt .
    cp ../certdata2pem.py .
    python certdata2pem.py

  - |
    cat > %{p11_format_bundle} <<EOF
    # This is a bundle of X.509 certificates of public Certificate
    # Authorities.  It was generated from the Mozilla root CA list.
    # These certificates and trust/distrust attributes use the file format accepted
    # by the p11-kit-trust module.
    #
    # Source: nss/lib/ckfw/builtins/certdata.txt
    # Source: nss/lib/ckfw/builtins/nssckbi.h
    #
    # Generated from:
    $(grep -w NSS_BUILTINS_LIBRARY_VERSION nsskbi.h | awk '{print "# " $2 " " $3}')
    $(echo '#')
    EOF
    P11FILES=`find certs -name \*.tmp-p11-kit | wc -l`
    if [ $P11FILES -ne 0 ]; then
      for p in certs/*.tmp-p11-kit; do 
        cat "$p" >> %{p11_format_bundle}
      done
    fi
    # Append trust fixes
    cat trust-fixes >> %{p11_format_bundle}

  - |
    touch %{legacy_default_bundle}
    NUM_LEGACY_DEFAULT=`find certs/legacy-default -type f | wc -l`
    if [ $NUM_LEGACY_DEFAULT -ne 0 ]; then
      for f in certs/legacy-default/*.crt; do 
        echo "processing $f"
        tbits=`sed -n '/^# openssl-trust/{s/^.*=//;p;}' $f`
        alias=`sed -n '/^# alias=/{s/^.*=//;p;q;}' $f | sed "s/'//g" | sed 's/"//g'`
        targs=""
        if [ -n "$tbits" ]; then
          for t in $tbits; do
            targs="${targs} -addtrust $t"
          done
        fi
        if [ -n "$targs" ]; then
          echo "legacy default flags $targs for $f" >> info.trust
          openssl x509 -text -in "$f" -trustout $targs -setalias "$alias" >> %{legacy_default_bundle}
         fi
       done
     fi

  - |
    touch %{legacy_disable_bundle}
    NUM_LEGACY_DISABLE=`find certs/legacy-disable -type f | wc -l`
    if [ $NUM_LEGACY_DISABLE -ne 0 ]; then
      for f in certs/legacy-disable/*.crt; do 
        echo "processing $f"
        tbits=`sed -n '/^# openssl-trust/{s/^.*=//;p;}' $f`
        alias=`sed -n '/^# alias=/{s/^.*=//;p;q;}' $f | sed "s/'//g" | sed 's/"//g'`
        targs=""
        if [ -n "$tbits" ]; then
          for t in $tbits; do
            targs="${targs} -addtrust $t"
          done
        fi
        if [ -n "$targs" ]; then
          echo "legacy disable flags $targs for $f" >> info.trust
          openssl x509 -text -in "$f" -trustout $targs -setalias "$alias" >> %{legacy_disable_bundle}
        fi
      done
    fi

  - |
    asciidoc -v -d manpage -b docbook update-ca-trust.8.txt
    xsltproc --nonet "%{manpage-xsl}" update-ca-trust.8.xml

    asciidoc -v -d manpage -b docbook ca-legacy.8.txt
    xsltproc --nonet "%{manpage-xsl}" ca-legacy.8.xml

  install-commands:
  - |
    mkdir -p -m 755 %{install-root}%{pkidir}/tls/certs
    mkdir -p -m 755 %{install-root}%{pkidir}/java
    mkdir -p -m 755 %{install-root}%{sysconfdir}/ssl
    mkdir -p -m 755 %{install-root}%{catrustdir}/source
    mkdir -p -m 755 %{install-root}%{catrustdir}/source/anchors
    mkdir -p -m 755 %{install-root}%{catrustdir}/source/blacklist
    mkdir -p -m 755 %{install-root}%{catrustdir}/source/blocklist
    mkdir -p -m 755 %{install-root}%{catrustdir}/extracted
    mkdir -p -m 755 %{install-root}%{catrustdir}/extracted/pem
    mkdir -p -m 755 %{install-root}%{catrustdir}/extracted/openssl
    mkdir -p -m 755 %{install-root}%{catrustdir}/extracted/java
    mkdir -p -m 755 %{install-root}%{catrustdir}/extracted/edk2
    mkdir -p -m 755 %{install-root}%{datadir}/pki/ca-trust-source
    mkdir -p -m 755 %{install-root}%{datadir}/pki/ca-trust-source/anchors
    mkdir -p -m 755 %{install-root}%{datadir}/pki/ca-trust-source/blacklist
    mkdir -p -m 755 %{install-root}%{datadir}/pki/ca-trust-source/blocklist
    mkdir -p -m 755 %{install-root}%{datadir}/pki/ca-trust-legacy
    mkdir -p -m 755 %{install-root}%{bindir}
    mkdir -p -m 755 %{install-root}%{mandir}/man8

    install -p -m 644 update-ca-trust.8 %{install-root}%{mandir}/man8
    install -p -m 644 ca-legacy.8 %{install-root}%{mandir}/man8
    install -p -m 644 README.usr %{install-root}%{datadir}/pki/ca-trust-source/README
    install -p -m 644 README.etc %{install-root}%{catrustdir}/README
    install -p -m 644 README.extr %{install-root}%{catrustdir}/extracted/README
    install -p -m 644 README.java %{install-root}%{catrustdir}/extracted/java/README
    install -p -m 644 README.openssl %{install-root}%{catrustdir}/extracted/openssl/README
    install -p -m 644 README.pem %{install-root}%{catrustdir}/extracted/pem/README
    install -p -m 644 README.edk2 %{install-root}%{catrustdir}/extracted/edk2/README
    install -p -m 644 README.src %{install-root}%{catrustdir}/source/README
    install -p -m 644 README.etcssl %{install-root}%{sysconfdir}/ssl/README

    install -p -m 644 %{p11_format_bundle} %{install-root}%{datadir}/pki/ca-trust-source/%{p11_format_bundle}

    install -p -m 644 %{legacy_default_bundle} %{install-root}%{datadir}/pki/ca-trust-legacy/%{legacy_default_bundle}
    install -p -m 644 %{legacy_disable_bundle} %{install-root}%{datadir}/pki/ca-trust-legacy/%{legacy_disable_bundle}

    install -p -m 644 ca-legacy.conf %{install-root}%{catrustdir}/ca-legacy.conf

    touch -r %{p11_format_bundle} %{install-root}%{datadir}/pki/ca-trust-source/%{p11_format_bundle}

    touch -r %{legacy_default_bundle} %{install-root}%{datadir}/pki/ca-trust-legacy/%{legacy_default_bundle}
    touch -r %{legacy_disable_bundle} %{install-root}%{datadir}/pki/ca-trust-legacy/%{legacy_disable_bundle}

    install -p -m 755 update-ca-trust %{install-root}%{bindir}/update-ca-trust

    install -p -m 755 ca-legacy %{install-root}%{bindir}/ca-legacy

  - |
    # /etc/ssl is provided in a Debian compatible form for (bad) code that
    # expects it: https://bugzilla.redhat.com/show_bug.cgi?id=1053882
    ln -s %{catrustdir}/extracted/pem/directory-hash \
    %{install-root}%{sysconfdir}/ssl/certs
    ln -s %{catrustdir}/extracted/pem/tls-ca-bundle.pem \
    %{install-root}%{sysconfdir}/ssl/cert.pem
    ln -s /etc/pki/tls/openssl.cnf \
    %{install-root}%{sysconfdir}/ssl/openssl.cnf
    ln -s /etc/pki/tls/ct_log_list.cnf \
    %{install-root}%{sysconfdir}/ssl/ct_log_list.cnf
    # legacy filenames
    ln -s %{catrustdir}/extracted/pem/tls-ca-bundle.pem \
    %{install-root}%{pkidir}/tls/cert.pem
    ln -s %{catrustdir}/extracted/pem/tls-ca-bundle.pem \
    %{install-root}%{pkidir}/tls/certs/%{classic_tls_bundle}
    ln -s %{catrustdir}/extracted/openssl/%{openssl_format_trust_bundle} \
    %{install-root}%{pkidir}/tls/certs/%{openssl_format_trust_bundle}
    ln -s %{catrustdir}/extracted/%{java_bundle} \
    %{install-root}%{pkidir}/%{java_bundle}

public:
  bst:
    integration-commands:
    - |
      update-ca-trust extract
      chmod -R u+w %{catrustdir}/extracted

sources:
- kind: git_tag
  url: fedora_rpms:ca-certificates.git
  track: rawhide
  track-tags: false
  ref: ca-certificates-2010_63-3_fc14-147-g44da037acbb6f11874d82c55afc46db072984c08
