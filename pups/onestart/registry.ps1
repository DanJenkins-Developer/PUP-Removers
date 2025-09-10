# Registry

$reg_paths = @("\software\OneStart.ai");

# iterate through users for onestart related registry keys and removes them
foreach ($registry_hive in (get-childitem registry::hkey_users)) {
    foreach ($regpath in $reg_paths){
        $path = $registry_hive.pspath + $regpath;
        if (test-path $path) {
            Remove-item -Path $path -Recurse -Force;
            Write-Output \"$path has been removed.\";

            # Write-Output \"$path exists.\";
        }
    }
}



# Run registry keys
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

                # Write-Output \"$path\$prop registry property value is here.\";
            }
        }
    }
}



# Helpers
# $reg_properties = @('OneStart*');
# foreach ($registry_hive in (Get-ChildItem registry::hkey_users)) {
#     $path = $registry_hive.PSPath + '\software\microsoft\windows\currentversion\run';
#     if (Test-Path $path) {
#         $reg_key = Get-Item $path;
#         $allProps = $reg_key.GetValueNames();
#         foreach ($pattern in $reg_properties) {
#             $matchedProps = $allProps | Where-Object { $_ -like $pattern };
#             foreach ($prop in $matchedProps) {
#                 Remove-ItemProperty -Path $path -Name $prop;
#                 Write-Output \"$path\$prop registry property value has been removed.\";
#             }
#         }
#     }
# }