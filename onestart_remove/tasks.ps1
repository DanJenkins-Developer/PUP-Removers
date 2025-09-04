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
