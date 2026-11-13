kind: manual

(@):
- elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.99.1-aarch64-unknown-linux-gnu.tar.xz
  ref: a48fb1e853be56ce9b8e2751f5464dbd5e16440cd81e237920f3a5e7e806333e
