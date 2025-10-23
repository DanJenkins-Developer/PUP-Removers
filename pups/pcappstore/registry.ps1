# Registry

# Software reg
Function registry_software {
    $reg_paths = @('\software\PCAppStore', '\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\PCAppStore');

    # iterate through users for onestart related registry keys and removes them
    foreach ($registry_hive in (get-childitem registry::hkey_users)) {
        foreach ($regpath in $reg_paths){
            $path = $registry_hive.pspath + $regpath;
            if (test-path $path) {
                Remove-item -Path $path -Recurse -Force;
                Write-Output \"$path has been removed.\";
                # Write-Output \"$path Is here.\";
            }
        }
    }
}

# Run keys
$reg_properties = @('Watchdog', 'PcAppStoreUpdater', 'PCAppStore');
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

                # Write-Output \"$path\$prop registry property value is here.\";
            }
        }
    }
}