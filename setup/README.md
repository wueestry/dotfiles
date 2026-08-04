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
    name: syncthing@{{ ansible_user_id }}
    enabled: true
    state: started
  ignore_errors: true
```

Use `ignore_errors: true` for services that may not be present on all distros. To stop managing a service, remove the task.

## Notes

- **Tailscale** requires its own repo on Fedora and Debian. `site.yml` adds it automatically before installing packages. On Arch it is available in the standard repos.
- **Docker** is installed from the standard distro repos (`moby-engine` on Fedora, `docker.io` on Debian, `docker` on Arch). For rootless mode, run `dockerd-rootless-setuptool.sh install` as your user after the playbook completes.
- **Optional packages** not in standard repos — `lazygit`, `atuin`, `sops`, `ssh-to-age` — can be installed manually after the playbook runs. Check each project's install docs for the recommended method on your distro.
