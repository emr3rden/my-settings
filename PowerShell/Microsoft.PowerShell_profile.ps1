# C:\Users\[user]\Documents\PowerShell\Microsoft.PowerShell_profile.ps1

clear

# oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/di4am0nd.omp.json' | Invoke-Expression
& ([ScriptBlock]::Create((oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\di4am0nd.omp.json" --print) -join "`n"))

Import-Module -Name PowerShellGet

Import-Module -Name Terminal-Icons

Import-Module -Name PSReadLine
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineKeyHandler -Chord "RightArrow" -Function ForwardWord

Import-Module -Name CompletionPredictor

# Example of setting prediction background color to Blue using $PSStyle:
Set-PSReadLineOption -Colors @{ InlinePrediction = $PSStyle.Background.blue }
# The default light-grey prediction text color can be restored using:
# Set-PSReadLineOption -Colors @{ InlinePrediction = "`e[38;5;238m" }
# or
# Set-PSReadLineOption -Colors @{ InlinePrediction = "$([char]0x1b)[38;5;238m"}

# Working with Azure? When you’re ready to extend predictions to include additional plugins, try out the latest preview of the Az.Tools.Predictor from the Azure PowerShell team.
# Find-Module Az.Tools.Predictor -AllowPrerelease
# Read more information, see: https://techcommunity.microsoft.com/t5/azure-tools-blog/announcing-az-predictor/ba-p/1873104

# Set-Alias v nvim
# Set-Alias g git
Set-Alias c New-Item

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}