kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.75.0-i686-unknown-linux-gnu.tar.xz
  ref: 90e51bf23bf94614ddb685211bd6df7c5a8c77065c715f89793e1465f408e8c2
