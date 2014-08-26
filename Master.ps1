#Global command line parameters
New-Variable -Name Env -Option AllScope -Value $null
New-Variable -Name app -Option AllScope -Value $null

#Test Variables
[string] $Path = Get-Location
[string] $Environment = "test"
[string] $Tests = "$Path\tests"
[string] $Data = "$Path\data\TestData.xml"
[string[]] $TestResults


#Help file
function Show-HelpUsage
{
    Write-Host " "
    Write-Host "NAME"
    Write-Host "    EngageDeploy.ps1"
    Write-Host " "
    Write-Host "DESCRIPTION"
    Write-Host "    This script will execute a list of powershell tests located in the 'tests' directory. "
    Write-Host " "
    Write-Host "PARAMETERS"
    Write-Host " "
    Write-Host " "
    Write-Host "  -Env [Dev | Test | Prod]"
    Write-Host "    Optional. Specifies the environment the tests will be executed in. Default environment is Test"

}

function Parse-CommandLine
{
  param($switches)
  for($i=0;$i -lt $switches.Count;$i++)
  {
    switch($switches[$i].Trim().ToLower())
    {
      "-Env"
        {
            if ($switches.Count -ge $i+1)
            {
              $Env = $switches[$i+1].ToLower()
              $i++
            }
            break
        }
      "-help"
      {
            Show-HelpUsage
            Exit
      }
      "-?"
      {
            Show-HelpUsage
            Exit
      }
      "-h"
      {
            Show-HelpUsage
            Exit
      }
    }
  }
}



#Validate that all required params are filled in. Paths are built later 
if($Env -eq "dev")
{
    $environment = "dev"
    $Data = "$Path\data\DevData.xml"
}
elseif($Env -eq "test")
{
    $environment = "test"
    $Data = "$Path\data\TestData.xml"
}
elseif($Env -eq "prod")
{
    $environment = "prod"
    $Data = "$Path\data\ProdData.xml"
}
elseif($Env -eq $null)
{
    $environment = "test"
    $Data = "$Path\data\TestData.xml"
}
else
{
    Write-Error "Invalid environment type selected. Please enter an environment type as 'test','dev'"
    Exit
}

#Build a list of tests from the tests directory (this should only contain valid test files, but if not the list will be limited to .ps1 files)
$TestList = gci $Tests | ? {$_.Name.Contains(".ps1")}

#Runs the tests and stores the returned XML into an array for building into a Junit report
foreach($TestName in $TestList.Name)
{
    $TestResults += Invoke-Expression "$Tests\$TestName -TestData $Data"
    
}



