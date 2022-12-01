# New-Item -Path "C:\Users\luka.france\Desktop\logs-test" -Name "testfile-old.txt" -ItemType "file" -Value "This is a text string."
# New-Item -Path "C:\Users\luka.france\Desktop\logs-test" -Name "testfile-old1.txt" -ItemType "file" -Value "This is a text string."
# New-Item -Path "C:\Users\luka.france\Desktop\logs-test" -Name "testfile-old2.txt" -ItemType "file" -Value "This is a text string."

# (Get-Item "C:\Users\luka.france\Desktop\logs-test\testfile-old.txt").CreationTime=("11 August 2021 15:00:00")
# (Get-Item "C:\Users\luka.france\Desktop\logs-test\testfile-old1.txt").CreationTime=("11 August 2021 15:00:00")
# (Get-Item "C:\Users\luka.france\Desktop\logs-test\testfile-old2.txt").CreationTime=("11 August 2021 15:00:00")


$path = "..\..\logs-test"   
$days = (Get-Date).AddDays(-14) 
$filesToDelete = Get-ChildItem $path -Recurse -Include ("*.txt") | Where-Object {$_.CreationTime -lt $days} 

foreach ($path in $path ) {
    Write-Host "Your Path is: $path" -ForegroundColor White
    Write-Host "Total files to be deleted are: $($filesToDelete.count)" -ForegroundColor Yellow
        try {
                if (Test-Path $path) {
                    Write-Host "Checking $($path)" -ForegroundColor Cyan
                    Remove-Item $filesToDelete 
                } else {
                    Write-Warning "Failed to find or verify $path"
                }
        }
        catch {
          Write-Host "ERROR" -ForegroundColor Red
        }

        Write-Host "Succesfully deleted: $($filesToDelete.Count) Files"
}








