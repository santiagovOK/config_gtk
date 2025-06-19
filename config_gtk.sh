#!/bin/bash

echo "🔍 GTK Environment Diagnostic and Configuration"
echo "-------------------------------------------------------"

# Check essential services
services=("dbus" "gvfs-daemons" "dconf-service" "xdg-desktop-portal" "gnome-keyring")

for srv in "${services[@]}"; do
    if systemctl --user status $srv &>/dev/null || systemctl status $srv &>/dev/null; then
        echo "✅ Service '$srv' is active"
    else
        echo "⚠️ Service '$srv' is not active"
    fi
done

# Check D-Bus environment variable
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    echo "❌ DBUS_SESSION_BUS_ADDRESS is not defined"
else
    echo "✅ Variable DBUS_SESSION_BUS_ADDRESS is defined"
fi

# Check GTK themes and fonts configuration
echo "📝 Reviewing themes and fonts configurations..."

files=("~/.gtkrc-2.0" "~/.config/gtk-3.0/settings.ini")

for f in "${files[@]}"; do
    eval filepath=$f
    if [ -f "$filepath" ]; then
        echo "✅ Configuration file found: $filepath"
        grep -E 'gtk-(font|theme-name|icon-theme-name)' "$filepath"
    else
        echo "⚠️ $filepath not found"
    fi
done

# Check if themes and icons exist
# Install if not present

echo "🎨 Checking availability of themes and icons..."

# Required packages
required_packages=("blackbird-gtk-theme" "arc-theme" "elementary-xfce-icon-theme")

for pkg in "${required_packages[@]}"; do
    if ! dpkg -s "$pkg" &>/dev/null; then
        echo "📦 Installing missing package: $pkg"
        sudo apt install -y "$pkg"
    else
        echo "✅ Package already installed: $pkg"
    fi
done

themes=("Arc-Dark" "Blackbird")
icons=("elementary-xfce" "Faenza" "Adwaita")

check_theme() {
    local theme=$1
    if [ -d "/usr/share/themes/$theme" ] || [ -d "$HOME/.themes/$theme" ]; then
        echo "✅ Theme found: $theme"
    else
        echo "❌ Missing theme: $theme"
    fi
}

check_icons() {
    local icon=$1
    if [ -d "/usr/share/icons/$icon" ] || [ -d "$HOME/.icons/$icon" ]; then
        echo "✅ Icons found: $icon"
    else
        echo "❌ Missing icons: $icon"
    fi
}

for t in "${themes[@]}"; do
    check_theme "$t"
done

for i in "${icons[@]}"; do
    check_icons "$i"
done

# Configure themes in GTK files
echo "🛠️ Configuring GTK files..."
mkdir -p ~/.config/gtk-3.0

cat > ~/.gtkrc-2.0 <<EOF
gtk-theme-name="Blackbird"
gtk-icon-theme-name="elementary-xfce"
gtk-font-name="Monospace 9"
EOF

cat > ~/.config/gtk-3.0/settings.ini <<EOF
[Settings]
gtk-theme-name = Blackbird
gtk-icon-theme-name = elementary-xfce
gtk-font-name = Monospace 9
EOF

# Optional cursor theme
echo "📌 Configuring cursor theme..."
echo -e "Xcursor.theme: Adwaita\nXcursor.size: 24" > ~/.Xresources
xrdb -merge ~/.Xresources

echo "✅ Configuration and diagnostic completed. Restart GTK2 and GTK3 apps to see changes."
