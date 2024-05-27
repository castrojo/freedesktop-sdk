kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.77.2-i686-unknown-linux-gnu.tar.xz
  ref: 10bde924c9ca7e6ef075c70751d7e8ed6ce8012d80ea7967aa61c8d99ff986c6
