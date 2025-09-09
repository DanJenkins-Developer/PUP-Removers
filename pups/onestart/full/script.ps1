#OneStart removal script



# Processes
# find running processes with "OneStart" in them
$valid_path = "C:\Users\*\AppData\Local\OneStart.ai\*"
$process_names = @("OneStart")
    foreach ($proc in $process_names){
    $OL_processes = Get-Process | Where-Object { $_.Name -like $proc }
    if ($OL_processes.Count -eq 0){
        Write-Output "No $proc processes were found."
    }else {
        write-output "The following processes contained $proc and file paths will be checked: $OL_processes"
        foreach ($process in $OL_processes){
            $path = $process.Path
            if ($path -like $valid_path){
                Stop-Process $process -Force
                Write-Output "$proc process file path matches and has been stopped."
            }else {
                Write-Output "$proc file path doesn't match and process was not stopped."
            }
        }
    }
}

# execute --command "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -WindowStyle Hidden -Command "$valid_path = 'C:\Users\*\AppData\Local\OneStart.ai\*'; $process_names = @('OneStart', 'updater'); foreach ($proc in $process_names) { $OL_processes = Get-Process | Where-Object { $_.Name -like $proc }; if ($OL_processes.Count -eq 0) { Write-Output \"No $proc processes were found.\" } else { Write-Output \"The following processes contained $proc and file paths will be checked: $OL_processes\"; foreach ($process in $OL_processes) { $path = $process.Path; if ($path -like $valid_path) { Stop-Process $process -Force; Write-Output \"$proc process file path matches and has been stopped.\" } else { Write-Output \"$proc file path doesnt match and process was not stopped.\" } } } }""
# execute --command "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -WindowStyle Hidden -Command "$valid_path = 'C:\Users\*\OneStart.ai\OneStart\*'; $process_names = @('OneStart', 'updater'); foreach ($proc in $process_names) { $OL_processes = Get-Process | Where-Object { $_.Name -like $proc }; if ($OL_processes.Count -eq 0) { Write-Output \"No $proc processes were found.\" } else { Write-Output \"The following processes contained $proc and file paths will be checked: $OL_processes\"; foreach ($process in $OL_processes) { $path = $process.Path; if ($path -like $valid_path) { Stop-Process $process -Force; Write-Output \"$proc process file path matches and has been stopped.\" } else { Write-Output \"$proc file path doesnt match and process was not stopped.\" } } } }""



############################################################


# Folders
Start-Sleep -Seconds 2
$file_paths = @("\AppData\Roaming\OneStart\", "\AppData\Local\OneStart.ai\", '\OneStart.ai\')

# Iterate through users for OneStart-related directories and deletes them
foreach ($folder in (Get-ChildItem C:\Users)) {
    foreach ($fpath in $file_paths) {
        $path = Join-Path -Path $folder.FullName -ChildPath $fpath
        # Debugging output
        Write-Output "Checking path: $path"
        if (Test-Path $path) {
            Remove-Item -Path $path -Recurse -Force -ErrorAction SilentlyContinue
            if (-not (Test-Path $path)) {
                Write-Output "$path has been deleted."
            } else {
                Write-Output "$path could not be deleted."
            }
        } else {
            Write-Output "$path does not exist."
        }
    }
}



# execute --command "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -WindowStyle Hidden -Command "Start-Sleep -Seconds 2; $file_paths = @('\AppData\Roaming\OneStart\', '\AppData\Local\OneStart.ai\', '\OneStart.ai\', '\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OneLaunch.lnk'); foreach ($folder in (Get-ChildItem C:\Users)) {foreach ($fpath in $file_paths) {$path = Join-Path -Path $folder.FullName -ChildPath $fpath; Write-Output \"Checking path: $path\"; if (Test-Path $path) { Remove-Item -Path $path -Recurse -Force -ErrorAction SilentlyContinue; if (-not (Test-Path $path)) { Write-Output \"$path has been deleted.\"; } else { Write-Output \"$path could not be deleted.\"; } } else { Write-Output \"$path does not exist.\"; } } }""
Start-Sleep -Seconds 2; $file_paths = @('\AppData\Roaming\OneStart\', '\AppData\Local\OneStart.ai\', '\OneStart.ai\', '\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OneLaunch.lnk'); foreach ($folder in (Get-ChildItem C:\Users)) {foreach ($fpath in $file_paths) {$path = Join-Path -Path $folder.FullName -ChildPath $fpath; Write-Output \"Checking path: $path\"; if (Test-Path $path) { Remove-Item -Path $path -Recurse -Force -ErrorAction SilentlyContinue; if (-not (Test-Path $path)) { Write-Output \"$path has been deleted.\"; } else { Write-Output \"$path could not be deleted.\"; } } else { Write-Output \"$path does not exist.\"; } } }





################################


# Files
# Remove OneStart from downloads


$fileFilter = 'OneStart*';
$userFolders = Get-ChildItem -Path 'C:\Users' -Directory;
$oneStartlnk = ''

foreach ($folder in $userFolders) {
    $downloadsPath = Join-Path -Path $folder.FullName -ChildPath 'Downloads';
    Write-Output \"Checking path: $downloadsPath\";
    if (Test-Path -Path $downloadsPath) {
        $files = Get-ChildItem -Path $downloadsPath -Filter $fileFilter -Force -ErrorAction SilentlyContinue;
        foreach($file in $files) {
            try {
                Remove-Item -Path $file.FullName -Recurse -Force -ErrorAction Stop;
                Write-Output \"$($file.FullName) has been deleted.\";
            }
            catch {
                 Write-Output \"Could not delete $($file.FullName): $_\";
            }
        }
    }
    else {
        Write-Output \"Downloads folder not found for user: $($folder.Name)\";
    }


}

# Check
# execute --command "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -WindowStyle Hidden -Command "$fileFilter = 'OneStart*'; $userFolders = Get-ChildItem -Path 'C:\Users' -Directory; foreach ($folder in $userFolders) { $downloadsPath = Join-Path -Path $folder.FullName -ChildPath 'Downloads'; Write-Output \"Checking path: $downloadsPath\"; if (Test-Path -Path $downloadsPath) { $files = Get-ChildItem -Path $downloadsPath -Filter $fileFilter -Force -ErrorAction SilentlyContinue; foreach($file in $files) { try { Write-Output \"$($file.FullName) is here.\"; } catch { Write-Output \"Could not delete $($file.FullName): $_\"; } } } else { Write-Output \"Downloads folder not found for user: $($folder.Name)\"; } }""
$fileFilter = 'OneStart*'; $userFolders = Get-ChildItem -Path 'C:\Users' -Directory; foreach ($folder in $userFolders) { $downloadsPath = Join-Path -Path $folder.FullName -ChildPath 'Downloads'; Write-Output \"Checking path: $downloadsPath\"; if (Test-Path -Path $downloadsPath) { $files = Get-ChildItem -Path $downloadsPath -Filter $fileFilter -Force -ErrorAction SilentlyContinue; foreach($file in $files) { try { Write-Output \"$($file.FullName) is here.\"; } catch { Write-Output \"Could not delete $($file.FullName): $_\"; } } } else { Write-Output \"Downloads folder not found for user: $($folder.Name)\"; } }

# Delete
# execute --command "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -WindowStyle Hidden -Command "$fileFilter = 'OneStart*'; $userFolders = Get-ChildItem -Path 'C:\Users' -Directory; foreach ($folder in $userFolders) { $downloadsPath = Join-Path -Path $folder.FullName -ChildPath 'Downloads'; Write-Output \"Checking path: $downloadsPath\"; if (Test-Path -Path $downloadsPath) { $files = Get-ChildItem -Path $downloadsPath -Filter $fileFilter -Force -ErrorAction SilentlyContinue; foreach($file in $files) { try { Remove-Item -Path $file.FullName -Recurse -Force -ErrorAction Stop; Write-Output \"$($file.FullName) has been deleted.\"; } catch { Write-Output \"Could not delete $($file.FullName): $_\"; } } } else { Write-Output \"Downloads folder not found for user: $($folder.Name)\"; } }""
$fileFilter = 'OneStart*'; $userFolders = Get-ChildItem -Path 'C:\Users' -Directory; foreach ($folder in $userFolders) { $downloadsPath = Join-Path -Path $folder.FullName -ChildPath 'Downloads'; Write-Output \"Checking path: $downloadsPath\"; if (Test-Path -Path $downloadsPath) { $files = Get-ChildItem -Path $downloadsPath -Filter $fileFilter -Force -ErrorAction SilentlyContinue; foreach($file in $files) { try { Remove-Item -Path $file.FullName -Recurse -Force -ErrorAction Stop; Write-Output \"$($file.FullName) has been deleted.\"; } catch { Write-Output \"Could not delete $($file.FullName): $_\"; } } } else { Write-Output \"Downloads folder not found for user: $($folder.Name)\"; } }


############################################################


# Registry

# Original
$reg_paths = @("\software\OneStart.ai")

# iterate through users for onestart related registry keys and removes them
foreach ($registry_hive in (get-childitem registry::hkey_users)) {
    foreach ($regpath in $reg_paths){
        $path = $registry_hive.pspath + $regpath
        if (test-path $path) {
            Remove-item -Path $path -Recurse -Force
            write-output "$path has been removed."
        }
    }
}


# New
$reg_paths = @("\software\OneStart.ai");

# iterate through users for onestart related registry keys and removes them
foreach ($registry_hive in (get-childitem registry::hkey_users)) {
    foreach ($regpath in $reg_paths){
        $path = $registry_hive.pspath + $regpath;
        if (test-path $path) {
            Remove-item -Path $path -Recurse -Force;
            Write-Output \"$path has been removed.\";
        }
    }
}


# CHECK SOFTWARE REG KEY
# execute --command "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -WindowStyle Hidden -Command "$reg_paths = @('\software\OneStart.ai'); foreach ($registry_hive in (get-childitem registry::hkey_users)) { foreach ($regpath in $reg_paths){ $path = $registry_hive.pspath + $regpath; if (test-path $path) { Write-Output \"$path is here.\"; } } }""
$reg_paths = @('\software\OneStart.ai'); foreach ($registry_hive in (get-childitem registry::hkey_users)) { foreach ($regpath in $reg_paths){ $path = $registry_hive.pspath + $regpath; if (test-path $path) { Write-Output \"$path is here.\"; } } }

# DELETE SOFTWARE REG KEY
# execute --command "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -WindowStyle Hidden -Command "$reg_paths = @('\software\OneStart.ai'); foreach ($registry_hive in (get-childitem registry::hkey_users)) { foreach ($regpath in $reg_paths) { $path = $registry_hive.pspath + $regpath; if (test-path $path) { Remove-item -Path $path -Recurse -Force; Write-Output \"$path has been removed.\"; } } }""
$reg_paths = @('\software\OneStart.ai'); foreach ($registry_hive in (get-childitem registry::hkey_users)) { foreach ($regpath in $reg_paths) { $path = $registry_hive.pspath + $regpath; if (test-path $path) { Remove-item -Path $path -Recurse -Force; Write-Output \"$path has been removed.\"; } } }


# Original run registry keys
$reg_properties = @('OneStartBar', 'OneStartBarUpdate', 'OneStartUpdate');
foreach($registry_hive in (get-childitem registry::hkey_users)){
    foreach ($property in $reg_properties){
        $path = $registry_hive.pspath + '\software\microsoft\windows\currentversion\run';
        if (test-path $path){
            $reg_key = Get-Item $path;
            $prop_value = $reg_key.GetValueNames() | Where-Object { $_ -like $property };
            if ($prop_value){
                Remove-ItemProperty $path $prop_value;
                Write-output \"$path\$prop_value registry property value has been removed.\";
            }
        }
    }
}

# New
$reg_properties = @('OneStart*');
foreach ($registry_hive in (Get-ChildItem registry::hkey_users)) {
    $path = $registry_hive.PSPath + '\software\microsoft\windows\currentversion\run';
    if (Test-Path $path) {
        $reg_key = Get-Item $path;
        $allProps = $reg_key.GetValueNames();
        foreach ($pattern in $reg_properties) {
            $matchedProps = $allProps | Where-Object { $_ -like $pattern };
            foreach ($prop in $matchedProps) {
                Remove-ItemProperty -Path $path -Name $prop;
                Write-Output \"$path\$prop registry property value has been removed.\";
            }
        }
    }
}


# Check run registry keys
# execute --command "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -WindowStyle Hidden -Command "$reg_properties = @('OneStart*'); foreach ($registry_hive in (Get-ChildItem registry::hkey_users)) { $path = $registry_hive.PSPath + '\software\microsoft\windows\currentversion\run'; if (Test-Path $path) { $reg_key = Get-Item $path; $allProps = $reg_key.GetValueNames(); foreach ($pattern in $reg_properties) { $matchedProps = $allProps | Where-Object { $_ -like $pattern }; foreach ($prop in $matchedProps) { Write-Output \"$path\$prop registry property value is here.\"; } } } }""


$reg_properties = @('OneStart*'); foreach ($registry_hive in (Get-ChildItem registry::hkey_users)) { $path = $registry_hive.PSPath + '\software\microsoft\windows\currentversion\run'; if (Test-Path $path) { $reg_key = Get-Item $path; $allProps = $reg_key.GetValueNames(); foreach ($pattern in $reg_properties) { $matchedProps = $allProps | Where-Object { $_ -like $pattern }; foreach ($prop in $matchedProps) { Write-Output \"$path\$prop registry property value is here.\"; } } } }

# Remove run registry keys
# execute --command "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -WindowStyle Hidden -Command "$reg_properties = @('OneStart*'); foreach ($registry_hive in (Get-ChildItem registry::hkey_users)) { $path = $registry_hive.PSPath + '\software\microsoft\windows\currentversion\run'; if (Test-Path $path) { $reg_key = Get-Item $path; $allProps = $reg_key.GetValueNames(); foreach ($pattern in $reg_properties) { $matchedProps = $allProps | Where-Object { $_ -like $pattern }; foreach ($prop in $matchedProps) { Remove-ItemProperty -Path $path -Name $prop; Write-Output \"$path\$prop registry property value has been removed.\"; } } } }""
$reg_properties = @('OneStart*'); foreach ($registry_hive in (Get-ChildItem registry::hkey_users)) { $path = $registry_hive.PSPath + '\software\microsoft\windows\currentversion\run'; if (Test-Path $path) { $reg_key = Get-Item $path; $allProps = $reg_key.GetValueNames(); foreach ($pattern in $reg_properties) { $matchedProps = $allProps | Where-Object { $_ -like $pattern }; foreach ($prop in $matchedProps) { Remove-ItemProperty -Path $path -Name $prop; Write-Output \"$path\$prop registry property value has been removed.\"; } } } }


############################################################


# Scheduled Tasks

# Original
$schtasknames = @("OneStart Chromium", "OneStart Updater")
$c = 0

# find onestart related scheduled tasks and unregister them
foreach ($task in $schtasknames){
    $clear_tasks = get-scheduledtask -taskname $task -ErrorAction SilentlyContinue
    if ($clear_tasks){
        $c++
        Unregister-ScheduledTask -TaskName $task -Confirm:$false
        Write-Output "Scheduled task '$task' has been removed."
    }
}

if ($c -eq 0){
    Write-Output "No OneStart scheduled tasks were found."
}


# New
$schtasknames = @('OneStart*');
$c = 0;

foreach ($taskPattern in $schtasknames) {
    $matchedTasks = Get-ScheduledTask -TaskName $taskPattern -ErrorAction SilentlyContinue;
    foreach ($task in $matchedTasks) {
        if ($task) {
            $c++;
            Unregister-ScheduledTask -TaskName $task.TaskName -Confirm:$false;
            Write-Output \"Scheduled task '$($task.TaskName)' has been removed.\";
        }
    }
}

if ($c -eq 0) {
    Write-Output \"No OneStart scheduled tasks were found.\";
}

# Check
# execute --command "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -WindowStyle Hidden -Command "$schtasknames = @('OneStart*'); $c = 0; foreach ($taskPattern in $schtasknames) { $matchedTasks = Get-ScheduledTask -TaskName $taskPattern -ErrorAction SilentlyContinue; foreach ($task in $matchedTasks) { if ($task) { $c++; Write-Output \"Scheduled task '$($task.TaskName)' was found.\"; } } } if ($c -eq 0) { Write-Output \"No OneStart scheduled tasks were found.\"; }""
$schtasknames = @('OneStart*'); $c = 0; foreach ($taskPattern in $schtasknames) { $matchedTasks = Get-ScheduledTask -TaskName $taskPattern -ErrorAction SilentlyContinue; foreach ($task in $matchedTasks) { if ($task) { $c++; Write-Output \"Scheduled task '$($task.TaskName)' was found.\"; } } } if ($c -eq 0) { Write-Output \"No OneStart scheduled tasks were found.\"; }


# Remove
# execute --command "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -WindowStyle Hidden -Command "$schtasknames = @('OneStart*'); $c = 0; foreach ($taskPattern in $schtasknames) { $matchedTasks = Get-ScheduledTask -TaskName $taskPattern -ErrorAction SilentlyContinue; foreach ($task in $matchedTasks) { if ($task) { $c++; Unregister-ScheduledTask -TaskName $task.TaskName -Confirm:$false; Write-Output \"Scheduled task '$($task.TaskName)' has been removed.\"; } } } if ($c -eq 0) { Write-Output \"No OneStart scheduled tasks were found.\"; }""
$schtasknames = @('OneStart*'); $c = 0; foreach ($taskPattern in $schtasknames) { $matchedTasks = Get-ScheduledTask -TaskName $taskPattern -ErrorAction SilentlyContinue; foreach ($task in $matchedTasks) { if ($task) { $c++; Unregister-ScheduledTask -TaskName $task.TaskName -Confirm:$false; Write-Output \"Scheduled task '$($task.TaskName)' has been removed.\"; } } } if ($c -eq 0) { Write-Output \"No OneStart scheduled tasks were found.\"; }



##############################



execute --command "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -WindowStyle Hidden -Command "Get-Website""

https://github.com/xephora/Threat-Remediation-Scripts/blob/main/OneLaunch/OneLaunch-Remediation-Script.ps1