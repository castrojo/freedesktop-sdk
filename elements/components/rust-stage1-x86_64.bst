kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.74.1-x86_64-unknown-linux-gnu.tar.xz
  ref: 5483e32fe962e9123cf49c9cf169e60640d4c9d0aad1a054dd4bf232f0f012be
