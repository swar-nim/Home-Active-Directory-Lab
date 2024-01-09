# Define log file paths to be collected
$logPaths = @(
    "C:\Logs\Server1.log",                     # Path to Server1 log file
    "\\Server2\Share\app.log",                 # Path to app.log on Server2 shared location
    "C:\ProgramData\Application\app.log"       # Path to local app.log file
)

# Define destination for the central log repository
$centralLogPath = "\\CentralServer\LogRepository"  # Central repository location

# Iterate through log paths and copy logs to the central repository
foreach ($logPath in $logPaths) {
    $logName = Split-Path $logPath -Leaf             # Extracts the log file name
    $destination = Join-Path $centralLogPath $logName   # Creates the destination path in the central repository
    Copy-Item -Path $logPath -Destination $destination -Force   # Copies the log file to the central repository
}
