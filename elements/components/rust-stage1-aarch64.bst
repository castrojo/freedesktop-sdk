kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.76.0-aarch64-unknown-linux-gnu.tar.xz
  ref: 171e118a34ad6bbf12540a3f1644649b0a9623c3381449ec4639f68bf293dc4e
