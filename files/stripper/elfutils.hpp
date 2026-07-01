// SPDX-FileCopyrightText: Freedesktop-SDK Developers
// SPDX-License-Identifier: MIT

/*
 * Copyright (c) 2019 Codethink Ltd.
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use, copy,
 * modify, merge, publish, distribute, sublicense, and/or sell copies
 * of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
 * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
#ifndef ELFUTILS_HPP
#define ELFUTILS_HPP

#include "arch.hpp"
#include "mapped_file.hpp"

#include <elf.h>
#include <cassert>

known_arch get_arch(Elf32_Ehdr const* header);

template <typename Header>
struct header_traits {
};

template <>
struct header_traits<Elf64_Ehdr> {
  using section_header_t = Elf64_Shdr;
};

template <>
struct header_traits<Elf32_Ehdr> {
  using section_header_t = Elf32_Shdr;
};

template <typename Header>
using section_header_t = typename header_traits<Header>::section_header_t;

template <typename Header>
endianness get_endianness(Header const* header);

template <typename Header>
Header const
sect_header_be(Header const* mm_header);

template <typename Header>
Header const
sect_header_le(Header const* mm_header);

template <typename Header>
section_header_t<Header> const
get_section(mapped_file& file, Header const& header, unsigned n) {
  assert((header.e_shoff + header.e_shentsize*n) < file.get_size());
  auto secthdr = file.ptr<section_header_t<Header>>(header.e_shoff + header.e_shentsize*n);
  if ( get_endianness(&header) == endianness::be ) {
    return sect_header_be(secthdr);
  }
  return sect_header_le(secthdr);
}

template <typename Header>
bool has_debuglink(mapped_file& file, Header const& header) {
  if ((header.e_shoff + header.e_shentsize*header.e_shnum) > file.get_size()) {
    throw std::runtime_error("Unexpected values for section headers");
  }
  if ((header.e_shstrndx >= header.e_shnum)) {
    throw std::runtime_error("Unexpected value for e_shstrndx");
  }
  auto strheader = get_section(file, header, header.e_shstrndx);
  if ((strheader.sh_offset+strheader.sh_size) > file.get_size()) {
    throw std::runtime_error("String table section outside of file");
  }
  auto strtbl = file.ptr<char>(strheader.sh_offset, strheader.sh_size);
  for (unsigned i = 0; i < header.e_shnum; ++i) {
    auto section = get_section(file, header, i);
    if (section.sh_name >= strheader.sh_size) {
      throw std::runtime_error("String not in within table");
    }
    std::string name(strtbl+section.sh_name);
    if (name == ".gnu_debuglink")
      return true;
  }
  return false;
}

bool has_debuglink(fd_t& fd);

template <typename Header>
void header_be(Header const* mm_header, Header &header);

template <typename Header>
void header_le(Header const* mm_header, Header &header);

#endif //ELFUTILS_HPP
