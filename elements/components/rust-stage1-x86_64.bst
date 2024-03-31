kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.76.0-x86_64-unknown-linux-gnu.tar.xz
  ref: 04fa0cf224ed36c9c7a5ea7a0ad7d31f5ad20dda5af0cc1e5991c703e01ef988
