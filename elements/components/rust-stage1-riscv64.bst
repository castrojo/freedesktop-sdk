kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.69.0-riscv64gc-unknown-linux-gnu.tar.xz
  ref: 267f17bad3cdbfbad18ffd6d71ef506f0290a05e221a6d41d78d828f791ef90d
