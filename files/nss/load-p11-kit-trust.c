// SPDX-FileCopyrightText: Freedesktop-SDK Developers
// SPDX-License-Identifier: MIT

#include <stdlib.h>
#include <p11-kit/p11-kit.h>
#include <dlfcn.h>
#include <string.h>

static
void* load_library()
{
  static void* handle = NULL;

  CK_FUNCTION_LIST ** modules = NULL;
  CK_FUNCTION_LIST * m = NULL;
  char* filename = NULL;

  if (handle != NULL) {
    return handle;
  }

  modules = p11_kit_modules_load(NULL, P11_KIT_MODULE_TRUSTED);
  if (!modules) {
    return NULL;
  }

  m = p11_kit_module_for_name(modules, "p11-kit-trust");
  if (!m) {
    p11_kit_modules_release(modules);
    return NULL;
  }

  filename = p11_kit_module_get_filename(m);
  p11_kit_modules_release(modules);

  if (!filename) {
    return NULL;
  }

  handle = dlopen(filename, RTLD_NOW|RTLD_LOCAL);

  free(filename);

  return handle;
}

CK_RV
C_GetFunctionList(CK_FUNCTION_LIST_PTR_PTR list)
{
  static CK_RV (*trust_C_GetFunctionList)(CK_FUNCTION_LIST_PTR_PTR) = NULL;
  void* handle = NULL;

  if (trust_C_GetFunctionList == NULL) {
    handle = load_library();
    if (!handle) {
      return CKR_LIBRARY_LOAD_FAILED;
    }

    trust_C_GetFunctionList = (CK_RV (*)(CK_FUNCTION_LIST_PTR_PTR))dlsym(handle, "C_GetFunctionList");
    if (!trust_C_GetFunctionList) {
      return CKR_LIBRARY_LOAD_FAILED;
    }
  }

  return (*trust_C_GetFunctionList)(list);
}

static CK_RV
default_C_GetInterfaceList (CK_INTERFACE_PTR list, CK_ULONG_PTR count) {
  *count = 1;
  if (list == NULL) {
    return CKR_OK;
  }
  list[0].pInterfaceName = "PKCS 11";
  list[0].flags = 0;
  return C_GetFunctionList((CK_FUNCTION_LIST_PTR_PTR)&list[0].pFunctionList);
}

CK_RV
C_GetInterfaceList (CK_INTERFACE_PTR list, CK_ULONG_PTR count) {
  static CK_RV (*trust_C_GetInterfaceList)(CK_INTERFACE_PTR, CK_ULONG_PTR) = NULL;
  void* handle = NULL;

  if (trust_C_GetInterfaceList == NULL) {
    handle = load_library();
    if (!handle) {
      return CKR_LIBRARY_LOAD_FAILED;
    }

    trust_C_GetInterfaceList = (CK_RV (*)(CK_INTERFACE_PTR, CK_ULONG_PTR))dlsym(handle, "C_GetInterfaceList");
    if (!trust_C_GetInterfaceList) {
      trust_C_GetInterfaceList = default_C_GetInterfaceList;
    }
  }

  return (*trust_C_GetInterfaceList)(list, count);
}

static CK_RV
default_C_GetInterface (CK_UTF8CHAR_PTR name, CK_VERSION_PTR version,
                        CK_INTERFACE_PTR_PTR interface, CK_FLAGS flags) {
  static int interface_set = 0;
  static struct CK_INTERFACE default_interface;

  if (interface == NULL) {
    return CKR_ARGUMENTS_BAD;
  }

  if (name != NULL && strcmp((char*)name, "PKCS 11") != 0) {
    return CKR_ARGUMENTS_BAD;
  }

  if (flags != 0) {
    return CKR_ARGUMENTS_BAD;
  }

  if (interface_set == 0) {
    CK_RV ret = C_GetFunctionList((CK_FUNCTION_LIST_PTR_PTR)&(default_interface.pFunctionList));
    if (ret != CKR_OK) {
      return ret;
    }

    default_interface.pInterfaceName = "PKCS 11";
    default_interface.flags = 0;

    interface_set = 1;
  }

  if ((version != NULL)
      && ((((CK_FUNCTION_LIST_PTR)(default_interface.pFunctionList))->version.major != version->major)
          || (((CK_FUNCTION_LIST_PTR)(default_interface.pFunctionList))->version.minor != version->minor))) {
    return CKR_ARGUMENTS_BAD;
  }

  *interface = &default_interface;

  return CKR_OK;
}

CK_RV
C_GetInterface (CK_UTF8CHAR_PTR name, CK_VERSION_PTR version,
                CK_INTERFACE_PTR_PTR interface, CK_FLAGS flags) {
  static CK_RV (*trust_C_GetInterface)(CK_UTF8CHAR_PTR, CK_VERSION_PTR, CK_INTERFACE_PTR_PTR, CK_FLAGS) = NULL;
  void* handle = NULL;

  if (trust_C_GetInterface == NULL) {
    handle = load_library();
    if (!handle) {
      return CKR_LIBRARY_LOAD_FAILED;
    }

    trust_C_GetInterface = (CK_RV (*)(CK_UTF8CHAR_PTR, CK_VERSION_PTR, CK_INTERFACE_PTR_PTR, CK_FLAGS))dlsym(handle, "C_GetInterface");
    if (!trust_C_GetInterface) {
      trust_C_GetInterface = default_C_GetInterface;
    }
  }

  return (*trust_C_GetInterface)(name, version, interface, flags);
}
