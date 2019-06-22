function Get-PhpIpamSubnetAddressesByID{
    [cmdletBinding()]
    Param(
         [parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true,position=0)]
         [int]$ID
    )

    begin{
        Write-Verbose $ID
    }
    process{
        $r=Invoke-PhpIpamExecute -method get -controller subnets -identifiers @($ID,"addresses")
        Resolve-PhpIpamExecuteResult -result $r
    }

    end{

    }
}

Export-ModuleMember -Function Get-PhpIpamSubnetAddressesByID
