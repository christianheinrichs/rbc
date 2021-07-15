@echo off

rem This script should backup profiles, settings and savegames, which are herein
rem collectively referred to as gamestate.

rem Write the path to your game directory here

set "gamerootdir="

echo Gamestate backup script running
echo.

rem A Hand With Many Fingers

set "ahwmfsavedir=%userprofile%\AppData\LocalLow\Colestia\A Hand With Many Fingers\saves"

rem Create backup directory if it doesn’t exist
echo A Hand With Many Fingers: Creating backup directory
md "A Hand With Many Fingers\saves"

rem Copy savegame file
echo A Hand With Many Fingers: Backing up savegame file
copy "%ahwmfsavedir%\autosave.save" "A Hand With Many Fingers\saves"

rem Export registry keys into file
echo A Hand With Many Fingers: Backing up registry keys
reg export HKCU\SOFTWARE\Colestia "A Hand With Many Fingers\ahwmf.reg" /y

echo A Hand With Many Fingers: Done.
echo.

rem Alan Wake - American Nightmare

set "awandir=%userprofile%\Documents\Remedy\AmericanNightmare_GOG_Version"

rem Create backup directory if it doesn’t exist
echo Alan Wake - American Nightmare: Creating backup directory
md "Alan Wake - American Nightmare\savegames"

rem Copy savegame file
echo Alan Wake - American Nightmare: Backing up savegame file
copy %awandir%\savegames\savegame_awns\savegame.aws "Alan Wake - American Nightmare\savegames\savegame_awns"

rem Copy config file, which for example stores Arcade scores separately
echo Alan Wake - American Nightmare: Backing up config file
copy %awandir%\config "Alan Wake - American Nightmare"

echo Alan Wake - American Nightmare: Done.
echo.

rem Amnesia - A Machine for Pigs

set "aamfpdir=%userprofile%\Documents\Amnesia\Pig"

rem Create backup directory if it doesn’t exist
echo Amnesia - A Machine for Pigs: Creating backup directory
md "Amnesia - A Machine for Pigs\New Player"

rem Copy main setting file
echo Amnesia - A Machine for Pigs: Backing up main setting file
copy "%aamfpdir%\main_settings.cfg" "Amnesia - A Machine for Pigs"

rem Copy savegames, key bindings and user main_settings
echo Amnesia - A Machine for Pigs: Backing up profile folder
copy "%aamfpdir%\New Player\*" "Amnesia - A Machine for Pigs\New Player"

echo Amnesia - A Machine for Pigs: Done.
echo.

rem Amnesia - The Dark Descent

set "amnesiadir=%userprofile%\Documents\Amnesia\Main\New Player"

rem Create backup directory if it doesn’t exist
echo Amnesia - The Dark Descent
md "Amnesia - The Dark Descent\New Player"

rem Copy savegame files from profile folder
echo Amnesia - The Dark Descent: Backing up savegame files
copy "%amnesiadir%\*.sav" "Amnesia - The Dark Descent"

echo Amnesia - The Dark Descent: Done.
echo.

rem Becherov

set "becherovdir=%gamerootdir%\Becherov\Data\Player"

rem Create backup directory if it doesn’t exist
echo Becherov: Creating backup directory
md Becherov

rem Copy profile data file into Becherov folder
echo Becherov: Backing up profile data
copy %becherovdir%\profiles.dat Becherov

echo Becherov: Done.
echo.

rem Buddy Simulator 1984

set "bs1984datadir=%userprofile%\Documents\Buddy Simulator 1984"
set "bs1984rootdir=%gamerootdir%\Buddy Simulator 1984"

rem Create backup directories
echo Buddy Simulator 1984: Creating backup folders
md "Buddy Simulator 1984\Buddy Simulator 1984"
md "Buddy Simulator 1984\Memories"

rem Copy new version of data folder
echo Buddy Simulator 1984: Backing up current data folder
xcopy /e /y "%bs1984datadir%" "Buddy Simulator 1984\Buddy Simulator 1984"

rem Copy memories
echo Buddy Simulator 1984: Backing up memories
copy "%bs1984rootdir%\Buddy Simulator 1984_Data\StreamingAssets\Memories\*" "Buddy Simulator 1984\Memories"

rem Export registry keys into file
echo Buddy Simulator 1984: Backing up registry keys
reg export "HKCU\SOFTWARE\Not a Sailor Studios" "Buddy Simulator 1984\buddy-sim-1984.reg" /y

echo Buddy Simulator 1984: Done.
echo.

rem Cave Story

set "cavestorydir=%gamerootdir%\Cave_Story"

rem Create backup directory if it doesn’t exist
echo Cave Story: Creating backup directory
md "Cave Story"

rem Copy profile data from the game’s root directory into ‘Cave Story’ folder
echo Cave Story: Backing up profile data
copy %cavestorydir%\Profile.dat "Cave Story"

echo Cave Story: Done.
echo.

rem Chaser

set "chaserdir=%gamerootdir%\Chaser\Save"

rem Create backup directory if it doesn’t exist
echo Chase: Creating backup directory
md "Chaser"

rem Copy all savegame files into Chaser directory
echo Chaser: Backing up savegames
copy %chaserdir%\*.sav Chaser

echo Chaser: Done.
echo.

rem Darkest Dungeon

set "ddprofiledir=%userprofile%\Documents\Darkest\profile_0"

rem Create backup directory if it doesn’t exist
echo Darkest Dungeon: Creating backup directory
md "Darkest Dungeon"

rem Copy JSON files into ‘Darkest Dungeon’ directory
echo Darkest Dungeon: Backing up JSON files
copy %ddprofiledir%\*.json "Darkest Dungeon"

echo Darkest Dungeon: Done.
echo.

rem else Heart.Break()

set "ehbsavedir=%gamerootdir%\ElseHeartbreak\ElseHeartbreak_Data\Saves"

rem Create backup directory if it doesn’t exist
echo else Heart.Break(): Creating backup directory
md "Else Heartbreak"

rem Copy JSON savegame files into ‘Else Heartbreak’ folder
echo else Heart.Break(): Backing up JSON savegames folder
copy %ehbsavedir%\*.json "Else Heartbreak"

echo else Heart.Break(): Done.
echo.

rem Enigmatis - The Ghosts of Maple Creek

set "enigmatisdir=%appdata%\Artifex Mundi\Enigmatis_TheGhostOfMapleCreek\CE\profile"

rem Create backup directory if it doesn’t exist
echo Enigmatis - The Ghosts of Maple Creek: Creating backup directory
md "Enigmatis - The Ghosts of Maple Creek"

rem Copy achievement file from profile folder into Enigmatis directory
echo Enigmatis - The Ghosts of Maple Creek: Backing up achievement file
copy "%enigmatisdir%\*.ach" "Enigmatis - The Ghosts of Maple Creek"

rem Copy global settings profile into Enigmatis directory
echo Enigmatis - The Ghosts of Maple Creek: Backing up global settings profile
copy "%enigmatisdir%\GlobalProfile.prf" "Enigmatis - The Ghosts of Maple Creek"

rem Copy player profile into Enigmatis directory
echo Enigmatis - The Ghosts of Maple Creek: Backing up player profile
copy "%enigmatisdir%\Profile_01.prf" "Enigmatis - The Ghosts of Maple Creek"

rem Copy savegame file into Enigmatis directory
echo Enigmatis - The Ghosts of Maple Creek: Backing up savegame file
copy "%enigmatisdir%\Save_01.cub" "Enigmatis - The Ghosts of Maple Creek"

echo Enigmatis - The Ghosts of Maple Creek: Done.
echo.

rem Grand Theft Auto III

set "gta3dir=%userprofile%\Documents\GTA3 User Files"

rem Create folder structure
echo Grand Theft Auto III: Creating folder structure
md "GTA III"

rem Copy settings file and all savegames
echo Grand Theft Auto III: Backing up settings file and savegames
copy "%gta3dir%\*" "GTA III"

echo Grand Theft Auto III: Done.
echo.

rem Grand Theft Auto: Vice City

set "gtavcdir=%userprofile%\Documents\GTA Vice City User Files"

rem Create folder structure
echo Grand Theft Auto: Vice City - Creating folder structure
md "GTA Vice City"

rem Copy settings file and all savegames
echo Grand Theft Auto: Vice City - Backing up settings file and savegames
copy "%gtavcdir%\*" "GTA Vice City"

echo Grand Theft Auto: Vice City - Done.
echo.

rem Grand Theft Auto: San Andreas

set "gtasadir=%userprofile%\Documents\GTA San Andreas User Files"

rem Create folder structure
echo Grand Theft Auto: San Andreas - Creating folder structure
md "GTA - San Andreas"

rem Backup the whole folder including subdirectories
echo Grand Theft Auto: San Andreas - Backing up user files
xcopy /e /y "%gtasadir%" "GTA - San Andreas"

echo Grand Theft Auto: San Andreas - Done.
echo.

rem Hacknet

set "hacknetdir=%userprofile%\Documents\My Games\Hacknet\Accounts"

rem Create folder structure
echo Hacknet: Creating folder structure
md "Hacknet"

rem Copy Accounts.txt and XML savegame file into Hacknet directory
echo Hacknet: Backing up Accounts.txt and XML savegame file
copy "%hacknetdir%\*.txt" Hacknet
copy "%hacknetdir%\*.xml" Hacknet

echo Hacknet: Done.
echo.

rem Hellblade - Senua’s Sacrifice

set "hbsavedir=%userprofile%\AppData\Local\HellbladeGame\Saved\SaveGames"

rem Create folder structure
echo Hellblade - Senua's Sacrifice: Creating folder structure
md "Hellblade - Senua's Sacrifice"

rem Copy savegame file into Hellblade folder
echo Hellblade - Senua's Sacrifice: Backing up savegame file
copy %hbsavedir%\*.sav "Hellblade - Senua's Sacrifice"

echo Hellblade - Senua's Sacrifice: Done.
echo.

rem Hotline Miami Original

set "hmrootdir=%gamerootdir%\Hotline Miami"

rem Create folder structure
echo Hotline Miami Original: Creating folder structure
md "Hotline Miami Original"

rem Copy savegame files from the game’s root directory into
rem ‘Hotline Miami Original’ folder

echo Hotline Miami Original: Backing up savegame files
copy "%hmrootdir%\achievements.dat" "Hotline Miami Original"
copy "%hmrootdir%\mask.nfo" "Hotline Miami Original"
copy "%hmrootdir%\pause.bmp" "Hotline Miami Original"
copy "%hmrootdir%\saves.dat" "Hotline Miami Original"
copy "%hmrootdir%\stats.sav" "Hotline Miami Original"
copy "%hmrootdir%\tempsave.sav" "Hotline Miami Original"

echo Hotline Miami Original: Done.
echo.

rem Inkslinger

rem Create folder structure
echo Inkslinger: Creating folder structure
md "Inkslinger"

rem Export registry keys into file
echo Inkslinger: Backing up registry keys
reg export HKCU\SOFTWARE\Gateway Inkslinger\inkslinger.reg /y

echo Inkslinger: Done.
echo.

rem Inside

set "insidedir=%userprofile%\AppData\Roaming\Playdead\Inside"

rem Create folder structure
echo Inside: Creating folder structure
md Inside

rem Backup savegame files into Inside folder
echo Inside: Backing up savegame file
copy "%insidedir%\*.sav" Inside

echo Inside: Done.
echo.

rem Jotun - Valhalla Edition

set "jvesavedir=%userprofile%\AppData\LocalLow\Thunder Lotus Games\Jotun"

rem Create folder structure
echo Jotun - Valhalla Edition: Creating folder structure
md "Jotun - Valhalla Edition"

rem Backup savegame file
echo Jotun - Valhalla Edition: Backing up savegame file
copy "%jvesavedir%\JotunGames.sav" "Jotun - Valhalla Edition"

rem Backup options file
echo Jotun - Valhalla Edition: Backing up options file
copy "%jvesavedir%\JotunOptions.sav" "Jotun - Valhalla Edition"

echo Jotun - Valhalla Edition: Done.
echo.

rem Master Spy

set "masterspydir=%localappdata%\Master Spy\Local Storage"

rem Create folder structure
echo Master Spy: Creating folder structure
md "Master Spy"

rem Copy all files from the game’s local storage into ‘Master Spy’ directory
echo Master Spy: Backing up local storage
copy "%masterspydir%\*" "Master Spy"

echo Master Spy: Done.
echo.

rem Metro 2033 Redux

set "m2033reduxdir=%userprofile%\Documents\4A Games\Metro Redux\2033"

rem Create folder structure
echo Metro 2033 Redux: Creating folder structure
md "Metro 2033 Redux"

rem Copy autosave file and player files
echo Metro 2033 Redux: Backing up autosave and player files
copy "%m2033reduxdir%\*" "Metro 2033 Redux"

echo Metro 2033 Redux: Done.
echo.

rem Mirror’s Edge

set "medir=%userprofile%\Documents\EA Games\Mirror's Edge\TdGame"

rem Create folder structure
echo Mirror's Edge: Creating folder structure
md "Mirror's Edge"

rem Copy savegame file from game’s savegame directory
echo Mirror's Edge: Backing up .dat file
copy "%medir%\Savefiles\*.dat" "Mirror's Edge"

rem Copy settings file and keybind file
echo Mirror's Edge: Backing up configuration and keybinds file
copy "%medir%\Config\*" "Mirror's Edge"

echo Mirror's Edge: Done.
echo.

rem Mount & Blade Warband - Viking Conquest

set "mbwvcsavedir=%userprofile%\Documents\Mount&Blade Warband Savegames\Viking Conquest"

rem Create folder structure
echo Mount and Blade: Warband - Viking Conquest: Creating folder structure
md "Mount & Blade Warband - Viking Conquest"

rem Backup savegame files
echo Mount and Blade: Warband - Viking Conquest: Backing up savegame files
copy "%mbwvcsavedir%\*.sav" "Mount & Blade Warband - Viking Conquest"

echo echo Mount and Blade: Warband - Viking Conquest: Done.
echo.

rem Oddworld - New 'n' Tasty

set "onntsavedir=%gamerootdir%\Oddworld - New 'n' Tasty\SaveGame"

rem Create folder structure
echo Oddworld - New 'n' Tasty: Creating folder structure
md "Oddworld - New 'n' Tasty"

rem Backup save slot files from the game’s savegame folder
echo Oddworld - New 'n' Tasty: Backing up save slot files
copy "%onntsavedir%\*.NnT" "Oddworld - New 'n' Tasty"

echo Oddworld - New 'n' Tasty: Done.
echo.

rem Outlast

set "olsavedir=%userprofile%\Documents\My Games\Outlast\OLGame\SaveData"

rem Create folder structure
echo Outlast: Creating folder structure
md Outlast

rem Backup Outlast profile
echo Outlast: Backing up profile
copy "%olsavedir%\*.olprofile" Outlast

rem Backup savegame files
echo Outlast: Backing up savegame files
copy "%olsavedir%\*.sav" Outlast

echo Outlast: Done.
echo.

rem Painkiller

set "pksavedir=%gamerootdir%\Painkiller Black\SaveGames"

rem Create folder structure
echo Painkiller: Creating folder structure
md Painkiller

rem Copy all savegame files and automatically create directories
echo Painkiller: Backing up savegame files and creating directories
xcopy /e /y "%pksavedir%\*" Painkiller

echo Painkiller: Done.
echo.

rem Quake III

set "q3rootdir=%gamerootdir%\Quake III Arena"

rem Create folder structure
echo Quake III: Creating folder structure
md "Quake III"

rem Backup config files from baseq3 directory
echo Quake III: Backing up config files
copy "%q3rootdir%\baseq3\*.cfg" "Quake III"

echo Quake III: Done.
echo.

rem Remothered - Tormented Fathers

set "rtfsavedir=%localappdata%\Remothered\Saved\SaveGames"

rem Create folder structure
echo Remothered - Tormented Fathers: Creating folder structure
md "Remothered - Tormented Fathers"

rem Backup all savegame files
echo Remothered - Tormented Fathers: Backing up savegame files
copy %rtfsavedir%\*.sav "Remothered - Tormented Fathers"

echo Remothered - Tormented Fathers: Done.
echo.

rem S.T.A.L.K.E.R. Clear Sky

set "stalkercsdir=%userprofile%\Documents\stalke~1"

rem Create folder structure
echo S.T.A.L.K.E.R. Clear Sky: Creating folder structure
md "S.T.A.L.K.E.R. Clear Sky\savedgames"

rem Backup savegame files
echo S.T.A.L.K.E.R. Clear Sky: Backing up savegame textures and saves
copy %stalkercsdir%\savedgames\*.dds "S.T.A.L.K.E.R. Clear Sky\savedgames"
copy %stalkercsdir%\savedgames\*.sav "S.T.A.L.K.E.R. Clear Sky\savedgames"

rem Backup user keybinds and settings
echo S.T.A.L.K.E.R. Clear Sky: Backing up user.ltx file
copy %stalkercsdir%\user.ltx "S.T.A.L.K.E.R. Clear Sky"

echo S.T.A.L.K.E.R. Clear Sky: Done.
echo.

rem Saints Row 3

set "sr3dir=%userprofile%\AppData\Local\Saints Row The Third"

rem Create folder structure
echo Saints Row 3: Creating folder structure
md "Saints Row 3"

rem Backup savegame files
echo Saints Row 3: Backing up savegame files
copy "%sr3dir%\savedir.sr3d_pc" "Saints Row 3"
copy "%sr3dir%\*.sr3s_pc" "Saints Row 3"
copy "%sr3dir%\sr3def_profile" "Saints Row 3"

echo Saints Row 3: Done.
echo.

rem Serious Sam: The First Encounter

set "sstfedir=%gamerootdir%\Serious Sam The First Encounter"

rem Create folder structure
echo Serious Sam: The First Encounter: Creating folder structure
md "Serious Sam - The First Encounter\Controls"
md "Serious Sam - The First Encounter\Players"
md "Serious Sam - The First Encounter\SaveGame\Player0\Quick"
md "Serious Sam - The First Encounter\Scripts"

rem Copy Controls file for player slot 0
echo Serious Sam: The First Encounter: Backing up Controls file
copy "%sstfedir%\Controls\Controls0.ctl" "Serious Sam - The First Encounter\Controls"

rem Copy .plr file from Players directory
echo Serious Sam: The First Encounter: Backing up .plr file
copy "%sstfedir%\Players\Player0.plr" "Serious Sam - The First Encounter\Players"

rem Copy all files from player profile directory
echo Serious Sam: The First Encounter: Backing up savegame files
copy "%sstfedir%\SaveGame\Player0\*" "Serious Sam - The First Encounter\SaveGame\Player0"

rem Copy all files from player profile quicksave directory
echo Serious Sam: The First Encounter: Backing up quicksave files
copy "%sstfedir%\SaveGame\Player0\Quick\*" "Serious Sam - The First Encounter\SaveGame\Player0\Quick"

rem Copy persistent symbols file, which contains setting values
echo Serious Sam: The First Encounter: Backing up persistent symbols file
copy "%sstfedir%\Scripts\PersistentSymbols.ini" "Serious Sam - The First Encounter\Scripts"

echo Serious Sam: The First Encounter: Done.
echo.

rem Sludge Life

set "slrootdir=%gamerootdir%\SludgeLife"

rem Create folder structure
echo Sludge Life: Creating folder structure
md "Sludge Life"

rem Backup savegame file from the game’s root directory
echo Sludge Life: Backing up savegame file
copy %slrootdir%\save.txt "Sludge Life"

echo Sludge Life: Done.
echo.

rem SWAT 4

set "swat4sysdir=%gamerootdir%\SWAT 4\Content\System"

rem Create folder structure
echo SWAT 4: Creating folder structure
md "SWAT 4"

rem Backup .ini files responsible for campaign progress, dynamic loadout state,
rem mission results, SWAT 4 general settings, SWAT 4 GUI state and user
rem configuration

echo SWAT 4: Backing up .ini files
copy "%swat4sysdir%\Campaign.ini" "SWAT 4"
copy "%swat4sysdir%\DynamicLoadout.ini" "SWAT 4"
copy "%swat4sysdir%\MissionResults.ini" "SWAT 4"
copy "%swat4sysdir%\Swat4.ini" "SWAT 4"
copy "%swat4sysdir%\SwatGUIState.ini" "SWAT 4"
copy "%swat4sysdir%\User.ini" "SWAT 4"

echo SWAT 4: Done.
echo.

rem Syberia I

set "syberiasavedir=%userprofile%\Documents\Syberia Saves"

rem Create folder structure
echo Syberia I: Creating folder structure
md "Syberia"

rem Backup savegame files
echo Syberia I: Backing up savegame files
copy "%syberiasavedir%\*.sav" Syberia

echo Syberia I: Done.
echo.

rem Syberia II

set "syb2savedir=%userprofile%\Documents\Syberia 2 Saves"

rem Create folder structure
echo Syberia II: Creating folder structure
md "Syberia 2"

rem Backup savegame files
echo Syberia II: Backing up savegame files
copy "%syb2savedir%\*.sav" "Syberia 2"

echo Syberia II: Done.
echo.

rem The Cat Lady

set "tclsavedir=%userprofile%\Saved Games\The Cat Lady"

rem Create folder structure
echo The Cat Lady: Creating folder structure
md "The Cat Lady"

rem Copy savegame files from savegame folder
echo The Cat Lady: Backing up savegame files
copy "%tclsavedir%\agssave.*" "The Cat Lady"

echo The Cat Lady: Done.
echo.

rem The Infectious Madness of Doctor Dekker

set "timoddsavedir=%userprofile%\AppData\Roaming\timodd"

rem Create folder structure
echo The Infectious Madness of Doctor Dekker: Creating folder structure
md "The Infectious Madness of Doctor Dekker"

rem Copy savegame files from the game’s savegame folder
echo The Infectious Madness of Doctor Dekker: Backing up JSON savegame files
copy %timoddsavedir%\*.json "The Infectious Madness of Doctor Dekker"

echo The Infectious Madness of Doctor Dekker: Done.
echo.

rem The Longest Journey

set "tljrootdir=%gamerootdir%\The Longest Journey"

rem Create folder structure
echo The Longest Journey: Creating folder structure
md "The Longest Journey"

rem Copy profile data from game folder into this folder
echo The Longest Journey: Copying plaintext profile data
copy "%tljrootdir%\Save\01.txt" "The Longest Journey"

rem Copy savegame data from game folder into this folder
echo The Longest Journey: Copying savegame data
copy "%tljrootdir%\Save\01\*" "The Longest Journey\01"

rem Copy game settings
echo The Longest Journey: Backing up game settings
copy "%tljrootdir%\preferences.ini" "The Longest Journey"

echo The Longest Journey: Done.
echo.

rem The Suicide of Rachel Foster

set "tsorfsavedir=%localappdata%\Daedalic Entertainment GmbH\The Suicide of Rachel Foster\Saved\SaveGames"

rem Create folder structure
echo The Suicide of Rachel Foster: Creating folder structure
md "The Suicide of Rachel Foster"

rem Backup savegame file
echo The Suicide of Rachel Foster: Backing up savegame file
copy "%tsorfsavedir%\OverlookSave.sav" "The Suicide of Rachel Foster"

echo The Suicide of Rachel Foster: Done.
echo.

rem The Witcher

set "tw1savedir=%userprofile%\Documents\The Witcher\saves"

rem Create folder structure
echo The Witcher: Creating folder structure
md "The Witcher"

rem Backup savegame files
echo The Witcher: Backing up savegame files
copy "%tw1savedir%\*" "The Witcher"

rem Export registry keys into file
echo The Witcher: Backing up registry keys
reg export "HKCU\SOFTWARE\CD Projekt RED" "The Witcher\tw1-settings.reg" /y

echo The Witcher: Done.
echo.

rem Uplink

set "uluserdir=%gamerootdir%\Uplink\users"

rem Create folder structure
echo Uplink: Creating folder structure
md Uplink

rem Copy options file from Uplink’s users directory
echo Uplink: Backing up options file
copy %uluserdir%\options Uplink

rem Copy user files from Uplink’s users directory
echo Uplink: Backing up user files
copy %uluserdir%\*.usr Uplink

echo Uplink: Done.
echo.

rem Vampire’s Dawn 2

set "vd2rootdir=%gamerootdir%\Vampires_Dawn_2"

rem Create folder structure
echo Vampire's Dawn 2: Creating folder structure
md "Vampires Dawn 2"

rem Copy savegame files
echo Vampire's Dawn 2: Backing up savegames
copy %vd2rootdir%\*.lsd "Vampires Dawn 2"

echo Vampire's Dawn 2: Done.
echo.

pause
