
New-Item -Path "C:\Users\luka.france\Desktop\logs-test" -Name "testfile-old.txt" -ItemType "file" -Value "This is a text string."
New-Item -Path "C:\Users\luka.france\Desktop\logs-test" -Name "testfile-old1.txt" -ItemType "file" -Value "This is a text string."

(Get-Item "C:\Users\luka.france\Desktop\logs-test\testfile-old.txt").CreationTime=("11 August 2021 15:00:00")
(Get-Item "C:\Users\luka.france\Desktop\logs-test\testfile-old1.txt").CreationTime=("11 August 2021 15:00:00")

$path = "..\..\logs-test" 
$days = (Get-Date).AddDays(-14) 
$filesToDelete = Get-ChildItem $path -Recurse -Include ("*.txt") | Where-Object {$_.CreationTime -lt $days} 

    try {
        Remove-Item $filesToDelete
        $CountDeleted++
    }
    catch {
        $CountNotDeleted++
    }

    






