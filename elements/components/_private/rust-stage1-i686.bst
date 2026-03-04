kind: manual

(@):
- elements/include/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.92.0-i686-unknown-linux-gnu.tar.xz
  ref: bdccb6bf0eb08b256ec08115e6b7a7daeb5db097b2f75288f1935ee3177f2cf1
