FROM alpine:3.23 AS builder

# Install default packages
RUN apk add \
  bash \
  neovim \
  git \
  luarocks \
  python3 \
  fzf \
  ripgrep \
  xsel \
  wl-clipboard

ENV HOME=/app \
    XDG_CONFIG_HOME=/app/config \
    XDG_DATA_HOME=/app/data \
    XDG_STATE_HOME=/app/state \
    XDG_CACHE_HOME=/app/cache

RUN mkdir -p /app/config/nvim /app/data /app/state /app/cache
COPY . /app/config/nvim/
COPY docker/build.lua /tmp/build.lua
RUN rm -rf /app/config/nvim/docker

# Pre-sync plugins & Mason LSPs (no treesitter step - see build.lua)
RUN XDG_CONFIG_HOME=/app/config \
    XDG_DATA_HOME=/app/data \
    XDG_STATE_HOME=/app/state \
    XDG_CACHE_HOME=/app/cache \
    nvim --headless -u /app/config/nvim/init.lua -l /tmp/build.lua

# Strip git folders, caches and download leftovers to cut image size
RUN find /app/data -name ".git" -type d -exec rm -rf {} + 2>/dev/null || true
RUN find /app -type d \( -iname "__pycache__" -o -iname "*.dist-info" \) -exec rm -rf {} + 2>/dev/null || true
RUN find /app/data -type f \( -iname "*.tar.gz" -o -iname "*.zip" -o -iname "*.whl" \) -delete 2>/dev/null || true
RUN rm -rf /app/cache/* 2>/dev/null || true
RUN rm -rf /var/cache/apk
RUN rm -rf /var/log
RUN chmod -R 777 /app

COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
