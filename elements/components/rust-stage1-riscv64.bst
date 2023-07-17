kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.70.0-riscv64gc-unknown-linux-gnu.tar.xz
  ref: 2da9c69e6ce28da52a2b5ec78db090f41a393bf4b290012058be4f09559662a3
