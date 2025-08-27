kind: manual

(@):
- elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.88.0-i686-unknown-linux-gnu.tar.xz
  ref: 1f28a28b025ab2637f479f7f239c391a83319dcb89c53819c5a828fe4f92616a
