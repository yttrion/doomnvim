#!/usr/bin/env bash
set -euo pipefail

# /app/data and /app/state are normally bind-mounted from the host, so they
# arrive EMPTY the very first time a given host directory is used. This
# copies the pre-built plugins/LSPs (data) and any baked default state
# (state) into them exactly once, so the volume becomes the permanent home
# for everything Lazy, Mason and Themery write from then on.
seed() {
  local target="$1"
  local seed_src="/opt/nvim-seed/$(basename "$target")"
  if [ -d "$seed_src" ] && [ -z "$(ls -A "$target" 2>/dev/null)" ]; then
    cp -a "$seed_src/." "$target/"
  fi
}

seed /app/data
seed /app/state

exec nvim "$@"
