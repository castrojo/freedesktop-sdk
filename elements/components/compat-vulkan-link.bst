kind: stack
description: Create a compat vulkan link

public:
  bst:
    integration-commands:
    - |
      mkdir -p "%{datadir}/vulkan"
      ln -svf "%{libdir}/GL/vulkan/icd.d" "%{datadir}/vulkan/icd.d"
      ln -svf "%{libdir}/GL/vulkan/implicit_layer.d" "%{datadir}/vulkan/implicit_layer.d"
      ln -svf "%{libdir}/GL/vulkan/explicit_layer.d" "%{datadir}/vulkan/explicit_layer.d"
