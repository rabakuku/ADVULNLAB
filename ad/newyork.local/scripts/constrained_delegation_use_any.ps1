# https://www.thehacker.recipes/ad/movement/kerberos/delegations/constrained#with-protocol-transition
Set-ADUser -Identity "elena.lopez" -ServicePrincipalNames @{Add='CIFS/Bronx.north.newyork.local'}
Get-ADUser -Identity "elena.lopez" | Set-ADAccountControl -TrustedToAuthForDelegation $true
Set-ADUser -Identity "elena.lopez" -Add @{'msDS-AllowedToDelegateTo'=@('CIFS/Bronx.north.newyork.local','CIFS/Bronx')}