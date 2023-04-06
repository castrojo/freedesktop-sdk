kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.67.1-aarch64-unknown-linux-gnu.tar.xz
  ref: b7b8e8b70cae457092661894efa5a4861ef4f0e20f2f617d05d6f17b1f780a68
