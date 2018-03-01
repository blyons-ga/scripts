Function Get-SKUInfo {
  $SKUnumber = $((gwmi Win32_operatingsystem).OperatingSystemSKU)
  $SKUname = switch ($SKUnumber)
  {
     0 {'Undefined';break}
     1 {'Ultimate Edition';break}
     2 {'Home Basic Edition';break}
     3 {'Home Premium Edition';break}
     4 {'Enterprise Edition';break}
     5 {'Home Basic N Edition';break}
     6 {'Business Edition';break}
     7 {'Standard Server Edition';break}
     8 {'Datacenter Server Edition';break}
     9 {'Small Business Server Edition';break}
     10 {'Enterprise Server Edition';break}
     11 {'Starter Edition';break}
     12 {'Datacenter Server Core Edition';break}
     13 {'Standard Server Core Edition';break}
     14 {'Enterprise Server Core Edition';break}
     15 {'Enterprise Server Edition for Itanium-Based Systems';break}
     16 {'Business N Edition';break}
     17 {'Web Server Edition';break}
     18 {'Cluster Server Edition';break}
     19 {'Home Server Edition';break}
     20 {'Storage Express Server Edition';break}
     21 {'Storage Standard Server Edition';break}
     22 {'Storage Workgroup Server Edition';break}
     23 {'Storage Enterprise Server Edition';break}
     24 {'Server For Small Business Edition';break}
     25 {'Small Business Server Premium Edition';break}
     29 {'Web Server, Server Core';break}
     39 {'Datacenter Edition without Hyper-V, Server Core';break}
     40 {'Standard Edition without Hyper-V, Server Core';break}
     41 {'Enterprise Edition without Hyper-V, Server Core';break}
     42 {'Hyper-V Server';break}
     43 {'Storage Server Express (core installation)';break}
     44 {'Storage Server Standard (core installation)';break}
     45 {'Storage Server Workgroup (core installation)';break}
     46 {'Storage Server Enterprise (core installation)';break}
     47 {'Starter N';break}
     48 {'Professional';break}
     49 {'Professional N';break}
     50 {'Windows Small Business Server 2011 Essentials';break}
     51 {'Server For SB Solutions';break}
     52 {'Server Solutions Premium';break}
     53 {'Server Solutions Premium (core installation)';break}
     54 {'Server For SB Solutions EM';break}
     55 {'Server For SB Solutions EM';break}
     56 {'Windows MultiPoint Server';break}
     59 {'Windows Essential Server Solution Management';break}
     60 {'Windows Essential Server Solution Additional';break}
     61 {'Windows Essential Server Solution Management SVC';break}
     62 {'Windows Essential Server Solution Additional SVC';break}
     63 {'Small Business Server Premium (core installation)';break}
     64 {'Server Hyper Core V';break}
     66 {'Starter E';break}
     67 {'Home Basic E';break}
     68 {'Home Premium E';break}
     69 {'Professional E';break}
     70 {'Enterprise E';break}
     71 {'Ultimate E';break}
     72 {'Server Enterprise (evaluation installation)';break}
     76 {'Windows MultiPoint Server Standard (full installation)';break}
     77 {'Windows MultiPoint Server Premium (full installation)';break}
     79 {'Server Standard (evaluation installation)';break}
     80 {'Server Datacenter (evaluation installation)';break}
     84 {'Enterprise N (evaluation installation)';break}
     95 {'Storage Server Workgroup (evaluation installation)';break}
     96 {'Storage Server Standard (evaluation installation)';break}
     98 {'Windows 8 N';break}
     99 {'Windows 8 China';break}
     100 {'Windows 8 Single Language';break}
     101 {'Windows 8';break}
     103 {'Professional with Media Center';break}
     default {'<UNKNOWN:$Sku>'}
  }
 
  $value = New-Object PsObject -Property @{skunumber = $SKUNumber; skuname = $SKUName}
  return $value

}


