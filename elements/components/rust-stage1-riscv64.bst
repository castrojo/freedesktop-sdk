kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.74.1-riscv64gc-unknown-linux-gnu.tar.xz
  ref: 4abc1499e91cfadf7610a08271d1f5ff9284a54ba4a0ba60f105bb9b2413169e
