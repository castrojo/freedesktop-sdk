kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.81.0-aarch64-unknown-linux-gnu.tar.xz
  ref: 5cd65b0a2724e4193a5c4ba79f0687f8c11d52c2d58ee35bc7ce5958a3cc8dc2
