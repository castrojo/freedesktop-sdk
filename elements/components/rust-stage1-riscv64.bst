kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.65.0-riscv64gc-unknown-linux-gnu.tar.xz
  ref: f02e1bac01415e101fac58608b070b0f37c7df1a142c8001ddbc489cfb85c232
