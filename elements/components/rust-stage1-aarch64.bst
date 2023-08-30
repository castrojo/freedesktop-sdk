kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.71.0-aarch64-unknown-linux-gnu.tar.xz
  ref: 9712efaa9c7977b6f03aeb3ef086d0050273f498790bf242e96b9a8117de901f
