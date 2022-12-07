New-Item -Path "C:\Users\luka.france\Desktop\logs-mod-test" -Name "testfile-old.txt" -ItemType "file" -Value "This is a text string."


Set-ItemProperty -Path "C:\Users\luka.france\Desktop\logs-mod-test\testfile-old.txt" -Name "LastWriteTime" -Value  "8/20/2021 12:00:00 PM"


# Set the path to the directory containing the log files
$log_file_path = "C:\Users\luka.france\Desktop\logs-mod-test"

# Get a list of all log files in the directory
$log_files = Get-ChildItem -Path $log_file_path -Filter "*.txt"

# Loop through each log file and check the last modified date
foreach ($log_file in $log_files) {
    $last_modified = $log_file.LastWriteTime

    # If the file was last modified over 14 days ago, delete it
    if (((Get-Date) - $last_modified).TotalDays -gt 14) {
        Remove-Item -Path $log_file.FullName
    }
}
