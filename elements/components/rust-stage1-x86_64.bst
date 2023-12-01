kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.72.1-x86_64-unknown-linux-gnu.tar.xz
  ref: 5b5fa378b428aae010b1f1201a44d4aac83899216d3392aa0b2953edee633ba0
