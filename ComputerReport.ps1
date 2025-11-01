# Replace 'COMPUTER NAME' with the actual hostname
$computer = "COMPUTERNAME"

# Gather system info
$report = @()
$report += "===== System Report for $computer ====="
$report += "Date: $(Get-Date)"
$report += "`n--- OS Info ---"
$report += (Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object Caption, Version, BuildNumber | Format-List | Out-String)
$report += "`n--- Hardware Info ---"
$report += (Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object Manufacturer, Model, TotalPhysicalMemory | Format-List | Out-String)
$report += "`n--- Network Info ---"
$report += (Get-NetIPAddress | Where-Object {$_.AddressFamily -eq "IPv4"} | Format-Table -AutoSize | Out-String)
$report += "`n--- Logged On Users ---"
$report += (quser | Out-String)

# Save to file
$report | Out-File "C:\Users\admin\Documents\Scripts\PS\$computer-SystemReport.txt" -Encoding UTF8