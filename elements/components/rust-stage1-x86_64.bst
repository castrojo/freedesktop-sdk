kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.75.0-x86_64-unknown-linux-gnu.tar.xz
  ref: 6bf166ddcad545aa26aa2d12a186454d7697133b52b7fbbd271ce3ee1ecfedc6
