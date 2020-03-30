# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

Invoke-Expression (&/home/schrodinger/.cargo/bin/starship init powershell)

Set-Alias -Name ls -Value lsd

Set-Alias -Name emacs -Value "emacsclient -c"


$env:PATH += "/var/lib/snapd/snap/bin"
$env:PATH += "/home/schrodinger/.idris2/bin"
$env:PATH += "/opt/mpich/bin:/home/schrodinger/.local/bin"
$env:PATH += "/opt/intel/system_studio_2020/compilers_and_libraries/linux/bin/intel64"
$env:PATH += "/opt/testa/bin:/home/schrodinger/.cargo/bin"
