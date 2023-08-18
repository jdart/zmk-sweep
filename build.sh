#!/usr/bin/env bash

set -xe

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )"/..

mkdir -p zmk-config/builds
rm -rf zmk-config/builds/dartyl*

west build -s zmk/app -b "nice_nano_v2" --pristine -- -DZMK_CONFIG="/workspaces/zmk-config/config" -DSHIELD="dartyl_left" && \
    cp build/zephyr/zmk.uf2 zmk-config/builds/dartyl_left.uf2

west build -s zmk/app -b "nice_nano_v2" --pristine -- -DZMK_CONFIG="/workspaces/zmk-config/config" -DSHIELD="dartyl_right" && \
    cp build/zephyr/zmk.uf2 zmk-config/builds/dartyl_right.uf2

# west build -s zmk/app -b "nice_nano_v2" --pristine -- -DZMK_CONFIG="/workspaces/zmk-config/config" -DSHIELD="settings_reset" && \
#     cp build/zephyr/zmk.uf2 zmk-config/builds/nice_settings_reset.uf2

west build -s zmk/app -b "seeeduino_xiao_ble" --pristine -- -DZMK_CONFIG="/workspaces/zmk-config/config" -DSHIELD="dartyl_dongle" && \
    cp build/zephyr/zmk.uf2 zmk-config/builds/dartyl_dongle.uf2

west build -s zmk/app -b "seeeduino_xiao_ble" --pristine -- -DZMK_CONFIG="/workspaces/zmk-config/config" -DSHIELD="settings_reset" && \
  cp build/zephyr/zmk.uf2 zmk-config/builds/xiao_settings_reset.uf2
