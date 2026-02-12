# Neovim Yapilandirmasi

## Yapilan Degisiklikler

### 1. Telescope Varsayilan Picker Olarak Ayarlandi

**Sorun:** Snacks.nvim dashboard acilirken fzf-lua hatasi veriyordu:
```
E5108: Error executing lua: [Fzf-lua]
```

**Cozum:** `lazyvim.json` dosyasina telescope extra'si eklendi:
```json
{
  "extras": ["lazyvim.plugins.extras.editor.telescope"]
}
```

Bu degisiklik LazyVim'in telescope'u varsayilan picker olarak kullanmasini saglar.

### 2. Ripgrep Kurulumu

**Sorun:** Telescope live_grep ozelligi calismiyor, ripgrep bulunamiyor hatasi:
```
telescope.live_grep: 'ripgrep', or similar alternative, is a required dependency
```

**Cozum:** Homebrew ile ripgrep kuruldu:
```bash
brew install ripgrep
```

### 3. Nerd Font Kurulumu

**Sorun:** Dashboard ve diger yerlerde ikonlar gorunmuyor (soru isaretli kutular).

**Cozum:** Homebrew ile Nerd Font kuruldu:
```bash
brew install --cask font-hack-nerd-font
```

Kurulumdan sonra terminal fontunu degistirmek gerekiyor:

- **Terminal.app:** Terminal → Preferences → Profiles → Font → "Hack Nerd Font Mono"
- **iTerm2:** iTerm2 → Preferences → Profiles → Text → Font → "Hack Nerd Font Mono"
- **Kitty:** `~/.config/kitty/kitty.conf` dosyasina `font_family Hack Nerd Font Mono` ekleyin

### 4. Lazygit Kurulumu

**Sorun:** Neovim icinden lazygit calismiyor.

**Cozum:** Homebrew ile lazygit kuruldu:
```bash
brew install lazygit
```

## Gereksinimler

- Neovim >= 0.9
- ripgrep (live_grep icin)
- lazygit (git islemleri icin)
- Git
