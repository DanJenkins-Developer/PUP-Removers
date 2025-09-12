# Folders


function Check-Folders{ 
    Start-Sleep -Seconds 2;
    $file_paths = @('\AppData\Local\Temp\7ZipSfx.000\');

    # Iterate through users for OneStart-related directories and deletes them
    foreach ($folder in (Get-ChildItem C:\Users)) {
        foreach ($fpath in $file_paths) {
            $path = Join-Path -Path $folder.FullName -ChildPath $fpath;
            # Debugging output
            Write-Output \"Checking path: $path\";
            if (Test-Path $path) {
                Write-Output \"$path is here.\";
            } else {
                Write-Output \"$path does not exist.\";
            }
        }
    }
}


function Remove-Folders{ 
    Start-Sleep -Seconds 2;
    $file_paths = @('\AppData\Local\Temp\7ZipSfx.000\');

    # Iterate through users for OneStart-related directories and deletes them
    foreach ($folder in (Get-ChildItem C:\Users)) {
        foreach ($fpath in $file_paths) {
            $path = Join-Path -Path $folder.FullName -ChildPath $fpath;
            # Debugging output
            Write-Output \"Checking path: $path\";
            if (Test-Path $path) {
                Remove-Item -Path $path -Recurse -Force -ErrorAction SilentlyContinue;
                if (-not (Test-Path $path)) {
                    # Write-Output \"$path has been deleted.\";
                } else {
                    Write-Output \"$path could not be deleted.\";
                }
            } else {
                Write-Output \"$path does not exist.\";
            }
        }
    }
}

Check-Folders;



