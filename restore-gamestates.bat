@echo off

rem This script restores gamestates, which include profiles, savegames, setting
rem files etc.

rem Write the path to your game directory here

set "gamerootdir="

echo Gamestate restore script running
echo.

rem A Hand With Many Fingers

set "ahwmfsavedir=%userprofile%\AppData\LocalLow\Colestia\A Hand With Many Fingers\saves"

rem Restore savegame file
echo A Hand With Many Fingers: Restoring savegame file
xcopy /e /i /y "A Hand With Many Fingers\saves\*.save" "%ahwmfsavedir%"

rem Import registry keys
echo A Hand With Many Fingers: Restoring settings
reg import "A Hand With Many Fingers\ahwmf.reg"

echo A Hand With Many Fingers: Done.
echo.

rem Alan Wake’s American Nightmare

set "remedydir=%userprofile%\Documents\Remedy"

rem Restore savegame file
echo Alan Wake's American Nightmare: Restoring savegame file
xcopy /e /i /y "Alan Wake's American Nightmare" %remedydir%

echo Alan Wake's American Nightmare: Done.
echo.

rem Amnesia: A Machine for Pigs

set "aamfpdir=%userprofile%\Documents\Amnesia\Pig"

rem Restore Amnesia\Pig folder
echo Amnesia: A Machine for Pigs - Restoring profile folder, first start flag and main settings
xcopy /e /i /y "Amnesia - A Machine for Pigs" "%aamfpdir%"

echo Amnesia: A Machine for Pigs - Done.
echo.

rem Amnesia - The Dark Descent

set "amnesiaprofiledir=%userprofile%\Documents\Amnesia\Main\New Player"

rem Restore Amnesia\Main folder
echo Amnesia - The Dark Descent: Restoring profile folder, first start flag and main settings
xcopy /e /i /y "Amnesia - The Dark Descent" "%amnesiaprofiledir%"

echo Amnesia - The Dark Descent: Done.
echo.

rem Becherov

set "becherovprofiledir=%gamerootdir%\Becherov\Data\Player"

rem Restore profile data
echo Becherov: Copying profile data
copy Becherov\profiles.dat %becherovprofiledir%

rem Import registry keys
echo Becherov: Restoring registry keys
reg import Becherov\becherov.reg

echo Becherov: Done.
echo.

rem Buddy Simulator 1984

set "bs1984datadir=%userprofile%\Documents\Buddy Simulator 1984"
set "bs1984rootdir=%gamerootdir%\Buddy Simulator 1984"

rem Copy data folder with subdirectories
echo Buddy Simulator 1984: Restoring data folder
xcopy /e /i /y "Buddy Simulator 1984\DATA" "%userprofile%\Documents\Buddy Simulator 1984"

rem Restore memories
echo Buddy Simulator 1984: Restoring memories
copy "Buddy Simulator 1984\Memories\*" "%bs1984rootdir%\Buddy Simulator 1984_Data\StreamingAssets\Memories"

rem Import registry keys
echo Buddy Simulator 1984: Importing registry keys
reg import "Buddy Simulator 1984\buddy-sim-1984.reg"

rem Cave Story

set "cavestorydir=%gamerootdir%\Cave_Story"

rem Copy .dat into the game’s root directory
echo Cave Story: Restoring configuration and profile data
copy "Cave Story\*.dat" %cavestorydir%

rem Restore window.rect
echo Cave Story: Restoring window.rect file
copy "Cave Story\*.rect" %cavestorydir%

echo Cave Story: Done.
echo.

rem Chaser

set "chasersavedir=%gamerootdir%\Chaser\Save"

rem Restore savegames
echo Chaser: Restoring savegames
copy Chaser\Save\*.sav %chasersavedir%

rem Restore keybinds and settings
echo Chaser: Restoring keybinds and settings
copy Chaser\Users\*.cfg %chasersavedir%\Users

echo Chaser: Done.
echo.

rem Darkest Dungeon

set "dddir=%userprofile%\Documents\Darkest"

rem Copy all relevant files to the newly created folder
echo Darkest Dungeon: Copying JSON files into profile folder
xcopy /e /i /y "Darkest Dungeon" %dddir%

echo Darkest Dungeon: Done.
echo.

rem else Heart.Break()

set "ehbsavedir=%gamerootdir%\ElseHeartbreak\ElseHeartbreak_Data\Saves"

rem Copy savegame files into savegame directory
echo else Heart.Break(): Restoring JSON savegame files
copy "Else Heartbreak\Saves\*.json" %ehbsavedir%

rem Import registry keys
echo else Heart.Break(): Restoring settings
reg import "Else Heartbreak\else-heartbreak.reg"

echo else Heart.Break(): Done.
echo.

rem Enigmatis - The Ghosts of Maple Creek

set "etgomcprofiledir=%appdata%\Artifex Mundi\Enigmatis_TheGhostOfMapleCreek\CE\profile"

rem Create profile folder structure
echo Enigmatis - The Ghosts of Maple Creek: Creating profile folder structure
md "%etgomcprofiledir%"

rem Copy achievement file into profile folder
echo Enigmatis - The Ghosts of Maple Creek: Copying achievement file
copy "Enigmatis - The Ghosts of Maple Creek\*.ach" "%etgomcprofiledir%"

rem Copy savegame file into profile folder
echo Enigmatis - The Ghosts of Maple Creek: Copying savegame
copy "Enigmatis - The Ghosts of Maple Creek\*.cub" "%etgomcprofiledir%"

rem Copy global and player profile
echo Enigmatis - The Ghosts of Maple Creek: Copying global and player profile
copy "Enigmatis - The Ghosts of Maple Creek\*.prf" "%etgomcprofiledir%"

echo Enigmatis - The Ghosts of Maple Creek: Done.
echo.

rem GTA III

set "gta3dir=%userprofile%\Documents\GTA3 User Files"

rem Restore settings file and savegames
xcopy /e /i /y "GTA III" "%gta3dir%"

echo GTA III: Done.
echo.

rem Grand Theft Auto: Vice City

set "gtavcdir=%userprofile%\Documents\GTA Vice City User Files"

rem Restore settings file and savegames
xcopy /e /i /y "GTA Vice City" "%gtavcdir%"

echo Grand Theft Auto: Vice City - Done.
echo.

rem Grand Theft Auto: San Andreas

set "gtasadir=%userprofile%\Documents\GTA San Andreas User Files"

rem Restore settings files, savegames, gallery and user tracks
xcopy /e /i /y "GTA - San Andreas" "%gtasadir%"

echo Grand Theft Auto: San Andreas - Done.
echo.

rem Hacknet

set "hacknetdir=%userprofile%\Documents\My Games\Hacknet\Accounts"
set "hnrootdir=%gamerootdir%\Hacknet"

rem Restore Accounts folder
echo Hacknet: Restoring Accounts folder
xcopy /e /i /y Hacknet\Accounts "%hacknetdir%"

rem Restore settings
echo Hacknet: Restoring settings file
copy Hacknet\Settings.txt %hnrootdir%

echo Hacknet: Done.
echo.

rem Hellblade - Senua’s Sacrifice

set "hbsavedir=%userprofile%\AppData\Local\HellbladeGame\Saved"

rem Copy savegame file into the game’s savegame folder
echo Hellblade - Senua's Sacrifice: Restoring savegame
xcopy /i /y "Hellblade - Senua's Sacrifice\SaveGames\*.sav" %hbsavedir%\SaveGames

rem Restore user settings file
echo Hellblade - Senua's Sacrifice: Restoring user settings
xcopy /i /y "Hellblade - Senua's Sacrifice\*.ini" %hbsavedir%\Config\WindowsNoEditor

echo Hellblade - Senua's Sacrifice: Done.
echo.

rem Hotline Miami Original

set "hmrootdir=%gamerootdir%\Hotline Miami"

rem Copy savegames files into Hotline Miami root directory
echo Hotline Miami Original: Restoring gamestate
copy "Hotline Miami Original\achievements.dat" "%hmrootdir%"
copy "Hotline Miami Original\mask.nfo" "%hmrootdir%"
copy "Hotline Miami Original\pause.bmp" "%hmrootdir%"
copy "Hotline Miami Original\saves.dat" "%hmrootdir%"
copy "Hotline Miami Original\stats.sav" "%hmrootdir%"
copy "Hotline Miami Original\tempsave.sav" "%hmrootdir%"

echo Hotline Miami Original: Done.
echo.

rem Inkslinger

rem Import registry keys
echo Inkslinger: Importing registry keys
reg import "Inkslinger\inkslinger.reg"

echo Inkslinger: Done.
echo.

rem Inside

set "insidedir=%appdata%\Playdead\Inside"

rem Copy savegame file into the game’s savegame folder
echo Inside: Restoring savegame
xcopy /i /y Inside\*.sav %insidedir%

rem Restore registry keys
echo Inside: Restoring settings
reg import Inside\inside.reg

echo Inside: Done.
echo.

rem Jotun - Valhalla Edition

set "jvesavedir=%userprofile%\AppData\LocalLow\Thunder Lotus Games\Jotun"

rem Copy savegame file into the game’s savegame folder
echo Jotun - Valhalla Edition: Restoring savegame and options
xcopy /i /y "Jotun - Valhalla Edition\*.sav" "%jvesavedir%"

echo Jotun - Valhalla Edition: Done.
echo.

rem Master Spy

set "masterspydir=%localappdata%\Master Spy\Local Storage"

rem Copy local storage files into the game’s local storage
echo Master Spy: Restoring local storage state
xcopy /i /y "Master Spy\*.localstorage" "%masterspydir%"
copy "Master Spy\*.localstorage-journal" "%masterspydir%"

echo Master Spy: Done.
echo.

rem Metro 2033 Redux

set "m2033reduxdir=%userprofile%\Documents\4A Games\Metro Redux\2033"
set "m2033reduxappdatadir=%localappdata%\4A Games\Metro Redux\2033"

rem Copy autosave file into the savegame directory
echo Metro 2033 Redux: Restoring autosaves and player files
xcopy /i /y "Metro 2033 Redux\Savegames\*" "%m2033reduxdir%"

rem Copy player files into the savegame directory
echo Metro 2033 Redux: Restoring keybinds and settings
xcopy /i /y "Metro 2033 Redux\*.cfg" "%m2033reduxappdatadir%"

echo Metro 2033 Redux: Done.
echo.

rem Mirror’s Edge

set "medir=%userprofile%\Documents\EA Games\Mirror's Edge\TdGame"

rem Copy savegame file into the game’s savegame folder
echo Mirror's Edge: Restoring savegame file
xcopy /i /y "Mirror's Edge\*.dat" "%medir%\Savefiles"

rem Copy configuration file into the game’s config folder
echo Mirror's Edge: Restoring configuration file
xcopy /i /y "Mirror's Edge\*.ini" "%medir%\Config"

echo Mirror's Edge: Done.
echo.

rem Mount & Blade Warband - Viking Conquest

set "mbwdir=%userprofile%\Documents\Mount&Blade Warband"
set "mbwvcsavedir=%userprofile%\Documents\Mount&Blade Warband Savegames\Viking Conquest"

rem Copy savegame files
echo Mount and Blade Warband: Viking Conquest - Restoring savegames
xcopy /i /y "Mount & Blade Warband - Viking Conquest\*.sav" "%mbwvcsavedir%"

rem Restore config file
echo Mount and Blade Warband: Viking Conquest - Restoring configuration file
xcopy /i /y "Mount & Blade Warband - Viking Conquest\*.txt" "%mbwdir%\"

echo Mount and Blade Warband: Viking Conquest - Done.
echo.

rem Oddworld - New 'n' Tasty

set "onntsavedir=%gamerootdir%\Oddworld - New 'n' Tasty\SaveGame"

rem Copy save slot files into the game’s savegame directory
echo Oddworld - New 'n' Tasty: Restoring save slot files
xcopy /i /y "Oddworld - New 'n' Tasty\*.NnT" "%onntsavedir%"

echo Oddworld - New 'n' Tasty: Done.
echo.

rem Outlast
set "oldir=%userprofile%\Documents\My Games\Outlast\OLGame"

rem Restore profile and savegame files
echo Outlast: Restoring profile and savegame files
xcopy /i /y Outlast\SaveData\* "%oldir%\SaveData"

rem Restore config folder
echo Outlast: Restoring config folder
xcopy /e /i /y Outlast\Config "%oldir%\Config"

echo Outlast: Done.
echo.

rem Painkiller

set "pkdir=%gamerootdir%\Painkiller Black"

rem Restore savegames and folder structure
echo Painkiller: Restoring savegames
xcopy /e /i /y Painkiller\SaveGames "%pkdir%\SaveGames"

rem Restore config file
echo Painkiller: Restoring config file
copy Painkiller\*.ini "%pkdir%\Bin"

echo Painkiller: Done.
echo.

rem Quake III

set "q3rootdir=%gamerootdir%\Quake III Arena"

rem Copy configuration files into baseq3 directory
echo Quake III: Restoring configuration files
copy "Quake III\*.cfg" "%q3rootdir%\baseq3\"

echo Quake III: Done.
echo.

rem Remothered - Tormented Fathers

set "rtfsavedir=%localappdata%\Remothered\Saved\SaveGames"

rem Copy savegame files into savegame folder
echo Remothered - Tormented Fathers: Restoring savegame files
xcopy /i /y "Remothered - Tormented Fathers\*.sav" %rtfsavedir%

echo Remothered - Tormented Fathers: Done.
echo.

rem Ritual of the Moon

rem Restore registry keys
echo Ritual of the Moon: Restoring progress and settings
reg import "Ritual of the Moon\rotm.reg"

rem S.T.A.L.K.E.R. - Clear Sky

set "stalkercsdir=%userprofile%\Documents\stalke~1"

rem Restore savegames and savegame textures
echo S.T.A.L.K.E.R. - Clear Sky: Restoring savegames and savegame textures
xcopy /i /y "S.T.A.L.K.E.R. Clear Sky\savedgames\*" %stalkercsdir%\savedgames

rem Restore keybinds and settings
echo S.T.A.L.K.E.R. - Clear Sky: Restoring keybinds and settings
copy "S.T.A.L.K.E.R. Clear Sky\user.ltx" %stalkercsdir%

echo S.T.A.L.K.E.R. - Clear Sky: Done.
echo.

rem Saints Row: The Third

set "sr3dir=%localappdata%\Saints Row The Third"

rem Create savegame folder structure
echo Saints Row 3: Creating savegame folder structure
md "%sr3savedir%"

rem Copy save directory information into savegame folder
echo Saints Row 3: Restoring save directory information
copy "Saints Row 3\savedir.sr3d_pc" "%sr3savedir%"

rem Copy profile data into newly created folder
echo Saints Row 3: Restoring profile data
copy "Saints Row 3\sr3def_profile" "%sr3savedir%"

rem Copy savegame files into newly created folder
echo Saints Row 3: Restoring savegames
copy "Saints Row 3\*.sr3s_pc" "%sr3savedir%"

echo Saints Row 3: Done.
echo.

rem Serious Sam: The First Encounter

set "sstfedir=%gamerootdir%\Serious Sam The First Encounter"

rem Restore control files
echo Serious Sam: The First Encounter - Restoring control files
xcopy /i /y "Serious Sam - The First Encounter\Controls\*.ctl" "%sstfedir%\Controls"

rem Restore .plr files Players directory
echo Serious Sam: The First Encounter - Restoring .plr files
xcopy /i /y "Serious Sam - The First Encounter\Players\*.plr" "%sstfedir%\Players"

rem Restore savegame files
echo Serious Sam: The First Encounter - Restoring savegame files
xcopy /e /i /y "Serious Sam - The First Encounter\SaveGame" "%sstfedir%\SaveGame"

rem Restore persistent symbols files, which contains setting values
echo Serious Sam: The First Encounter - Restoring persistent symbols file
copy "Serious Sam - The First Encounter\Scripts\PersistentSymbols.ini" "%sstfedir%\Scripts"

echo Serious Sam: The First Encounter: Done.
echo.

rem Sludge Life

set "slrootdir=%gamerootdir%\SludgeLife"

rem Restore pictures
echo Sludge Life: Restoring pictures
xcopy /e /i /y "Sludge Life\PICS" %slrootdir%\PICS

rem Copy savegame file into the game’s root directory
echo Sludge Life: Restoring savegame file
copy "Sludge Life\save.txt" %slrootdir%

rem Restore registry keys. Settings are stored here
echo Sludge Life: Restoring registry keys
reg import "Sludge Life\sludgelife.reg"

echo Sludge Life: Done.
echo.

rem SOMA

set "somadir=%userprofile%\Documents\My Games\Soma"

rem Restore Soma\Main folder
echo SOMA: Restoring profile folder, first start flag and main settings
xcopy /e /i /y "SOMA" "%somadir%"

echo SOMA: Done.
echo.

rem SWAT 4

set "swat4sysdir=%gamerootdir%\SWAT 4\Content\System"

rem Copy all .ini files into the game’s system directory
echo SWAT 4: Restoring .ini files
copy "SWAT 4\*" "%swat4sysdir%"

echo SWAT 4: Done.
echo.

rem Syberia

set "syberiasavedir=%userprofile%\Documents\Syberia Saves"

rem Restore config and savegame files
echo Syberia: Restoring configuration file and savegames
xcopy /i /y Syberia\* "%syberiasavedir%"

echo Syberia: Done.
echo.

rem Syberia II

set "syb2savedir=%userprofile%\Documents\Syberia 2 Saves"

rem Restore config and savegame files
echo Syberia II: Restoring configuration and savegames
xcopy /i /y "Syberia 2\*" "%syb2savedir%"

echo Syberia II: Done.
echo.

rem The Cat Lady

set "tclsavedir=%userprofile%\Saved Games\The Cat Lady"

rem Restore settings and savegame files
echo The Cat Lady: Restoring settings and savegames
xcopy /i /y  "The Cat Lady\*" "%tclsavedir%"

echo The Cat Lady: Done.
echo.

rem The Infectious Madness of Doctor Dekker

set "timoddrootdir=%gamerootdir%\The Infectious Madness of Doctor Dekker"
set "timoddsavedir=%userprofile%\AppData\Roaming\timodd"

rem Copy savegame files into the game’s savegame folder
echo The Infectious Madness of Doctor Dekker: Restoring JSON savegame files
xcopy /i /y "The Infectious Madness of Doctor Dekker\*.json" %timoddsavedir%

rem Restore init.json file
echo The Infectious Madness of Doctor Dekker: Restoring settings
copy "The Infectious Madness of Doctor Dekker\settings\init.json" "%timoddrootdir%\resources\app"

echo The Infectious Madness of Doctor Dekker: Done.
echo.

rem The Longest Journey

set "tljrootdir=%gamerootdir%\The Longest Journey"

rem Restore savegame index, profile data, savegames, thumbnails
echo The Longest Journey: Restoring savegame index, profile data, savegames and thumbnails
xcopy /e /i /y "The Longest Journey\Save" "%tljrootdir%\Save"

rem Restore game settings
echo The Longest Journey: Restoring game settings
copy "The Longest Journey\preferences.ini" "%tljrootdir%"

echo The Longest Journey: Done.
echo.

rem The Suicide of Rachel Foster

set "tsorfsavedir=%localappdata%\Daedalic Entertainment GmbH\The Suicide of Rachel Foster\Saved"

rem Restore savegame files
echo The Suicide of Rachel Foster: Restoring savegame file and game options
xcopy /i /y "The Suicide of Rachel Foster\SaveGames\*.sav" "%tsorfsavedir%\SaveGames"

rem Restore user settings
echo The Suicide of Rachel Foster: Restoring user settings
xcopy /i /y "The Suicide of Rachel Foster\*.ini" "%tsorfsavedir%\Config\WindowsNoEditor"

echo The Suicide of Rachel Foster: Done.
echo.

rem The Witcher

set "tw1savedir=%userprofile%\Documents\The Witcher\saves"

rem Restore savegame files
echo The Witcher: Restoring savegame files
xcopy /i /y "The Witcher\*.TheWitcherSave" "%tw1savedir%"

rem Restore settings via registry keys
echo The Witcher: Restoring settings via registry keys
reg import "The Witcher\tw1-settings.reg"

echo The Witcher: Done.
echo.

rem Uplink

set "uluserdir=%gamerootdir%\Uplink\users"

rem Copy user files into Uplink’s users folder
echo Uplink: Restoring user files
xcopy /i /y Uplink\*.usr %uluserdir%

rem Copy options file into Uplink’s users folder
echo Uplink: Restoring options file
copy Uplink\options %uluserdir%

echo Uplink: Done.
echo.

rem Vampire’s Dawn 2

set "vd2rootdir=%gamerootdir%\Vampires_Dawn_2"

rem Restore savegame files
echo Vampire's Dawn 2: Restoring savegames
copy "Vampires Dawn 2\*.lsd" %vd2rootdir%

echo Vampire's Dawn 2: Done.
echo.

pause
