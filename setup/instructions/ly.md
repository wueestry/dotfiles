Changes to be made in `/etc/ly/config.ini`


Change A — line 68:
# Before
auto_login_session = null
# After
auto_login_session = Hyprland
The value Hyprland matches the DesktopNames=Hyprland field in /usr/share/wayland-sessions/hyprland.desktop.
Change B — line 73:
# Before
auto_login_user = null
# After
auto_login_user = ryan
These are the only two lines to touch in that file. Everything else (including auto_login_service = ly-autologin on line 59) is already correctly set.

