kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.78.0-loongarch64-unknown-linux-gnu.tar.xz
  ref: 2d12243dc6371583838dc3c8660e1cb73541ec5880c06f3e65f46307aa8e2191
