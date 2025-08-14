kind: manual

depends:
- components/python3.bst

config:
  install-commands:
  - |
    LIBDEST=$(python3 -c "import sysconfig; print(sysconfig.get_path('purelib'))")
    mkdir -p $LIBDEST
    install -m 644 -D build.py "%{install-root}${LIBDEST}/build.py"
    python3 -m compileall -o 0 -o 1 -o 2 "%{install-root}${LIBDEST}/build.py"

  - |
    %{install-extra}

variables:
  strip-binaries: ''

sources:
- kind: local
  path: files/python-bootstrap/build.py
