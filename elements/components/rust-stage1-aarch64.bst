kind: manual

(@):
- elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.97.0-aarch64-unknown-linux-gnu.tar.xz
  ref: 4c88fe30a748a8853c19f4e8876a64b32005bc4cbcde48e93732d06a430e808a
