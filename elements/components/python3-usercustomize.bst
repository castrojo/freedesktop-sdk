kind: manual
depends:
- components/python3.bst

config:
  install-commands:
  - |
    LIBDEST="$(python3 -c "import sysconfig; print(sysconfig.get_path('stdlib'))")"
    install -m 644 -D python3_usercustomize.py "%{install-root}${LIBDEST}/usercustomize.py"
    python3 -m compileall -o 0 -o 1 -o 2 "%{install-root}${LIBDEST}/usercustomize.py"

sources:
- kind: local
  path: files/python3_usercustomize.py
