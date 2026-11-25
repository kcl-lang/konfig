#!/bin/sh

# Stop on error.

# Note: Before you start tests, please install kcl
# kcl installation: https://kcl-lang.io/docs/user_docs/getting-started/install

set -e

find ./examples -name "main.k" -exec dirname {} \; | while read -r dir; do
    if output=$(cd "$dir" && kcl run); then
        # nginx-example is the documented first run. KCL 0.12.8 evaluated
        # config.replicas as Undefined inside server_backend.k (discussion 2126).
        case "$dir" in
            *nginx-example/dev)
                printf '%s\n' "$output" | grep -q "replicas: 1" || {
                    echo "\033[31mTest FAILED - $dir (expected replicas: 1)\033[0m\n"
                    exit 1
                }
                ;;
        esac
        echo "\033[32mTest SUCCESSED - $dir\033[0m\n"
    else
        echo "\033[31mTest FAILED - $dir\033[0m\n"
        exit 1
    fi
done
