# ===== Powershell Profile ====

fastfetch
scoop update

Set-PsReadlineKeyHandler -Key Tab -Function MenuComplete
oh-my-posh init pwsh --config "C:\Users\env:username\Dotfiles\greyscale.omp.json" | Invoke-Expression
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# === Functions ===

function ezai {
eza --icons
}

function fzfi {
fzf --preview 'bat --style=numbers --color=always --theme="ansi" --line-range=:500 {+}'
}


# === Import Modules ===

Import-Module cscompile
Import-Module PoSHFuck
Import-Module PSScriptAnalyzer
Import-Module FindOpenFile


