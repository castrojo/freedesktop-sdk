kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.71.0-powerpc64le-unknown-linux-gnu.tar.xz
  ref: 1cdfccb28bed3ad6b0204e3773e3aa43a8687d1740dcb3dd21b4b37ae5308ac1
