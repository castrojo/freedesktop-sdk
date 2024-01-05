kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.74.1-aarch64-unknown-linux-gnu.tar.xz
  ref: 88d0cd0407ca5bb73b5d72956d85e31e057657c7ec09a58ca634cf36bd5cf626
