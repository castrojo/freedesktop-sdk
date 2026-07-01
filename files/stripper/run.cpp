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
#include "run.hpp"

#include <sys/types.h>
#include <unistd.h>
#include <system_error>
#include <iostream>
#include <sys/wait.h>

int run(std::vector<std::string> args, fd_t output) {
  pid_t pid = fork();
  if (pid == -1) {
    throw std::system_error(errno, std::generic_category());
  } else if (pid == 0) {
    char const* argv[args.size() + 1];
    for (size_t i = 0; i < args.size(); ++i) {
      argv[i] = args[i].c_str();
    }
    argv[args.size()] = nullptr;
    if (output.get() != -1) {
      close(1);
      if (dup2(output.get(), 1) != 1) {
        std::error_code ec(errno, std::generic_category());
        std::cerr << "dup2: " << ec.message() << '\n';
        exit(1);
      }
      output = fd_t{};
    }
    execvp(argv[0], const_cast<char* const*>(argv));
    std::error_code ec(errno, std::generic_category());
    std::cerr << "execlp failed: " << ec.message() << '\n';
    exit(1);
  } else {
    int wstatus;
    waitpid(pid, &wstatus, 0);
    return WEXITSTATUS(wstatus);
  }
}
