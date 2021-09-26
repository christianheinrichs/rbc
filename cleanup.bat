@echo off

rem This script takes care of traces left behind by the games listed in the
rem SUPPORTED.md file.

rem Write the path to your game directory here
set "gamerootdir="

title Cleanup script running

mode con cols=100

echo Cleanup script running
echo.

rem A Hand With Many Fingers

set "ahwmflldir=%userprofile%\AppData\LocalLow\Colestia\A Hand With Many Fingers"

rem Delete the LocalLow folder
rd /q /s %ahwmflldir%

rem Delete registry keys
reg delete "HKCU\SOFTWARE\Colestia\A Hand With Many Fingers" /f

rem Alan Wake

set "awdir=%userprofile%\Documents\Remedy\AlanWake_GOG_Version"

rem Delete the ‘AlanWake_GOG_Version’ folder
rd /q /s %awdir%

rem Alan Wake - American Nightmare

set "awandir=%userprofile%\Documents\Remedy\AmericanNightmare_GOG_Version"

rem Delete the ‘AmericanNightmare_GOG_Version’ folder
rd /q /s %awandir%

rem Aliens Versus Predator - Classic 2000

set "avpc2kdir1=%localappdata%\AvPGold"
set "avpc2kdir2=%localappdata%\Rebellion\AvP Classic"
set "avpc2krootdir=%gamerootdir%\Aliens versus Predator Classic"

rem Delete log files
del "%avpc2krootdir%\ConsoleLog.txt"
del "%avpc2krootdir%\bin_Crossplay\ConsoleLog.txt"
del "%avpc2krootdir%\bin\ConsoleLog.txt"

rem Delete profiles, savegames and video configuration
rd /q /s "%avpc2kdir2%"

rem Delete Launcher.ini
rd /q /s %avpc2kdir1%

rem Delete configuration
del "%avpc2krootdir%\CONFIG.CFG"

rem Amnesia - The Dark Descent
rem Amnesia - A Machine for Pigs

set "amnesiadir=%userprofile%\Documents\Amnesia"

rem Delete the Amnesia folder. Files here include configuration, log files,
rem an empty first start flag, profile folders which in turn contain savegames,
rem user bindings and user settings

rd /q /s %amnesiadir%

rem Anachronox

set "anoxrootdir=%gamerootdir%\Anachronox"

rem Delete SAVE folder
rd /q /s %anoxrootdir%\anoxdata\SAVE

rem Delete log files
del %anoxrootdir%\*.log
del /q %anoxrootdir%\anoxdata\logs\*

rem ANNO 1602

set "anno1602rootdir=%gamerootdir%\ANNO1602"

rem Delete Game.dat file
del %anno1602rootdir%\Game.dat

rem Delete savegames
del /q %anno1602rootdir%\Savegame\*

rem Delete registry keys
reg delete HKCU\SOFTWARE\ANNO1602 /f

rem Barrow Hill - Curse of the Ancient Circle

set "bh1rootdir=%gamerootdir%\Barrow Hill - Curse of the Ancient Circle"

rem Delete savegames
del "%bh1rootdir%\*.sav"

rem Delete settings file
del "%bh1rootdir%\*.mat"

rem Battle Realms

set "br1rootdir=%gamerootdir%\Battle Realms"

rem Delete log files
del "%br1rootdir%\protlog*"

rem Delete configuration file
del "%br1rootdir%\*.ini"

rem Delete registry keys
reg delete "HKCU\SOFTWARE\Liquid Entertainment\Battle Realms" /f

rem Delete Serpent DLL file
del "%br1rootdir%\Scripts\Serpent 5E_F.dll"

rem Delete savegames
del "%br1rootdir%\Saved Games\*.br1"

rem Becherov

set "becherovdir=%gamerootdir%\Becherov"

rem Delete profile data
del %becherovdir%\Data\Player\profiles.dat

rem Delete all registry data for Becherov
reg delete HKCU\Software\Inputwish\Becherov /f

rem BioShock

set "bs1dir=%appdata%\Bioshock"
set "bs1sgdir=%userprofile%\Documents\Bioshock"

rem Delete savegame directory
rd /q /s %bs1sgdir%

rem Delete Bioshock folder located in AppData
rd /q /s %bs1dir%

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
reg delete "HKCU\SOFTWARE\Not a Sailor Studios\Buddy Simulator 1984" /f

rem Cave Story

set "cavestorydir=%gamerootdir%\Cave_Story"

rem Delete configuration and profile data. Profile data also contains savegame
rem markers
del %cavestorydir%\*.dat

rem Delete window.rect, which might be rectangular window data
del %cavestorydir%\*.rect

rem Chaser

set "chaserdir=%gamerootdir%\Chaser"

rem Delete .cfg file
del %chaserdir%\Save\Users\*.cfg

rem Delete savegame files
del %chaserdir%\Save\*.sav

rem Crashday

set "crashdayrootdir=%gamerootdir%\Crashday"

rem Delete log files
del %crashdayrootdir%\*.log
del %crashdayrootdir%\loc\eng\*.log
del %crashdayrootdir%\loc\ger\*.log
del %crashdayrootdir%\trkdata\cars\*.log
del %crashdayrootdir%\trkdata\tiles\*.log

rem Delete minigame highscores
del %crashdayrootdir%\career\minigame\*.hig

rem Delete quickchat file
del %crashdayrootdir%\quickchat.txt

rem Delete configuration files
del %crashdayrootdir%\contrldx.cfg
del %crashdayrootdir%\propsfx.cfg
del %crashdayrootdir%\sounddx.cfg

rem Backup track highscores and replay file
del %gamerootdir%\Crashday\trkdata\tracks\*.hig
del "%gamerootdir%\Crashday\trkdata\tracks\_!replay!_.trk"

rem Delete replays
del %crashdayrootdir%\replays\*.rpl

rem Delete last user file and savegames
del /q %crashdayrootdir%\savegame\*

rem Darkest Dungeon

set "darkestdungeondir=%userprofile%\Documents\Darkest"

rem Delete Darkest Dungeon folder, which should contain all profiles
rd /q /s %darkestdungeondir%

rem Delete registry keys
reg delete "HKCU\Software\Red Hook Studios\Darkest Dungeon" /f

rem Dear Devere

set "ddaddir=%appdata%\RenPy\DearDevere-1581812927"
set "ddrootdir=%gamerootdir%\Dear Devere"

rem Delete log file
del "%ddrootdir%\*.txt"

rem Delete screenshots
del "%ddrootdir%\*.png"

rem Delete savegames
del /q "%ddrootdir%\game\saves\*"
rd /q /s "%ddaddir%"

rem Diablo (Classic)

set "diablorootdir=%gamerootdir%\Diablo"

rem Delete savegames
del %diablorootdir%\*.sv

rem Delete log files
del %diablorootdir%\*.log

rem Delete registry keys
reg delete "HKCU\SOFTWARE\Blizzard Entertainment\Diablo" /f

rem Diablo

rem Delete savegames
del %diablorootdir%\dx\*.sv

rem Delete DX configuration
del %diablorootdir%\dx\dxcfg.ini

rem Diablo: Hellfire

rem Delete savegames
del %diablorootdir%\hellfire\*.hsv

rem Delete registry keys
reg delete "HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Blizzard Entertainment" /f

rem Diablo II

set "d2dir=%userprofile%\Documents\Diablo II"
set "d2rootdir=%gamerootdir%\Diablo II"
set "d2sgdir=%userprofile%\Saved Games\Diablo II"

rem Delete savegame directory
rd /q /s "%d2sgdir%"

rem Delete Diablo II directory located in the ‘Documents’ folder
rd /q /s "%d2dir%"

rem Delete Battle.net log
del "%d2rootdir%\BnetLog.txt"

rem Delete default.key file
del "%d2rootdir%\default.key"

rem Delete Battle.net updater log
del "%d2rootdir%\bnupdate.log"

rem Delete registry keys
reg delete "HKCU\SOFTWARE\Blizzard Entertainment\Diablo II" /f

rem Die Gilde

set "gilderootdir=%gamerootdir%\Die Gilde"

rem Delete configuration
del "%gilderootdir%\game.ini"

rem Delete registry keys
reg delete "HKCU\SOFTWARE\Ahead Entertainment" /f

rem Delete savegames
del /q "%gilderootdir%\Resources\gamedata\saves\*"

rem Die Völker

set "dvdir=%gamerootdir%\Alien Nations"

rem Delete configuration and savegame files
del /q "%dvdir%\Savegames\*"

rem Driver

set "driverrootdir=%gamerootdir%\Driver"

rem Delete logs
del %driverrootdir%\*.log

rem Delete configuration
del %driverrootdir%\CONFIG.DAT

rem Delete start position file
del %driverrootdir%\*.X

rem Delete temporary user replay data
del "%driverrootdir%\ReplayData\User\$TEMP$.CFG"
del "%driverrootdir%\ReplayData\User\$TEMP$.PADS"

rem Delete highscores, replays and savegames
del /q %driverrootdir%\Saves\*

rem Dungeon Keeper 2

set "dk2rootdir=%gamerootdir%\Dungeon Keeper 2"

rem Delete log file
del "%dk2rootdir%\*.LOG"

rem Delete registry keys
reg delete "HKCU\SOFTWARE\Bullfrog Productions Ltd\Dungeon Keeper II" /f
reg delete "HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Bullfrog Productions Ltd\Dungeon Keeper II" /f

rem Delete highscores
del "%dk2rootdir%\Data\Settings\*.dat"

rem Delete savegames
del "%dk2rootdir%\Data\Save\*.SAV"

rem else Heart.Break()

set "ehbrootdir=%gamerootdir%\ElseHeartbreak"

rem Delete Unity log file
del %ehbrootdir%\ElseHeartBreak_Data\*.txt

rem Delete savegames
del %ehbrootdir%\ElseHeartbreak_Data\Saves\*.json

rem Delete registry keys
reg delete "HKCU\Software\Miman\Else Heartbreak" /f

rem Enigmatis - The Ghosts of Maple Creek

set "etgomcdir=%appdata%\Artifex Mundi\Enigmatis_TheGhostOfMapleCreek"

rem Delete directory located in ‘Artifex Mundi’
rd /q /s "%etgomcdir%"

rem Europa Universalis

set "eu1rootdir=%gamerootdir%\Europa Universalis"

rem Delete log files
del "%eu1rootdir%\debug.txt"
del "%eu1rootdir%\log.txt"
del "%eu1rootdir%\netlog.txt"

rem Delete savegames
del /q "%eu1rootdir%\Scenarios\Save Games\*"

rem Delete configuration
del "%eu1rootdir%\*.eu"

rem Europa Universalis

set "eu2rootdir=%gamerootdir%\Europa Universalis 2"

rem Delete history file
del "%eu2rootdir%\history.txt"

rem Delete log files
del "%eu2rootdir%\debug.txt"
del "%eu2rootdir%\log.txt"
del "%eu2rootdir%\netlog.txt"

rem Delete savegames
del /q "%eu2rootdir%\Scenarios\save games\*"

rem Delete configuration
del "%eu2rootdir%\*.eu"

rem Delete settings file
del "%eu2rootdir%\settings.cfg"

rem FaeFever

set "fflldir=%userprofile%\AppData\LocalLow\MonkeyWizardEntertainment\FaeFever"

rem Delete registry keys
reg delete HKCU\SOFTWARE\MonkeyWizardEntertainment\FaeFever /f

rem Delete LocalLow directory
rd /q /s "%fflldir%"

rem Firewatch

set "fwlldir=%userprofile%\AppData\LocalLow\CampoSanto\Firewatch"
set "fwrootdir=%gamerootdir%\Firewatch"

rem Delete localisation file, keybinds, photos and savegames
rd /q /s %fwlldir%

rem Delete log file
del %fwrootdir%\Firewatch_Data\*.txt

rem Delete settings
reg delete HKCU\SOFTWARE\CampoSanto\Firewatch /f

rem Gothic

set "g1rootdir=%gamerootdir%\Gothic"

rem Delete installation log
del %g1rootdir%\install.log

rem Delete Saves folder
rd /q /s %g1rootdir%\Saves

rem Delete GOTHIC.INI file
del %g1rootdir%\system\GOTHIC.INI

rem Delete MSSFAST.M3D file
del %g1rootdir%\system\MSSFAST.M3D

rem Delete RPT file
del %g1rootdir%\system\GOTHIC.RPT

rem Gothic II

set "g2rootdir=%gamerootdir%\Gothic II Gold"

rem Delete installation log
del "%g2rootdir%\*.log"

rem Delete Saves folder
rd /q /s "%g2rootdir%\Saves"

rem Delete GOTHIC.INI file
del "%g2rootdir%\system\Gothic.INI"

rem Delete MSSSOFT.M3D file
del "%g2rootdir%\system\MSSSOFT.M3D"

rem Grand Theft Auto

set "gta1rootdir=%gamerootdir%\Grand Theft Auto"

rem Delete .dat file
del "%gta1rootdir%\GTADATA\*.dat"

rem Delete replay file
del "%gta1rootdir%\GTADATA\REPLAY.REP"

rem Delete language settings and key configuration
reg delete "HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\DMA Design\Grand Theft Auto" /f

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

rem Hearts of Iron

set "hoirootdir=%gamerootdir%\Hearts of Iron"

rem Delete configuration
del "%hoirootdir%\*.eu"

rem Delete savegame debug log file
del "%hoirootdir%\savedebug.txt"

rem Delete history file
del "%hoirootdir%\history.txt"

rem Delete savegames
del /q "%hoirootdir%\scenarios\save games\*"

rem Hellblade - Senua’s Sacrifice

set "hellbladedir=%localappdata%\HellbladeGame"

rem Delete local appdata Hellblade folder which contains .ini files and the
rem savegame in .sav format
rd /q /s %hellbladedir%

rem Hitman - Codename 47

set "hc47rootdir=%gamerootdir%\Hitman Codename 47"

rem Delete savegames
del "%hc47rootdir%\*.sav"

rem Delete keybinds and sound settings
del "%hc47rootdir%\*.cfg"

rem Delete configuration file
del "%hc47rootdir%\Hitman.ini"

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

rem Hotline Miami Updated

set "hmudir=%userprofile%\Documents\My Games\HotlineMiami"

rem Delete Hotline Miami folder, which includes configuration, a log file and
rem save data
rd /q /s "%hmudir%"

rem Inkslinger

set "inkslingerlldir=%userprofile%\AppData\LocalLow\Gateway\Inkslinger"

rem Delete Inkslinger folder
rd /q /s %inkslingerlldir%

rem Delete registry keys
reg delete "HKCU\SOFTWARE\Gateway\Inkslinger" /f

rem Inside

set "insideaddir=%appdata%\Playdead\Inside"
set "insidelldir=%userprofile%\AppData\LocalLow\Playdead\INSIDE"

rem Delete Inside folder
rd /q /s %insideaddir%

rem Delete LocalLow INSIDE folder
rd /q /s %insidelldir%

rem Delete INSIDE registry keys
reg delete HKCU\Software\Playdead\INSIDE /f

rem Jotun - Valhalla Edition

set "jvelldir=%userprofile%\AppData\LocalLow\Thunder Lotus Games\Jotun"

rem Delete LocalLow folder
rd /q /s "%jvelldir%"

rem Delete registry keys
reg delete "HKCU\Software\Thunder Lotus Games\Jotun" /f

rem L’Amerzone

set "larootdir=%gamerootdir%\AmerZone"

rem Delete savegames
del %larootdir%\*.bin

rem Legacy of Kain: Soul Reaver

set "loksrdir=%gamerootdir%\Legacy of Kain Soul Reaver"

rem Delete savegame file
del "%loksrdir%\*.her"

rem Delete registry keys
reg delete "HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Crystal Dynamics\Legacy of Kain: Soul Reaver" /f

rem Mafia

set "mafiarootdir=%gamerootdir%\Mafia"

rem Delete log file
del %mafiarootdir%\log.txt

rem Delete registry keys
reg delete "HKCU\SOFTWARE\Illusion Softworks\Mafia" /f

rem Delete savegame files
del /q %mafiarootdir%\savegame\*

rem Master Spy

set "masterspydir=%localappdata%\Master Spy"

rem Delete local Master Spy directory
rd /q /s "%masterspydir%"

rem Metal Gear Solid

set "mgsrootdir=%gamerootdir%\Metal Gear Solid"

rem Delete configuration files
del "%mgsrootdir%\*.cfg"

rem Delete log file
del "%mgsrootdir%\profile.log"

rem Delete DirectX configuration
del "%mgsrootdir%\dxcfg.ini"

rem Delete VR records
del "%mgsrootdir%\records.vr"

rem Delete photos
del /q "%mgsrootdir%\PHOTOS\*"

rem Delete savegames
del /q "%mgsrootdir%\SavedGames\*"

rem Delete registry keys
reg delete "HKCU\SOFTWARE\Metal Gear Solid" /f

rem Metro 2033 Redux

set "m2033dir=%userprofile%\Documents\4A Games\Metro Redux"
set "m2033laddir=%localappdata%\4A Games\Metro Redux"

rem Delete Metro Redux directory
rd /q /s "%m2033dir%"

rem Delete local AppData directory
rd /q /s "%m2033laddir%"

rem Delete registry keys
reg delete "HKCU\Software\4A-Games\Metro Redux" /f

rem Mirror’s Edge

set "medir=%userprofile%\Documents\EA Games\Mirror's Edge"

rem Delete Mirror’s Edge directory
rd /q /s "%medir%"

rem Mount & Blade

set "mbdir=%appdata%\Mount&Blade"
set "mbrootdir=%gamerootdir%\Mount and Blade"
set "mbsavedir=%userprofile%\Documents\Mount&Blade Savegames"

rem Delete savegame folder
rd /q /s "%mbsavedir%"

rem Delete Mount & Blade appdata folder
rd /q /s "%mbdir%"

rem Delete log file
del "%mbrootdir%\rgl_log.txt"

rem Delete Mount & Blade registry keys
reg delete HKCU\SOFTWARE\MountAndBladeKeys /f

rem Mount & Blade Warband

set "mbwaddir=%appdata%\Mount&Blade Warband"
set "mbwuserdir=%userprofile%\Documents\Mount&Blade Warband"
set "mbwrootdir=%gamerootdir%\Mount and Blade - Warband"
set "mbwsavedir=%userprofile%\Documents\Mount&Blade Warband Savegames"

rem Delete Mount & Blade Warband user directory
rd /q /s "%mbwuserdir%"

rem Delete Mount & Blade Warband log file
del "%mbwrootdir%\rgl_log.txt"

rem Delete Mount & Blade Warband registry keys
reg delete HKCU\SOFTWARE\MountAndBladeWarbandKeys /f

rem Delete Mount & Blade Warband AppData directory
rd /q /s "%mbwaddir%"

rem Delete Mount & Blade Warband savegame directory
rd /q /s "%mbwsavedir%"

rem Oddworld: Abe’s Oddysee

set "oaodir=%gamerootdir%\Abes Oddysee"

rem Delete savegames
del "%oaodir%\*.sav"

rem Delete configuration
del "%oaodir%\abe.ini"

rem Oddworld: Abe’s Exoddus

set "oaedir=%gamerootdir%\Abes Exoddus"

rem Delete savegames
del "%oaedir%\*.sav"

rem Delete configuration
del "%oaedir%\abe2.ini"

rem Oddworld - New 'n' Tasty

set "onntrootdir=%gamerootdir%\Oddworld - New 'n' Tasty"

rem Delete all files in savegame folder
del /q "%onntrootdir%\SaveGame\*"

rem Delete Unity log file
del "%onntrootdir%\NNT_Data\output_log.txt"

rem Delete registry keys
reg delete "HKCU\Software\Oddworld Inhabitants, Inc.\Oddworld New 'n' Tasty" /f

rem Omikron: The Nomad Soul

set "otnsrootdir=%gamerootdir%\Omikron - The Nomad Soul"

rem Delete configuration, keybinds and savegames
del "%otnsrootdir%\IAM\GAMES"

rem Open Arena

set "oaaddir=%appdata%\OpenArena"
set "oarootdir=%gamerootdir%\Open Arena"

rem Delete Open Arena AppData folder
rd /q /s %oaaddir%

rem Delete log file
del "%oarootdir%\stderr.txt"

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
reg delete HKCU\Software\PeopleCanFly /f
reg delete HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\PeopleCanFly\Painkiller /f

rem Penumbra: Overture

set "podir=%userprofile%\Documents\Penumbra Overture"

rem Delete keybinds, log files, settings and savegames
rd /q /s "%podir%"

rem Penumbra: Black Plague
rem Penumbra: Requiem

set "penumbradir=%userprofile%\Documents\Penumbra"

rem Delete keybinds, log files, savegames and settings
rd /q /s %penumbradir%

rem Planescape: Torment

set "ptrootdir=%gamerootdir%\Planescape Torment"

rem Delete save folder
rd /q /s "%ptrootdir%\save"

rem Delete cache files
del /q "%ptrootdir%\cache\*"

rem Delete configuration file
del "%ptrootdir%\Torment.ini"

rem Delete log files
del "%ptrootdir%\*.log"

rem Delete error log file
del "%ptrootdir%\*.err"

rem Port Royale

set "prrootdir=%gamerootdir%\Port Royale"

rem Delete log files
del "%prrootdir%\*.2DL"

rem Delete player .aim files
del "%prrootdir%\Run\Player*"

rem Delete options file
del "%prrootdir%\Save\*.sav"

rem Delete savegames
del "%prrootdir%\Save\*.mrk"

rem Postal Plus

set "p1dir=%gamerootdir%\Postal2STP\PostalClassic&Uncut"

rem Delete configuration file
del "%p1dir%\*.ini"

rem Delete savegames and highscores
del /q "%p1dir%\res\SaveGame\*"

rem Postal 2

set "p2dir=%gamerootdir%\Postal2STP"

rem Delete savegames
del /q "%p2dir%\Save\*"

rem Delete log file
del "%p2dir%\System\Postal2.log"

rem Delete configuration, keybinds and savegame information
del "%p2dir%\System\Postal2.ini"
del "%p2dir%\System\SavedGameInfo.ini"
del "%p2dir%\System\User.ini"

rem Quake II

set "q2rootdir=%gamerootdir%\Quake II"

rem Delete .cfg files
del "%q2rootdir%\baseq2\*.cfg"

rem Delete save folder
rd /q /s "%q2rootdir%\baseq2\save"

rem Quake II mission pack: The Reckoning

rem Delete .cfg files
del "%q2rootdir%\xatrix\*.cfg"

rem Delete save folder
rd /q /s "%q2rootdir%\xatrix\save"

rem Quake II mission pack 2: Ground Zero

rem Delete .cfg files
del "%q2rootdir%\rogue\*.cfg"

rem Delete save folder
rd /q /s "%q2rootdir%\rogue\save"

rem Quake II - The Eraser Bot

rem Delete config.cfg
del "%q2rootdir%\Eraser\config.cfg"

rem Delete save folder
rd /q /s "%q2rootdir%\Eraser\save"

rem Quake III

set "q3rootdir=%gamerootdir%\Quake III Arena"

rem Delete log files in root directory
del "%q3rootdir%\*.log"

rem Delete configuration files from baseq3 directory
del "%q3rootdir%\baseq3\*.cfg"

rem Red Faction

set "rfrootdir=%gamerootdir%\Red Faction"

rem Delete savegames
del /q "%rfrootdir%\savegame\*"

rem Delete configuration file
del "%rfrootdir%\*.cfg"

rem Delete D3D file
del "%rfrootdir%\*.id"

rem Delete banlist
del "%rfrootdir%\banlist.txt"

rem Delete console history
del "%rfrootdir%\console_history"

rem Delete registry keys
reg delete "HKCU\SOFTWARE\Volition\Red Faction" /f

rem Remothered - Tormented Fathers

set "rtfladdir=%localappdata%\Remothered"

rem Delete Remothered directory
rd /q /s %rtfladdir%

rem Ritual of the Moon

set "rotmlldir=%userprofile%\AppData\LocalLow\Kara Stone\R o t M"

rem Delete LocalLow folder
rd /q /s "%rotmlldir%"

rem Delete registry keys
reg delete "HKCU\SOFTWARE\Kara Stone\R o t M" /f

rem S.T.A.L.K.E.R. Clear Sky

set "stalkercsdir=%userprofile%\Documents\stalke~1"

rem Delete S.T.A.L.K.E.R. Clear Sky user directory
rd /q /s %stalkercsdir%

rem S.T.A.L.K.E.R. Shadow of Chernobyl

set "sshocdir=%userprofile%\Documents\Stalker-SHOC"

rem Delete S.T.A.L.K.E.R. Shadow of Chernobyl user directory
rd /q /s %sshocdir%

rem Sacred Gold

set "sgrootdir=%gamerootdir%\Sacred Gold"

rem Delete log files
del "%sgrootdir%\*.log"

rem Delete exported characters and savegames
del /q "%sgrootdir%\save\*"

rem Delete configuration files
del "%sgrootdir%\*.cfg"

rem Delete GLOBAL.TXT
del "%sgrootdir%\GLOBAL.TXT"

rem Saints Row 3

set "sr3laddir=%localappdata%\Saints Row The Third"
set "sr3rootdir=%gamerootdir%\Saints Row 3"

rem Delete local app data folder
rd /q /s "%sr3laddir%"

rem Delete display configuration file and viewed.dat
del "%sr3rootdir%\display.ini"
del "%sr3rootdir%\viewed.dat"

rem Serious Sam: The First Encounter

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

set "sllldir=%userprofile%\AppData\LocalLow\TerriVellmann\SludgeLife"
set "slrootdir=%gamerootdir%\Sludge Life"

rem Delete pictures
del /q "%slrootdir%\PICS\*"

rem Delete savegame
del "%slrootdir%\save.txt"

rem Delete local low directory
rd /q /s "%sllldir%"

rem Delete registry keys
reg delete HKCU\Software\TerriVellmann\SludgeLife /f

rem SOMA

set "somadir=%userprofile%\Documents\My Games\Soma"

rem Delete the Soma folder. Files here include configuration, log files,
rem an empty first start flag, profile folders which in turn contain savegames,
rem user bindings and user settings

rd /q /s "%somadir%"

rem SPY Fox - Dry Cereal

set "sfdcsavedir=C:\hegames"

rd /q /s %sfdcsavedir%

rem Sudden Strike

set "ssrootdir=%gamerootdir%\Sudden Strike"

rem Delete savegames
rd /q /s "%ssrootdir%\SaveGames"

rem Delete .ini file
del "%ssrootdir%\sudtest.ini"

rem Delete ratings data
del "%ssrootdir%\ratings\*.rtc"

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

rem Syberia

set "syberiarootdir=%gamerootdir%\Syberia"
set "syberiasavedir=%userprofile%\Documents\Syberia Saves"

rem Delete Syberia debug log file
del %syberiarootdir%\debug.log

rem Delete Syberia savegame directory
rd /q /s "%syberiasavedir%"

rem Syberia II

set "syb2rootdir=%gamerootdir%\Syberia 2"
set "syb2savedir=%userprofile%\Documents\Syberia 2 Saves"

rem Delete Syberia II debug log file
del "%syb2rootdir%"\debug.log

rem Delete Syberia II savegame directory
rd /q /s "%syb2savedir%"

rem The Alto Collection

set "taclldir=%userprofile%\AppData\LocalLow\Team Alto"

rem Delete analytical information and log file
rd /q /s "%taclldir%"

rem Delete configuration and savegame data
reg delete "HKCU\SOFTWARE\Team Alto\The Alto Collection" /f

rem The Cat Lady

set "tclsavedir=%userprofile%\Saved Games\The Cat Lady"

rem Delete savegame directory
rd /q /s "%tclsavedir%"

rem The Elder Scrolls III: Morrowind

set "tes3rootdir=%gamerootdir%\Morrowind"

rem Delete savegames
del /q %tes3rootdir%\Saves\*.ess

rem Delete configuration file
del %tes3rootdir%\Morrowind.ini

rem Delete journal
del %tes3rootdir%\Journal.htm

rem Delete warning log
del %tes3rootdir%\Warnings.txt

rem Delete program flow log
del %tes3rootdir%\ProgramFlow.txt

rem Delete registry keys
reg delete "HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Bethesda Softworks\Morrowind" /f
reg delete "HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Bethesda Softworks\TES3 Editor" /f

rem The Infectious Madness of Doctor Dekker

set "timoddaddir=%appdata%\timodd"
set "timoddrootdir=%gamerootdir%\The Infectious Madness of Doctor Dekker"

rem Delete app data folder
rd /q /s %timoddaddir%

rem Delete init.json settings file
del "%timoddrootdir%\resources\app\init.json"

rem The Longest Journey

set "tljrootdir=%gamerootdir%\The Longest Journey"

rem Delete preferences file
del "%tljrootdir%\preferences.ini"

rem Delete savegame folders and savegames
rd /q /s "%tljrootdir%\Save\01"
del "%tljrootdir%\Save\01.txt"

rem The Suicide of Rachel Foster

set "tsorfladdir=%localappdata%\Daedalic Entertainment GmbH\The Suicide of Rachel Foster"

rem Delete local AppData folder
rd /q /s "%tsorfladdir%"

rem The Witcher

set "w1dir=%userprofile%\Documents\The Witcher"
set "w1laddir=%localappdata%\The Witcher"

rem Delete Witcher local appdata folder
rem Contains multiple folders and log files
rd /q /s "%w1laddir%"

rem Delete Witcher user directory
rd /q /s "%w1dir%"

rem Delete Witcher registry keys
reg delete "HKCU\Software\CD Projekt RED\Witcher" /f

rem Thief: The Dark Project

set "ttdprootdir=%gamerootdir%\Thief Gold"

rem Delete mission start save file
del "%ttdprootdir%\*.sav"

rem Delete savegames
del "%ttdprootdir%\SAVES\*.sav"

rem Delete configuration
del "%ttdprootdir%\cam.cfg"

rem Delete keybinds
del "%ttdprootdir%\user.bnd"

rem Tom Clancy’s Splinter Cell

set "tcscrootdir=%gamerootdir%\Splinter Cell"

rem Delete savegames
rd /q /s "%tcscrootdir%\Save"

rem Delete configuration files
del "%tcscrootdir%\system\SplinterCell.ini"
del "%tcscrootdir%\system\SplinterCellUser.ini"

rem Unreal

set "unrealrootdir=%gamerootdir%\Unreal Gold"

rem Delete savegames
del /q "%unrealrootdir%\Save\*"

rem Delete configuration and keybinds
del "%unrealrootdir%\System\Unreal.ini"
del "%unrealrootdir%\System\User.ini"

rem Delete log file
del "%unrealrootdir%\System\*.log"

rem Unreal II - The Awakening

set "unreal2rootdir=%gamerootdir%\Unreal 2 - The Awakening"

rem Delete savegames
del /q "%unreal2rootdir%\singleplayer\Save\*"

rem Delete configuration and keybinds
del "%unreal2rootdir%\singleplayer\System\Unreal2.ini"
del "%unreal2rootdir%\singleplayer\System\User.ini"

rem Delete Golem file
del "%unreal2rootdir%\singleplayer\System\Golem.u"

rem Delete log files
del "%unreal2rootdir%\singleplayer\System\*.log"

rem Uplink

set "ulrootdir=%gamerootdir%\Uplink"

rem Delete all files in users directory
rem Files here contain user file, temporary user file backup, options file and
rem a debug log
del /q %ulrootdir%\users\*

rem Delete all files in temporary user folder
del /q %ulrootdir%\userstmp\*

rem Vampire’s Dawn 2

set "vd2rootdir=%gamerootdir%\Vampires_Dawn_2"

rem Delete savegames
del /q %vd2rootdir%\*.lsd

rem Worms Armageddon

set "warootdir=%gamerootdir%\Worms Armageddon"

rem Delete games data
del /q "%warootdir%\User\Games\*"

rem Delete team data
del /q "%warootdir%\User\Teams\*"

rem Delete custom.dat file
del "%warootdir%\custom.dat"

rem Delete land.dat file
del "%warootdir%\DATA\land.dat"

rem Delete registry keys
reg delete HKCU\SOFTWARE\Team17SoftwareLTD\WormsArmageddon /f

echo Worms Armageddon: Done.
echo.

rem XIII

set "xiiirootdir=%gamerootdir%\XIII"

rem Delete sound log
del %xiiirootdir%\usnd_log.txt

rem Delete video debug file
del %xiiirootdir%\system\Debug_video.txt

rem Delete XIII log file
del %xiiirootdir%\system\XIII.log

rem Delete XIII configuration file
del %xiiirootdir%\system\XIII.ini

rem Delete profiles, which also contain savegame data
del %xiiirootdir%\Save\*.pro

pause
