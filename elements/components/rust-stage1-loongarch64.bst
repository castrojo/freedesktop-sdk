kind: manual

(@):
- elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: 
    tar_https:static.rust-lang.org/dist/rust-1.88.0-loongarch64-unknown-linux-gnu.tar.xz
  ref: 351293deeac73e30c3d67db28a4894642d132e934aeeda44eedf8df036a88c97
