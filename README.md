# NixOS Configuration

Personal NixOS, nix-darwin, and home-manager configuration for multiple machines.

## Hosts

| Host | Platform | Description |
|------|----------|-------------|
| `callisto` | macOS (aarch64-darwin) | MacBook Pro |
| `europa` | NixOS (x86_64-linux) | Desktop |
| `ganymede` | NixOS (x86_64-linux) | Desktop |
| `io` | NixOS-WSL (x86_64-linux) | WSL instance |

## Structure

```
.
├── config.nix           # Personal configuration values (emails, profiles, etc.)
├── flake.nix            # Flake definition with all inputs and outputs
├── home/                # Home-manager configurations
│   └── mdziuba/
│       ├── features/    # Feature modules (cli, desktop, programming, games)
│       ├── global/      # Shared home-manager config
│       ├── dotfiles/    # Dotfiles managed via symlinks
│       └── <host>.nix   # Per-host home-manager config
├── hosts/               # NixOS/darwin host configurations
│   ├── common/          # Shared host config (global, optional, users)
│   └── <hostname>/      # Per-host NixOS config
├── lib/                 # Custom library functions
├── modules/             # Custom NixOS and home-manager modules
├── overlays/            # Nixpkgs overlays
└── pkgs/                # Custom packages
```

## Usage

### Prerequisites

- Nix with flakes enabled
- For macOS: nix-darwin installed

### Building

**NixOS:**
```bash
sudo nixos-rebuild switch --flake ~/.config/nixos#<hostname>
```

**macOS (nix-darwin):**
```bash
darwin-rebuild switch --flake ~/.config/nixos
```

**Home-manager only:**
```bash
home-manager switch --flake ~/.config/nixos#<username>@<hostname>
```

### Quick aliases (after initial setup)

These aliases are available in zsh after setup:

- `snrs` - sudo nixos-rebuild switch
- `hms` - home-manager switch
- `drs` - darwin-rebuild switch

## Adding a New Host

1. Create `hosts/<hostname>/default.nix` with NixOS configuration
2. Create `hosts/<hostname>/hardware-configuration.nix`
3. Create `home/mdziuba/<hostname>.nix` with home-manager config
4. Add the host to `flake.nix` under `nixosConfigurations` or `darwinConfigurations`

## Custom Library Functions

Located in `lib/default.nix`:

- `mkDotfileSymlink config "name"` - Create symlink to a dotfile
- `mkDotfileEntry config "name"` - Create home.file entry for a dotfile
- `mkDotfileEntries config ["a" "b"]` - Create multiple dotfile entries

## Configuration Values

Personal values (emails, AWS profiles, etc.) are centralized in `config.nix`.
Import and use these values instead of hardcoding them in modules.
