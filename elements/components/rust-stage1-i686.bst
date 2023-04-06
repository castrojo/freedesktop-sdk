kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.67.1-i686-unknown-linux-gnu.tar.xz
  ref: b686a2d0d1648e1b84def715dd65a85a3d2802b33ecf65808bdb2ed639aec7d3
