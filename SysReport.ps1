# SysReport.ps1
$logPath = "D:\Klark\Scripts\PS\SysReport.txt"
$report = @()
$report += "===== System Report - $(Get-Date) ====="
$report += "Hostname: $env:COMPUTERNAME"
$report += "Uptime: $((Get-CimInstance Win32_OperatingSystem).LastBootUpTime)"
$report += "CPU Usage (%): $([math]::Round((Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples.CookedValue,2))"
$report += "Memory Usage (%): $([math]::Round(((Get-Counter '\Memory\% Committed Bytes In Use').CounterSamples.CookedValue),2))"
$report += "============================="
$report -join "`n" | Out-File $logPath -Append