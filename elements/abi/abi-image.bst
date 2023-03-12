kind: compose

description: Composes the platform image with the library headers, to check its ABI.

build-depends:
- platform-image.bst
- abi/sdk-lib-headers.bst
