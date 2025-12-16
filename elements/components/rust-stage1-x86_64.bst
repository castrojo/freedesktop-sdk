kind: manual

(@):
- elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.91.0-x86_64-unknown-linux-gnu.tar.xz
  ref: 5bea12c1911dda5c0a91cee4e9b617a65bcf23a21e2852a17b544936de1f83e3
