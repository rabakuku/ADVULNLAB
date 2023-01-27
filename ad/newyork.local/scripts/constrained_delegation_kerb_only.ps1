# https://www.thehacker.recipes/ad/movement/kerberos/delegations/constrained#without-protocol-transition
Set-ADComputer -Identity "Yonkers$" -ServicePrincipalNames @{Add='HTTP/Bronx.north.newyork.local'}
Set-ADComputer -Identity "Yonkers$" -Add @{'msDS-AllowedToDelegateTo'=@('HTTP/Bronx.north.newyork.local','HTTP/Bronx')}
# Set-ADComputer -Identity "Yonkers$" -Add @{'msDS-AllowedToDelegateTo'=@('CIFS/Bronx.north.newyork.local','CIFS/Bronx')}