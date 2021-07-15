@echo off

rem This script restores gamestates, which include profiles, savegames, setting
rem files etc.

rem Write the path to your game directory here

set "gamerootdir="

echo Gamestate restore script running
echo.

rem A Hand With Many Fingers

set "ahwmfsavedir=%userprofile%\AppData\LocalLow\Colestia\A Hand With Many Fingers\saves"

rem Create folder structure
echo A Hand With Many Fingers: Creating folder structure
md "%ahwmfsavedir%"

rem Restore savegame file
echo A Hand With Many Fingers: Restoring savegame file
copy "A Hand With Many Fingers\saves\autosave.save" "%ahwmfsavedir%"

echo A Hand With Many Fingers: Done.
echo.

rem Alan Wake - American Nightmare

set "remedydir=%userprofile%\Documents\Remedy"

rem Create folder structure
echo Alan Wake - American Nightmare: Creating folder structure
md %remedydir%\AmericanNightmare_GOG_Version\savegames\savegame_awns

rem Restore savegame file
echo Alan Wake - American Nightmare: Restoring savegame file
copy "Alan Wake - American Nightmare\savegames\savegame_awns\savegame.aws" %remedydir%\AmericanNightmare_GOG_Version\savegames\savegame_awns

rem Restore config file
echo Alan Wake - American Nightmare: Restoring config file
copy "Alan Wake - American Nightmare\config" %remedydir%\AmericanNightmare_GOG_Version

echo Alan Wake - American Nightmare: Done.
echo.

rem Amnesia - A Machine for Pigs

set "aamfpdir=%userprofile%\Documents\Amnesia\Pig"

rem Create profile folder structure
echo Amnesia - A Machine for Pigs: Creating profile folder structure
md "%aamfpdir%\New Player"

rem Copy main settings file
echo Amnesia - A Machine for Pigs: Restoring main settings file
copy "Amnesia - A Machine for Pigs\main_settings.cfg" "%aamfpdir%"

rem Copy savegame files, key bindings and user settings
echo Amnesia - A Machine for Pigs: Restoring savegames, binds, user settings
copy "Amnesia - A Machine for Pigs\New Player\*" "%aamfpdir%\New Player"

echo Amnesia - A Machine for Pigs: Done.
echo.

rem Amnesia - The Dark Descent

set "amnesiaprofiledir=%userprofile%\Documents\Amnesia\Main\New Player"

rem Create profile folder and folder structure
echo Amnesia - The Dark Descent: Creating profile folder structure
md "%amnesiaprofiledir%"

rem Copy Amnesia .sav files into profile folder
echo Amnesia - The Dark Descent: Copying savegame files into profile folder
copy "Amnesia - The Dark Descent\*.sav" "%amnesiaprofiledir%"

echo Amnesia - The Dark Descent: Done.
echo.

rem Becherov

set "becherovprofiledir=%gamerootdir%\Becherov\Data\Player"

echo Becherov: Copying profile data
copy Becherov\profiles.dat %becherovprofiledir%

echo Becherov: Done.
echo.

rem Buddy Simulator 1984

set "bs1984datadir=%userprofile%\Documents\Buddy Simulator 1984"
set "bs1984rootdir=%gamerootdir%\Buddy Simulator 1984"

rem Create data folder structure
echo Buddy Simulator 1984: Creating data folder structure
md "%bs1984datadir%"

rem Copy data folder with subdirectories
echo Buddy Simulator 1984: Restoring data folder
xcopy /e /y "Buddy Simulator 1984\Buddy Simulator 1984" "%userprofile%\Documents\Buddy Simulator 1984"

rem Restore memories
echo Buddy Simulator 1984: Restoring memories
copy "Buddy Simulator 1984\Memories\*" "%bs1984rootdir%\Buddy Simulator 1984_Data\StreamingAssets\Memories"

rem Import registry keys
echo Buddy Simulator 1984: Importing registry keys
reg import "Buddy Simulator 1984\buddy-sim-1984.reg"

rem Cave Story

set "cavestorydir=%gamerootdir%\Cave_Story"

rem Copy profile data into the game’s root directory
echo Cave Story: Copying profile data into game root directory
copy "Cave Story\Profile.dat" %cavestorydir%

echo Cave Story: Done.
echo.

rem Chaser

set "chasersavedir=%gamerootdir%\Chaser\Save"

rem Restore savegames
echo Chaser: Copying savegame files into savegame folder
copy Chaser\*.sav %chasersavedir%

echo Chaser: Done.
echo.

rem Darkest Dungeon

set "ddprofiledir=%userprofile%\Documents\Darkest\profile_0"

rem Create profile/savegame folder
echo Darkest Dungeon: Creating profile folder
md %ddprofiledir%

rem Copy all relevant files to the newly created folder
echo Darkest Dungeon: Copying JSON files into profile folder
copy "Darkest Dungeon\*.json" %ddprofiledir%

echo Darkest Dungeon: Done.
echo.

rem else Heart.Break()

set "ehbsavedir=%gamerootdir%\ElseHeartbreak\ElseHeartbreak_Data\Saves"

rem Copy savegame files into savegame directory
echo else Heart.Break(): Copying JSON savegame files
copy "Else Heartbreak\*.json" %ehbsavedir%

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

rem Create GTA III folder structure
echo GTA III: Creating folder structure
md "%gta3dir%"

rem Restore settings file and savegames
copy "GTA III\*" "%gta3dir%"

echo GTA III: Done.
echo.

rem Grand Theft Auto: Vice City

set "gtavcdir=%userprofile%\Documents\GTA Vice City User Files"

rem Create GTA: Vice City folder structure
echo Grand Theft Auto: Vice City - Creating folder structure
md "%gtavcdir%"

rem Restore settings file and savegames
copy "GTA Vice City\*" "%gtavcdir%"

echo GTA Vice City: Done.
echo.

rem Grand Theft Auto: San Andreas

set "gtasadir=%userprofile%\Documents\GTA San Andreas User Files"

rem Create GTA: San Andreas folder structure
echo Grand Theft Auto: San Andreas - Creating folder structure
md "%gtasadir%"

rem Restore settings files, savegames, gallery and user tracks
xcopy /e /y "GTA - San Andreas" "%gtasadir%"

echo Grand Theft Auto: San Andreas - Done.
echo.

rem Hacknet

set "hacknetdir=%userprofile%\Documents\My Games\Hacknet\Accounts"

rem Create Hacknet and accounts directory
echo Hacknet: Creating Hacknet account folder structure
md "%hacknetdir%"

rem Copy Accounts.txt and XML file into accounts folder
echo Hacknet: Copying Accounts.txt and XML savegame
copy Hacknet\*.txt "%hacknetdir%"
copy Hacknet\*.xml "%hacknetdir%"

echo Hacknet: Done.
echo.

rem Hellblade - Senua’s Sacrifice

set "hbsavedir=%userprofile%\AppData\Local\HellbladeGame\Saved\SaveGames"

rem Create savegame folder and relevant folder structure
echo Hellblade - Senua's Sacrifice: Creating savegame folder structure
md %hbsavedir%

rem Copy savegame files into the game’s savegame folder
echo Hellblade - Senua's Sacrifice: Restoring savegame
copy "Hellblade - Senua's Sacrifice\*.sav" %hbsavedir%

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

rem Inside

set "insidedir=%userprofile%\AppData\Roaming\Playdead\Inside"

rem Create savegame folder structure
echo Inside: Creating savegame folder structure
md %insidedir%

rem Copy savegame file into the game’s savegame folder
echo Inside: Restoring savegame
copy Inside\*.sav %insidedir%

echo Inside: Done.
echo.

rem Jotun - Valhalla Edition

set "jvesavedir=%userprofile%\AppData\LocalLow\Thunder Lotus Games\Jotun"

rem Create Jotun folder structure
echo Jotun - Valhalla Edition: Creating folder structure
md "%jvesavedir%"

rem Copy savegame file into the game’s savegame folder
echo Jotun - Valhalla Edition: Restoring savegame
copy "Jotun - Valhalla Edition\JotunGames.sav" "%jvesavedir%"

rem Copy options file into the game’s savegame folder
echo Jotun - Valhalla Edition: Restoring options
copy "Jotun - Valhalla Edition\JotunOptions.sav" "%jvesavedir%"

echo Jotun - Valhalla Edition: Done.
echo.

rem Master Spy

set "masterspydir=%localappdata%\Master Spy\Local Storage"

rem Create local storage folder structure
echo Master Spy: Creating local storage folder structure
md "%masterspydir%"

rem Copy local storage files into the game’s local storage
echo Master Spy: Restoring local storage state
copy "Master Spy\*.localstorage" "%masterspydir%"
copy "Master Spy\*.localstorage-journal" "%masterspydir%"

echo Master Spy: Done.
echo.

rem Metro 2033 Redux

set "m2033reduxdir=%userprofile%\Documents\4A Games\Metro Redux\2033"

rem Create savegame directory structure
echo Metro 2033 Redux: Creating savegame directory structure
md "%m2033reduxdir%"

rem Copy autosave file into the savegame directory
echo Metro 2033 Redux: Restoring autosaves
copy "Metro 2033 Redux\2033_auto_save" "%m2033reduxdir%"

rem Copy player files into the savegame directory
echo Metro 2033 Redux: Restoring player files
copy "Metro 2033 Redux\*.player" "%m2033reduxdir%"

echo Metro 2033 Redux: Done.
echo.

rem Mirror’s Edge

set "mecfgdir=%userprofile%\Documents\EA Games\Mirror's Edge\TdGame\Config"
set "mesavedir=%userprofile%\Documents\EA Games\Mirror's Edge\TdGame\Savefiles"

rem Create config folder structure
echo Mirror's Edge: Creating config folder structure
md "%mecfgdir%"

rem Create savegame folder structure
echo Mirror's Edge: Creating savegame folder structure
md "%mesavedir%"

rem Copy configuration file into the game’s config folder
echo Mirror's Edge: Restoring configuration file
copy "Mirror's Edge\TdEngine.ini" "%mecfgdir%"

rem Copy keybinds file into the game’s config folder
echo Mirror's Edge: Restoring keybinds file
copy "Mirror's Edge\TdInput.ini" "%mecfgdir%"

rem Copy savegame file into the game’s savegame folder
echo Mirror's Edge: Restoring savegame file
copy "Mirror's Edge\*.dat" "%mesavedir%"

echo Mirror's Edge: Done.
echo.

rem Mount & Blade Warband - Viking Conquest

set "mbwvcsavedir=%userprofile%\Documents\Mount&Blade Warband Savegames\Viking Conquest"

rem Create savegame folder structure
echo Mount and Blade Warband - Viking Conquest: Creating savegame folder structure
md "%mbwvcsavedir%"

rem Copy savegame files
echo Mount and Blade Warband - Viking Conquest: Restoring savegames
copy "Mount & Blade Warband - Viking Conquest\*.sav" "%mbwvcsavedir%"

echo Mount and Blade Warband - Viking Conquest: Done.
echo.

rem Oddworld - New 'n' Tasty

set "onntsavedir=%gamerootdir%\Oddworld - New 'n' Tasty\SaveGame"

rem Copy save slot files into the game’s savegame directory
echo Oddworld - New 'n' Tasty: Restoring save slot files
copy "Oddworld - New 'n' Tasty\*.NnT" "%onntsavedir%"

echo Oddworld - New 'n' Tasty: Done.
echo.

rem Outlast
set "olsavedir=%userprofile%\Documents\My Games\Outlast\OLGame\SaveData"

rem Create savegame directory structure
echo Outlast: Creating savegame directory structure
md "%olsavedir%"

rem Copy Outlast profile into savegame folder
echo Outlast: Restoring Outlast profile
copy Outlast\*.olprofile "%olsavedir%"

rem Copy savegame files into savegame folder
echo Outlast: Restoring savegame files
copy Outlast\*.sav "%olsavedir%"

echo Outlast: Done.
echo.

rem Painkiller

set "pksavedir=%gamerootdir%\Painkiller Black\SaveGames"

rem Create savegame folder
md "%pksavedir%"

rem Copy all .dat files to savegame folder and automatically create directories
echo Painkiller: Restoring savegames in .dat format
xcopy /e /y Painkiller\*.dat "%pksavedir%"

rem Copy all .Info files to savegame folder and automatically create directories
echo Painkiller: Restoring savegame info
xcopy /e /y Painkiller\*.Info "%pksavedir%"

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

rem Create savegame directory structure
echo Remothered - Tormented Fathers: Creating savegame directory structure
md %rtfsavedir%

rem Copy savegame files into savegame folder
echo Remothered - Tormented Fathers: Restoring savegame files
copy "Remothered - Tormented Fathers\*.sav" %rtfsavedir%

echo Remothered - Tormented Fathers: Done.
echo.

rem S.T.A.L.K.E.R. - Clear Sky

set "stalkercssavedir=%userprofile%\Documents\stalke~1\savedgames"

rem Create savegame folder structure
echo S.T.A.L.K.E.R. - Clear Sky: Creating savegame folder structure
md %stalkercssavedir%

rem Copy savegame files into newly created directory
echo S.T.A.L.K.E.R. - Clear Sky: Restoring savegame files
copy "S.T.A.L.K.E.R. Clear Sky\*.dds" %stalkercssavedir%
copy "S.T.A.L.K.E.R. Clear Sky\*.sav" %stalkercssavedir%

echo S.T.A.L.K.E.R. - Clear Sky: Done.
echo.

rem Saints Row: The Third

set "sr3savedir=%userprofile%\AppData\Local\Saints Row The Third"

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

set "sstfeplrdir=%gamerootdir%\Serious Sam The First Encounter\Players"
set "sstferootdir=%gamerootdir%\Serious Sam The First Encounter"
set "sstfesavedir=%gamerootdir%\Serious Sam The First Encounter\SaveGame"

rem Copy persistent symbols file to keep settings etc.
echo Serious Sam: The First Encounter: Restoring persistent symbols file
copy "Serious Sam - The First Encounter\Scripts\PersistentSymbols.ini" "%sstferootdir%\Scripts"

rem Copy Control file for player slot 0, format .ctl
echo Serious Sam: The First Encounter: Restoring .ctl file
copy "Serious Sam - The First Encounter\Controls\Controls0.ctl" "%sstferootdir%\Controls"

rem Copy .plr file
echo Serious Sam: The First Encounter: Restoring .plr file
copy "Serious Sam - The First Encounter\Players\Player0.plr" "%sstfeplrdir%"

rem Copy description files into player profile root directory
echo Serious Sam: The First Encounter: Restoring description files
copy "Serious Sam - The First Encounter\SaveGame\Player0\*.des" "%sstfesavedir%\Player0"

rem Copy savegame files into player profile root directory
echo Serious Sam: The First Encounter: Restoring savegame files
copy "Serious Sam - The First Encounter\SaveGame\Player0\*.sav" "%sstfesavedir%\Player0"

rem Copy texture files into player profile root directory
echo Serious Sam: The First Encounter: Restoring texture files
copy "Serious Sam - The First Encounter\SaveGame\Player0\*.tex" "%sstfesavedir%\Player0"

rem Create quicksave folder
md "%sstfesavedir%\Player0\Quick"

rem Copy description files, savegame files and texture files into player profile
rem quicksave directory
echo Serious Sam: The First Encounter: Restoring quicksave files
copy "Serious Sam - The First Encounter\SaveGame\Player0\Quick\*" "%sstfesavedir%\Player0\Quick"

echo Serious Sam: The First Encounter: Done.
echo.

rem Sludge Life

set "slrootdir=%gamerootdir%\SludgeLife"

rem Copy savegame file into the game’s root directory
echo Sludge Life: Restoring savegame file
copy "Sludge Life\save.txt" %slrootdir%

echo Sludge Life: Done.
echo.

rem SWAT 4

set "swat4sysdir=%gamerootdir%\SWAT 4\Content\System"

rem Copy all .ini files into the game’s system directory
echo SWAT 4: Restoring .ini files
copy "SWAT 4\*" "%swat4sysdir%"

echo SWAT 4: Done.
echo.

rem Syberia I

set "syberiasavedir=%userprofile%\Documents\Syberia Saves"

rem Create savegame folder
echo Syberia I: Creating savegame folder
md "%syberiasavedir%"

rem Copy savegame files into the game’s savegame directory
echo Syberia I: Restoring savegames
copy Syberia\*.sav "%syberiasavedir%"

echo Syberia I: Done.
echo.

rem Syberia II

set "syb2savedir=%userprofile%\Documents\Syberia 2 Saves"

rem Create savegame folder
echo Syberia II: Creating savegame folder
md "%syb2savedir%"

rem Copy savegame files into the game’s savegame directory
echo Syberia II: Restoring savegames
copy "Syberia 2\*.sav" "%syb2savedir%"

echo Syberia II: Done.
echo.

rem The Cat Lady

set "tclsavedir=%userprofile%\Saved Games\The Cat Lady"

rem Create savegame folder
echo The Cat Lady: Creating savegame folder structure
md "%tclsavedir%"

rem Copy savegame files into the game’s savegame folder
echo The Cat Lady: Restoring savegames
copy "The Cat Lady\agssave.*" "%tclsavedir%"

echo The Cat Lady: Done.
echo.

rem The Infectious Madness of Doctor Dekker

set "timoddsavedir=%userprofile%\AppData\Roaming\timodd"

rem Create savegame folder
echo The Infectious Madness of Doctor Dekker: Creating savegame folder
md %timoddsavedir%

rem Copy savegame files into the game’s savegame folder
echo The Infectious Madness of Doctor Dekker: Restoring JSON save file
copy "The Infectious Madness of Doctor Dekker\*.json" %timoddsavedir%

echo The Infectious Madness of Doctor Dekker: Done.
echo.

rem The Longest Journey

set "tljsavedir=%gamerootdir%\The Longest Journey\Save"

rem Create savegame profile folder structure
echo The Longest Journey: Creating savegame folder structure
md "%tljsavedir%\01"

rem Copy profile data
echo The Longest Journey: Restoring profile data
copy "The Longest Journey\01.txt" "%tljsavedir%"

rem Copy savegame files into the game’s savegame folder
echo The Longest Journey: Restoring savegame files
copy "The Longest Journey\01\*" "%tljsavedir%\01"

echo The Longest Journey: Done.
echo.

rem The Suicide of Rachel Foster

set "tsorfsavedir=%localappdata%\Daedalic Entertainment GmbH\The Suicide of Rachel Foster\Saved\SaveGames"

rem Create savegame folder structure
echo The Suicide of Rachel Foster: Creating savegame folder structure
md "%tsorfsavedir%"

rem Copy savegame file into the game’s savegame folder
echo The Suicide of Rachel Foster: Restoring savegame
copy "The Suicide of Rachel Foster\OverlookSave.sav" "%tsorfsavedir%"

echo The Suicide of Rachel Foster: Done.
echo.

rem The Witcher 1
set "tw1savedir=%userprofile%\Documents\The Witcher\saves"

rem Create savegame folder structure
echo The Witcher: Creating savegame folder structure
md "%tw1savedir%"

rem Copy savegame files into the game’s savegame folder
echo The Witcher: Restoring savegame files
copy "The Witcher\*.TheWitcherSave" "%tw1savedir%"

rem Restore settings via registry keys
echo The Witcher: Importing settings via registry keys
reg import "The Witcher\tw1-settings.reg"

echo The Witcher: Done.
echo.

rem Uplink

set "uluserdir=%gamerootdir%\Uplink\users"

rem Copy options file into Uplink’s users folder
echo Uplink: Copying options file
copy Uplink\options %uluserdir%

rem Copy user files into Uplink’s users folder
echo Uplink: Copying user files
copy Uplink\*.usr %uluserdir%

echo Uplink: Done.
echo.

rem Vampire’s Dawn 2

set "vd2rootdir=%gamerootdir%\Vampires_Dawn_2"

rem Copy savegame files into the game root directory
echo Vampire's Dawn 2: Copying savegame files into root directory
copy "Vampires Dawn 2\*.lsd" %vd2rootdir%

echo Vampire's Dawn 2: Done.
echo.

pause
