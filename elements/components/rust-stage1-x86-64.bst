kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.63.0-x86_64-unknown-linux-gnu.tar.xz
  ref: be9b25bcf1e564876762e653688e0b5df11fab53048ac18bf77761cf0a0cc465
