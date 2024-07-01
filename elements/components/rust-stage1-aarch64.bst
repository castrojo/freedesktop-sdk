kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.78.0-aarch64-unknown-linux-gnu.tar.xz
  ref: e33789c7c32d89cbb939b2f58b7651c736cb9f37e42e11152cda7cc33df686a0
