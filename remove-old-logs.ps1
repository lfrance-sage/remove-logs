New-Item -Path "C:\Users\luka.france\Desktop\logs-test" -Name "testfile-old.txt" -ItemType "file" -Value "This is a text string."
New-Item -Path "C:\Users\luka.france\Desktop\logs-test" -Name "testfile-old1.txt" -ItemType "file" -Value "This is a text string."
New-Item -Path "C:\Users\luka.france\Desktop\logs-test" -Name "testfile-old2.txt" -ItemType "file" -Value "This is a text string."

(Get-Item "C:\Users\luka.france\Desktop\logs-test\testfile-old.txt").CreationTime=("11 August 2021 15:00:00")
(Get-Item "C:\Users\luka.france\Desktop\logs-test\testfile-old1.txt").CreationTime=("11 August 2021 15:00:00")
(Get-Item "C:\Users\luka.france\Desktop\logs-test\testfile-old2.txt").CreationTime=("11 August 2021 15:00:00")


Set-ItemProperty -Path "C:\Users\luka.france\Desktop\logs-test\testfile-old.txt" -Name "LastWriteTime" -Value  "8/20/2022 12:00:00 PM"

function deleteLogs {    
    
    $logFile = "C:\Users\luka.france\Desktop\my-log-output\log-$(Get-Date -Format yyyy-MM-dd-HH-mm-ss).txt"
        if (-not (Test-Path $logFile)) {
            New-Item -Path $logFile -ItemType File
            Add-Content -Path $logFile -Value "Script started at $(Get-Date)"
          }
    $path = "..\..\logs-test"    #This is where we will set the path for the log files
    $days = (Get-Date).AddDays(-14)  # The number -14 is the time you want the files to delete after
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
                Write-Host "Succesfully deleted: $($filesToDelete.Count) Files" -ForegroundColor Green
    }
    Add-Content -Path $logFile -Value "Deleted files: $($filesToDelete)"
    Add-Content -Path $logFile -Value "Script finished at $(Get-Date)"
    }
    deleteLogs