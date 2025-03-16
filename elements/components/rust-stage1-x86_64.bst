kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.84.0-x86_64-unknown-linux-gnu.tar.xz
  ref: 73aca7e08720b7bf28beee8f2370c6aef961aa87e9674989f5ce62ec2f95dcfd
