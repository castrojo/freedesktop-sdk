kind: meson

depends:
- filename: bootstrap-import.bst
- filename: desktop/llvm7.bst
  type: build
- filename: desktop/llvm7-static.bst
  type: build
- filename: desktop/llvm7-runtime.bst
  type: runtime
- filename: desktop/libdrm.bst
- filename: desktop/libva.bst
- filename: desktop/libclc.bst
- filename: desktop/opencl.bst
- filename: desktop/xorg-lib-xdamage.bst
- filename: desktop/xorg-lib-xfixes.bst
- filename: desktop/xorg-lib-xrandr.bst
- filename: desktop/xorg-lib-xshmfence.bst
- filename: desktop/xorg-lib-xxf86vm.bst
- filename: desktop/wayland.bst
- filename: desktop/wayland-protocols.bst
  type: build
- filename: desktop/libglvnd.bst
- filename: desktop/libvdpau.bst
- filename: base/bison.bst
  type: build
- filename: base/flex.bst
  type: build
- filename: base/libunwind.bst
- filename: base/buildsystem-meson.bst
  type: build
- filename: base/python3.bst
  type: build
- filename: base/python3-mako.bst
  type: build
- filename: base/gettext.bst
  type: build

variables:
  (?):
  - target_arch == "i686" or target_arch == "x86_64":
      gallium_drivers: nouveau,r600,r300,radeonsi,svga,swrast,virgl
      dri_drivers: i915,i965,nouveau,r100,r200
      vulkan_drivers: amd,intel
      enable_libunwind: 'true'
  - target_arch == "arm" or target_arch == "aarch64":
      gallium_drivers: etnaviv,freedreno,kmsro,nouveau,swrast,tegra,virgl,vc4
      dri_drivers: ''
      vulkan_drivers: ''
      enable_libunwind: 'false'

  meson-local: |
    -Db_ndebug=true \
    -Ddri3=true \
    -Ddri-drivers=%{dri_drivers} \
    -Degl=true \
    -Dgallium-drivers=%{gallium_drivers} \
    -Dgallium-nine=true \
    -Dgallium-omx=disabled \
    -Dgallium-opencl=icd \
    -Dgallium-va=true \
    -Dgallium-vdpau=true \
    -Dgallium-xa=false \
    -Dgallium-xvmc=false \
    -Dgbm=true \
    -Dgles1=false \
    -Dgles2=true \
    -Dglvnd=true \
    -Dglx=auto \
    -Dlibunwind=%{enable_libunwind} \
    -Dllvm=true \
    -Dlmsensors=false \
    -Dosmesa=gallium \
    -Dplatforms=x11,drm,surfaceless,wayland \
    -Dselinux=false \
    -Dshared-glapi=true \
    -Dvalgrind=false \
    -Dvulkan-drivers=%{vulkan_drivers} \
    -Dvulkan-icd-dir="%{libdir}/vulkan/icd.d" \
    -Dxlib-lease=true

config:
  install-commands:
    (>):
    - |
      mkdir -p "%{install-root}%{libdir}"
      mv "%{install-root}%{sysconfdir}/OpenCL" "%{install-root}%{libdir}/"
      ln -s libEGL_mesa.so.0 %{install-root}%{libdir}/libEGL_indirect.so.0
      ln -s libGLX_mesa.so.0 %{install-root}%{libdir}/libGLX_indirect.so.0
      rm -f "%{install-root}%{libdir}"/libGLESv2*
      rm -f "%{install-root}%{libdir}/libGLX_mesa.so"
      rm -f "%{install-root}%{libdir}/libEGL_mesa.so"
      rm -f "%{install-root}%{libdir}/libglapi.so"

    - |
      for dir in vdpau dri; do
        for file in "%{install-root}%{libdir}/${dir}/"*.so*; do
          soname="$(objdump -p "${file}" | sed "/ *SONAME */{;s///;q;};d")"
          if [ -L "${file}" ]; then
            continue
          fi
          if ! [ -f "%{install-root}%{libdir}/${dir}/${soname}" ]; then
            mv "${file}" "%{install-root}%{libdir}/${dir}/${soname}"
          else
            rm "${file}"
          fi
          ln -s "${soname}" "${file}"
        done
      done

    # For some reason Mesa does not install glesv2.pc. But it is not
    # installed by libglvnd either. If the following test fails, then
    # it was fixed and you need to remove the 3 following commands.
    - |
      ! [ -f "%{install-root}%{libdir}/pkgconfig/glesv2.pc" ]

    - |
      cat <<\EOF >glesv2.pc
      prefix=%{prefix}
      libdir=%{libdir}
      includedir=%{includedir}

      Name: glesv2
      Description: Mesa OpenGL ES 2.0 library
      Version: 19.1.7
      Libs: -lGLESv2
      Cflags: -I${includedir}
      EOF

    - |
      install -Dm644 glesv2.pc "%{install-root}%{libdir}/pkgconfig/glesv2.pc"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgbm.so'
        - '%{libdir}/libglapi.so'
        - '%{libdir}/libOSMesa.so'
        - '%{libdir}/libwayland-egl.so'
        - '%{libdir}/libMesaOpenCL.so'

sources:
- kind: git_tag
  url: freedesktop:mesa/mesa.git
  track: '19.1'
  ref: mesa-19.1.8-0-g5c6d266c591208b1c27e06f61b814210fc6e095f
