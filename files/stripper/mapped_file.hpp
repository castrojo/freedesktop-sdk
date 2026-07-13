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
#ifndef MAPPED_FILE_HPP
#define MAPPED_FILE_HPP

#include "fd.hpp"
#include <sys/mman.h>
#include <map>
#include <vector>
#include <utility>
#include <unistd.h>

class mapped_file {
public:
  mapped_file(): fd(nullptr) {
  }

  explicit mapped_file(fd_t& fd);

  template <typename T>
  T const* ptr(off_t offset, std::size_t n) {
    return static_cast<T const*>(ptr_void(offset, n*sizeof(T)));
  }

  template <typename T>
  T const* ptr(off_t offset) {
    return ptr<T>(offset, 1);
  }

  std::size_t get_size() const {
    return file_size;
  }

private:
  void* ptr_void(off_t offset, std::size_t n);
  void* map_slice(off_t offset, std::size_t size);

  struct slice {
    void* mem;
    std::size_t size;

    slice(): mem(nullptr) {}
    slice(void* mem, std::size_t size): mem(mem), size(size) {}
    slice(slice const&) = delete;
    slice(slice&& other) noexcept:
      mem(std::exchange(other.mem, nullptr)), size(std::move(other.size)) {}
    ~slice();
  };

  fd_t* fd;
  std::map<std::size_t, std::vector<slice>> slices;
  std::size_t file_size;
};

#endif //MAPPED_FILE_HPP
