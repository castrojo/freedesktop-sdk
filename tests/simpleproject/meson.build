project('shared lib', 'c')

lib = library('mylib', 'library.c', install : true)

executable('hello', 'prog.c', link_with : lib, install: true)
