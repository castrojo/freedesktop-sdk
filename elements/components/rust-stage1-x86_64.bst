kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.86.0-x86_64-unknown-linux-gnu.tar.xz
  ref: 6b448b3669e0c74f7f4b87da7da4868a552fcbba1f955032d8925ad2fffb3798
