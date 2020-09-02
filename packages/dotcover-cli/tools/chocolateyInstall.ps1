$tools = Split-Path -Path $MyInvocation.MyCommand.Definition
$content = Join-Path -Path (Split-Path -Path $tools) -ChildPath 'content'

Install-ChocolateyZipPackage `
    -PackageName 'dotcover-cli' `
    -Url 'https://download.jetbrains.com/resharper/dotUltimate.2020.2.1/JetBrains.dotCover.CommandLineTools.2020.2.1.zip'`
    -Checksum '4d29574e03cd6a9da9dc7c4aafb11a2ea07b9599e9d9ed603887b9ae4b46136a' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $content

Get-ChildItem -Path $content -Include '*.exe' -Exclude 'dotCover.exe' -Recurse `
    | %{ New-Item -Type 'File' -Path "$_.ignore" | Out-Null }
