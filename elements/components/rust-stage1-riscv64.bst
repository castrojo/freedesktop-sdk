kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.67.1-riscv64gc-unknown-linux-gnu.tar.xz
  ref: 50e98fefef58218bd2c09c826308d43abe11b05f528b08ecca3d2657d7996630
