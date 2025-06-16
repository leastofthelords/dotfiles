===== Powershell Profile ====

winfetch
scoop update

Set-PsReadlineKeyHandler -Key Tab -Function MenuComplete
oh-my-posh init pwsh --config "C:\Users\env:username\Dotfiles\greyscale.omp.json" | Invoke-Expression
Invoke-Expression (& { (zoxide init powershell | Out-String) })

=== Functions ===

function ezai {
eza --icons
}

function fzfi {
fzf --preview 'bat --style=numbers --color=always --theme="ansi" --line-range=:500 {+}'
}

function cscompile {
param (
[string]$Name
)
$csc = "$env:WINDIR\Microsoft.NET\Framework\v4.0.30319\csc.exe"
& $csc "C:\Users\26COSJO\OneDrive - Caritas College\2025\Notepad++\C#\$Name"
}


