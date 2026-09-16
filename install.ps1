[CmdletBinding()]
param()

$ErrorActionPreference = "Stop"
$petDirectory = Join-Path $env:USERPROFILE ".codex\pets\huahua"
$manifestSource = Join-Path $PSScriptRoot "pet.json"
$spritesheetSource = Join-Path $PSScriptRoot "spritesheet.webp"

if (-not (Test-Path -LiteralPath $manifestSource) -or -not (Test-Path -LiteralPath $spritesheetSource)) {
    throw "Incomplete package: pet.json or spritesheet.webp is missing."
}

New-Item -ItemType Directory -Force -Path $petDirectory | Out-Null
Copy-Item -LiteralPath $manifestSource -Destination (Join-Path $petDirectory "pet.json") -Force
Copy-Item -LiteralPath $spritesheetSource -Destination (Join-Path $petDirectory "spritesheet.webp") -Force

Write-Host "Huahua was installed to: $petDirectory"
Write-Host "Refresh the Codex pet list and select Huahua (custom:huahua)."
