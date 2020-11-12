# Script: VB_Job
# Author: Francisco Tudel
# Description: Query Veeam job information
# License:
#
# This script is intended for use with PandoraFMS
#
#
# USAGE:
#   as a script: C:\WINDOWS\system32\windowspowershell\v1.0\powershell.exe -command  "& C:\path\vb_job.ps1 <ITEM_TO_QUERY> <JOBID>"
#
#
$version = "0.1"

$ITEM = [string]$args[0]
$ID = [string]$args[1]

#* Load Veeam snapin
Add-PsSnapin -Name VeeamPSSnapIn -ErrorAction SilentlyContinue


# Open JSON object
$output =  ""


switch ($ITEM) {
    "JobName" {
	  $query = Get-VBRBackupSession | Where {$_.jobId -eq "$ID"} | Sort EndTimeUTC -Descending | Select -First 1
	  $output = $output + $query.Info.JobName
	  $query = ''
	}
	"IsEnabled" {
	  $query = Get-VBRJob | Where-Object {$_.Id -like "*$ID*"}
	  $output = $output + [bool]$query.IsScheduleEnabled 
	  $query = ''
	}
	"Result" {
	  $query = Get-VBRBackupSession | Where {$_.jobId -eq "$ID"} | Sort EndTimeUTC -Descending | Select -First 1
	  $output = $output + $query.Info.Result 
	  $query = ''
	}
	"IsRunning" {
	  $query = Get-VBRJob | Where-Object {$_.Id -like "*$ID*"}
	  $output = $output + [bool]$query.IsRunning 
	  $query = ''
	}
	"VmCount" {
	  $query = Get-VBRBackupSession | Where {$_.jobId -eq "$ID"} | Sort EndTimeUTC -Descending | Select -First 1
	  $output = $output + $query.Info.Progress.TotalObjects
	  $query = ''
	}
	"TargetDir" {
	  $query = Get-VBRJob | Where-Object {$_.Id -like "*$ID*"}
	  $output = $output + $query.TargetDir
	  $query = ''
	}
	"TargetFile" {
	  $query = Get-VBRJob | Where-Object {$_.Id -like "*$ID*"}
	  $output = $output + $query.TargetFile
	  $query = ''
	}
	"JobType" {
	  $query = Get-VBRJob | Where-Object {$_.Id -like "*$ID*"}
	  $output = $output + $query.JobType 
	  $query = ''
	}
	"NextRun" {
	  $query = Get-VBRJob | Where-Object {$_.Id -like "*$ID*"}
	  $output = $output + ([datetime]$query.ScheduleOptions.NextRun).ToString("dd/MM/yyyy HH:mm:ss")
	  $query = ''
	}
	"LastRunStart" {
	  $query = Get-VBRBackupSession | Where {$_.jobId -eq "$ID"} | Sort EndTimeUTC -Descending | Select -First 1
	  #$output = $output + $query2.ScheduleOptions.LatestRunLocal.ToString("dd/MM/yyyy HH:mm:ss")
	  #$output = $output + $query2.ScheduleOptions.LatestRunLocal
	  $output = $output + ([datetime]$query.Info.Progress.StartTimeLocal).ToString("dd/MM/yyyy HH:mm:ss")
	  $query = ''
	}
	"LastRunStop" {
	  $query = Get-VBRBackupSession | Where {$_.jobId -eq "$ID"} | Sort EndTimeUTC -Descending | Select -First 1
	  $output = $output + ([datetime]$query.Info.Progress.StopTimeLocal).ToString("dd/MM/yyyy HH:mm:ss")
	  $query = ''
	}
	"LastRunMinutes" {
	  $query = Get-VBRBackupSession | Where {$_.jobId -eq "$ID"} | Sort EndTimeUTC -Descending | Select -First 1
	  $output = $output + [int]$query.Info.Progress.Duration.TotalMinutes
	  $query = ''
	}
	"TransferedSize" {
	  $query = Get-VBRBackupSession | Where {$_.jobId -eq "$ID"} | Sort EndTimeUTC -Descending | Select -First 1
	  $output = $output + [long]$query.Info.Progress.TransferedSize
	  $query = ''
	}
	"RetainDays" {
	  $query2 = Get-VBRJob | Where-Object {$_.Id -like "*$ID*"}
	  $output = $output +  [int]$query2.Options.BackupStorageOptions.RetainDays
	  $query = ''
	}
	"RunManually" {
	  $query = Get-VBRJob | Where-Object {$_.Id -like "*$ID*"}
	  $output = $output +  [int]$query.Options.JobOptions.RunManually
	  $query = ''
	}
	"All" {
	  $query = Get-VBRJob | Where-Object {$_.Id -like "*$ID*"}
	  $output = $output + $query 
	  $query = ''
	}
	"TimeFromLast" {
	$query = Get-VBRBackupSession | Where {$_.jobId -eq "$ID"} | Sort EndTimeUTC -Descending | Select -First 1
	$res = Get-Date
	$res -= [datetime]$query.Info.Progress.StopTimeLocal
	#$res.TotalHours
	#[math]::round($res.TotalHours,1)
	[int]$res.TotalHours
	$query = ''
	}
	"TimeFromLastMinutes" {
	$query = Get-VBRBackupSession | Where {$_.jobId -eq "$ID"} | Sort EndTimeUTC -Descending | Select -First 1
	$res = Get-Date
	$res -= [datetime]$query.Info.Progress.StopTimeLocal
	[int]$res.TotalSeconds
	$query = ''
    }
	"Version" {
	$output = $version
    }
	"ListCSV" {
	$count = $query | Measure-Object
    $count = $count.count
	$query = Get-VBRJob
    foreach ($object in $query) {
	  $Id = [string]$object.Id
	  $Name = [string]$object.Name
	  $Schedule = [int]$object.IsScheduleEnabled
	  $output = $output + $Name + ";" + $Schedule + ";" + $Id + ";`r`n"
      }
	 $query = ''
    }
}
Write-Host $output