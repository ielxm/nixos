{ home, config, ... }:
{
  # Workaround to make Element and other Electron applications use GNOME Keyring
  # https://discourse.nixos.org/t/element-desktop-no-longer-working-with-nixos-25-05-on-a-minimal-desktop-i3-or-xterm-due-to-unsupported-keyring/69731/3
  home.file."${config.xdg.configHome}/electron-flags.conf".text = ''
    --password-store=gnome-libsecret
    --ozone-platform=wayland
    --gtk-version=4
    --enable-features=WaylandWindowDecorations,AllowQt
  '';
}
