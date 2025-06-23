kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: gitlab:cunity/cunit.git
  track: '*.*.*'
  ref: 3.5.4-0-g697b1fbc9ae01903b262d608cf5fe3fb1b38931f
