Install-WindowsFeature -Name GPMC
$gpo_exist = Get-GPO -Name "NorthWallpaper" -erroraction ignore

if ($gpo_exist) {
    # Do nothing
    #Remove-GPO -Name "NorthWallpaper"
    #Remove the link of the GPO Remove-NorthWallpaper if it exists
    #Remove-GPLink -Name "NorthWallpaper" -Target "DC=north,DC=newyork,DC=local" -erroraction 'silentlycontinue'
} else {
    New-GPO -Name "NorthWallpaper" -comment "Change Wallpaper"
    New-GPLink -Name "NorthWallpaper" -Target "DC=north,DC=newyork,DC=local"

    #https://www.thewindowsclub.com/set-desktop-wallpaper-using-group-policy-and-registry-editor
    Set-GPRegistryValue -Name "NorthWallpaper" -key "HKEY_CURRENT_USER\Control Panel\Colors" -ValueName Background -Type String -Value "100 175 200"
    #Set-GPPrefRegistryValue -Name "NorthWallpaper" -Context User -Action Create -Key "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System" -ValueName Wallpaper -Type String -Value "C:\tmp\GOAD.png"

    Set-GPRegistryValue -Name "NorthWallpaper" -key "HKEY_CURRENT_USER\Control Panel\Desktop" -ValueName Wallpaper -Type String -Value ""
    #Set-GPPrefRegistryValue -Name "NorthWallpaper" -Context User -Action Create -Key "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System" -ValueName WallpaperStyle -Type String -Value "4"

    Set-GPRegistryValue -Name "NorthWallpaper" -Key "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\CurrentVersion\WinLogon" -ValueName SyncForegroundPolicy -Type DWORD -Value 1

    # Allow miguel.cabrera to Edit Settings of the GPO
    # https://learn.microsoft.com/en-us/powershell/module/grouppolicy/set-gppermission?view=windowsserver2022-ps
    Set-GPPermissions -Name "NorthWallpaper" -PermissionLevel GpoEditDeleteModifySecurity -TargetName "miguel.cabrera" -TargetType "User"
}