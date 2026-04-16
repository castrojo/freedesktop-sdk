# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script

build-depends:
- public-stacks/runtime-minimal.bst
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- bootstrap/findutils.bst
- bootstrap/grep.bst
- components/gzip.bst
- components/supported-locales.bst

environment:
  MAXJOBS: "%{max-jobs}"

environment-nocache:
- MAXJOBS

config:
  commands:
  - |
    mkdir -p %{install-root}/usr/lib/locale

    grep -v -e "en_US.UTF-8" -e "C.UTF-8" %{datadir}/i18n/SUPPORTED | xargs -P $MAXJOBS -n 2 bash -c 'echo "Generating ${0}"; \
    localedef --prefix=%{install-root} --no-archive -i ${0%%.*} -f ${1} ${0}'


public:
  bst:
    split-rules:
      locale:
        (>):
        - "%{indep-libdir}/locale"
        - "%{indep-libdir}/locale/**"
