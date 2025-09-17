# Files



#Get user dirctories on the system
$userFolders = Get-ChildItem -Path 'C:\Users' -Directory;


# Remove OneStart from downloads
$fileFilter = 'SparkOnSoft*';



# Iterate through user directories
foreach ($folder in $userFolders) {
    $downloadsPath = Join-Path -Path $folder.FullName -ChildPath 'Downloads';
    Write-Output \"Checking path: $downloadsPath\";
    if (Test-Path -Path $downloadsPath) {
        $files = Get-ChildItem -Path $downloadsPath -Filter $fileFilter -Force -ErrorAction SilentlyContinue;
        foreach($file in $files) {
            try {
                # Remove-Item -Path $file.FullName -Recurse -Force -ErrorAction Stop;
                # Write-Output \"$($file.FullName) has been deleted.\";

                Write-Output \"$($file.FullName) is here.\";
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