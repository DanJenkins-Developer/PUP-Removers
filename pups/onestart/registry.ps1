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