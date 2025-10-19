# Cleanup.ps1
$TempPaths = @(
    "$env:TEMP\*",
    "C:\Windows\Temp\*",
    "$env:USERPROFILE\AppData\Local\Temp\*"
)

foreach ($path in $TempPaths) {
    try {
        Remove-Item -Path $path -Recurse -Force -ErrorAction SilentlyContinue
    } catch {
        Write-Host "Could not clean: $path"
    }
}

# Empty recycle bin
Clear-RecycleBin -Force
Write-Output "Cleanup completed at $(Get-Date)" | Out-File "C:\Scripts\CleanupLog.txt" -Append