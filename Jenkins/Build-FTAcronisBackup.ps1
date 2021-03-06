# Function to write a message to the Application event log, source "PowerShell-Script", event ID 1
# Requires admin rights to create the source.
function Write-AppEventLog {
  Param(
    [Parameter(Mandatory=$true)]
    [string]$MessageText
    ,
    [Parameter(Mandatory=$true)]
    [ValidateSet("Information","Warning","Error")]
    [string]$EventType # Information, Warning etc
  )

  If(![System.Diagnostics.EventLog]::SourceExists("PowerShell-Script")) { 
    [System.Diagnostics.EventLog]::CreateEventSource("PowerShell-Script",'Application')
  }
        
  Write-EventLog -LogName Application -Source PowerShell-Script -EventId 1 -EntryType $EventType -Message $MessageText
}`

$giturl = "https://github.com/Financial-Times/acronis-sgw-snapshots.git";$runMessage = "$(Get-Date) managed by $($env:COMPUTERNAME) Starting the circleci daily build ";$Acronispath = "D:\scripts\acronis-sgw-snapshots";$folderpath = "D:\Scripts";$flag = "flag.txt"

#$Acronispath = "C:\Amar\Scripts\acronis-sgw-snapshots"
#$folderpath = "C:\Amar\Scripts"


Write-AppEventLog -MessageText "Starting the circleci daily build User: $($env:USERDOMAIN)\$($env:USERNAME)" -EventType Information

if (test-path -Path "$Acronispath\$flag"){

    Set-Location -Path $Acronispath
    git pull
    git checkout circleci
    $runMessage | out-file -FilePath "$Acronispath\$flag"  -Force
    git add .
    git commit -m $runMessage 
    git push --set-upstream origin circleci
    git checkout master
    $runMessage | out-file -FilePath "$Acronispath\$flag"  -Force
    git add .
    git commit -m $runMessage 
    git push --set-upstream origin master
    
}else{
    Set-Location -Path $folderpath
    git clone $giturl
    Set-Location -Path $Acronispath
    git checkout circleci
    $runMessage | out-file -FilePath "$Acronispath\$flag"  -Force
    git add .
    git commit -m $runMessage 
    git push --set-upstream origin circleci
    git checkout master
    $runMessage | out-file -FilePath "$Acronispath\$flag"  -Force
    git add .
    git commit -m $runMessage 
    git push --set-upstream origin master
}
