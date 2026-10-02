kind: manual

(@):
- elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.98.1-x86_64-unknown-linux-gnu.tar.xz
  ref: 5326b36c53de11d148c8f8dab6553a3d1006c2cfd32123683073fad3c302605b
