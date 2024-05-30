kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.77.2-x86_64-unknown-linux-gnu.tar.xz
  ref: fbcaf0a49541bb99684802229b4cdbccfde5be9d14f18197cecb39276c901a01
