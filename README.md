# 🍰 nix-flake-config

My personal [NixOS](https://nixos.org/) flake-based configuration, designed for a development and content-creation workstation powered by **Hyprland**, **NVIDIA**, and a solid suite of tools.

---

## 🖥️ System Overview

- **Display Server**: Wayland (Hyprland)
- **Graphics**: NVIDIA (PRIME setup with Intel)
- **Terminal**: Ghostty
- **Window Manager Bar**: Waybar
- **Launcher**: Rofi
- **Audio**: PipeWire + PavuControl
- **Clipboard**: `wl-clipboard`
- **File Systems**: Auto-mount support via `udisks2`, `devmon`, `gvfs`

---

## 🔧 Core Packages

### 📝 Editors
- `neovim` – lightweight and powerful code editor
- `obsidian` – markdown-based knowledge management

### 🖥️ Terminal & UI Tools
- `ghostty` – GPU-accelerated terminal emulator
- `rofi` – app launcher
- `waybar` – Wayland status bar
- `wl-clipboard` – Wayland clipboard tool
- `pavucontrol` – audio control panel
- `udisks2` – disk management

### 📽️ Media & Streaming
- `vlc` – video player
- `obs-studio` – video recording/streaming
- `discord` – chat and screen sharing
- `cudatoolkit` – screen sharing/video encoding with NVIDIA

### 🔋 Power & Battery
- `power-profiles-daemon` – power management backend

### 🎨 Ricing & Eye Candy
- `swww` – Wayland wallpaper daemon
- `hyprpaper` – wallpaper manager
- `hyprshot` – screenshot tool
- `eww` – customizable widget framework
- `jq`, `socat` – handy CLI tools for scripts/widgets

### 🌐 Tunnels & Remote
- `cloudflared` – secure tunnels via Cloudflare
- `appimage-run` – run AppImage-based apps (e.g. Zed browser)

---

## 👨‍💻 Developer Tools

- `git`, `bun`, `nodejs`, `go`, `gcc`, `clang`, `cmake`, `zig`, `lua`, `python3`, `unzip`
- **Lua tools**: `stylua`, `luacheck`, `lua-language-server`
- Built-in support for:
  - Compiling C/C++/Zig
  - JavaScript & Node tooling
  - Lua dev and linting
  - Python scripting

---

## 🧠 Services & Daemons

### 🖼️ NVIDIA Setup
- Hybrid GPU (PRIME) with Intel & NVIDIA
- `nvidiaSettings`, `nvidiaPersistenced`, `modesetting`
- 32-bit and container support (`nvidia-container-toolkit`)

### 🔊 Audio (PipeWire)
- Full PipeWire stack:
  - ALSA
  - PulseAudio
  - JACK
  - `wireplumber` session manager

### ☀️ Game Streaming (Sunshine)
- `sunshine` service for low-latency remote desktop/streaming
- CUDA support enabled
- Firewall automatically opened

### 🖥️ Remote Desktop (VNC)
- `xrdp` enabled for RDP access

### 🔌 Auto-Mount & Storage
- `devmon`, `gvfs`, `udisks2` for USB and disk handling

### 🐘 PostgreSQL
- Service enabled with:
  - Trust auth for local connections

### 🔐 SSH
- `openssh` server enabled

---

## 📦 Flake Usage

This repo is intended to be used with a Nix flake setup. Clone it and use as your system configuration:

```bash
git clone git@github.com:cheezecakee/nix-flake-config.git ~/myflake
cd ~/myflake
sudo nixos-rebuild switch --flake .

