# BackupDocs.ps1
$source = "$env:USERPROFILE\OneDrive\Documents"
$destination = "D:\Klark\Documents_$(Get-Date -Format yyyy-MM-dd)"
New-Item -ItemType Directory -Force -Path $destination | Out-Null
Copy-Item -Path $source\* -Destination $destination -Recurse -Force
Write-Output "Backup completed at $(Get-Date)" | Out-File "C:\Users\klark\OneDrive\Documents\PS Scripts\BackupLog.txt" -Append