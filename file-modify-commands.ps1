$path = "C:\Users\luka.france\Desktop\objectMultiplyer"

 1..10| ForEach-Object {new-item -path $path -Name "testfile$PSItem.txt" -ItemType "file" -Value "This is a text string."} 


# Get-Item -Path $path*.txt.CreationTime=("11 August 2021 15:00:00")


# Get-ChildItem -Path $path -filter *.txt CreationTime = ("11 August 2021 15:00:00")