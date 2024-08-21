kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.79.0-aarch64-unknown-linux-gnu.tar.xz
  ref: 8e7a2d514ee469325e5a7d0a2f0cad313aecb4c3da134f3bf84f7901a809d566
