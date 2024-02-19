kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.75.0-aarch64-unknown-linux-gnu.tar.xz
  ref: 990845fa017f4dc55b866ffbfba3670e88b5b3465f420a212a372169fdf98d30
