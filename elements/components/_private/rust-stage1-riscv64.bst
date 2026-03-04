kind: manual

(@):
- elements/include/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: 
    tar_https:static.rust-lang.org/dist/rust-1.92.0-riscv64gc-unknown-linux-gnu.tar.xz
  ref: 5492105083990bc0fd91008b1dc66b748b9687bbaf16719b5b37b1f09bf59458
