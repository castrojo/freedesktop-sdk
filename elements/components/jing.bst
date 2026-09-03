# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT
# Jing RELAX NG validator

kind: manual

build-depends:
- public-stacks/runtime-gnu.bst
- components/git.bst

depends:
- public-stacks/runtime-minimal.bst
- components/openjdk25.bst

variables:
  strip-binaries: ''

config:
  build-commands:
  - |
    set -e

    export JAVA_HOME="%{libdir}/jvm/openjdk-25"
    ./ant

  install-commands:
  - |
    set -e

    install -d "%{install-root}%{datadir}/java/jing"
    install -m 644 build/jing.jar \
      "%{install-root}%{datadir}/java/jing/jing.jar"

    install -d "%{install-root}%{bindir}"
    cat > "%{install-root}%{bindir}/jing" <<'SCRIPT'
    #!/bin/sh
    exec java -jar /usr/share/java/jing/jing.jar "$@"
    SCRIPT
    chmod 755 "%{install-root}%{bindir}/jing"

sources:
- kind: git_repo
  url: github:relaxng/jing-trang.git
  ref: a6bc0041035988325dfbfe7823ef2c098fc56597

- kind: git_module
  path: relaxng.org
  url: github:relaxng/relaxng.org.git
  ref: 1fc8c8d337c2c75b6b15b281f2c69e86110e475f
