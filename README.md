# MyDotFiles

A collection of personal dotfiles and custom scripts to streamline development environment setup and daily workflows.

## 🚀 Features

- **Stow Configuration Files**: Enhanced productivity through GNU Stow-managed dotfiles
- **Custom Shell Scripts**: Automation scripts for common development tasks
- **Easy Installation**: Streamlined setup process for quick environment configuration
- **Modular Structure**: Well-organized configuration files for different tools and applications

## 📦 Included Configurations

- `dunst`: Notification daemon configuration
- `git`: Git configuration and aliases
- `hyprland`: Hyprland window manager settings
- `kitty`: Kitty terminal emulator configuration
- `nvim`: Neovim editor setup and plugins
- `rofi`: Application launcher configuration
- `tmux`: Terminal multiplexer settings
- `waybar`: Status bar configuration for Wayland
- `waypaper`: Wallpaper manager settings
- `wlogout`: Logout manager configuration
- `zsh`: Z shell configuration and custom functions

## 🛠️ Installation

1. Clone the repository:
```bash
git clone https://github.com/HaroonSaifi17/MyDotFiles.git
cd MyDotFiles
```

2. Install GNU Stow if you haven't already:
```bash
# For Debian/Ubuntu
sudo apt install stow

# For Arch Linux
sudo pacman -S stow
```

3. Use stow to symlink the configurations:
```bash
stow */  # This will stow all configurations
# Or stow individual configurations:
stow nvim
stow zsh
```

## 🔧 Customization

Each tool's configuration can be found in its respective directory. Feel free to modify the configurations to match your preferences:

- `scripts/` directory contains helper scripts and utilities

## 📝 Contributing

Contributions are welcome! If you have any improvements or bug fixes:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the [MIT License](LICENSE) - see the LICENSE file for details.

## 🙏 Acknowledgments

- Thanks to the open-source community for providing amazing tools
- Inspired by various dotfile repositories in the GitHub community

## 📞 Contact

- GitHub: [@HaroonSaifi17](https://github.com/HaroonSaifi17)

---

⭐ Star this repository if you find it helpful!
