@echo off
@set JOB=f2f89dfb-c131-40a1-bc7f-8b7e9d7a72fa
@echo Este Script se usa para recoger alguna o todas las consultas posibles de un solo trabajo de para ello, 
@echo  primero recoge la lista de todas las tareas con su UID, de este resultado cogemos alguna de las UID 
@echo  y la ponemos en la variable JOB de este script.
@echo -Jobs-
@echo.
@echo Lista Tareas
@%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -nologo -command C:\zabbix\scripts_pandorafms\vb_job.ps1 ListCSV
@echo Lista Tareas Enabled
@%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -nologo -command C:\zabbix\scripts_pandorafms\vb_job.ps1 ListEnabledCSV
@echo Tarea consultada: %JOB%
@echo.
@echo -Percent-
@%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -nologo -command C:\zabbix\scripts_pandorafms\vb_job.ps1 Percent %JOB%
@echo -AvgSpeed-
@%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -nologo -command C:\zabbix\scripts_pandorafms\vb_job.ps1 AvgSpeed %JOB%
@echo -JobName-
@%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -nologo -command C:\zabbix\scripts_pandorafms\vb_job.ps1 JobName %JOB%
@echo -RetainDays-
@%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -nologo -command C:\zabbix\scripts_pandorafms\vb_job.ps1 RetainDays %JOB%
@echo -TargetDir-
@%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -nologo -command C:\zabbix\scripts_pandorafms\vb_job.ps1 TargetDir %JOB%
@echo -TargetFile-
@%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -nologo -command C:\zabbix\scripts_pandorafms\vb_job.ps1 TargetFile %JOB%
@echo -LastRunStart-
@%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -nologo -command C:\zabbix\scripts_pandorafms\vb_job.ps1 LastRunStart %JOB%
@echo -LastRunStop-
@%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -nologo -command C:\zabbix\scripts_pandorafms\vb_job.ps1 LastRunStop %JOB%
@echo -LastRunMinutes-
@%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -nologo -command C:\zabbix\scripts_pandorafms\vb_job.ps1 LastRunMinutes %JOB%
@echo -NextRun-
@%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -nologo -command C:\zabbix\scripts_pandorafms\vb_job.ps1 NextRun %JOB%
@echo -JobType-
@%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -nologo -command C:\zabbix\scripts_pandorafms\vb_job.ps1 JobType %JOB%
@echo -All-
@%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -nologo -command C:\zabbix\scripts_pandorafms\vb_job.ps1 All %JOB%
@echo -VmCount-
@%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -nologo -command C:\zabbix\scripts_pandorafms\vb_job.ps1 VmCount %JOB%
@echo -IsEnabled-
@%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -nologo -command C:\zabbix\scripts_pandorafms\vb_job.ps1 IsEnabled %JOB%
@echo -Result-
@%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -nologo -command C:\zabbix\scripts_pandorafms\vb_job.ps1 Result %JOB%
@echo -IsRunning-
@%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -nologo -command C:\zabbix\scripts_pandorafms\vb_job.ps1 IsRunning %JOB%
@echo -RunManually-
@%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -nologo -command C:\zabbix\scripts_pandorafms\vb_job.ps1 RunManually %JOB%
@echo -TransferedSize-
@%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -nologo -command C:\zabbix\scripts_pandorafms\vb_job.ps1 TransferedSize %JOB%
@echo -TimeFromLast-
@%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -nologo -command C:\zabbix\scripts_pandorafms\vb_job.ps1 TimeFromLast %JOB%
@echo -TimeFromLastMinutes-
@%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -nologo -command C:\zabbix\scripts_pandorafms\vb_job.ps1 TimeFromLastMinutes %JOB%
@echo -Version-
@%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -nologo -command C:\zabbix\scripts_pandorafms\vb_job.ps1 Version %JOB%

