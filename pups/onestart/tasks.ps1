# Scheduled Tasks

$schtasknames = @('OneStart*');
$c = 0;

foreach ($taskPattern in $schtasknames) {
    $matchedTasks = Get-ScheduledTask -TaskName $taskPattern -ErrorAction SilentlyContinue;
    foreach ($task in $matchedTasks) {
        if ($task) {
            $c++;
            Unregister-ScheduledTask -TaskName $task.TaskName -Confirm:$false;
            Write-Output \"Scheduled task '$($task.TaskName)' has been removed.\";

            # Write-Output \"Scheduled task '$($task.TaskName)' is here.\";
        }
    }
}
if ($c -eq 0) {
    Write-Output \"No OneStart scheduled tasks were found.\";
}