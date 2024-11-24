kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.81.0-i686-unknown-linux-gnu.tar.xz
  ref: b8e1a2889c574d235b210ae7ac8dd0696ea845fdc3707d67955d53ad4c0de027
