kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-xext.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/python3.bst
  type: build

variables:
  local_flags: >-
    -UDEFAULT_EGL_VENDOR_CONFIG_DIRS
    -DDEFAULT_EGL_VENDOR_CONFIG_DIRS=\"%{libdir}/GL/glvnd/egl_vendor.d\"

  conf-local: >-
    --enable-asm
    --enable-tls
    --disable-headers

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
  url: github:NVIDIA/libglvnd.git
  track: v*
  ref: v1.7.0-0-gfaa23f21fc677af5792825dc30cb1ccef4bf33a6
