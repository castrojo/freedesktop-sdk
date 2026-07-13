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
#ifndef THREAD_POOL_HPP
#define THREAD_POOL_HPP

#include <thread>
#include <memory>
#include <future>
#include <vector>
#include <list>

class thread_pool {
public:
  explicit thread_pool(std::size_t size);
  ~thread_pool();

  template <typename Fun>
  std::future<typename std::result_of<typename std::decay<Fun>::type()>::type>
  post(Fun&& fun) {
    using ret_type = typename std::result_of<typename std::decay<Fun>::type()>::type;
    auto task = std::make_shared<std::packaged_task<ret_type()> >(std::forward<Fun>(fun));
    auto ret = task->get_future();
    {
      std::lock_guard<std::mutex> lk(jobs_mutex);
      jobs.push_back([task] { return (*task)(); });
      filled.notify_one();
    }
    return ret;
  }

private:
  void run_worker();

private:
  std::vector<std::thread> threads;
  std::list<std::function<void()> > jobs;
  bool running;
  mutable std::mutex jobs_mutex;
  std::condition_variable filled;
};

#endif //THREAD_POOL_HPP
