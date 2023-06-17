kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.69.0-aarch64-unknown-linux-gnu.tar.xz
  ref: 1d92fc3dd807c0182d0f87b90a9d5dac8be4164d3096634e2da23cc2a6c39792
