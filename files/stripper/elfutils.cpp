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
#include "elfutils.hpp"
#include <type_traits>
#include <cstring>

// defined since glibc 2.36
#if !defined(EM_LOONGARCH)
#define EM_LOONGARCH 258
#endif

known_arch get_arch(Elf32_Ehdr const* header) {
  auto endian = get_endianness(header);
  switch (header->e_machine) {
  case EM_AARCH64:
    return known_arch::aarch64;
  case EM_386:
    return known_arch::i686;
  case EM_ARM:
    return known_arch::arm;
  case EM_X86_64:
    return known_arch::x86_64;
  case EM_RISCV:
    return known_arch::riscv64;
  case EM_PPC64:
    if (endian == endianness::be)
      return known_arch::ppc64;
    else
      return known_arch::ppc64le;
  case EM_LOONGARCH:
    return known_arch::loongarch64;
  }
  return known_arch::unknown;
}

template <typename Header>
endianness get_endianness(Header const* header) {
  return (header->e_ident[EI_DATA] == ELFDATA2MSB)?
    endianness::be : endianness::le;
}

bool has_debuglink(fd_t& fd) {
  {
    Elf32_Ehdr header;
    mapped_file m(fd);
    auto mm_header = m.ptr<Elf32_Ehdr>(0);
    if ( get_endianness(mm_header) == endianness::be ) {
      header_be(mm_header, header);
    }
    else {
      header_le(mm_header, header);
    }

    if (header.e_ident[EI_CLASS] == ELFCLASS32) {
      return has_debuglink(m, header);
    } else if (header.e_ident[EI_CLASS] != ELFCLASS64) {
      return false;
    }
  }
  mapped_file m(fd);
  Elf64_Ehdr header;
  auto mm_header = m.ptr<Elf64_Ehdr>(0);
  if ( get_endianness(mm_header) == endianness::be ) {
    header_be(mm_header, header);
  }
  else {
    header_le(mm_header, header);
  }

  return has_debuglink(m, header);
}

template <typename Header>
void header_be(Header const* mm_header, Header &header) {
  if constexpr (std::is_same_v<Header, Elf64_Ehdr>) {
    memcpy(header.e_ident,mm_header->e_ident,sizeof(unsigned char)*EI_NIDENT);
    header.e_type      = be16toh(mm_header->e_type);
    header.e_machine   = be16toh(mm_header->e_machine);
    header.e_version   = be32toh(mm_header->e_version);
    header.e_entry     = be64toh(mm_header->e_entry);
    header.e_phoff     = be64toh(mm_header->e_phoff);
    header.e_shoff     = be64toh(mm_header->e_shoff);
    header.e_flags     = be32toh(mm_header->e_flags);
    header.e_ehsize    = be16toh(mm_header->e_ehsize);
    header.e_phentsize = be16toh(mm_header->e_phentsize);
    header.e_phnum     = be16toh(mm_header->e_phnum);
    header.e_shentsize = be16toh(mm_header->e_shentsize);
    header.e_shnum     = be16toh(mm_header->e_shnum);
    header.e_shstrndx  = be16toh(mm_header->e_shstrndx);
  }
  else if constexpr (std::is_same_v<Header, Elf32_Ehdr>) {
    memcpy(header.e_ident,mm_header->e_ident,sizeof(unsigned char)*EI_NIDENT);
    header.e_type      = be16toh(mm_header->e_type);
    header.e_machine   = be16toh(mm_header->e_machine);
    header.e_version   = be32toh(mm_header->e_version);
    header.e_entry     = be32toh(mm_header->e_entry);
    header.e_phoff     = be32toh(mm_header->e_phoff);
    header.e_shoff     = be32toh(mm_header->e_shoff);
    header.e_flags     = be32toh(mm_header->e_flags);
    header.e_ehsize    = be16toh(mm_header->e_ehsize);
    header.e_phentsize = be16toh(mm_header->e_phentsize);
    header.e_phnum     = be16toh(mm_header->e_phnum);
    header.e_shentsize = be16toh(mm_header->e_shentsize);
    header.e_shnum     = be16toh(mm_header->e_shnum);
    header.e_shstrndx  = be16toh(mm_header->e_shstrndx);
  }
  else {
    throw std::runtime_error("Cannot cast BE Elf header");
  }
}

template <typename Header>
void header_le(Header const* mm_header, Header &header) {
  if constexpr (std::is_same_v<Header, Elf64_Ehdr>) {
    memcpy(header.e_ident,mm_header->e_ident,sizeof(unsigned char)*EI_NIDENT);
    header.e_type      = le16toh(mm_header->e_type);
    header.e_machine   = le16toh(mm_header->e_machine);
    header.e_version   = le32toh(mm_header->e_version);
    header.e_entry     = le64toh(mm_header->e_entry);
    header.e_phoff     = le64toh(mm_header->e_phoff);
    header.e_shoff     = le64toh(mm_header->e_shoff);
    header.e_flags     = le32toh(mm_header->e_flags);
    header.e_ehsize    = le16toh(mm_header->e_ehsize);
    header.e_phentsize = le16toh(mm_header->e_phentsize);
    header.e_phnum     = le16toh(mm_header->e_phnum);
    header.e_shentsize = le16toh(mm_header->e_shentsize);
    header.e_shnum     = le16toh(mm_header->e_shnum);
    header.e_shstrndx  = le16toh(mm_header->e_shstrndx);
  }
  else if constexpr (std::is_same_v<Header, Elf32_Ehdr>) {
    memcpy(header.e_ident,mm_header->e_ident,sizeof(unsigned char)*EI_NIDENT);
    header.e_type      = le16toh(mm_header->e_type);
    header.e_machine   = le16toh(mm_header->e_machine);
    header.e_version   = le32toh(mm_header->e_version);
    header.e_entry     = le32toh(mm_header->e_entry);
    header.e_phoff     = le32toh(mm_header->e_phoff);
    header.e_shoff     = le32toh(mm_header->e_shoff);
    header.e_flags     = le32toh(mm_header->e_flags);
    header.e_ehsize    = le16toh(mm_header->e_ehsize);
    header.e_phentsize = le16toh(mm_header->e_phentsize);
    header.e_phnum     = le16toh(mm_header->e_phnum);
    header.e_shentsize = le16toh(mm_header->e_shentsize);
    header.e_shnum     = le16toh(mm_header->e_shnum);
    header.e_shstrndx  = le16toh(mm_header->e_shstrndx);
  }
  else {
    throw std::runtime_error("Cannot cast LE Elf header");
  }
}

template <typename Header>
Header const
sect_header_be(Header const* mm_header) {
  Header header;
  if constexpr (std::is_same_v<Header, Elf64_Shdr>) {
    header.sh_name = be32toh(mm_header->sh_name);
    header.sh_type = be32toh(mm_header->sh_type);
    header.sh_flags = be64toh(mm_header->sh_flags);
    header.sh_addr = be64toh(mm_header->sh_addr);
    header.sh_offset = be64toh(mm_header->sh_offset);
    header.sh_size = be64toh(mm_header->sh_size);
    header.sh_link = be32toh(mm_header->sh_link);
    header.sh_info = be32toh(mm_header->sh_info);
    header.sh_addralign = be64toh(mm_header->sh_addralign);
    header.sh_entsize = be64toh(mm_header->sh_entsize);
    return static_cast<Header const>(header);
  }
  else if constexpr (std::is_same_v<Header, Elf32_Shdr>) {
    header.sh_name = be32toh(mm_header->sh_name);
    header.sh_type = be32toh(mm_header->sh_type);
    header.sh_flags = be32toh(mm_header->sh_flags);
    header.sh_addr = be32toh(mm_header->sh_addr);
    header.sh_offset = be32toh(mm_header->sh_offset);
    header.sh_size = be32toh(mm_header->sh_size);
    header.sh_link = be32toh(mm_header->sh_link);
    header.sh_info = be32toh(mm_header->sh_info);
    header.sh_addralign = be32toh(mm_header->sh_addralign);
    header.sh_entsize = be32toh(mm_header->sh_entsize);
    return static_cast<Header const>(header);
  }
  else {
    throw std::runtime_error("Cannot cast section header");
  }
}

template <typename Header>
Header const
sect_header_le(Header const* mm_header) {
  Header header;
  if constexpr (std::is_same_v<Header, Elf64_Shdr>) {
    header.sh_name = le32toh(mm_header->sh_name);
    header.sh_type = le32toh(mm_header->sh_type);
    header.sh_flags = le64toh(mm_header->sh_flags);
    header.sh_addr = le64toh(mm_header->sh_addr);
    header.sh_offset = le64toh(mm_header->sh_offset);
    header.sh_size = le64toh(mm_header->sh_size);
    header.sh_link = le32toh(mm_header->sh_link);
    header.sh_info = le32toh(mm_header->sh_info);
    header.sh_addralign = le64toh(mm_header->sh_addralign);
    header.sh_entsize = le64toh(mm_header->sh_entsize);
    return static_cast<Header const>(header);
  }
  else if constexpr (std::is_same_v<Header, Elf32_Shdr>) {
    header.sh_name = le32toh(mm_header->sh_name);
    header.sh_type = le32toh(mm_header->sh_type);
    header.sh_flags = le32toh(mm_header->sh_flags);
    header.sh_addr = le32toh(mm_header->sh_addr);
    header.sh_offset = le32toh(mm_header->sh_offset);
    header.sh_size = le32toh(mm_header->sh_size);
    header.sh_link = le32toh(mm_header->sh_link);
    header.sh_info = le32toh(mm_header->sh_info);
    header.sh_addralign = le32toh(mm_header->sh_addralign);
    header.sh_entsize = le32toh(mm_header->sh_entsize);
    return static_cast<Header const>(header);
  }
  else {
    throw std::runtime_error("Cannot cast section header");
  }
}
