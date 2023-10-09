kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.72.1-riscv64gc-unknown-linux-gnu.tar.xz
  ref: 9fcee22b5e86d366942f715a1075c21ca605db8d43851ddcae3b6bbf919bf5f9
