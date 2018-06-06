
#$smallobjs = $objsfound| select -first 10

$found=@()
$uncontactable=@()
$smallobjs | ForEach-Object{

  $results += Invoke-Command -Computername $_.name -ScriptBlock {

    $_ = $currentObj
    try{

      $env:COMPUTERNAME
      $Time=Get-Date
      $found += ,@("Server $_ was contactable at $Time",$_, $env:COMPUTERNAME)

      Return $_

    } Catch [System.Exception]{

      $uncontactable += ,@("Server $_ was uncontactable at $Time",$_,$Error[0].Exception )

      Return $_

    }Finally{
      #$Time=Get-Date
      #"This finshed at $Time and took this much time to run" | out-file c:\amar\ExpensesScript.log -append
    }
  }
}
