kind: manual

(@):
- elements/include/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.92.0-aarch64-unknown-linux-gnu.tar.xz
  ref: 3e383f8b4fca710d0600d0c1de97b78281672be2cda6575ecbe1c183a12e3822
