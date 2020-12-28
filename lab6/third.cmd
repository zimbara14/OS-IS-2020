@echo off
net stop dnscache
:: or
:: REG add "HKLM\SYSTEM\CurrentControlSet\services\dnscache\" /v Start /t REG_DWORD /d 4 /f
timeout 10
net start > services2_
:: or
:: sc query type=service > services2_
c:\lab6\mkdiff.cmd services_ services2_ > servicesDIFF_
net start dnscache
:: or
:: REG add "HKLM\SYSTEM\CurrentControlSet\services\dnscache\" /v Start /t REG_DWORD /d 2 /f