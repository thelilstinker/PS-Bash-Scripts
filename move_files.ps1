﻿$_DestinationPath = "C:\Users\Jen\Desktop\test"

$textFilesToMove = 'text_files_to_move.txt'

$delimiter = "`n"
$nonmatchArrayList = New-Object -TypeName "System.Collections.ArrayList"

[string[]]$pattern= Get-Content -Path $textFilesToMove

For ($i = 0; $i -lt $pattern.Length; $i++) {
    $match = Get-ChildItem -recurse | Where-Object {$_.Name -match $pattern[$i].Trim() }
    if($match) {
        For($j=0; $j -lt $match.Count; $j++){
            #Move-item –path $match –destination $_DestinationPath
            Copy-Item -path $match[$j] –destination $_DestinationPath
        }

    }
}