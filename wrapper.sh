#!/usr/bin/env bash

HOST_PWD="$(pwd)"
CONTAINER_PWD="/host${HOST_PWD}"

# Directories on your HOST machine where Neovim's persistent bits will live.
# - state: shada, undo history, sessions, etc.
# - data:  Lazy plugins, Mason-installed LSPs, and Themery's saved colorscheme.
#          (Themery writes its state.json under Neovim's "data" path, which is
#          why it needs to be a real persistent volume too, not just "state".)
HOST_STATE_DIR="${HOME}/.local/share/docker-nvim/state"
HOST_DATA_DIR="${HOME}/.local/share/docker-nvim/data"
mkdir -p "${HOST_STATE_DIR}" "${HOST_DATA_DIR}"

WAYLAND_SOCKET="${XDG_RUNTIME_DIR}/${WAYLAND_DISPLAY:-wayland-0}"
WAYLAND_MOUNT=()
if [ -S "$WAYLAND_SOCKET" ]; then
  WAYLAND_MOUNT=(
    -e WAYLAND_DISPLAY="${WAYLAND_DISPLAY}"
    -e XDG_RUNTIME_DIR="/tmp"
    -v "${WAYLAND_SOCKET}:/tmp/${WAYLAND_DISPLAY}"
  )
fi

exec docker run -it --rm \
  --net=host \
  -e HOME="/app" \
  -e XDG_CONFIG_HOME="/app/config" \
  -e XDG_DATA_HOME="/app/data" \
  -e XDG_STATE_HOME="/app/state" \
  -e XDG_CACHE_HOME="/app/cache" \
  -e DISPLAY="${DISPLAY:-:0}" \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -v "${HOME}/.Xauthority:/app/.Xauthority:ro" \
  "${WAYLAND_MOUNT[@]}" \
  -v "${HOST_DATA_DIR}:/app/data" \
  -v "${HOST_STATE_DIR}:/app/state" \
  -v /:/host \
  -w "${CONTAINER_PWD}" \
  --user "$(id -u):$(id -g)" \
  doomnvim-slim "$@"
