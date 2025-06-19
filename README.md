# GTK Environment Diagnostic and Configuration Script

This script is designed to perform a diagnostic check of the GTK environment on a Linux system and configure GTK themes, icons, and fonts. It ensures that essential services are running, checks for the presence of necessary configuration files, and installs missing themes and icons if required. This script is specifically tailored for use with the Openbox window manager and Tint2 panel on a Debian 12 environment.

## Features

- **Service Check**: Verifies the status of essential services like `dbus`, `gvfs-daemons`, `dconf-service`, `xdg-desktop-portal`, and `gnome-keyring`.
- **Environment Variable Check**: Ensures that the `DBUS_SESSION_BUS_ADDRESS` environment variable is defined.
- **Configuration File Review**: Checks for the presence of GTK configuration files (`~/.gtkrc-2.0` and `~/.config/gtk-3.0/settings.ini`) and reviews their contents.
- **Theme and Icon Check**: Verifies the availability of specified themes and icons, and installs them if they are missing.
- **Configuration**: Configures GTK themes, icons, and fonts by creating or updating the necessary configuration files.

## Prerequisites

- A Debian 12 system with Openbox window manager and Tint2 panel installed.
- `systemctl`, `dpkg`, and `apt` commands available.
- `sudo` privileges to install missing packages.

## Usage

1. **Download the Script**: Save the script to a file named `config_gtk.sh`.

2. **Make the Script Executable**:
   ```bash
   chmod +x config_gtk.sh
# GTK Environment Diagnostic and Configuration Script

This script is designed to perform a diagnostic check of the GTK environment on a Linux system and configure GTK themes, icons, and fonts. It ensures that essential services are running, checks for the presence of necessary configuration files, and installs missing themes and icons if required. This script is specifically tailored for use with the Openbox window manager and Tint2 panel on a Debian 12 environment.

## Features

- **Service Check**: Verifies the status of essential services like `dbus`, `gvfs-daemons`, `dconf-service`, `xdg-desktop-portal`, and `gnome-keyring`.
- **Environment Variable Check**: Ensures that the `DBUS_SESSION_BUS_ADDRESS` environment variable is defined.
- **Configuration File Review**: Checks for the presence of GTK configuration files (`~/.gtkrc-2.0` and `~/.config/gtk-3.0/settings.ini`) and reviews their contents.
- **Theme and Icon Check**: Verifies the availability of specified themes and icons, and installs them if they are missing.
- **Configuration**: Configures GTK themes, icons, and fonts by creating or updating the necessary configuration files.

## Prerequisites

- A Debian 12 system with Openbox window manager and Tint2 panel installed.
- `systemctl`, `dpkg`, and `apt` commands available.
- `sudo` privileges to install missing packages.

## Usage

1. **Download the Script**: Save the script to a file named `config_gtk.sh`.

2. **Make the Script Executable**:
   ```bash
   chmod +x config_gtk.sh
   ```

3. **Run the Script**:
   ```bash
   ./config_gtk.sh
   ```

## Script Details

### Service Check

The script checks the status of the following services:
- `dbus`
- `gvfs-daemons`
- `dconf-service`
- `xdg-desktop-portal`
- `gnome-keyring`

### Environment Variable Check

The script checks if the `DBUS_SESSION_BUS_ADDRESS` environment variable is defined.

### Configuration File Review

The script checks for the presence of the following configuration files:
- `~/.gtkrc-2.0`
- `~/.config/gtk-3.0/settings.ini`

If these files are found, the script reviews their contents to ensure they include the necessary GTK settings.

### Theme and Icon Check

The script checks for the presence of the following themes and icons:
- Themes: `Arc-Dark`, `Blackbird`
- Icons: `elementary-xfce`, `Faenza`, `Adwaita`

If any of these themes or icons are missing, the script installs them using `apt`.

### Configuration

The script configures the GTK environment by creating or updating the following files:
- `~/.gtkrc-2.0`
- `~/.config/gtk-3.0/settings.ini`

It sets the following configurations:
- Theme: `Blackbird`
- Icon Theme: `elementary-xfce`
- Font: `Monospace 9`

Additionally, the script configures the cursor theme by updating the `~/.Xresources` file and merging it with the current X resources.

## Notes

- After running the script, you may need to restart any GTK2 and GTK3 applications to see the changes.
- The script uses `sudo` to install missing packages. Ensure you have the necessary permissions to run `sudo` commands.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

This README provides a basic overview of the script's functionality and usage instructions. For more detailed information, refer to the script comments and documentation.