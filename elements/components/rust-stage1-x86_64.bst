kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.79.0-x86_64-unknown-linux-gnu.tar.xz
  ref: ce552d6bf22a2544ea78647d98cb405d5089af58dbcaa4efea711bf8becd71c5
