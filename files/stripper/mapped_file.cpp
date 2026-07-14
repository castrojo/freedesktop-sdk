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
#include "mapped_file.hpp"
#include <sys/stat.h>

mapped_file::mapped_file(fd_t& fd): fd(&fd) {
  auto st = fd.get_stat();
  file_size = st.st_size;
}

void* mapped_file::map_slice(off_t offset, std::size_t size) {
  auto mem = mmap(nullptr, size, PROT_READ, MAP_PRIVATE,
             fd->get(), offset);
  if (mem == MAP_FAILED) {
    throw std::system_error(errno, std::generic_category());
  }
  slices[offset].push_back(slice(mem, size));

  return mem;
}

namespace {
  std::size_t page_size = getpagesize();
}

void* mapped_file::ptr_void(off_t offset, std::size_t size) {
  off_t aligned_offset = offset & ~(page_size-1);
  off_t diff = offset - aligned_offset;
  std::size_t aligned_size = (diff + size + page_size - 1) & ~(page_size-1);

  auto found = slices.find(aligned_offset);
  if (found != slices.end()) {
    for (auto& entry : found->second) {
      if (entry.size >= aligned_size) {
        return static_cast<void*>(static_cast<char*>(entry.mem)+diff);
      }
    }
  }

  auto allocated = map_slice(aligned_offset, aligned_size);
  return static_cast<void*>(static_cast<char*>(allocated)+diff);
}

mapped_file::slice::~slice() {
  if (mem != nullptr) {
    munmap(mem, size);
  }
}
