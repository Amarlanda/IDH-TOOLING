function FTMap-drive{
<#
     .Example
          Map-Adrive Z \\server\folder
     .Example
          Map-Adrive Z \\server\folder -persistent
     .Example
          Map-Adrive Z \\server\folder -verbose
#>    
     [CmdletBinding()]
     param(
          [string]$driveletter,
          [string]$path,
          [switch]$persistent
     )
     process{
          $nwrk=new-object -com Wscript.Network
          Write-Verbose "Mapping $($driveletter+':') to $path and persist=$persistent"
          try{
               $nwrk.MapNetworkDrive($($driveletter+':'),$path)     
               Write-Verbose "Mapping successful."
          }
          catch{
               Write-Verbose "Mapping failed!"
          }
     }
}