@echo off

rem This script takes care of traces left behind by the games listed in the
rem SUPPORTED.md file.

rem Write the path to your game directory here

set "gamerootdir="

rem A Hand With Many Fingers

set "colestiadir=%userprofile%\AppData\LocalLow\Colestia"

rem Delete the Colestia folder
rd /q /s %colestiadir%

rem Delete registry keys
reg delete HKEY_CURRENT_USER\SOFTWARE\Colestia /f

rem Alan Wake - American Nightmare

set "remedydir=%userprofile%\Documents\Remedy"

rem Delete the Remedy folder
rd /q /s %remedydir%

rem Amnesia - The Dark Descent

set "amnesiadir=%userprofile%\Documents\Amnesia"

rem Delete the Amnesia folder. Files here include configuration, log files,
rem an empty first start flag, profile folders which in turn contain savegames,
rem user bindings and user settings

rd /q /s %amnesiadir%

rem Becherov

set "becherovdir=%gamerootdir%\Becherov"

rem Delete profile data
del %becherovdir%\Data\Player\profiles.dat

rem Delete all registry data for Becherov
reg delete HKEY_CURRENT_USER\Software\Inputwish /f

rem Buddy Simulator 1984

set "bs1984datadir=%userprofile%\Documents\Buddy Simulator 1984"
set "bs1984lldir=%userprofile%\AppData\LocalLow\Not a Sailor Studios"
set "bs1984rootdir=%gamerootdir%\Buddy Simulator 1984"

rem Delete data folder
rd /q /s "%bs1984datadir%"

rem Delete LocalLow directory
rd /q /s "%bs1984lldir%"

rem Delete memories
del /q "%bs1984rootdir%\Buddy Simulator 1984_Data\StreamingAssets\Memories\*"

rem Delete registry keys
reg delete "HKCU\SOFTWARE\Not a Sailor Studios" /f

rem Cave Story

set "cavestorydir=%gamerootdir%\Cave_Story"

rem Delete configuration and profile data. Profile data also contains savegame
rem markers
del %cavestorydir%\*.dat

rem Delete window.rect
del %cavestorydir%\*.rect

rem Chaser

set "chaserdir=%gamerootdir%\Chaser"

rem Delete Users folder, which contains at least a bind and settings file
rd /q /s %chaserdir%\Save\Users

rem Delete savegame files
del %chaserdir%\Save\*.sav

rem Darkest Dungeon

set "darkestdungeondir=%userprofile%\Documents\Darkest"

rem Delete Darkest Dungeon folder, which should contain all profiles
rd /q /s %darkestdungeondir%

rem Delete registry keys
reg delete "HKEY_CURRENT_USER\Software\Red Hook Studios" /f

rem else Heart.Break()

set "ehbrootdir=%gamerootdir%\ElseHeartbreak"

rem Delete Unity log file
del %ehbrootdir%\ElseHeartBreak_Data\*.txt

rem Delete savegames
del %ehbrootdir%\ElseHeartbreak_Data\Saves\*.json

rem Delete registry keys
reg delete HKEY_CURRENT_USER\Software\Miman /f

rem Enigmatis - The Ghosts of Maple Creek

set "amdir=%appdata%\Artifex Mundi\"

rem Delete Artifex Mundi directory
rd /q /s "%amdir%"

rem Grand Theft Auto III

set "gta3dir=%userprofile%\Documents\GTA3 User Files"

rem Delete GTA3 directory
rd /q /s "%gta3dir%"

rem Grand Theft Auto: Vice City

set "gtavcdir=%userprofile%\Documents\GTA Vice City User Files"

rem Delete GTA: Vice City directory
rd /q /s "%gtavcdir%"

rem Grand Theft Auto: San Andreas

set "gtasadir=%userprofile%\Documents\GTA San Andreas User Files"

rem Delete GTA: San Andreas directory
rd /q /s "%gtasadir%"

rem Hacknet

set "hacknetdir=%userprofile%\Documents\My Games\Hacknet"
set "hacknetrootdir=%gamerootdir%\Hacknet"

rem Delete log file
del %hacknetrootdir%\*.log

rem Delete settings file
del %hacknetrootdir%\Settings.txt

rem Delete Hacknet folder, within it is a directory called Accounts.
rem Accounts contains accounts information and the actual user profiles
rem in XML format. These user profiles also contain savegame information, but
rem are only functional in combination with the correct accounts file
rd /q /s "%hacknetdir%"

rem Hellblade - Senua’s Sacrifice

set "hellbladedir=%localappdata%\HellbladeGame"

rem Delete local appdata Hellblade folder which contains .ini files and the
rem savegame in .sav format
rd /q /s %hellbladedir%

rem Hotline Miami Original

set "hmrootdir=%gamerootdir%\Hotline Miami"
set "hmuserdir=%userprofile%\Documents\My Games\HotlineMiami"

rem Delete savegame files in HM root directory
del "%hmrootdir%\achievements.dat"
del "%hmrootdir%\mask.nfo"
del "%hmrootdir%\pause.bmp"
del "%hmrootdir%\saves.dat"
del "%hmrootdir%\stats.sav"
del "%hmrootdir%\tempsave.sav"

rem Delete HM’s user folder, which contains at least one .cfg file
rd /q /s "%hmuserdir%"

rem Inkslinger

set "inkslingerlldir=%userprofile%\AppData\LocalLow\Gateway"

rem Delete Gateway folder
rd /q /s %inkslingerlldir%

rem Delete registry keys
reg delete "HKCU\SOFTWARE\Gateway" /f

rem Inside

set "playdeaddir=%appdata%\Playdead"
set "playdeadlldir=%userprofile%\AppData\LocalLow\Playdead"

rem Delete Playdead folder
rd /q /s %playdeaddir%

rem Delete Playdead folder in local low app data storage
rd /q /s %playdeadlldir%

rem Delete Playdead registry keys
reg delete HKEY_CURRENT_USER\Software\Playdead /f

rem Jotun - Valhalla Edition

set "tldir=%userprofile%\AppData\LocalLow\Thunder Lotus Games"

rem Delete Thunder Lotus Games folder
rd /q /s "%tldir%"

rem Delete Thunder Lotus Games registry keys
reg delete "HKEY_CURRENT_USER\Software\Thunder Lotus Games" /f

rem Master Spy

set "masterspydir=%localappdata%\Master Spy"

rem Delete local Master Spy directory
rd /q /s "%masterspydir%"

rem Metro 2033 Redux

set "m2033devdir=%userprofile%\Documents\4A Games"
set "m2033localdir=%localappdata%\4A Games"

rem Delete 4A Games directory
rd /q /s "%m2033devdir%"

rem Delete 4A Games directory in local appdata
rd /q /s "%m2033localdir%"

rem Delete 4A Games registry keys
reg delete HKEY_CURRENT_USER\Software\4A-Games /f

rem Mirror’s Edge

set "eadir=%userprofile%\Documents\EA Games"

rem Delete EA Games directory
rd /q /s "%eadir%"

rem Mount & Blade Warband

set "mbwuserdir=%userprofile%\Documents\Mount&Blade Warband"
set "mbwroamingdir=%appdata%\Mount&Blade Warband"
set "mbwsavedir=%userprofile%\Documents\Mount&Blade Warband Savegames"

rem Delete Mount & Blade Warband user directory
rd /q /s "%mbwuserdir%"

rem Delete Mount & Blade Warband roaming directory
rd /q /s "%mbwroamingdir%"

rem Delete Mount & Blade Warband savegame directory
rd /q /s "%mbwsavedir%"

rem Oddworld - New 'n' Tasty

set "onntdatadir=%gamerootdir%\Oddworld - New 'n' Tasty\NNT_Data"
set "onntsavedir=%gamerootdir%\Oddworld - New 'n' Tasty\SaveGame"

rem Delete all files in savegame folder
del /q "%onntsavedir%\*"

rem Delete Unity log file
del "%onntdatadir%\output_log.txt"

rem Delete Oddworld Inhabitants registry keys
reg delete "HKCU\Software\Oddworld Inhabitants, Inc." /f

rem Outlast

set "oluserdir=%userprofile%\Documents\My Games\Outlast"

rem Delete Outlast user directory
rd /q /s "%oluserdir%"

rem Painkiller

set "pk1rootdir=%gamerootdir%\Painkiller Black"

rem Delete configuration file
del "%pk1rootdir%\Bin\config.ini"

rem Delete savegame folders and savegames
rd /q /s "%pk1rootdir%\SaveGames"

rem Delete registry keys
reg delete HKEY_CURRENT_USER\Software\PeopleCanFly /f

rem Quake III

set "q3rootdir=%gamerootdir%\Quake III Arena"

rem Delete log files in root directory
echo Quake III: Deleting log files
del "%q3rootdir%\*.log"

rem Delete configuration files from baseq3 directory
echo Quake III: Deleting configuration files
del "%q3rootdir%\baseq3\*.cfg"

rem Remothered - Tormented Fathers

set "rtfdir=%localappdata%\Remothered"

rem Delete Remothered directory
rd /q /s %rtfdir%

rem Ritual of the Moon

set "rotmlldir=%userprofile%\AppData\LocalLow\Kara Stone"

rem Delete LocalLow folder
rd /q /s "%rotmlldir%"

rem Delete registry keys
reg delete "HKCU\SOFTWARE\Kara Stone" /f

rem S.T.A.L.K.E.R. Clear Sky

set "stalkercsdir=%userprofile%\Documents\stalke~1"

rem Delete S.T.A.L.K.E.R. Clear Sky user directory
rd /q /s %stalkercsdir%

rem Saints Row 3

set "sr3localdir=%localappdata%\Saints Row The Third"
set "sr3rootdir=%gamerootdir%\Saints Row 3"

rem Delete local app data folder
rd /q /s "%sr3localdir%"

rem Delete display configuration file and viewed.dat
del "%sr3rootdir%\display.ini"
del "%sr3rootdir%\viewed.dat"

rem Serious Sam The First Encounter

set "sstferootdir=%gamerootdir%\Serious Sam The First Encounter"

rem Delete log file
del "%sstferootdir%\SeriousSam.log"

rem Delete GMS file
del "%sstferootdir%\Data\SeriousSam.gms"

rem Delete control files
del "%sstferootdir%\Controls\Controls*"

rem Delete player files
del /q "%sstferootdir%\Players\*"

rem Delete console history
del "%sstferootdir%\Temp\ConsoleHistory.txt"

rem Delete persistent symbol file
del "%sstferootdir%\Scripts\PersistentSymbols.ini"

rem Delete all savegames from player profile 0
del /q "%sstferootdir%\SaveGame\Player0\*"
del /q "%sstferootdir%\Savegame\Player0\Quick\*"

rem Delete .vis files
del /q "%sstferootdir%\Levels\*.vis"

rem Sludge Life

set "sllldir=%userprofile%\AppData\LocalLow\TerriVellmann"
set "slrootdir=%gamerootdir%\SludgeLife"

rem Delete savegame
del %slrootdir%\save.txt

rem Delete local low directory
rd /q /s %sllldir%

rem Delete registry keys
reg delete HKEY_CURRENT_USER\Software\TerriVellmann /f

rem SWAT 4

set "swat4sysdir=%gamerootdir%\SWAT 4\Content\System"

rem Delete newly generated .ini files
del "%swat4sysdir%\Campaign.ini"
del "%swat4sysdir%\DynamicLoadout.ini"
del "%swat4sysdir%\MissionResults.ini"
del "%swat4sysdir%\Swat4.ini"
del "%swat4sysdir%\SwatGUIState.ini"
del "%swat4sysdir%\User.ini"

rem Delete log file
del "%swat4sysdir%\Swat4.log"

rem Syberia I

set "syberiarootdir=%gamerootdir%\Syberia"
set "syberiasavedir=%userprofile%\Documents\Syberia Saves"

rem Delete Syberia I debug log file
del %syberiarootdir%\debug.log

rem Delete Syberia I savegame directory
rd /q /s "%syberiasavedir%"

rem Syberia II

set "syb2rootdir=%gamerootdir%\Syberia 2"
set "syb2savedir=%userprofile%\Documents\Syberia 2 Saves"

rem Delete Syberia II debug log file
del "%syb2rootdir%"\debug.log

rem Delete Syberia II savegame directory
rd /q /s "%syb2savedir%"

rem The Cat Lady

set "tclsavedir=%userprofile%\Saved Games\The Cat Lady"

rem Delete savegame directory
rd /q /s "%tclsavedir%"

rem The Suicide of Rachel Foster

set "daedalicdir=%localappdata%\Daedalic Entertainment GmbH"

rem Delete Daedalic folder
rd /q /s "%daedalicdir%"

rem The Infectious Madness of Doctor Dekker

set "timoddappdir=%appdata%\timodd"

rem Delete app data folder
rd /q /s %timoddappdir%

rem The Longest Journey

set "tljrootdir=%gamerootdir%\The Longest Journey"

rem Delete preferences file
del "%tljrootdir%\preferences.ini"

rem Delete savegame folders and savegames
rd /q /s "%tljrootdir%\Save\01"
del "%tljrootdir%\Save\01.txt"

rem The Witcher

set "w1localdir=%localappdata%\The Witcher"
set "w1userdir=%userprofile%\Documents\The Witcher"

rem Delete Witcher 1 local appdata folder
rem Contains multiple folders and log files
rd /q /s "%w1localdir%"

rem Delete Witcher 1 user directory
rd /q /s "%w1userdir%"

rem Delete Witcher 1 registry keys
reg delete "HKCU\Software\CD Projekt RED" /f

rem Uplink

set "ulrootdir=%gamerootdir%\Uplink"

rem Delete all files in users directory
rem Here, there is a user file, a temporary user file backup, an options file
rem and a debug log
del /q %ulrootdir%\users\*

rem Delete all files in temporary user folder
del /q %ulrootdir%\userstmp\*

rem Vampire’s Dawn 2

set "vd2rootdir=%gamerootdir%\Vampires_Dawn_2"

rem Delete savegame files
del /q %vd2rootdir%\*.lsd

pause
