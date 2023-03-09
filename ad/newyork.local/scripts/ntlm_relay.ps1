$task = '/c powershell New-PSDrive -Name "Public" -PSProvider "FileSystem" -Root "\\baltimoree\Private"'
$repeat = (New-TimeSpan -Minutes 5)
$taskName = "ntlm_bot"
$user = "north.newyork.local\fernando.alonzo"
$password = "IDr1R3allyF@sTF1!"

$action = New-ScheduledTaskAction -Execute "cmd.exe" -Argument "$task"
$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval $repeat
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable -RunOnlyIfNetworkAvailable -DontStopOnIdleEnd

$taskExists = Get-ScheduledTask | Where-Object {$_.TaskName -like $taskName }
if($taskExists) {
    Unregister-ScheduledTask -TaskName $taskName -Confirm:$false
}
Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -User $user -Password $password -Settings $settings
