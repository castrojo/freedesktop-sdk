kind: manual

(@):
- elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: 
    tar_https:static.rust-lang.org/dist/rust-1.86.0-riscv64gc-unknown-linux-gnu.tar.xz
  ref: bd968612d77de0d2bb4ec4d33f4aa105c5cdc44eca8deabfe2d8cae2a0ffbe18
