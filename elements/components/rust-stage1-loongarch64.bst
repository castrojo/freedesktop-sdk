kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: 
    tar_https:static.rust-lang.org/dist/rust-1.81.0-loongarch64-unknown-linux-gnu.tar.xz
  ref: 35abdd57afdd85515b241e3cd8ac4b4841fc2c28055ddd1701db05d271da7093
