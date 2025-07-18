# MrZsh 🚀

A powerful bash script that automatically installs and configures a modern Zsh environment with Oh My Zsh, syntax highlighting, autosuggestions, and system information display across multiple Linux distributions.

## ✨ Features

- **Universal Package Manager Support**: Automatically detects and uses the appropriate package manager
  - Debian/Ubuntu (`apt-get`)
  - RHEL/CentOS (`yum`)
  - Fedora (`dnf`)
  - Arch Linux (`pacman`)
  - Termux (`pkg`)
- **Complete Zsh Setup**: Installs Zsh and sets it as the default shell
- **Oh My Zsh Integration**: Installs the popular Zsh framework
- **Enhanced Plugins**:
  - `zsh-autosuggestions`: Fish-like autosuggestions for Zsh
  - `zsh-syntax-highlighting`: Real-time syntax highlighting
- **Beautiful Theme**: Configures the "bira" theme for a modern look
- **System Info**: Includes Neofetch for stylish system information display
- **Smart Installation**: Checks for existing installations to avoid conflicts

## 📋 Prerequisites

- Linux-based operating system
- Internet connection for downloading packages
- `sudo` privileges for package installation

## 🚀 Quick Start

### One-Line Installation

```bash
bash MrZsh.sh
```

### Step-by-Step

1. **Clone or download the script**:
   ```bash
   wget https://raw.githubusercontent.com/yourusername/MrZsh/main/MrZsh.sh
   # or
   curl -O https://raw.githubusercontent.com/yourusername/MrZsh/main/MrZsh.sh
   ```

2. **Make it executable**:
   ```bash
   chmod +x MrZsh.sh
   ```

3. **Run the script**:
   ```bash
   ./MrZsh.sh
   ```

## 🔧 What Gets Installed

| Component | Description | Purpose |
|-----------|-------------|---------|
| **Zsh** | Z Shell | Modern shell with advanced features |
| **Oh My Zsh** | Zsh framework | Plugin and theme management |
| **zsh-autosuggestions** | Autocompletion plugin | Fish-like command suggestions |
| **zsh-syntax-highlighting** | Syntax highlighting | Real-time command validation |
| **Neofetch** | System info tool | Beautiful system information display |
| **Git** | Version control | Required for Oh My Zsh plugins |
| **Curl** | HTTP client | Required for downloading components |

## ⚙️ Configuration Details

The script automatically configures your `.zshrc` file with:

- **Theme**: `bira` - A clean, informative theme
- **Plugins**: `git`, `zsh-autosuggestions`, `zsh-syntax-highlighting`
- **Startup**: Neofetch display on terminal launch
- **Default Shell**: Sets Zsh as your default shell

## 🖥️ Supported Distributions

| Distribution Family | Package Manager | Status |
|-------------------|-----------------|--------|
| Debian/Ubuntu | `apt-get` | ✅ Supported |
| RHEL/CentOS | `yum` | ✅ Supported |
| Fedora | `dnf` | ✅ Supported |
| Arch Linux | `pacman` | ✅ Supported |
| Termux (Android) | `pkg` | ✅ Supported |

## 🛡️ Safety Features

- **Duplicate Detection**: Checks if components are already installed
- **Graceful Handling**: Skips installation if packages already exist
- **Error Reporting**: Clear error messages with colored output
- **Non-Destructive**: Preserves existing configurations when possible

## 🎨 Customization

After installation, you can customize your setup by editing `~/.zshrc`:

```bash
# Change theme
ZSH_THEME="your-preferred-theme"

# Add more plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting your-plugin)

# Remove neofetch if not desired
# Comment out or remove the 'neofetch' line
```

## 🔍 Troubleshooting

### Common Issues

1. **Permission Denied**:
   ```bash
   chmod +x MrZsh.sh
   ```

2. **Package Manager Not Found**:
   - Ensure you're running on a supported Linux distribution
   - Check if your package manager is in PATH

3. **Network Issues**:
   - Verify internet connection
   - Check if firewall allows HTTP/HTTPS connections

4. **Sudo Issues**:
   - Ensure your user has sudo privileges
   - Try running with `sudo bash MrZsh.sh` if needed

### Manual Cleanup

If you need to remove the installation:

```bash
# Remove Oh My Zsh
rm -rf ~/.oh-my-zsh

# Reset shell to bash
chsh -s /bin/bash

# Remove .zshrc (backup first!)
mv ~/.zshrc ~/.zshrc.backup
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit issues, feature requests, or pull requests.

### Development

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test on multiple distributions
5. Submit a pull request

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## 🙏 Acknowledgments

- [Oh My Zsh](https://ohmyz.sh/) - The amazing Zsh framework
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) - Fish-like autosuggestions
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) - Syntax highlighting plugin
- [Neofetch](https://github.com/dylanaraps/neofetch) - System information tool

## 📞 Support

If you encounter any issues or have questions:

1. Check the [Troubleshooting](#-troubleshooting) section
2. Search existing [Issues](https://github.com/yourusername/MrZsh/issues)
3. Create a new issue with detailed information about your system and the problem

---

**Made with ❤️ for the Linux community**
