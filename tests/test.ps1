#Global command line parameters
New-Variable -Name TestData -Option AllScope -Value $null

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
              $TestData = $switches[$i+1].ToLower()
              $i++
            }
            break
        }

    }
  }
}