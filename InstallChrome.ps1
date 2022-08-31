#check install
New-Item -Path 'C:\Common Files\LOG\' -ItemType Directory
New-Item -Path 'C:\Common Files\LOG\log.txt' -ItemType File  
$CheckGoogle = Get-ChildItem -Path 'C:\Program Files' -Name -Filter Google 

if ($CheckGoogle -contains ("Google")){
    Add-Content -Path 'C:\Common Files\LOG\log.txt' -Value "Chrome Installed already"
    }
    else {
    #download .exe
    Invoke-WebRequest -Uri "http://dl.google.com/chrome/install/375.126/chrome_installer.exe" -OutFile 'C:\Users\Administrator\Downloads\chrome.exe'
    #run .exe
    <#$pathvargs = {C:\Users\Administrator\Downloads\chrome.exe /silent /install }
    Invoke-Command -ScriptBlock $pathvargs#>
    Start-Process -Wait -FilePath "C:\Users\Administrator\Downloads\chrome.exe" -ArgumentList "/silent /install" -PassThru
    Add-Content -Path 'C:\Common Files\LOG\log.txt' -Value "Chrome Installed succesfully"     
    }
 Add-Content -Path 'C:\Common Files\LOG\log.txt' -Value "Chrome Installed"
