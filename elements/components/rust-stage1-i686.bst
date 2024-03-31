kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.76.0-i686-unknown-linux-gnu.tar.xz
  ref: 7a7cf14defe7a055d097912f573f061e88083a47f0438f0f4ee651424db6ec8f
