kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.71.0-x86_64-unknown-linux-gnu.tar.xz
  ref: 7ae6cf3686f7638c8263d6d7aba68e275edee4e4d832723c603ddab96e330fa4
