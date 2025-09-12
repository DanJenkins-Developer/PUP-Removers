# Files

#Get user dirctories on the system
$userFolders = Get-ChildItem -Path 'C:\Users' -Directory;

# Remove OneStart from downloads
$fileFilter = 'OneStart*';

# Todo: Add shortcut files
# $shortcuts = @(
#     '\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\OneLaunch.lnk',
#     '\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\OneLaunchChromium.lnk',
#     '\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\OneLaunchUpdater.lnk',
#     '\desktop\OneLaunch.lnk'
#     );

# Iterate through user directories
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

    # Write-Output \"Checking for shortcutfiles\";

    # foreach ($shortcut in $shortcuts) {
    #     $shortcutPath = Join-Path -Path $folder.FullName -ChildPath $shortcut; 
    #     Write-Output \"Checking for $($shortcutPath)\";
    #     if (Test-Path -Path $shortcutPath)
    #     {
    #         Write-Output \"$($shortcutPath) exists\";
    #     }
    #     else {
    #         Write-Output \"$($shortcutPath) does not exist\";
    #     }
    # }


}









