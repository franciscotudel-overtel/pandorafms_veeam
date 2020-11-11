Configuracion de los modulos

#Modulo Jobs


module_begin
module_name Veeam Backup - Jobs
module_type generic_data_string
module_exec %SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -nologo -command C:\zabbix\scripts_pandorafms\vb_job.ps1 ListCSV
module_description Lista de Tareas
module_crontab 45 * * * *
module_timeout 50

