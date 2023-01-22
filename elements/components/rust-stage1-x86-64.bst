kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.64.0-x86_64-unknown-linux-gnu.tar.xz
  ref: bd69e42f6cfe3ba96d781ad0b4095ddac4f0fc31c1af445018edf6f0aba543e4
