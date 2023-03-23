Set-ItemProperty -Path "HKLM:\software\policies\Microsoft\Windows\WindowsUpdate" -Name WUServer -Value "http://192.168.56.24:8530" -Type String -force
Set-ItemProperty -Path "HKLM:\software\policies\Microsoft\Windows\WindowsUpdate" -Name WUStatusServer -Value "http://192.168.56.24:8530" -Type String -force
Set-ItemProperty -Path "HKLM:\software\policies\Microsoft\Windows\WindowsUpdate\AU" -Name UseWUServer -Value "1" -Type DWORD -force
net start BITS
net start CryptSvc
$updateSession = new-object -com "Microsoft.Update.Session"; $updates=$updateSession.CreateupdateSearcher().Search($criteria).Updates
USOClient scannow
wuauclt.exe /detectnow /reportnow

