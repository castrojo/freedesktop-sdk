kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.77.2-riscv64gc-unknown-linux-gnu.tar.xz
  ref: 9dfa1e4b488e541fd0e9cacd786713b279b715db1e3f4754f1f460ae6ac1c6d8
