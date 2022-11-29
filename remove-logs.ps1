# $path = "..\..\logs-test" 
# $days = (Get-Date).AddDays(-14)
# Get-ChildItem $path -Recurse -Include ("*.txt") | Where-Object {$_.CreationTime -lt $days} | Remove-Item
# (Get-Item "C:\Users\luka.france\Desktop\logs-test\old-test-file.txt").CreationTime=("11 August 2021 15:00:00")
# (Get-Item "C:\Users\luka.france\Desktop\logs-test\old-test-file.txt").CreationTime=("11 August 2021 15:00:00")



# $path = "..\..\logs-test" 
# try {
#     Get-ChildItem $path -Recurse -Include ("*.txt") | Where-Object {$_.CreationTime -lt $days} | Remove-Item 
# }
# catch {
#     Write-Host "An error has occured"
# }



# $path = "..\..\logs-test" 

# try {
#     Get-ChildItem $path -Recurse -Include ("*.txt") | Where-Object {$_.CreationTime -lt $days} | Remove-Item 
# }
# catch {
#     Write-Host "An error has occured"
# }



# $path = "..\..\logs-test" 
# $days = (Get-Date).AddDays(-14)
# Get-ChildItem $path -Recurse -Include ("*.txt") | Where-Object {$_.CreationTime -lt $days} | Remove-Item



# $path = "..\..\logs-test" 
# $days = (Get-Date).AddDays(-14) 
# Get-ChildItem $path -Recurse -Include ("*.txt") | Where-Object {$_.CreationTime -lt $days} | Remove-Item 
# Write-Host "Files older than: $days days will be deleted)"




$path = "..\..\logs-test" 

$filesToDelete = Get-ChildItem $path -Recurse -Include ("*.txt") | Where-Object {$_.CreationTime -lt $days} 

    try {
        Remove-Item $filesToDelete
        $CountDeleted++
    }
    catch {
        $CountNotDeleted++
    }

    Write-Host "Deleted files: $($CountDeleted)"

    "Result : {0} file(s) deleted, {1} file(s) cant removed" -f $CountDeleted, $CountNotDeleted

