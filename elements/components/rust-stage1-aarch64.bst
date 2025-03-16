kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.84.0-aarch64-unknown-linux-gnu.tar.xz
  ref: c535d4eb461a361fcaaad98ce578b5846e1a0bd3ff6939874a3e9cbe72cfae17
