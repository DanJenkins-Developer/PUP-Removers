# Folders


Start-Sleep -Seconds 2;
$file_paths = @('\PCAppStore\');

foreach ($folder in (Get-ChildItem C:\Users)) {
    foreach ($fpath in $file_paths) {
        $path = Join-Path -Path $folder.FullName -ChildPath $fpath;
        # Debugging output
        Write-Output \"Checking path: $path\";
        if (Test-Path $path) {
            Remove-Item -Path $path -Recurse -Force -ErrorAction SilentlyContinue;
            if (-not (Test-Path $path)) {
                Write-Output \"$path has been deleted.\";
            } else {
                Write-Output \"$path could not be deleted.\";
            }
        } else {
            Write-Output \"$path does not exist.\";
        }
    }
}