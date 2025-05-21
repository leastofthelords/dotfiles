# === Pwsh launch Config===

Invoke-Expression (& { (zoxide init powershell | Out-String) })

oh-my-posh init pwsh --config "PATHHERE\greyscale.omp.json" | Invoke-Expression # [Replace]

function ezai {
    eza --icons
}

Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
