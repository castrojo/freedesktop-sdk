kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.69.0-x86_64-unknown-linux-gnu.tar.xz
  ref: fe0d3eb8604a72cd70030b72b3199a2eb7ed2a427ac7462e959e93b367ff5855
