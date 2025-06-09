=== Powershell Profile ==

winfetch
scoop update

function ezai {
eza --icons
}

function fzfi {fzf --preview 'bat --style=numbers --color=always --theme="ansi" --line-range=:500 {+}'}

Set-PsReadlineKeyHandler -Key Tab -Function MenuComplete

oh-my-posh init pwsh --config "C:\Users\Jorda\Dotfiles\greyscale.omp.json" | Invoke-Expression 
Invoke-Expression (& { (zoxide init powershell | Out-String) })
