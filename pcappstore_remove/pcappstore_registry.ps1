# Registry




# Software reg

$reg_paths = @("\software\PCAppStore");

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
$reg_paths = @('\software\PCAppStore'); foreach ($registry_hive in (get-childitem registry::hkey_users)) { foreach ($regpath in $reg_paths){ $path = $registry_hive.pspath + $regpath; if (test-path $path) { Write-Output \"$path is here.\"; } } }
# execute --command "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -WindowStyle Hidden -Command "$reg_paths = @('\software\PCAppStore'); foreach ($registry_hive in (get-childitem registry::hkey_users)) { foreach ($regpath in $reg_paths){ $path = $registry_hive.pspath + $regpath; if (test-path $path) { Write-Output \"$path is here.\"; } } }""

# DELETE SOFTWARE REG KEY
$reg_paths = @('\software\PCAppStore'); foreach ($registry_hive in (get-childitem registry::hkey_users)) { foreach ($regpath in $reg_paths) { $path = $registry_hive.pspath + $regpath; if (test-path $path) { Remove-item -Path $path -Recurse -Force; Write-Output \"$path has been removed.\"; } } }
# execute --command "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -WindowStyle Hidden -Command "$reg_paths = @('\software\PCAppStore'); foreach ($registry_hive in (get-childitem registry::hkey_users)) { foreach ($regpath in $reg_paths) { $path = $registry_hive.pspath + $regpath; if (test-path $path) { Remove-item -Path $path -Recurse -Force; Write-Output \"$path has been removed.\"; } } }""



# Run keys

# Check
$reg_properties = @('Watchdog');
foreach ($registry_hive in (Get-ChildItem registry::hkey_users)) {
    $path = $registry_hive.PSPath + '\software\microsoft\windows\currentversion\run';
    if (Test-Path $path) {
        $reg_key = Get-Item $path;
        $allProps = $reg_key.GetValueNames();
        foreach ($pattern in $reg_properties) {
            $matchedProps = $allProps | Where-Object { $_ -like $pattern };
            foreach ($prop in $matchedProps) {
                Write-Output \"$path\$prop registry property value is here.\";
            }
        }
    }
}

$reg_properties = @('Watchdog'); foreach ($registry_hive in (Get-ChildItem registry::hkey_users)) { $path = $registry_hive.PSPath + '\software\microsoft\windows\currentversion\run'; if (Test-Path $path) { $reg_key = Get-Item $path; $allProps = $reg_key.GetValueNames(); foreach ($pattern in $reg_properties) { $matchedProps = $allProps | Where-Object { $_ -like $pattern }; foreach ($prop in $matchedProps) { Write-Output \"$path\$prop registry property value is here.\"; } } } }
# execute --command "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -WindowStyle Hidden -Command "$reg_properties = @('Watchdog'); foreach ($registry_hive in (Get-ChildItem registry::hkey_users)) { $path = $registry_hive.PSPath + '\software\microsoft\windows\currentversion\run'; if (Test-Path $path) { $reg_key = Get-Item $path; $allProps = $reg_key.GetValueNames(); foreach ($pattern in $reg_properties) { $matchedProps = $allProps | Where-Object { $_ -like $pattern }; foreach ($prop in $matchedProps) { Write-Output \"$path\$prop registry property value is here.\"; } } } }""

# Delete
$reg_properties = @('Watchdog');
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

$reg_properties = @('Watchdog'); foreach ($registry_hive in (Get-ChildItem registry::hkey_users)) { $path = $registry_hive.PSPath + '\software\microsoft\windows\currentversion\run'; if (Test-Path $path) { $reg_key = Get-Item $path; $allProps = $reg_key.GetValueNames(); foreach ($pattern in $reg_properties) { $matchedProps = $allProps | Where-Object { $_ -like $pattern }; foreach ($prop in $matchedProps) { Remove-ItemProperty -Path $path -Name $prop; Write-Output \"$path\$prop registry property value has been removed.\"; } } } }
# execute --command "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -WindowStyle Hidden -Command "$reg_properties = @('Watchdog'); foreach ($registry_hive in (Get-ChildItem registry::hkey_users)) { $path = $registry_hive.PSPath + '\software\microsoft\windows\currentversion\run'; if (Test-Path $path) { $reg_key = Get-Item $path; $allProps = $reg_key.GetValueNames(); foreach ($pattern in $reg_properties) { $matchedProps = $allProps | Where-Object { $_ -like $pattern }; foreach ($prop in $matchedProps) { Remove-ItemProperty -Path $path -Name $prop; Write-Output \"$path\$prop registry property value has been removed.\"; } } } }""



# Helpers
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