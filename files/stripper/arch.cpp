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
#include "arch.hpp"
#include <unistd.h>

std::string get_triplet(known_arch arch) {
  std::string triplet;
  switch (arch) {
  case known_arch::x86_64:
    triplet = "x86_64-unknown-linux-gnu";
    break ;
  case known_arch::i686:
    triplet = "i686-unknown-linux-gnu";
    break ;
  case known_arch::aarch64:
    triplet = "aarch64-unknown-linux-gnu";
    break ;
  case known_arch::arm:
    triplet = "arm-unknown-linux-gnueabihf";
    break ;
  case known_arch::ppc64le:
    triplet = "powerpc64le-unknown-linux-gnu";
    break ;
  case known_arch::ppc64:
    triplet = "powerpc64-unknown-linux-gnu";
    break ;
  case known_arch::riscv64:
    triplet = "riscv64-unknown-linux-gnu";
    break ;
  case known_arch::loongarch64:
    triplet = "loongarch64-unknown-linux-gnu";
    break ;
  case known_arch::unknown:
    throw std::runtime_error("Unknown toolchain");
  }

  return triplet;
}

std::filesystem::path get_toolchain(std::vector<std::string> const& prefixes, known_arch arch) {
  std::string triplet = get_triplet(arch);

  for (auto& prefix: prefixes) {
    std::filesystem::path p(prefix);
    auto bindir = p / triplet / "bin";
    auto objdump = bindir / "objdump";
    if (0 == access(objdump.c_str(), X_OK)) {
      return bindir;
    }
  }

  throw std::runtime_error("Toolchain not found");
}
