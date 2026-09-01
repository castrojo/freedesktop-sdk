# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT
# Jing RELAX NG validator

kind: manual

build-depends:
- public-stacks/runtime-gnu.bst
- components/findutils.bst

depends:
- public-stacks/runtime-minimal.bst
- components/openjdk25.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    set -e

    jing_jar="$(find . -type f -name jing.jar -print -quit)"
    test -n "$jing_jar"
    jing_dir="$(dirname "$jing_jar")"

    install -d "%{install-root}%{datadir}/java/jing"
    cp -a "$jing_dir"/. "%{install-root}%{datadir}/java/jing/"

    install -d "%{install-root}%{bindir}"
    cat > "%{install-root}%{bindir}/jing" <<'SCRIPT'
    #!/bin/sh
    exec java -jar /usr/share/java/jing/jing.jar "$@"
    SCRIPT
    chmod 755 "%{install-root}%{bindir}/jing"

sources:
- kind: zip
  url: github_files:relaxng/jing-trang/releases/download/V20241231/jing-20241231.zip
  ref: d11a765f9106e398e01d66aaffb629beb1da21f8a716299e2930a751130bfad2
  base-dir: ''
