Get-ADComputer -Identity "bigapple" | Set-ADAccountControl -TrustedForDelegation $true
