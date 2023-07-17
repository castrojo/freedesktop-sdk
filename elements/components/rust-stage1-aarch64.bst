kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.70.0-aarch64-unknown-linux-gnu.tar.xz
  ref: a36e20a55e39c857f9ec69b146ae04572d5e666e76ff2dd6422cc8f575aed1c7
