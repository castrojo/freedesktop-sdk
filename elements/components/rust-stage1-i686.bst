kind: manual

(@):
- elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.86.0-i686-unknown-linux-gnu.tar.xz
  ref: 70eab6af09396f59f353a40adb5e89a830ec2f94f4374147f5132e79d031d433
