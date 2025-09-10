# Processes
# find running processes with "OneStart" in them
$valid_path = 'C:\Users\*\AppData\Local\OneStart.ai\*';
$process_names = @('OneStart', 'updater', 'Updater', 'onestart');
    foreach ($proc in $process_names){
    $OL_processes = Get-Process | Where-Object { $_.Name -like $proc };
    if ($OL_processes.Count -eq 0){
        Write-Output \"No $proc processes were found.\";
    }else {
        write-output \"The following processes contained $proc and file paths will be checked: $OL_processes\"
        foreach ($process in $OL_processes){
            $path = $process.Path;
            if ($path -like $valid_path){
                Stop-Process $process -Force;
                Write-Output \"$proc process file path matches and has been stopped.\";
            }else {
                Write-Output \"$proc file path doesn't match and process was not stopped.\";
            }
        }
    }
}