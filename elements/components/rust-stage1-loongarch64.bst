kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: 
    tar_https:static.rust-lang.org/dist/rust-1.79.0-loongarch64-unknown-linux-gnu.tar.xz
  ref: 70cbe2abba1fee4ed65f056b5c6b477809e4f0ab7d481f43a543c22178527661
