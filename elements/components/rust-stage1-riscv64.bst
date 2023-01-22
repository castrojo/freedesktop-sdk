kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.64.0-riscv64gc-unknown-linux-gnu.tar.xz
  ref: 822cfc0abb4a30f37bf53b6703acac69f56edb2700a62502caca5ae09ede4e10
