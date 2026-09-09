-- docker/shell.lua
-- Source this from init.lua (e.g. `require("docker.shell")` if it lives
-- under lua/docker/shell.lua in your config, or dofile(...) it directly).
--
-- Picks the shell binary matching whatever the host was using
-- ($HOST_SHELL, set by wrapper.sh from the host's $SHELL) instead of
-- defaulting to /bin/sh. This is the container's OWN zsh/bash binary
-- (baked in via EXTRA_SHELLS in the Dockerfile) - not a bind-mount of the
-- host's actual binary, since that would hit the same glibc/musl mismatch
-- Mason binaries run into. It also won't read your host's ~/.zshrc, since
-- $HOME inside the container is /app, not your real home - you get the
-- shell's normal behaviour, not your personal config, unless you bind-mount
-- specific rc files in separately later.

local host_shell = vim.env.HOST_SHELL

if host_shell and host_shell ~= "" then
  local path = vim.fn.exepath(host_shell)
  if path ~= "" then
    vim.o.shell = path
  else
    vim.notify(
      ("HOST_SHELL=%s requested but not installed in this image (see EXTRA_SHELLS in the Dockerfile) - falling back to %s")
        :format(host_shell, vim.o.shell),
      vim.log.levels.WARN
    )
  end
end

-- If you use a floating-terminal plugin (toggleterm.nvim, etc.), it may not
-- read the global 'shell' option by default - point it at the same
-- resolved path explicitly. Example for toggleterm.nvim:
--
-- require("toggleterm").setup({ shell = vim.o.shell })
