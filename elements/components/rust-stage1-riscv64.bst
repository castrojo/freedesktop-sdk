kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: 
    tar_https:static.rust-lang.org/dist/rust-1.79.0-riscv64gc-unknown-linux-gnu.tar.xz
  ref: acfb935d96986b05d6f8071a75ecc62f404d64faa65b81b1bb025821cfd3507b
