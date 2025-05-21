kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.86.0-aarch64-unknown-linux-gnu.tar.xz
  ref: 2b97d1e09a1d7fdbed748332879318ee7f41c008837f87ccb44ec045df0a8a1b
