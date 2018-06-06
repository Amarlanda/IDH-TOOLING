<#
     .Bug
          Unable to wrap -persistent
#>

$server FTAPP70-WVPR-P
$path = "\\$server\c$\tmp"

[string]$psProvider = FileSystem
[string]$location = "\\FTAPP70-WVPR-P\c$\
"
[switch]$persistent


new-psdrive -name $name -psProvider $psProvider -root $location -persist
