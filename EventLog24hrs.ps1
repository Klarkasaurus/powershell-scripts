Get-WinEvent -FilterHashtable @{
    LogName = 'System', "Security", 'Application'
    Level = 1,2,3  # 1=Critical, 2=Error, 3=Warning
    StartTime = (Get-Date).AddDays(-1)
} | Format-Table -wrap TimeCreated, LevelDisplayName, Id, Message -AutoSize | Out-File "C:\Users\admin\Documents\Scripts\PS\EventLog24hrs.txt"