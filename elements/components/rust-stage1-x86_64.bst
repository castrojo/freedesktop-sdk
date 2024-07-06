kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.78.0-x86_64-unknown-linux-gnu.tar.xz
  ref: ea144a052c0980dfbc6c84b3eda21e9f61b02b7b171787c7de80d7a8ad344ab3
