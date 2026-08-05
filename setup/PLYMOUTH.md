# Setting up Plymouth (boot splash)

`site.yml` links this repo's custom Plymouth theme into `/usr/share/plymouth/themes/custom`
(the `plymouth` entry in `system_stow_packages`), but linking the theme files is as far as
automation goes. Activating Plymouth — picking the default theme, rebuilding the initramfs,
and turning on the boot splash — touches the initramfs and bootloader, so it's a manual,
one-time step per machine rather than something the playbook does for you.

## 1. Prerequisites

Make sure Plymouth itself is installed (not just the theme):

- **Fedora**: `sudo dnf install plymouth plymouth-scripts` (usually already present on
  desktop spins — check with `rpm -q plymouth`)
- **Debian/Ubuntu**: `sudo apt install plymouth plymouth-themes`
- **Arch**: `sudo pacman -S plymouth`

## 2. See what themes are available

```bash
plymouth-set-default-theme --list
```

After `site.yml` has run (or after stowing manually — see §4), `custom` should be in that list.

## 3. Set the theme and rebuild the initramfs

The rebuild step differs by distro because they use different initramfs tooling.

**Fedora/RHEL** (dracut) — one command does both:

```bash
sudo plymouth-set-default-theme -R custom
```

**Debian/Ubuntu** (initramfs-tools) — same command, it wraps `update-initramfs` instead:

```bash
sudo plymouth-set-default-theme -R custom
```

**Arch** — `plymouth-set-default-theme` doesn't trigger a rebuild here. First make sure
`plymouth` is in the `HOOKS` array in `/etc/mkinitcpio.conf`, placed after `base udev` and
before `encrypt`/`filesystems` (if you use encrypted root, `sd-encrypt`/`encrypt` must come
*after* `plymouth`):

```
HOOKS=(base udev plymouth autodetect microcode modconf kms keyboard keymap consolefont block filesystems fsck)
```

Then:

```bash
sudo plymouth-set-default-theme custom
sudo mkinitcpio -P
```

## 4. Enable the splash on the kernel command line

Plymouth won't render anything unless the kernel is told to show it.

**Fedora** (BLS + `grubby`) — Fedora uses `rhgb` (RedHat Graphical Boot) instead of `splash`:

```bash
sudo grubby --update-kernel=ALL --args="rhgb quiet"
```

Check current args first with `cat /etc/kernel/cmdline` — if `rhgb quiet` is already there
(it is by default on Fedora Workstation), you can skip this step entirely.

**Debian/Ubuntu** (GRUB) — edit `/etc/default/grub`:

```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
```

then:

```bash
sudo update-grub
```

**Arch** — depends on your bootloader:

- GRUB: same as Debian above, but regenerate with `sudo grub-mkconfig -o /boot/grub/grub.cfg`
- systemd-boot: add `splash` to the `options` line in `/boot/loader/entries/<your-entry>.conf`

## 5. Reboot and check

```bash
sudo reboot
```

You should see the theme during boot. If not:

- Confirm the theme actually set: `plymouth-set-default-theme` (no args) prints the current default.
- Check `journalctl -b -1 | grep -i plymouth` for errors from the previous boot.
- Double check step 4 — a missing `rhgb`/`splash` kernel arg is the most common reason nothing shows.

## Using a different theme instead

You don't need the `custom` theme from this repo — any theme works the same way:

- **A theme already packaged for your distro** (e.g. `spinner`, `bgrt`): skip straight to §3/§4
  with that theme's name.
- **A different custom theme you want version-controlled here**: drop it under
  `plymouth/usr/share/plymouth/themes/<name>/` in this repo (a `.plymouth` file plus its
  script/images, same shape as `custom/`), then either let `site.yml` pick it up automatically
  (add `<name>` to `system_stow_packages` in `site.yml` alongside/instead of `plymouth` — note
  the whole `plymouth/` directory is one Stow package, so multiple themes under it get linked
  together) or link it by hand:

  ```bash
  stow --dir=~/.dotfiles --target=/ --restow plymouth
  ```

  Then run §3/§4 with `<name>` instead of `custom`.
