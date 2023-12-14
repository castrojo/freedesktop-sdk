kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- components/xorg-lib-x11.bst
- components/xorg-lib-xext.bst

variables:
  datadir: "%{libdir}/GL"

  asm: 'enabled'
  meson-local: >-
    -Dheaders=false
    -Dasm=%{asm}

  (?):
  - target_arch in ["riscv64"]:
      asm: 'disabled'

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{libdir}"/libGLESv1_CM.so*

    - |
      rm "%{install-root}%{libdir}/pkgconfig"/gl.pc
      rm "%{install-root}%{libdir}/pkgconfig"/egl.pc
      rm "%{install-root}%{libdir}/pkgconfig"/glesv2.pc
      rm "%{install-root}%{libdir}/pkgconfig"/glesv1_cm.pc

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libGLdispatch.so'
        - '%{libdir}/libOpenGL.so'
        - '%{libdir}/libEGL.so'
        - '%{libdir}/libGL.so'
        - '%{libdir}/libGLX.so'
        - '%{libdir}/libGLESv2.so'

sources:
- kind: git_repo
  url: freedesktop:glvnd/libglvnd.git
  track: v*
  ref: v1.7.0-0-gfaa23f21fc677af5792825dc30cb1ccef4bf33a6
