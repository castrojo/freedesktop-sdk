// SPDX-FileCopyrightText: Freedesktop-SDK Developers
// SPDX-License-Identifier: MIT

#include "libheif/heif.h"
#include <iostream>
#include <optional>
#include <string>
#include <cstring>

std::optional<std::string> getArg(int argc, char* argv[]) {
    if (argc > 1) {
        return std::string(argv[1]);
    }
    return std::nullopt;
}

int main(int argc, char* argv[]) {
    auto plugin_paths = heif_get_plugin_directories();

    if (plugin_paths == nullptr || plugin_paths[0] == nullptr) {
        std::cout << "Plugin path not found\n";
        heif_free_plugin_directories(plugin_paths);
        return 1;
    }

    std::optional<std::string> firstArg = getArg(argc, argv);

    if (!firstArg) {
        std::cout << "No argument provided\n";
        heif_free_plugin_directories(plugin_paths);
        return 1;
    }

    std::cout << "Plugin path is " << plugin_paths[0] << "\n";
    std::cout << "Argument is " << *firstArg << "\n";

    if (strcmp(plugin_paths[0], firstArg->c_str()) != 0) {
        std::cout << "Plugin path does not match argument\n";
        heif_free_plugin_directories(plugin_paths);
        return 1;
    }

    std::cout << "Plugin path matches argument\n";
    heif_free_plugin_directories(plugin_paths);
    return 0;
}
