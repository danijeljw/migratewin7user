@echo on
rem Set the date for folder name structure
FOR /F "TOKENS=1* DELIMS= " %%A IN ('DATE/T') DO SET CDATE=%%B
FOR /F "TOKENS=1,2 eol=/ DELIMS=/ " %%A IN ('DATE/T') DO SET mm=%%B
FOR /F "TOKENS=1,2 DELIMS=/ eol=/" %%A IN ('echo %CDATE%') DO SET dd=%%B
FOR /F "TOKENS=2,3 DELIMS=/ " %%A IN ('echo %CDATE%') DO SET yyyy=%%B
SET date=%mm%%dd%%yyyy% 
rem Create folder structure from hostname
echo "Creating folder structure"
timeout /t 3 /nobreak
mkdir %curpath%\%date%\%hostname%\UserData
mkdir %curpath%\%date%\%hostname%\%username%\Desktop
mkdir %curpath%\%date%\%hostname%\%username%\Documents
mkdir %curpath%\%date%\%hostname%\%username%\Downloads
mkdir %curpath%\%date%\%hostname%\%username%\Favourites
mkdir %curpath%\%date%\%hostname%\signatures
rem copy UserData across
echo "Copying UserData folder"
timeout /t 3 /nobreak
powershell -c "Get-ChildItem -Recurse 'C:\UserData' | Measure-Object -Property Length -Sum"
xcopy "C:\UserData\*.*" %curpath%\%date%\%hostname%\UserData /D /S /R /K /Y
rem copy user folder across
echo "Copying UserID Desktop, Documents, Downloads, Favourites folders"
timeout /t 3 /nobreak
powershell -c "Get-ChildItem -Recurse 'C:\Users' | Measure-Object -Property Length -Sum"
xcopy "C:\Users\%username%\Desktop\*.*" %curpath%\%date%\%hostname%\%username%\Desktop /D /S /R /K /Y 
xcopy "C:\Users\%username%\Documents\*.*" %curpath%\%date%\%hostname%\%username%\Documents /D /S /R /K /Y 
xcopy "C:\Users\%username%\Downloads\*.*" %curpath%\%date%\%hostname%\%username%\Downloads /D /S /R /K /Y 
xcopy "C:\Users\%username%\Favourites\*.*" %curpath%\%date%\%hostname%\%username%\Favourites /D /S /R /K /Y 
rem copy signatures across
echo "Copying Outlook signatures folder"
timeout /t 3 /nobreak
powershell -c "Get-ChildItem -Recurse 'C:\UserData' | Measure-Object -Property Length -Sum"
xcopy "C:\Users\%username%\AppData\Roaming\Microsoft\Signatures\*.*" %curpath%\%date%\%hostname%\signatures /D /S /R /K /Y
rem completion notice
echo "Completion of tasks"
timeout /t 5 /nobreak
exit
