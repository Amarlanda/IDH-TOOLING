$stageSvrs = "FTAPP70-WVPR-P"

$stageSvrs | %{
         Invoke-Command -ComputerName $_ -ScriptBlock {
             $setupFolder = "c:\tmp"
             Write-Host "Creating $_\$setupFolder Folder"
             New-Item -Path $setupFolder -type directory -Force
             Write-Host "Folder creation complete"
         }
}

Get-ChildItem -Path "\\FTAPP70-WVPR-P\c$\tmp" -Recurse

Copy-Item 
