# ===== Powershell Profile ====

fastfetch

Set-PsReadlineKeyHandler -Key Tab -Function MenuComplete
oh-my-posh init pwsh --config "insertpathhere" | Invoke-Expression
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# === Functions ===

function ezai {
eza --icons
}

function fzfi {
fzf --preview 'bat --style=numbers --color=always --theme="ansi" --line-range=:500 {+}'
}

# === Import Modules ===
Import-Module PSScriptAnalyzer

