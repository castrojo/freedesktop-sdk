kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.65.0-x86_64-unknown-linux-gnu.tar.xz
  ref: 9455cab767f7b9f46259aac8d953f15f11b3d65513384e2b0a5e77d0432ae82f
