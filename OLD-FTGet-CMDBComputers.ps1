#$FTcomputers= Import-Clixml -Path C:\amar\computers.xml

#$comps = Get-ADComputer -filter * -SearchBase "OU=Windows Servers,DC=ad,DC=ft,DC=com"

<#
$obj1 = Get-Random -InputObject $FTcomputers -count 10 | %{

    $_ | select DNSHostName,
     DistinguishedName


}

#>

 $objsfound = $FTcomputers | Where-Object { $_.name -match "-p\b" }


 $allobjects =$objsfound| ForEach-Object{


 Invoke-Command -Computername $_.name -ScriptBlock {$env:COMPUTERNAME}

 }

 <#
$obj1|%{

    write-host "checking $($_.DNSHostName) from ou $($_.DistinguishedName) "
    }
    ft

   Invoke-Command -Computername FTVCE02-WVPR-P -ScriptBlock {$env:COMPUTERNAME}
   # Invoke-Command -Computername FTINF69-AVPR-P -ScriptBlock {$env:COMPUTERNAME}
   #>

   $comps = Get-ADComputer -filter * -SearchBase "OU=Windows Servers,DC=ad,DC=ft,DC=com"
   $FTcomputers= Import-Clixml -Path C:\amar\computers.xml

   <#
   $obj1 = Get-Random -InputObject $FTcomputers -count 10 | %{

       $_ | select DNSHostName,
        DistinguishedName

   }




   }

   $objsfound = $FTcomputers | Where-Object { $_.name -match "-p\b" } |

   Try
   {
     $allobjects =$objsfound| ForEach-Object{

   }
   #Catch [System.OutOfMemoryException]
   #{
   #    Restart-Computer localhos
   #}
   Catch
   {
       $ErrorMessage = $_.Exception.Message
       $FailedItem = $_.Exception.ItemName
       $error = $_.Exception
   }
   Finally
   {
       $Time=Get-Date
       "This finshed at $Time" | out-file c:\amar\ExpensesScript.log -append
   }

   #>
