@echo off
title ⟊⟁𖤐 ALIEN PROTOCOL █████
setlocal enabledelayedexpansion
color 0A

:: =======================================
:: JÄRJESTELMÄNVALVOJAN TARKISTUS (alien-muoto)
:: =======================================
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ⟊⟁𖤐⟁⟟⧖⧃ 𖤣⟊⟁ ⟟⟊𐍈 ⧖⟁ ✦✦✦ ADMIN ✦✦✦ ⧃⧠𖤣
    pause
    exit /b
)

:: =======================================
:: ASETUKSET
:: =======================================
set pads=20
set lines=50
set wallpaper=%~dp0alien.jpg
set beeps=70
set popups=10

:: Alien-viestit popupteihin
set messages[0]=👽 Tervetuloa maapallolle!
set messages[1]=🛸 Olet havaittu!
set messages[2]=✨ Alieneilla on silmät päällä!
set messages[3]=⟁⊹ Ole varuillasi!
set messages[4]=🜁🜎 Suunnitelma käynnissä!
set messages[5]=🛸👁️ Pian tapahtuu jotain!
set messages[6]=👽 Abduktio käynnissä!
set messages[7]=✨🔮 Katso taivaalle!
set messages[8]=⟁ Alien-hälytys aktivoitu!
set messages[9]=👾 Tervetuloa galaksiin!

:: =======================================
:: TAUSTAKUVA
:: =======================================
if exist "%wallpaper%" (
    powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(""user32.dll"", SetLastError=true)] public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'%wallpaper%',3)"
) else (
    echo ⟟⟊𐍈 ⧖⟁ ⟊𖤐✦ PROJEKTIO ✦✦✦
)

:: =======================================
:: LUODAAN ENEMMÄN ALIEN NOTEPAD-TIEDOSTOJA
:: =======================================
for /l %%p in (1,1,%pads%) do (
    set "outfile=alien_%%p.txt"
    > "!outfile!" (
        for /l %%i in (1,1,%lines%) do (
            set /a rand=!random! %% 7
            if !rand!==0 echo 👽𖤐✨🛸⟁⟟⟊
            if !rand!==1 echo ⟟⟊𐍈𖣘▜⧖
            if !rand!==2 echo ⧃⧠𖤣🜁🜎✨
            if !rand!==3 echo ⟁𖤐⡡⟟𖣘⊹
            if !rand!==4 echo ⟊🜄𖠑𖤓⧖𖠿🛸
            if !rand!==5 echo 👾✨🛸⟁🜁
            if !rand!==6 echo ⛧👽🔮⟟⧖
        )
    )
    start "" notepad.exe "!outfile!"
)

:: =======================================
:: PÄÄ LOOP — KESTÄÄ IKUISESTI
:: =======================================
:ALIENLOOP

    :: Satunnaiset CMD-värit
    set /a colorRand=!random! %% 6
    if !colorRand!==0 color 0A
    if !colorRand!==1 color 0B
    if !colorRand!==2 color 0C
    if !colorRand!==3 color 0D
    if !colorRand!==4 color 0E
    if !colorRand!==5 color 0F

    :: Putoava alien-data
    for /l %%i in (1,1,25) do (
        set "line="
        for /l %%j in (1,1,12) do (
            set /a r=!random! %% 7
            if !r!==0 set "char=👽"
            if !r!==1 set "char=🛸"
            if !r!==2 set "char=✨"
            if !r!==3 set "char=⟁"
            if !r!==4 set "char=⟊"
            if !r!==5 set "char=👾"
            if !r!==6 set "char=🔮"
            set "line=!line!!char!"
        )
        echo !line!
        powershell -command "Start-Sleep -Milliseconds 70"
    )

    :: Alien beep-äänet
    for /l %%b in (1,1,7) do (
        powershell -c "[console]::beep((400 + (Get-Random -Maximum 1200)),(100 + (Get-Random -Maximum 200)))"
    )

    :: Satunnaiset popup-viestit
    set /a popupRand=!random! %% %popups%
    powershell -command ^
    "[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null; ^
    $Template = [Windows.UI.Notifications.ToastTemplateType]::ToastText02; ^
    $Xml = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent($Template); ^
    $TextNodes = $Xml.GetElementsByTagName('text'); ^
    $TextNodes.Item(0).AppendChild($Xml.CreateTextNode('👽 Alien')) > $null; ^
    $TextNodes.Item(1).AppendChild($Xml.CreateTextNode('%messages[%popupRand%]%')) > $null; ^
    $Toast = [Windows.UI.Notifications.ToastNotification]::new($Xml); ^
    $Notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier('Alien Script'); ^
    $Notifier.Show($Toast)"

    :: Satunnaiset alien-hälytysviestit CMD-ikkunaan
    set /a alertRand=!random! %% 5
    if !alertRand!==0 echo [Alien ALERT] Energia-anomalia havaittu!
    if !alertRand!==1 echo [Alien ALERT] Analysoidaan maapallon signaaleja...
    if !alertRand!==2 echo [Alien ALERT] Uusi olio havaittu!
    if !alertRand!==3 echo [Alien ALERT] 🛸👽✨
    if !alertRand!==4 echo [Alien ALERT] 🔮✨ Alien-aktivaatio!

goto ALIENLOOP
