cls
$fileName = "File_Uploading_Report"
$enddate = (Get-Date).tostring("yyyyMMddhhmmss") 
$logFileName = $fileName +"_"+ $enddate+"_Log.txt"   
$invocation = (Get-Variable MyInvocation).Value  
$directoryPath = Split-Path $invocation.MyCommand.Path

$directoryPathForLog=$directoryPath+"\"+"LogFiles"
if(!(Test-Path -path $directoryPathForLog))  
        {  
            New-Item -ItemType directory -Path $directoryPathForLog
               
        }

$logPath = $directoryPathForLog + "\" + $logFileName
$isLogFileCreated = $False 

function Write-Log([string]$logMsg)  
{   
    if(!$isLogFileCreated){   
        Write-Host "Creating Log File..."   
        if(!(Test-Path -path $directoryPath))  
        {  
            Write-Host "Please Provide Proper Log Path" -ForegroundColor Red   
        }   
        else   
        {   
            $script:isLogFileCreated = $True   
            Write-Host "Log File ($logFileName) Created..."   
            [string]$logMessage = [System.String]::Format("[$(Get-Date)] - {0}", $logMsg)   
            Add-Content -Path $logPath -Value $logMessage   
        }   
    }   
    else   
    {   
        [string]$logMessage = [System.String]::Format("[$(Get-Date)] - {0}", $logMsg)   
        Add-Content -Path $logPath -Value $logMessage   
    }   
}

#####How to use?################################ 
$sampleLogMessage="This is a sample log entry";
Write-Log $sampleLogMessage
Write-host "Log file entry has been successfully tested"
#####How to use ends here#######################