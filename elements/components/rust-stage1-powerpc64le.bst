kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: 
    tar_https:static.rust-lang.org/dist/rust-1.76.0-powerpc64le-unknown-linux-gnu.tar.xz
  ref: 42620515ebed3ba9adf264194898f3c3ffe8512d9bde70d7948c545e6f43a34d
