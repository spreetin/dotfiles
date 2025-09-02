#!/usr/bin/env bash

CURRENT=$(hyprctl getoption input:kb_layout -j | jq ".str" -r)

if [ "$CURRENT" == "se" ]; then
  hyprctl keyword input:kb_layout us
else
  hyprctl keyword input:kb_layout se
fi
