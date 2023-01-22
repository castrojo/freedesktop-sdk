kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.64.0-i686-unknown-linux-gnu.tar.xz
  ref: b22e0efcdff9bcb27aef82148f26a5d3d67da618da3e6e8c9402fe7fcdd8ca69
