kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: 
    tar_https:static.rust-lang.org/dist/rust-1.76.0-riscv64gc-unknown-linux-gnu.tar.xz
  ref: 91f706fac3429b23f1f7d870af3b1462ededf8179b5e51624caa26cb480037a5
