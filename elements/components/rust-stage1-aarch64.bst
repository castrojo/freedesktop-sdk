kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.63.0-aarch64-unknown-linux-gnu.tar.xz
  ref: 963dd3c8b0b1ba970e8608b5bf457c24d5dc471d68f40e5cb62582fbd0461988
