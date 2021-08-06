@echo off

rem This script should backup profiles, settings and savegames, which are herein
rem collectively referred to as gamestate.

rem Write the path to your game directory here
set "gamerootdir="

echo Gamestate backup script running
echo.

rem A Hand With Many Fingers

set "ahwmfsavedir=%userprofile%\AppData\LocalLow\Colestia\A Hand With Many Fingers\saves"

rem Copy savegame file
echo A Hand With Many Fingers: Backing up savegame file
xcopy /e /i /y "%ahwmfsavedir%" "A Hand With Many Fingers\saves"

rem Export registry keys into file
echo A Hand With Many Fingers: Backing up registry keys
reg export HKCU\SOFTWARE\Colestia "A Hand With Many Fingers\ahwmf.reg" /y

echo A Hand With Many Fingers: Done.
echo.

rem Alan Wake’s American Nightmare

set "awandir=%userprofile%\Documents\Remedy\AmericanNightmare_GOG_Version"

rem Back up config file (which contains Arcade score data), keybinds, resolution
rem settings and savegames
echo Alan Wake's American Nightmare: Backing up config file, keybinds, resolution settings, savegames
xcopy /e /i /y %awandir% "Alan Wake's American Nightmare"

echo Alan Wake's American Nightmare: Done.
echo.

rem Amnesia: A Machine For Pigs

set "aamfpdir=%userprofile%\Documents\Amnesia\Pig"

rem Copy savegames, key bindings and user settings. Also, add the start flag. In
rem addition to that, create folder structure
rem TODO: Research /exclude parameter for log file exclusion
echo Amnesia: A Machine For Pigs - Backing up profile folder, first start flag and main settings
xcopy /e /i /y "%aamfpdir%" "Amnesia - A Machine for Pigs"

echo Amnesia: A Machine For Pigs - Done.
echo.

rem Amnesia: The Dark Descent

set "amnesiadir=%userprofile%\Documents\Amnesia\Main"

rem Copy savegames, key bindings and user settings. Also, add the start flag. In
rem addition to that, create folder structure
rem TODO: Research /exclude parameter for log file exclusion
echo Amnesia: The Dark Descent - Backing up profile folder, first start flag and main settings
xcopy /e /i /y "%amnesiadir%" "Amnesia - The Dark Descent"

echo Amnesia: The Dark Descent - Done.
echo.

rem ANNO 1602

set "anno1602rootdir=%gamerootdir%\ANNO1602"

rem Backup savegames
echo ANNO 1602: Backing up savegames
xcopy /e /i /y %anno1602rootdir%\Savegame "ANNO 1602\Savegame"

rem Backup Game.dat
echo ANNO 1602: Backing up Game.dat file
copy %anno1602rootdir%\Game.dat "ANNO 1602"

rem Backup registry keys
echo ANNO 1602: Backing up registry keys
reg export HKCU\SOFTWARE\ANNO1602 "ANNO 1602\anno1602.reg" /y

echo ANNO 1602: Done.
echo.

rem Becherov

set "becherovdir=%gamerootdir%\Becherov\Data\Player"

rem Copy profile data file into Becherov folder
echo Becherov: Backing up profile data
xcopy /i /y %becherovdir%\*.dat Becherov

rem Export settings into a file
echo Becherov: Backing up registry keys
reg export HKCU\SOFTWARE\Inputwish Becherov\becherov.reg /y

echo Becherov: Done.
echo.

rem BioShock

set "bs1dir=%appdata%\Bioshock"
set "bs1sgdir=%userprofile%\Documents\Bioshock\SaveGames"

rem Backup savegames
echo BioShock: Backing up savegames
xcopy /e /i /y %bs1sgdir% "BioShock\SaveGames"

rem Backup memory file, configuration and keybinds
echo BioShock: Backing up memory file, configuration and keybinds
xcopy /e /i /y %bs1dir% "BioShock\AppData"

echo BioShock: Done.
echo.

rem Buddy Simulator 1984

set "bs1984datadir=%userprofile%\Documents\Buddy Simulator 1984"
set "bs1984rootdir=%gamerootdir%\Buddy Simulator 1984"

rem Copy new version of data folder
echo Buddy Simulator 1984: Backing up current data folder
xcopy /e /i /y "%bs1984datadir%" "Buddy Simulator 1984\DATA"

rem Copy memories
echo Buddy Simulator 1984: Backing up memories
xcopy /i /y "%bs1984rootdir%\Buddy Simulator 1984_Data\StreamingAssets\Memories\*" "Buddy Simulator 1984\Memories"

rem Export registry keys into file
echo Buddy Simulator 1984: Backing up registry keys
reg export "HKCU\SOFTWARE\Not a Sailor Studios" "Buddy Simulator 1984\buddy-sim-1984.reg" /y

echo Buddy Simulator 1984: Done.
echo.

rem Cave Story

set "cavestorydir=%gamerootdir%\Cave_Story"

rem Copy profile data from the game’s root directory into ‘Cave Story’ folder
echo Cave Story: Backing up profile data
xcopy /i /y %cavestorydir%\*.dat "Cave Story"

rem Back up window.rect
echo Cave Story: Backing up window.rect
copy %cavestorydir%\*.rect "Cave Story"

echo Cave Story: Done.
echo.

rem Chaser

set "chaserdir=%gamerootdir%\Chaser\Save"

rem Copy all savegame files into Chaser directory
echo Chaser: Backing up savegames
xcopy /i /y %chaserdir%\*.sav Chaser\Save

rem Copy Users folder
echo Chaser: Backing up user keybinds and settings
xcopy /e /i /y %chaserdir%\Users Chaser\Users

echo Chaser: Done.
echo.

rem Darkest Dungeon

set "dddir=%userprofile%\Documents\Darkest"

rem Copy JSON files into ‘Darkest Dungeon’ directory
echo Darkest Dungeon: Backing up profiles and persistent options file
xcopy /e /i /y %dddir% "Darkest Dungeon"

echo Darkest Dungeon: Done.
echo.

rem Diablo (Classic)

set "diablorootdir=%gamerootdir%\Diablo"

rem Backup savegame files
echo Diablo (Classic): Backing up savegame files
xcopy /i /y %diablorootdir%\*.sv Diablo\Classic

echo Diablo (Classic): Done.
echo.

rem Diablo

rem Backup savegame files
echo Diablo: Backing up savegame files
xcopy /i /y %diablorootdir%\dx\*.sv Diablo\DX

rem Backup DX configuration
echo Diablo: Backing up DX configuration
copy %diablorootdir%\dx\dxcfg.ini Diablo\DX

echo Diablo: Done.
echo.

rem Diablo: Hellfire

rem Backup savegame files
echo Diablo: Hellfire - Backing up savegame files
xcopy /i /y %diablorootdir%\hellfire\*.hsv Diablo\Hellfire

echo Diablo: Hellfire - Done.
echo.

rem Diablo II

set "d2rootdir=%gamerootdir%\Diablo II"
set "d2sgdir=%userprofile%\Saved Games\Diablo II"

rem Backup savegame files
echo Diablo II: Backing up savegame files
xcopy /e /i /y "%d2sgdir%" "Diablo II\Saved Games"

rem Backup default.key file
echo Diablo II: Backing up default.key file
copy "%d2rootdir%\default.key" "Diablo II"

rem Backup registry keys
echo Diablo II: Backing up registry keys
reg export "HKCU\SOFTWARE\Blizzard Entertainment\Diablo II" "Diablo II\d2.reg" /y

echo Diablo II: Done.
echo.

rem Die Völker

set "dvdir=%gamerootdir%\Alien Nations"

rem Backup configuration and savegame files
echo Die Voelker: Backing up configuration and savegame files
xcopy /e /i /y "%dvdir%\Savegames" "Die Voelker\Savegames"

echo Die Voelker: Done.
echo.

rem else Heart.Break()

set "ehbsavedir=%gamerootdir%\ElseHeartbreak\ElseHeartbreak_Data\Saves"

rem Copy JSON savegame files into ‘Saves’ folder
echo else Heart.Break(): Backing up JSON savegames folder
xcopy /i /y %ehbsavedir%\*.json "Else Heartbreak\Saves"

rem Export registry keys. Settings are stored in them.
echo else Heart.Break(): Backing up registry keys
reg export HKCU\SOFTWARE\Miman "Else Heartbreak\else-heartbreak.reg" /y

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

rem Gothic

set "g1rootdir=%gamerootdir%\Gothic"

rem Backup savegames
echo Gothic: Backing up savegames
xcopy /e /i /y %g1rootdir%\Saves Gothic\Saves

rem Backup configuration file
echo Gothic: Backing up configuration file
xcopy /i /y %g1rootdir%\system\*.INI Gothic\system

echo Gothic: Done.
echo.

rem Gothic II

set "g2rootdir=%gamerootdir%\Gothic II Gold"

rem Backup savegames
echo Gothic II: Backing up savegames
xcopy /e /i /y "%g2rootdir%\Saves" "Gothic II\Saves"

rem Backup configuration file
echo Gothic II: Backing up configuration file
xcopy /i /y "%g2rootdir%\system\*.INI" "Gothic II\system"

echo Gothic II: Done.
echo.

rem Grand Theft Auto III

set "gta3dir=%userprofile%\Documents\GTA3 User Files"

rem Copy settings file and all savegames
echo Grand Theft Auto III: Backing up settings file and savegames
xcopy /i /y "%gta3dir%\*" "GTA III"

echo Grand Theft Auto III: Done.
echo.

rem Grand Theft Auto: Vice City

set "gtavcdir=%userprofile%\Documents\GTA Vice City User Files"

rem Copy settings file and all savegames
echo Grand Theft Auto: Vice City - Backing up settings file and savegames
xcopy /i /y "%gtavcdir%\*" "GTA Vice City"

echo Grand Theft Auto: Vice City - Done.
echo.

rem Grand Theft Auto: San Andreas

set "gtasadir=%userprofile%\Documents\GTA San Andreas User Files"

rem Backup the whole folder with subdirectories
echo Grand Theft Auto: San Andreas - Backing up user files
xcopy /e /i /y "%gtasadir%" "GTA - San Andreas"

echo Grand Theft Auto: San Andreas - Done.
echo.

rem Hacknet

set "hacknetdir=%userprofile%\Documents\My Games\Hacknet\Accounts"
set "hnrootdir=%gamerootdir%\Hacknet"

rem Copy Accounts.txt and XML savegame file into Hacknet directory
echo Hacknet: Backing up Accounts.txt and XML savegame file
xcopy /i /y "%hacknetdir%\*" Hacknet\Accounts

rem Back up settings file
echo Hacknet: Backing up settings file
copy %hnrootdir%\Settings.txt Hacknet

echo Hacknet: Done.
echo.

rem Hellblade - Senua’s Sacrifice

set "hbsavedir=%userprofile%\AppData\Local\HellbladeGame\Saved"

rem Copy savegame file into Hellblade folder
echo Hellblade - Senua's Sacrifice: Backing up savegame file
xcopy /i /y %hbsavedir%\SaveGames\*.sav "Hellblade - Senua's Sacrifice\SaveGames"

rem Copy user settings file
echo Hellblade - Senua's Sacrifice: Backing up user settings
copy %hbsavedir%\Config\WindowsNoEditor\GameUserSettings.ini "Hellblade - Senua's Sacrifice"

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
md Inkslinger

rem Export registry keys into file
echo Inkslinger: Backing up registry keys
reg export HKCU\SOFTWARE\Gateway Inkslinger\inkslinger.reg /y

echo Inkslinger: Done.
echo.

rem Inside

set "insidedir=%appdata%\Playdead\Inside"

rem Backup savegame files into Inside folder
echo Inside: Backing up savegame file
xcopy /i /y "%insidedir%\*.sav" Inside

rem Back up registry keys. Settings are stored here
echo Inside: Backing up registry keys
reg export HKCU\SOFTWARE\Playdead Inside\inside.reg /y

echo Inside: Done.
echo.

rem Jotun - Valhalla Edition

set "jvesavedir=%userprofile%\AppData\LocalLow\Thunder Lotus Games\Jotun"

rem Backup options and savegame file
echo Jotun - Valhalla Edition: Backing up options and savegame file
xcopy /i /y "%jvesavedir%\*.sav" "Jotun - Valhalla Edition"

echo Jotun - Valhalla Edition: Done.
echo.

rem Master Spy

set "masterspydir=%localappdata%\Master Spy\Local Storage"

rem Copy all files from the game’s local storage into ‘Master Spy’ directory
echo Master Spy: Backing up local storage
xcopy /i /y "%masterspydir%\*" "Master Spy"

echo Master Spy: Done.
echo.

rem Metal Gear Solid

set "mgsdir=%gamerootdir%\Metal Gear Solid"

rem Backup savegames
echo Metal Gear Solid: Backing up savegames
xcopy /e /i /y "%mgsdir%\SavedGames" "Metal Gear Solid\SavedGames"

rem Backup configuration files
echo Metal Gear Solid: Backing up MGS configuration files
xcopy /i /y "%mgsdir%\*.cfg" "Metal Gear Solid"

rem Backup DirectX configuration
echo Metal Gear Solid: Backing up DirectX configuration
copy "%mgsdir%\dxcfg.ini" "Metal Gear Solid"

rem Backup VR records
echo Metal Gear Solid: Backing up VR records
copy "%mgsdir%\records.vr" "Metal Gear Solid"

rem Backup photos
echo Metal Gear Solid: Backing up photos
xcopy /e /i /y "%mgsdir%\PHOTOS" "Metal Gear Solid\PHOTOS"

rem Backup registry keys
echo Metal Gear Solid: Backing up registry keys
reg export "HKCU\SOFTWARE\Metal Gear Solid" "Metal Gear Solid\mgs.reg" /y

echo Metal Gear Solid: Done.
echo.

rem Metro 2033 Redux

set "m2033reduxdir=%userprofile%\Documents\4A Games\Metro Redux\2033"
set "m2033reduxappdatadir=%localappdata%\4A Games\Metro Redux\2033"

rem Copy autosave file and player files
echo Metro 2033 Redux: Backing up autosave and player files
xcopy /i /y "%m2033reduxdir%\*" "Metro 2033 Redux\Savegames"

rem Copy user keybinds and settings
echo Metro 2033 Redux: Backing up keybinds and settings
copy "%m2033reduxappdatadir%\*.cfg" "Metro 2033 Redux"

echo Metro 2033 Redux: Done.
echo.

rem Mirror’s Edge

set "medir=%userprofile%\Documents\EA Games\Mirror's Edge\TdGame"

rem Copy savegame file from game’s savegame directory
echo Mirror's Edge: Backing up .dat file
xcopy /i /y "%medir%\Savefiles\*.dat" "Mirror's Edge"

rem Copy settings file and keybind file
echo Mirror's Edge: Backing up configuration and keybinds file
copy "%medir%\Config\*.ini" "Mirror's Edge"

echo Mirror's Edge: Done.
echo.

rem Mount & Blade Warband - Viking Conquest

set "mbwdir=%userprofile%\Documents\Mount&Blade Warband"
set "mbwvcsavedir=%userprofile%\Documents\Mount&Blade Warband Savegames\Viking Conquest"

rem Backup savegame files
echo Mount and Blade: Warband - Viking Conquest: Backing up savegame files
xcopy /i /y "%mbwvcsavedir%\*.sav" "Mount & Blade Warband - Viking Conquest"

rem Backup configuration files
echo Mount and Blade: Warband - Viking Conquest: Backing up config file
copy "%mbwdir%\*.txt" "Mount & Blade Warband - Viking Conquest"

echo echo Mount and Blade: Warband - Viking Conquest: Done.
echo.

rem Oddworld: Abe’s Oddysee

set "oaodir=%gamerootdir%\Abes Oddysee"

rem Backup savegames
echo Oddworld: Abe's Oddysee - Backing up savegames
xcopy /i /y "%oaodir%\*.sav" "Oddworld - Abe's Oddysee"

rem Backup configuration
echo Oddworld: Abe's Oddysee - Backing up configuration
copy "%oaodir%\abe.ini" "Oddworld - Abe's Oddysee"

echo Oddworld: Abe's Oddysee - Done.
echo.

rem Oddworld: Abe’s Exoddus

set "oaedir=%gamerootdir%\Abes Exoddus"

rem Backup savegames
echo Oddworld: Abe's Exoddus - Backing up savegames
xcopy /i /y "%oaedir%\*.sav" "Oddworld - Abe's Exoddus"

rem Backup configuration
echo Oddworld: Abe's Exoddus - Backing up configuration
copy "%oaedir%\abe2.ini" "Oddworld - Abe's Exoddus"

echo Oddworld: Abe's Exoddus - Done.
echo.

rem Oddworld - New 'n' Tasty

set "onntsavedir=%gamerootdir%\Oddworld - New 'n' Tasty\SaveGame"

rem Backup files from the game’s savegame folder
echo Oddworld - New 'n' Tasty: Backing up savegames and settings
xcopy /i /y "%onntsavedir%\*.NnT" "Oddworld - New 'n' Tasty"

echo Oddworld - New 'n' Tasty: Done.
echo.

rem Outlast

set "oldir=%userprofile%\Documents\My Games\Outlast\OLGame"

rem Backup Outlast profile
echo Outlast: Backing up profile and savegame files
xcopy /i /y "%oldir%\SaveData\*" Outlast\SaveData

rem Backup config folder
echo Outlast: Backing up config folder
xcopy /e /i /y "%oldir%\Config" Outlast\Config

echo Outlast: Done.
echo.

rem Painkiller

set "pkdir=%gamerootdir%\Painkiller Black"

rem Copy all savegame files and automatically create directories
echo Painkiller: Backing up savegame files and creating directories
xcopy /e /i /y "%pkdir%\SaveGames" Painkiller\SaveGames

rem Back up config file
echo Painkiller: Backing up config file
copy "%pkdir%\Bin\*.ini" Painkiller

rem Back up registry keys
echo Painkiller: Backing up registry keys
reg export HKEY_CURRENT_USER\SOFTWARE\PeopleCanFly Painkiller\painkiller-1.reg /y
reg export HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\PeopleCanFly Painkiller\painkiller-2.reg /y

echo Painkiller: Done.
echo.

rem Postal Plus

set "p1dir=%gamerootdir%\Postal2STP\PostalClassic&Uncut"

rem Back up savegames and highscores
echo Postal Plus: Backing up savegames and highscores
xcopy /e /i /y "%p1dir%\res\SaveGame" "Postal Plus\SaveGame"

rem Backup configuration
echo Postal Plus: Backing up configuration
copy "%p1dir%\*.ini" "Postal Plus"

echo Postal Plus: Done.
echo.

rem Postal 2

set "p2dir=%gamerootdir%\Postal2STP"

rem Backup savegames
echo Postal 2: Backing up savegames
xcopy /e /i /y "%p2dir%\Save" "Postal 2\Save"

rem Backup configuration, keybinds and savegame information
echo Postal 2: Backing up configuration, keybinds and savegame information
md "Postal 2\System"
copy "%p2dir%\System\Postal2.ini" "Postal 2\System"
copy "%p2dir%\System\SavedGameInfo.ini" "Postal 2\System"
copy "%p2dir%\System\User.ini" "Postal 2\System"

echo Postal 2: Done.
echo.

rem Quake II

set "q2rootdir=%gamerootdir%\Quake II"

rem Backup savegames
echo Quake II: Backing up savegames
xcopy /e /i /y "%q2rootdir%\baseq2\save" "Quake II\Base\save"

rem Backup keybinds and configuration file
echo Quake II: Backing up keybinds and configuration
copy "%q2rootdir%\baseq2\*.cfg" "Quake II\Base"

echo Quake II: Done.
echo.

rem Quake II mission pack: The Reckoning

rem Backup savegames
echo Quake II mission pack: The Reckoning - Backing up savegames
xcopy /e /i /y "%q2rootdir%\xatrix\save" "Quake II\The Reckoning\save"

rem Backup keybinds and configuration file
echo Quake II mission pack: The Reckoning - Backing up keybinds and configuration
copy "%q2rootdir%\xatrix\*.cfg" "Quake II\The Reckoning"

echo Quake II mission pack: The Reckoning - Done.
echo.

rem Quake II mission pack 2: Ground Zero

rem Backup savegames
echo Quake II mission pack 2: Ground Zero - Backing up savegames
xcopy /e /i /y "%q2rootdir%\rogue\save" "Quake II\Ground Zero\save"

rem Backup keybinds and configuration file
echo Quake II mission pack 2: Ground Zero - Backing up keybinds and configuration
copy "%q2rootdir%\rogue\*.cfg" "Quake II\Ground Zero"

echo Quake II mission pack 2: Ground Zero - Done.
echo.

rem Quake II - The Eraser Bot

rem Backup keybinds and configuration file
echo Quake II - The Eraser Bot: Backing up keybinds and configuration
xcopy /i /y "%q2rootdir%\Eraser\*.cfg" "Quake II\The Eraser Bot"

echo Quake II - The Eraser Bot:  Done.
echo.

rem Quake III

set "q3rootdir=%gamerootdir%\Quake III Arena"

rem Backup config files from baseq3 directory
echo Quake III: Backing up config files
xcopy /i /y "%q3rootdir%\baseq3\*.cfg" "Quake III"

echo Quake III: Done.
echo.

rem Remothered - Tormented Fathers

set "rtfsavedir=%localappdata%\Remothered\Saved\SaveGames"

rem Backup all savegame files
echo Remothered - Tormented Fathers: Backing up savegames and settings
xcopy /i /y %rtfsavedir%\*.sav "Remothered - Tormented Fathers"

echo Remothered - Tormented Fathers: Done.
echo.

rem Ritual of the Moon

rem Create folder structure
echo Ritual of the Moon: Creating folder structure
md "Ritual of the Moon"

rem Backup registry keys
echo Ritual of the Moon: Backing up progress and settings
reg export "HKCU\SOFTWARE\Kara Stone" "Ritual of the Moon\rotm.reg" /y

rem S.T.A.L.K.E.R. Clear Sky

set "stalkercsdir=%userprofile%\Documents\stalke~1"

rem Backup savegame files
echo S.T.A.L.K.E.R. Clear Sky: Backing up savegame textures and saves
xcopy /i /y %stalkercsdir%\savedgames\* "S.T.A.L.K.E.R. Clear Sky\savedgames"

rem Backup user keybinds and settings
echo S.T.A.L.K.E.R. Clear Sky: Backing up user.ltx file
copy %stalkercsdir%\user.ltx "S.T.A.L.K.E.R. Clear Sky"

echo S.T.A.L.K.E.R. Clear Sky: Done.
echo.

rem Saints Row 3

set "sr3dir=%localappdata%\Saints Row The Third"

rem Backup savegame files
echo Saints Row 3: Backing up savegame files
xcopy /i /y "%sr3dir%\savedir.sr3d_pc" "Saints Row 3"
copy "%sr3dir%\*.sr3s_pc" "Saints Row 3"
copy "%sr3dir%\sr3def_profile" "Saints Row 3"

echo Saints Row 3: Done.
echo.

rem Serious Sam: The First Encounter

set "sstfedir=%gamerootdir%\Serious Sam The First Encounter"

rem Copy control files
echo Serious Sam: The First Encounter - Backing up control files
xcopy /i /y "%sstfedir%\Controls\*.ctl" "Serious Sam - The First Encounter\Controls"

rem Copy .plr files from Players directory
echo Serious Sam: The First Encounter - Backing up .plr files
xcopy /i /y "%sstfedir%\Players\*.plr" "Serious Sam - The First Encounter\Players"

rem Copy savegame files
echo Serious Sam: The First Encounter - Backing up savegame files
xcopy /e /i /y "%sstfedir%\SaveGame" "Serious Sam - The First Encounter\SaveGame"

rem Copy persistent symbols file, which contains setting values
echo Serious Sam: The First Encounter - Backing up persistent symbols file
md "Serious Sam - The First Encounter\Scripts"
copy "%sstfedir%\Scripts\PersistentSymbols.ini" "Serious Sam - The First Encounter\Scripts"

echo Serious Sam: The First Encounter - Done.
echo.

rem Sludge Life

set "slrootdir=%gamerootdir%\SludgeLife"

rem Back up pictures
echo Sludge Life: Backing up pictures
xcopy /e /i /y %slrootdir%\PICS "Sludge Life\PICS"

rem Backup savegame file from the game’s root directory
echo Sludge Life: Backing up savegame file
copy %slrootdir%\save.txt "Sludge Life"

rem Backup registry keys. Settings are stored here
echo Sludge Life: Backing up registry keys
reg export HKCU\SOFTWARE\TerriVellmann "Sludge Life\sludgelife.reg" /y

echo Sludge Life: Done.
echo.

rem SOMA

set "somadir=%userprofile%\Documents\My Games\Soma"

rem Backup Soma\Main folder
echo SOMA: Backing up profile folder, first start flag and main settings
xcopy /e /i /y "%somadir%" "SOMA"

echo SOMA: Done.
echo.

rem SPY Fox - Dry Cereal

set "sfdrsavedir=C:\hegames"

rem Backup savegames
echo SPY Fox - Dry Cereal: Backing up savegames
xcopy /i /y %sfdrsavedir%\* "SPY Fox - Dry Cereal"

echo SPY Fox - Dry Cereal: Done.
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

rem Syberia

set "syberiasavedir=%userprofile%\Documents\Syberia Saves"

rem Backup config and savegame files
echo Syberia: Backing up configuration and savegames
xcopy /i /y "%syberiasavedir%\*" Syberia

echo Syberia: Done.
echo.

rem Syberia II

set "syb2savedir=%userprofile%\Documents\Syberia 2 Saves"

rem Backup config and savegame files
echo Syberia II: Backing up configuration and savegames
xcopy /i /y "%syb2savedir%\*" "Syberia 2"

echo Syberia II: Done.
echo.

rem The Cat Lady

set "tclsavedir=%userprofile%\Saved Games\The Cat Lady"

rem Copy settings and savegame files
echo The Cat Lady: Backing up settings and savegames
xcopy /i /y "%tclsavedir%\*" "The Cat Lady"

echo The Cat Lady: Done.
echo.

rem The Elder Scrolls III: Morrowind

set "tes3rootdir=%gamerootdir%\Morrowind"

rem Backup savegames
echo The Elder Scrolls III: Morrowind - Backing up savegames
xcopy /e /i /y %tes3rootdir%\Saves Morrowind\Saves

rem Backup configuration file
echo The Elder Scrolls III: Morrowind - Backing up configuration file
copy %tes3rootdir%\Morrowind.ini Morrowind

rem Backup journal
echo The Elder Scrolls III: Morrowind - Backing up journal
copy %tes3rootdir%\Journal.htm Morrowind

rem Backup registry keys
echo The Elder Scrolls III: Morrowind - Backing up registry keys
reg export "HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Bethesda Softworks" Morrowind\morrowind.reg /y

echo The Elder Scrolls III: Morrowind - Done.
echo.

rem The Infectious Madness of Doctor Dekker

set "timoddrootdir=%gamerootdir%\The Infectious Madness of Doctor Dekker"
set "timoddsavedir=%userprofile%\AppData\Roaming\timodd"

rem Copy savegame files from the game’s savegame folder
echo The Infectious Madness of Doctor Dekker: Backing up JSON savegame files
xcopy /i /y %timoddsavedir%\*.json "The Infectious Madness of Doctor Dekker"

rem Copy init.json file
echo The Infectious Madness of Doctor Dekker: Backing up settings
copy "%timoddrootdir%\resources\app\init.json" "The Infectious Madness of Doctor Dekker\settings"

echo The Infectious Madness of Doctor Dekker: Done.
echo.

rem The Longest Journey

set "tljrootdir=%gamerootdir%\The Longest Journey"

rem Backup savegame index, profile data, savegames, thumbnails
echo The Longest Journey: Backing up savegame index, profile data, savegames and thumbnails
xcopy /e /i /y "%tljrootdir%\Save" "The Longest Journey\Save"

rem Copy game settings
echo The Longest Journey: Backing up game settings
copy "%tljrootdir%\preferences.ini" "The Longest Journey"

echo The Longest Journey: Done.
echo.

rem The Suicide of Rachel Foster

set "tsorfsavedir=%localappdata%\Daedalic Entertainment GmbH\The Suicide of Rachel Foster\Saved"

rem Backup savegame files
echo The Suicide of Rachel Foster: Backing up savegame file and game options
xcopy /i /y "%tsorfsavedir%\SaveGames\*.sav" "The Suicide of Rachel Foster\SaveGames"

rem Backup user settings
echo The Suicide of Rachel Foster: Backing up user settings
copy "%tsorfsavedir%\Config\WindowsNoEditor\GameUserSettings.ini" "The Suicide of Rachel Foster"

echo The Suicide of Rachel Foster: Done.
echo.

rem The Witcher

set "tw1savedir=%userprofile%\Documents\The Witcher\saves"

rem Backup savegame files
echo The Witcher: Backing up savegame files
xcopy /i /y "%tw1savedir%\*.TheWitcherSave" "The Witcher"

rem Export registry keys into file
echo The Witcher: Backing up registry keys
reg export "HKCU\SOFTWARE\CD Projekt RED" "The Witcher\tw1-settings.reg" /y

echo The Witcher: Done.
echo.

rem Uplink

set "uluserdir=%gamerootdir%\Uplink\users"

rem Copy user files from Uplink’s users directory
echo Uplink: Backing up user files
xcopy /i /y %uluserdir%\*.usr Uplink

rem Copy options file from Uplink’s users directory
echo Uplink: Backing up options file
copy %uluserdir%\options Uplink

echo Uplink: Done.
echo.

rem Vampire’s Dawn 2

set "vd2rootdir=%gamerootdir%\Vampires_Dawn_2"

rem Copy savegame files
echo Vampire's Dawn 2: Backing up savegames
xcopy /i /y %vd2rootdir%\*.lsd "Vampires Dawn 2"

echo Vampire's Dawn 2: Done.
echo.

pause
