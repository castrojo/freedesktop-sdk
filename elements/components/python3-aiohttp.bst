# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst
- components/findutils.bst
- components/grep.bst
- components/python3-pkgconfig.bst

runtime-depends:
- components/python3-aiohappyeyeballs.bst
- components/python3-aiosignal.bst
- components/python3-attrs.bst
- components/python3-chardet.bst
- components/python3-multidict.bst
- components/python3-yarl.bst
- components/python3.bst

config:
  build-commands:
    (<):
    - |
      python3 -m cython -3 -I aiohttp \
        -o aiohttp/_http_parser.c \
        aiohttp/_http_parser.pyx

    - |
      python3 -m cython -3 -I aiohttp \
        -o aiohttp/_http_writer.c \
        aiohttp/_http_writer.pyx

    - |
      python3 -m cython -3 -I aiohttp \
        -o aiohttp/_websocket/mask.c \
        aiohttp/_websocket/mask.pyx

    - |
      python3 -m cython -3 -I aiohttp \
        --module-name aiohttp._websocket.reader_c \
        -o aiohttp/_websocket/reader_c.c \
        aiohttp/_websocket/reader_py.py

sources:
- kind: pypi
  name: aiohttp
  ref:
    sha256sum: 5558a7f5a05af9ecf744af91e5baefc436f93c9333e656c27ec253f9a6bbe178
    suffix: 6c/4c/bdccd81e9ee225b69c60e7766c9a5b05364f118f4d383713b89a682d772d/aiohttp-3.14.5.tar.gz
