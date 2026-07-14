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
#include "thread_pool.hpp"

thread_pool::thread_pool(std::size_t size): running(true) {
  for (std::size_t i = 0; i < size; ++i) {
    threads.emplace_back([this] { this->run_worker(); });
  }
}

thread_pool::~thread_pool() {
  {
    std::lock_guard<std::mutex> lk(jobs_mutex);
    running = false;
    filled.notify_all();
  }
  for (auto& t : threads) {
    t.join();
  }
}

void thread_pool::run_worker() {
  while (true) {
    std::function<void()> front;
    {
      std::unique_lock<std::mutex> l(jobs_mutex);
      filled.wait(l, [&] { return !running || !jobs.empty(); });
      if (jobs.empty() && !running) break ;
      front = std::move(jobs.front());
      jobs.pop_front();
    }
    front();
  }
}
