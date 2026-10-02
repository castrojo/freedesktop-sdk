kind: manual

(@):
- elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.98.1-i686-unknown-linux-gnu.tar.xz
  ref: 51733c05e0f784825aab7391761199eb090456b2e95e45420c544eb25eaee3ba