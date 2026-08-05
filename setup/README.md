# setup

Ansible playbook for bootstrapping a new Fedora, Debian/Ubuntu, or Arch Linux machine with the same packages and services used in the NixOS config.

## Prerequisites

- Ansible ≥ 2.14
- Python 3 on the target machine

Install the required Ansible collection once:

```bash
ansible-galaxy collection install -r requirements.yml
```

## Running

**Local machine:**

```bash
ansible-playbook -i localhost, -c local site.yml -K
```

**Remote machine:**

```bash
ansible-playbook -i 192.168.1.10, site.yml -u ryan -K
```

`-K` prompts for the sudo password.

## Adding or removing packages

All packages are defined in **`vars/packages.yml`** — this is the only file you need to edit.

### System packages

Add an entry to `system_packages`. If the package name is the same on all distros:

```yaml
- name: htop
```

If the name differs across distros, add the relevant override keys:

```yaml
- name: python3
  arch: python
```

Supported keys are `name` (fallback), `fedora`, `debian`, and `arch`. Any omitted distro key falls back to `name`.

Mark a package `optional: true` if it may not be in standard repos — it will be installed best-effort and a failure won't abort the run:

```yaml
- name: sops
  optional: true
```

To remove a package, delete its entry from the list.

### Flatpak applications

Add or remove Flatpak app IDs from the `flatpak_packages` list:

```yaml
flatpak_packages:
  - org.videolan.VLC          # add
  - app.zen_browser.zen
  - com.brave.Browser
  # - md.obsidian.Obsidian    # remove by deleting or commenting out
```

## Adding or removing services

Services are enabled in the **Services** section of `site.yml`. To enable a new service, add a task:

```yaml
- name: Enable syncthing
  systemd:
    name: syncthing@{{ target_user }}
    enabled: true
    state: started
  ignore_errors: true
```

Use `ignore_errors: true` for services that may not be present on all distros. To stop managing a service, remove the task.

Use `target_user` (set in `pre_tasks`), not `ansible_user_id`, for anything that needs the real login account — `ansible_user_id` resolves to `root` here since the whole play runs with `become: true`, including fact-gathering.

## Notes

- **Tailscale** requires its own repo on Fedora and Debian. `site.yml` adds it automatically before installing packages. On Arch it is available in the standard repos.
- **Podman** is installed from the standard distro repos on all three distros and runs rootless by default — no daemon service or extra group membership needed. `podman-docker` is installed best-effort to provide a `docker` CLI shim (and `/var/run/docker.sock`) backed by Podman, so existing `docker` commands and tooling keep working. `podman-compose` is also installed best-effort where packaged.
- **Optional packages** not in standard repos — `lazygit`, `atuin`, `sops`, `ssh-to-age` — can be installed manually after the playbook runs. Check each project's install docs for the recommended method on your distro.
- **Starship** has no official package on Fedora or Debian, so it isn't listed in `vars/packages.yml` at all. `site.yml` installs it on all three distros via upstream's installer script (https://starship.rs/install.sh) into `/usr/local/bin`, skipping the download/install if it's already present.
- **Plymouth** (boot splash theme): `site.yml` only links this repo's theme files into `/usr/share/plymouth/themes/custom` via Stow — activating it (setting it as default, rebuilding the initramfs, enabling the splash kernel arg) is bootloader/initramfs-specific and done by hand. See **[PLYMOUTH.md](PLYMOUTH.md)** for the full per-distro walkthrough, including how to swap in a different theme.
- **niri + DankMaterialShell**: `niri`, `quickshell`, `matugen`, `qt6ct` install from standard repos on Arch/Fedora (Debian/Ubuntu lack official packages, so these stay `optional`). DMS itself (`dms`) follows [upstream's per-distro instructions](https://danklinux.com/docs/dankmaterialshell/installation): on Arch it's the official `extra` package (`dms-shell`); on Fedora, `site.yml` enables the `avengemedia/dms` COPR before install; on Ubuntu, it enables the `avengemedia/danklinux` and `avengemedia/dms` PPAs before install. Plain Debian isn't automated — upstream requires a manual OBS repo plus native `quickshell` there. `danksearch` (the launcher) isn't a separate package; it ships inside `dms`. `adw-gtk3-theme` (Fedora only) and `xwayland-satellite`/`wl-clip-persist` (Arch/Fedora and Arch-only, respectively) round out the niri session. You'll still need to set up the login greeter (`dms-greeter`) by hand — the playbook has no equivalent to the NixOS `services.displayManager.dms-greeter` module. Two ways to do that once `site.yml` has finished:
  - Manually: install the `dms-greeter` package for your distro, then run `dms greeter enable` (configures `greetd`, disables any competing display manager), `dms greeter sync` (ACLs/config sharing), and `dms greeter status` to verify.
  - Via upstream's interactive installer: `curl -fsSL https://install.danklinux.com | sh` (must be run as your normal user, not root — it refuses to run as root). It's a TUI, Niri/Hyprland only, and walks through the same steps above with `dms-greeter` setup as an opt-in toggle (skipped by default, so remember to enable it when prompted). Since it's interactive, it isn't run from `site.yml` itself — treat it as an optional manual step after the playbook, not a replacement for it.
