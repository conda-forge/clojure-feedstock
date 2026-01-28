$c = Get-Content 'deps.edn' -Raw                                                                                                                      
$repo = "`n :mvn/repos`n {`"local`" {:url `"file:$($env:USERPROFILE.Replace('\','/'))/.m2/repository`"}}`n"                                           
$c = $c -replace '(\{:paths \["src"\])', "`$1$repo"                                                                                                   
$c = $c -replace ':git/tag v', ':mvn/version'                                                                                                           
$c = $c -replace ' :git/sha +"[a-f0-9]+"', ''                                                                                                         
Set-Content 'deps.edn' $c                                                                                                                             
