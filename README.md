<p>
  <a href="https://github.com/nodev7/nodevs-dotfiles/commits/main">
    <img src="https://img.shields.io/github/last-commit/nodev7/nodevs-dotfiles" alt="Last commit" />
  </a>
  <a href="https://github.com/nodev7/nodevs-dotfiles/issues">
    <img src="https://img.shields.io/github/issues/nodev7/nodevs-dotfiles" alt="Open issues" />
  </a>
  <a href="https://github.com/nodev7/nodevs-dotfiles/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/nodev7/nodevs-dotfiles" alt="License" />
  </a>
  <a href="https://github.com/nodev7/nodevs-dotfiles/stargazers">
    <img src="https://img.shields.io/github/stars/nodev7/nodevs-dotfiles?style=social" alt="GitHub stars" />
  </a>
</p>

---

# Dotfiles
- A collection of my dotfiles i use, coherant greyscale theme, Fabulous contrast. (sorry u cant see any synax and output hilighting ¯\_(ツ)_/¯)

---

### Terminal Preview:

![image](https://raw.githubusercontent.com/leastofthelords/dotfiles/refs/heads/main/Screenshots/Screenshot%202025-09-23%20181316.png)

### Helix only Whitespace Filling 

![image](https://github.com/user-attachments/assets/29e469c5-6318-4949-9d79-7f1fb36ac7fc)

[ Tabs are represented with →

Spaces are Represented as .

Line Ends are represented as ⏎ ]

---

### Setup:
[wezterm.lua](./wezterm.lua):
- Place in the same directory as `wezterm.exe`
- Provide paths and change your shell `(@Line 180)` if using diff shell or a powershell version above `powershell 5.1`, this config uses [GoMono Nerd Font Mono](https://www.nerdfonts.com/font-downloads).

[Oh My Posh](./greyscale.omp.json):
- Download [greyscale.omp.json](./greyscale.omp.json),
- Copy line 7 -> `"oh-my-posh init pwsh --config "C:\Users\env:username\Dotfiles\greyscale.omp.json" | Invoke-Expression"`  then replace pthe path pointing to [greyscale.omp.json](./greyscale.omp.json) with your own, and put the line it into your `$PROFILE`

[config.toml](./config.toml): (helix)
- replace the defult config.toml with the one in the repo (IF YOU ARE GOING TO USE HELIX).

---

### Modules i use with these dotfiles:

- [Eza](github.com/search?q=eza&type=repositories)
- [Helix](https://docs.helix-editor.com/install.html)
- [Fzf](https://github.com/junegunn/fzf)
- [Zoxide](https://github.com/ajeetdsouza/zoxide)
- [Winfetch](https://github.com/lptstr/winfetch)
- [Omp](https://ohmyposh.dev)
- [Btop4win](https://github.com/aristocratos/btop4win)
- [bat](https://github.com/sharkdp/bat)
- [PSedit](https://github.com/ironmansoftware/psedit)









