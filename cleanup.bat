@echo off

rem rbc: Cleanup script
rem Last modified on 16 April 2022

rem This script takes care of traces left behind by the games listed in the
rem SUPPORTED file

rem Write the path to your game directory here
set "gamerootdir="

rem Steam default game folder
set "steamdefaultlibdir=C:\Program Files (x86)\Steam\steamapps\common"

rem Steam alternative library
rem set "steamlibdir=S:\Users\User\Games\SteamLibrary"

title rbc: Cleanup script running

mode con cols=100

echo Cleanup script running
echo.

if "%gamerootdir%" == "" (
	echo Please specify your game root directory
	pause
	exit
) else (
	echo Game root directory found. Continuing...
	echo.
)

rem A Hand With Many Fingers

set "ahwmflldir=%userprofile%\AppData\LocalLow\Colestia\A Hand With Many Fingers"
set "ahwmfregpath=HKCU\SOFTWARE\Colestia\A Hand With Many Fingers"

rem Delete the LocalLow folder
rd /q /s "%ahwmflldir%"

rem Delete registry key
reg delete "%ahwmfregpath%" /f

rem Alan Wake

set "awdir=%userprofile%\Documents\Remedy\AlanWake_GOG_Version"

rem Delete the ‘AlanWake_GOG_Version’ folder
rd /q /s "%awdir%"

rem Alan Wake - American Nightmare

set "awandir=%userprofile%\Documents\Remedy\AmericanNightmare_GOG_Version"

rem Delete the ‘AmericanNightmare_GOG_Version’ folder
rd /q /s "%awandir%"

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

rem Alpha Polaris

set "alphapolarisregpath=HKCU\SOFTWARE\TurmoilGames\AlphaPolaris"
set "alphapolarissgdir=%userprofile%\Saved Games\Alpha Polaris"

rem Delete registry key
reg delete "%alphapolarisregpath%" /f

rem Delete savegame folder
rd /q /s "%alphapolarissgdir%"

rem Amnesia - The Dark Descent
rem Amnesia - A Machine for Pigs

set "amnesiadir=%userprofile%\Documents\Amnesia"

rem Delete the Amnesia folder. Files here include configuration, log files,
rem an empty first start flag, profile folders which in turn contain savegames,
rem user bindings and user settings

rd /q /s "%amnesiadir%"

rem Anachronox

set "anoxrootdir=%gamerootdir%\Anachronox"

rem Delete SAVE folder
rd /q /s "%anoxrootdir%\anoxdata\SAVE"

rem Delete log files
del "%anoxrootdir%\*.log"
del /q "%anoxrootdir%\anoxdata\logs\*"

rem ANNO 1602

set "anno1602regpath=HKCU\SOFTWARE\ANNO1602"
set "anno1602rootdir=%gamerootdir%\ANNO1602"

rem Delete Game.dat file
del "%anno1602rootdir%\Game.dat"

rem Delete savegames
del /q "%anno1602rootdir%\Savegame\*"

rem Delete registry key
reg delete "%anno1602regpath%" /f

rem ArmA: Armed Assault

set "armadocdir1=%userprofile%\Documents\ArmA"
set "armadocdir2=%userprofile%\Documents\ArmA Other Profiles"
set "armaladdir=%localappdata%\ArmA"
set "armaregkeypath1=HKCU\SOFTWARE\Bohemia Interactive Studio\ArmA"
set "armaregkeypath2=HKLM\SOFTWARE\WOW6432Node\Bohemia Interactive Studio\ArmA"
set "armaregkeypath3=HKCU\SOFTWARE\GameSpy"
set "armaregkeypath4=HKLM\SOFTWARE\WOW6432Node\Bohemia Interactive\BattlEye"

rem Delete local AppData folder
rd /q /s "%armaladdir%"

rem Delete registry keys
reg delete "%armaregkeypath1%" /f
reg delete "%armaregkeypath2%" /f
reg delete "%armaregkeypath3%" /f
reg delete "%armaregkeypath4%" /f

rem Delete profile folders
rd /q /s "%armadocdir1%"
rd /q /s "%armadocdir2%"

rem Arma: Cold War Assault

set "acwaregkeypath=HKLM\SOFTWARE\WOW6432Node\Bohemia Interactive Studio\ColdWarAssault"
set "acwarootdir=%gamerootdir%\Arma Cold War Assault"

rem Delete registry key
reg delete "%acwaregkeypath%" /f

rem Delete configuration
"%acwarootdir%\ColdWarAssault.cfg"

rem Delete Users folder
rd /q /s "%acwarootdir%\Users"

rem Baldur’s Gate

set "baldursgaterootdir=%gamerootdir%\Baldur's Gate"

rem Delete configuration file
del "%baldursgaterootdir%\Baldur.ini"

rem Delete characters
del /q "%baldursgaterootdir%\Characters\*"

rem Delete savegame folder
rd /q /s "%baldursgaterootdir%\Save"

rem Baldur’s Gate: Enhanced Edition

set "bgeedir=%userprofile%\Documents\Baldur's Gate - Enhanced Edition"

rem Delete folder
rd /q /s "%bgeedir%"

rem Barrow Hill - Curse of the Ancient Circle

set "bh1rootdir=%gamerootdir%\Barrow Hill - Curse of the Ancient Circle"

rem Delete savegames
del "%bh1rootdir%\*.sav"

rem Delete settings file
del "%bh1rootdir%\*.mat"

rem Battle Realms

set "br1regpath=HKCU\SOFTWARE\Liquid Entertainment\Battle Realms"
set "br1rootdir=%gamerootdir%\Battle Realms"

rem Delete log files
del "%br1rootdir%\protlog*"

rem Delete configuration file
del "%br1rootdir%\*.ini"

rem Delete registry key
reg delete "%br1regpath%" /f

rem Delete Serpent DLL file
del "%br1rootdir%\Scripts\Serpent 5E_F.dll"

rem Delete savegames
del "%br1rootdir%\Saved Games\*.br1"

rem Becherov

set "becherovdir=%gamerootdir%\Becherov"
set "becherovregpath=HKCU\Software\Inputwish\Becherov"

rem Delete profile data
del "%becherovdir%\Data\Player\profiles.dat"

rem Delete all registry data for Becherov
reg delete "%becherovregpath%" /f

rem Bio Menace
rem GOG edition, DOSBox emulation

set "biomenacerootdir=%gamerootdir%\Bio Menace"

rem Delete DOSBox log file
del "%biomenacerootdir%\DOSBOX\stdout*"

rem Delete configuration
del "%biomenacerootdir%\cloud_saves\CONFIG*"

rem Delete DOSBox configuration file
del "%biomenacerootdir%\dosbox_biomenace.conf"

rem Delete savegames
del "%biomenacerootdir%\cloud_saves\SAVEGAM*"

rem BioShock

set "bs1dir=%appdata%\Bioshock"
set "bs1sgdir=%userprofile%\Documents\Bioshock"

rem Delete savegame directory
rd /q /s "%bs1sgdir%"

rem Delete Bioshock folder located in AppData
rd /q /s "%bs1dir%"

rem Blair Witch

set "blairwitchdir=%localappdata%\Blairwitch"

rem Delete local AppData folder
rd /q /s "%blairwitchdir%"

rem Blitzkrieg

set "blitzkriegregpath=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Nival Interactive\Blitzkrieg"
set "blitzkriegrootdir=%gamerootdir%\Blitzkrieg"

rem Delete address book
del "%blitzkriegrootdir%\data\*.xml"

rem Delete registry key
reg delete "%blitzkriegregpath%" /f

rem Delete chapters folder
rd /q /s "%blitzkriegrootdir%\data\scenarios\chapters"

rem Delete savegames
del "%blitzkriegrootdir%\saves\*.sav"

rem Blitzkrieg Anthology: Burning Horizon - Rolling Thunder

set "babhrtregpath=HKLM\SOFTWARE\WOW6432Node\CDV Software Entertainment AG\Blitzkrieg Rolling Thunder"
set "babhrtrootdir=%gamerootdir%\Blitzkrieg BHRT"

rem Delete address book
del "%babhrtrootdir%\Run\data\AddressBook.xml"

rem Delete configuration
del "%babhrtrootdir%\Run\config.cfg"

rem Delete registry key
reg delete "%babhrtregpath%" /f

rem Delete chapters folder
rd /q /s "%babhrtrootdir%\Run\data\scenarios\chapters"

rem Delete savegames
del "%babhrtrootdir%\Run\saves\*.sav"

rem Blood Omen: Legacy of Kain

set "bolokregpath=HKCU\SOFTWARE\LegacyOfKain"
set "bolokrootdir=%gamerootdir%\Blood Omen"

rem Delete DirectX configuration
del "%bolokrootdir%\dxcfg.ini"

rem Delete configuration files and PTEMP.TMP
del "%bolokrootdir%\Cfg\*.cfg"
del "%bolokrootdir%\Cfg\*.TMP"

rem Delete registry key
reg delete "%bolokregpath%" /f

rem Delete savegames
del "%bolokrootdir%\Saves\*.sav"

rem Buddy Simulator 1984

set "bs1984datadir=%userprofile%\Documents\Buddy Simulator 1984"
set "bs1984lldir=%userprofile%\AppData\LocalLow\Not a Sailor Studios"
set "bs1984regpath=HKCU\SOFTWARE\Not a Sailor Studios\Buddy Simulator 1984"
set "bs1984rootdir=%gamerootdir%\Buddy Simulator 1984"

rem Delete data folder
rd /q /s "%bs1984datadir%"

rem Delete LocalLow directory
rd /q /s "%bs1984lldir%"

rem Delete memories
del "%bs1984rootdir%\Buddy Simulator 1984_Data\StreamingAssets\Memories\*.png"

rem Delete registry key
reg delete "%bs1984regpath%" /f

rem Call of Cthulhu: Dark Corners of the Earth

set "cocdcotedir=%userprofile%\Documents\Bethesda\Call of Cthulhu"
set "cocdcoteregpath=HKCU\SOFTWARE\Bethesda Softworks\Call Of Cthulhu DCoTE"
set "cocdcoterootdir=%gamerootdir%\Spiele\Call of Cthulhu - DCotE"

rem Delete automatic save, options and manual savegames
rd /q /s "%cocdcotedir%"

rem Delete registry key
reg delete "%cocdcoteregpath%" /f

rem Delete device files
del "%cocdcoterootdir%\Engine\device*"

rem Cave Story

set "cavestoryrootdir=%gamerootdir%\Cave Story"

rem Delete configuration and profile data. Profile data also contains savegame
rem markers
del "%cavestoryrootdir%\*.dat"

rem Delete window.rect, which might be rectangular window data
del "%cavestoryrootdir%\*.rect"

rem Chaser

set "chaserdir=%gamerootdir%\Chaser"

rem Delete .cfg file
del "%chaserdir%\Save\Users\*.cfg"

rem Delete savegame files
del "%chaserdir%\Save\*.sav"

rem Cosmo’s Cosmic Adventure
rem GOG edition, emulated in DOSBox

set "ccarootdir=%gamerootdir%\Cosmo's Cosmic Adventure"

rem Delete DOSBox log file
del "%ccarootdir%\DOSBOX\stdout*"

rem Delete savegames, SVT files and highscore file
del "%ccarootdir%\cloud_saves\COSMO*"

rem Crashday

set "crashdayrootdir=%gamerootdir%\Crashday"

rem Delete log files
del "%crashdayrootdir%\*.log"
del "%crashdayrootdir%\loc\eng\*.log"
del "%crashdayrootdir%\loc\ger\*.log"
del "%crashdayrootdir%\trkdata\cars\*.log"
del "%crashdayrootdir%\trkdata\tiles\*.log"

rem Delete minigame highscores
del "%crashdayrootdir%\career\minigame\*.hig"

rem Delete quickchat file
del "%crashdayrootdir%\quickchat.txt"

rem Delete configuration files
del "%crashdayrootdir%\contrldx.cfg"
del "%crashdayrootdir%\propsfx.cfg"
del "%crashdayrootdir%\sounddx.cfg"

rem Backup track highscores and replay file
del "%gamerootdir%\Crashday\trkdata\tracks\*.hig"
del "%gamerootdir%\Crashday\trkdata\tracks\_!replay!_.trk"

rem Delete replays
del "%crashdayrootdir%\replays\*.rpl"

rem Delete last user file and savegames
del /q "%crashdayrootdir%\savegame\*"

rem Dagon by H. P. Lovecraft

set "dagondir=%userprofile%\AppData\LocalLow\BitGolem\Dagon"
set "dagonregpath=HKCU\SOFTWARE\BitGolem\Dagon"

rem Delete LocalLow directory
rd /q /s "%dagondir%"

rem Delete registry key
reg delete "%dagonregpath%" /f

rem Darkest Dungeon

set "darkestdungeondir=%userprofile%\Documents\Darkest"
set "darkestregpath=HKCU\Software\Red Hook Studios\Darkest Dungeon"

rem Delete Darkest Dungeon folder, which should contain all profiles
rd /q /s "%darkestdungeondir%"

rem Delete registry key
reg delete "%darkestregpath%" /f

rem Dear Devere

set "devereaddir=%appdata%\RenPy\DearDevere-1581812927"
set "devererootdir=%gamerootdir%\Dear Devere"

rem Delete log file
del "%devererootdir%\*.txt"

rem Delete screenshots
del "%devererootdir%\*.png"

rem Delete savegames
del /q "%devererootdir%\game\saves\*.save"
rd /q /s "%devereaddir%"

rem Diablo (Classic)

set "diabloregpath=HKCU\SOFTWARE\Blizzard Entertainment\Diablo"
set "diablorootdir=%gamerootdir%\Diablo"

rem Delete savegames
del "%diablorootdir%\*.sv"

rem Delete log files
del "%diablorootdir%\*.log"

rem Delete registry key
reg delete "%diabloregpath%" /f

rem Diablo

rem Delete savegames
del "%diablorootdir%\dx\*.sv"

rem Delete DX configuration
del "%diablorootdir%\dx\dxcfg.ini"

rem Diablo: Hellfire

set "dhellfireregpath=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Blizzard Entertainment\Hellfire"

rem Delete savegames
del "%diablorootdir%\hellfire\*.hsv"

rem Delete registry key
reg delete "%dhellfireregpath%" /f

rem Diablo II

set "d2dir=%userprofile%\Documents\Diablo II"
set "d2regpath=HKCU\SOFTWARE\Blizzard Entertainment\Diablo II"
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

rem Delete registry key
reg delete "%d2regpath%" /f

rem Die Gilde

set "gilderootdir=%gamerootdir%\Die Gilde"

rem Delete configuration
del "%gilderootdir%\game.ini"

rem Delete savegames
del /q "%gilderootdir%\Resources\gamedata\saves\*"

rem Delete registry key
reg delete "HKCU\SOFTWARE\Ahead Entertainment" /f

rem Die Siedler II - Gold Edition
rem English title: The Settlers II GOLD
rem
rem GOG edition, DOSBox emulation

set "diesiedler2rootdir=%gamerootdir%\The Settlers 2 GOLD"

rem Delete configuration
del "%diesiedler2rootdir%\SETUP.INI"

rem Delete EDITRES.IDX
del "%diesiedler2rootdir%\DATA\EDITRES.IDX"

rem Delete REMAP.DAT
del "%diesiedler2rootdir%\DATA\REMAP.DAT"

rem Delete RESOURCE.IDX
del "%diesiedler2rootdir%\DATA\RESOURCE.IDX"

rem Delete EDITIO.IDX
del "%diesiedler2rootdir%\DATA\IO\EDITIO.IDX"

rem Delete IO.IDX
del "%diesiedler2rootdir%\DATA\IO\IO.IDX"

rem Delete DOSBox log file
del "%diesiedler2rootdir%\DOSBOX\stdout*"

rem Delete .DAT save files
del "%diesiedler2rootdir%\SAVE\*.DAT"

rem Delete world files
del "%diesiedler2rootdir%\WORLDS\*.SWD"

rem Delete world screenshots
del "%diesiedler2rootdir%\WORLDS\*.PCX"

rem Die Völker
rem English title: Alien Nations

set "dievoelkerrootdir=%gamerootdir%\Alien Nations"

rem Delete configuration and savegame files
del /q "%dievoelkerrootdir%\Savegames\*"

rem DOOM
rem GOG edition, emulated in DOSBox
rem
rem Known as ‘The Ultimate DOOM’

set "doomrootdir=%gamerootdir%\DOOM"

rem Delete DOSBox log file
del "%doomrootdir%\DOSBOX\stdout*"

rem Delete configuration
del "%doomrootdir%\cloud_saves\*.CFG"

rem Delete savegames
del "%doomrootdir%\cloud_saves\*.DSG"

rem DOOM II
rem GOG edition, emulated in DOSBox

set "doom2rootdir=%gamerootdir%\DOOM 2"

rem Delete DOSBox log file
del "%doom2rootdir%\DOSBOX\stdout*"

rem Delete MASTER folder
rd /q /s "%doom2rootdir%\cloud_saves\MASTER"

rem Delete DOOM2 folder
rd /q /s "%doom2rootdir%\cloud_saves\DOOM2"

rem Driver

set "driverrootdir=%gamerootdir%\Driver"

rem Delete logs
del "%driverrootdir%\*.log"

rem Delete configuration
del "%driverrootdir%\CONFIG.DAT"

rem Delete start position file
del "%driverrootdir%\*.X"

rem Delete temporary user replay data
del "%driverrootdir%\ReplayData\User\$TEMP$.CFG"
del "%driverrootdir%\ReplayData\User\$TEMP$.PADS"

rem Delete highscores, replays and savegames
del /q "%driverrootdir%\Saves\*"

rem Dungeon Keeper
rem Deeper Dungeons
rem GOG edition, DOSBox emulation

set "dk1rootdir=%gamerootdir%\Dungeon Keeper Gold"

rem Delete DOSBox log file
del "%dk1rootdir%\DOSBOX\stdout*"

rem Delete DATA folder
rd /q /s "%dk1rootdir%\cloud_saves\DATA"

rem Delete SAVE folder
rd /q /s "%dk1rootdir%\cloud_saves\SAVE"

rem Dungeon Keeper 2

set "dk2rootdir=%gamerootdir%\Dungeon Keeper 2"
set "dk2confregpath=HKCU\SOFTWARE\Bullfrog Productions Ltd\Dungeon Keeper II"
set "dk2versionregpath=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Bullfrog Productions Ltd\Dungeon Keeper II"

rem Delete log file
del "%dk2rootdir%\*.LOG"

rem Delete registry key
reg delete "%dk2confregpath%" /f
reg delete "%dk2versionregpath%" /f

rem Delete highscores
del "%dk2rootdir%\Data\Settings\*.dat"

rem Delete savegames
del "%dk2rootdir%\Data\Save\*.SAV"

rem else Heart.Break()

set "ehbregpath=HKCU\Software\Miman\Else Heartbreak"
set "ehbrootdir=%gamerootdir%\ElseHeartbreak"

rem Delete Unity log file
del "%ehbrootdir%\ElseHeartBreak_Data\*.txt"

rem Delete savegames
del "%ehbrootdir%\ElseHeartbreak_Data\Saves\*.json"

rem Delete registry key
reg delete "%ehbregpath%" /f

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

rem Europa Universalis II

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

set "faefeverlldir=%userprofile%\AppData\LocalLow\MonkeyWizardEntertainment\FaeFever"
set "faefeverregpath=HKCU\SOFTWARE\MonkeyWizardEntertainment\FaeFever"

rem Delete registry key
reg delete "%faefeverregpath%" /f

rem Delete LocalLow directory
rd /q /s "%faefeverlldir%"

rem Final DOOM
rem GOG edition, DOSBox emulation

set "finaldoomrootdir=%gamerootdir%\Final DOOM"

rem Delete DOSBox log file
del "%finaldoomrootdir%\DOSBOX\stdout*"

rem TNT: Evilution

rem Delete TNT folder
rd /q /s "%finaldoomrootdir%\cloud_saves\TNT"

rem The Plutonium Experiment

rem Delete PLUTONIA folder
rd /q /s "%finaldoomrootdir%\cloud_saves\PLUTONIA"

rem Firewatch

set "fwlldir=%userprofile%\AppData\LocalLow\CampoSanto\Firewatch"
set "fwregpath=HKCU\SOFTWARE\CampoSanto\Firewatch"
set "fwrootdir=%gamerootdir%\Firewatch"

rem Delete localisation file, keybinds, photos and savegames
rd /q /s "%fwlldir%"

rem Delete log file
del "%fwrootdir%\Firewatch_Data\*.txt"

rem Delete settings
reg delete "%fwregpath%" /f

rem Gothic

set "g1rootdir=%gamerootdir%\Gothic"

rem Delete installation log
del "%g1rootdir%\install.log"

rem Delete Saves folder
rd /q /s "%g1rootdir%\Saves"

rem Delete GOTHIC.INI file
del "%g1rootdir%\system\GOTHIC.INI"

rem Delete MSSFAST.M3D file
del "%g1rootdir%\system\MSSFAST.M3D"

rem Delete RPT file
del "%g1rootdir%\system\GOTHIC.RPT"

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

set "gtaregpath=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\DMA Design\Grand Theft Auto"
set "gtarootdir=%gamerootdir%\Grand Theft Auto"

rem Delete .dat file
del "%gtarootdir%\GTADATA\*.dat"

rem Delete replay file
del "%gtarootdir%\GTADATA\REPLAY.REP"

rem Delete language settings and key configuration
reg delete "%gtaregpath%" /f

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
del "%hacknetrootdir%\*.log"

rem Delete settings file
del "%hacknetrootdir%\Settings.txt"

rem Delete Hacknet folder, within it is a directory called Accounts.
rem Accounts contains accounts information and the actual user profiles
rem in XML format. These user profiles also contain savegame information, but
rem are only functional in combination with the correct accounts file
rd /q /s "%hacknetdir%"

rem Hatred

set "hatredrootdir=%gamerootdir%\Hatred"

rem Delete configuration files
del "%hatredrootdir%\Hatred\Saved\Config\WindowsNoEditor\*.ini"

rem Delete savegames
del "%hatredrootdir%\Hatred\Saved\SaveGames\*.sav"

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

rem Delete local AppData Hellblade folder which contains .ini files and the
rem savegame in .sav format
rd /q /s "%hellbladedir%"

rem Heretic: Shadow of the Serpent Riders
rem GOG edition, DOSBox emulation

set "hsotsrrootdir=%gamerootdir%\Heretic"

rem Delete DOSBox log file
del "%hsotsrrootdir%\DOSBOX\stdout*"

rem Delete DOSBox configuration file
del "%hsotsrrootdir%\dosbox_heretic.conf"

rem Delete configuration files, savegames and temporary deathmatch file
del /q "%hsotsrrootdir%\cloud_saves\*"

rem Heroes of Might and Magic
rem GOG edition, DOSBox emulation

set "homamrootdir=%gamerootdir%\HoMM"

rem Delete DOSBox log file
del "%homamrootdir%\DOSBOX\stdout*"

rem Delete DOSBox configuration
del "%homamrootdir%\dosboxHOMM1.conf"

rem Delete configuration
del "%homamrootdir%\cloud_saves\*.CFG"

rem Delete savegame folder
rd /q /s "%homamrootdir%\cloud_saves\GAMES"

rem Heroine’s Quest: The Herald of Ragnarok

set "hqthordir=%userprofile%\Saved Games\Heroine's Quest 1.2"

rem Delete savegame folder
rd /q /s "%hqthordir%"

rem Hexen: Beyond Heretic
rem GOG edition, DOSBox emulation

set "hexenrootdir=%gamerootdir%\HeXen"

rem Delete DOSBox log file
del "%hexenrootdir%\DOSBOX\stdout*"

rem Delete DOSBox configuration
del "%hexenrootdir%\dosbox_hexen.conf"

rem Delete configuration files and temporary deathmatch file
del /q "%hexenrootdir%\cloud_saves\*"

rem Delete savegame folder
rd /q /s "%hexenrootdir%\cloud_saves\HEXNDATA"

rem Hexen: Deathkings of the Dark Citadel
rem GOG edition, DOSBox emulation

set "hdotdcrootdir=%gamerootdir%\HeXenDK"

rem Delete DOSBox log file
del "%hdotdcrootdir%\DOSBOX\stdout*"

rem Delete DOSBox configuration
del "%hdotdcrootdir%\dosbox_hexenDK.conf"

rem Delete configuration files and temporary deathmatch file
del /q "%hdotdcrootdir%\cloud_saves\*"

rem Delete savegame folder
rd /q /s "%hdotdcrootdir%\cloud_saves\HEXNDATA"

rem Hexen II

set "nglideconfigregpath=HKCU\SOFTWARE\Zeus Software\nGlide2"
set "hexen2regpath=HKLM\SOFTWARE\WOW6432Node\Activision\Hexen II"
set "hexen2rootdir=%gamerootdir%\HeXen II"
set "hexen2sgdirs=for /f %%a in ('dir /b "%hexen2rootdir%\data1"') do echo %%a | findstr "quick s" | findstr /v "Strings.txt""

rem Delete registry keys
reg delete "%nglideconfigregpath%" /f

rem Without administrator rights, the following command shows the
rem ‘ERROR: Access is denied.’ message.
rem reg delete "%hexen2regpath%" /f

rem Delete configuration files
del "%hexen2rootdir%\data1\*.cfg"

rem Delete savegame folders
rem
rem The command sequence contained in the variable ‘hexen2sgdirs’ does output
rem the savegames folders. I could not figure out how to delete them by
rem accessing the result of ‘hexen2sgdirs’. Therefore, just delete all savegame
rem folders explicitly.
rem
rem `rd /q /s %hexen2sgdirs%` and `rd /q /s "%hexen2sgdirs%"` throw errors

rem rem Delete multiplayer savegame folders explicitly
rd /q /s "%hexen2rootdir%\data1\ms0"
rd /q /s "%hexen2rootdir%\data1\ms1"
rd /q /s "%hexen2rootdir%\data1\ms2"
rd /q /s "%hexen2rootdir%\data1\ms3"
rd /q /s "%hexen2rootdir%\data1\ms4"
rd /q /s "%hexen2rootdir%\data1\ms5"
rd /q /s "%hexen2rootdir%\data1\ms6"
rd /q /s "%hexen2rootdir%\data1\ms7"
rd /q /s "%hexen2rootdir%\data1\ms8"
rd /q /s "%hexen2rootdir%\data1\ms9"
rd /q /s "%hexen2rootdir%\data1\ms10"
rd /q /s "%hexen2rootdir%\data1\ms11"

rem Delete quicksave folder
rd /q /s "%hexen2rootdir%\data1\quick"

rem Delete singleplayer savegame folders explicitly
rd /q /s "%hexen2rootdir%\data1\s0"
rd /q /s "%hexen2rootdir%\data1\s1"
rd /q /s "%hexen2rootdir%\data1\s2"
rd /q /s "%hexen2rootdir%\data1\s3"
rd /q /s "%hexen2rootdir%\data1\s4"
rd /q /s "%hexen2rootdir%\data1\s5"
rd /q /s "%hexen2rootdir%\data1\s6"
rd /q /s "%hexen2rootdir%\data1\s7"
rd /q /s "%hexen2rootdir%\data1\s8"
rd /q /s "%hexen2rootdir%\data1\s9"
rd /q /s "%hexen2rootdir%\data1\s10"
rd /q /s "%hexen2rootdir%\data1\s11"

rem Hidden and Dangerous

set "hadregkeypath1=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Take2\Hidden and Dangerous"
set "hadregkeypath2=HKLM\SOFTWARE\WOW6432Node\Take2\Hidden and Dangerous"
set "hadrootdir=%gamerootdir%\Hidden and Dangerous\HD"

rem Delete registry keys
reg delete "%hadregkeypath1%" /f
reg delete "%hadregkeypath2%" /f

rem Delete .ini file
del "%hadrootdir%\*.ini"

rem Delete savegames
del "%hadrootdir%\savegame\single\*.bin"

rem Hidden and Dangerous Deluxe

set "haddregkeypath1=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Lonely Cat Games\Hidden and Dangerous Deluxe"
set "haddregkeypath2=HKCU\SOFTWARE\Insanity3D system"
set "haddregkeypath3=HKLM\SOFTWARE\WOW6432Node\Lonely Cat Games\Hidden and Dangerous Deluxe"
set "haddrootdir=%gamerootdir%\Hidden and Dangerous\HD Deluxe"

rem Delete registry keys
reg delete "%haddregkeypath1%" /f
reg delete "%haddregkeypath2%" /f
reg delete "%haddregkeypath3%" /f

rem Delete savegames
del "%haddrootdir%\Savegame\*.bin"

rem Hidden and Dangerous - Fight for Freedom

set "hadfff=%gamerootdir%\Hidden and Dangerous\HD FF"

rem Delete .ini file
del "%hadfff%\*.ini"

rem Delete controls file
del "%hadfff%\*.cfg"

rem Delete savegames
del "%hadfff%\savegame\single\*.bin"

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

rem I Have No Mouth, and I Must Scream
rem GOG edition, ScummVM emulation

set "ihnmaimsrootdir=%gamerootdir%\I Have No Mouth"
set "svmregpath=HKCU\SOFTWARE\scummvm.org"
set "svmadpath=%appdata%\ScummVM"

rem Delete registry key
reg delete "%svmregpath%" /f

rem Delete AppData folder
rd /q /s "%svmadpath%"

rem Delete configuration
del "%ihnmaimsrootdir%\ihnm.ini"

rem Delete savegames
del "%ihnmaimsrootdir%\saves\*.s*"

rem Icewind Dale Complete

set "idcregpath1=HKLM\SOFTWARE\WOW6432Node\Black Isle\Icewind Dale"
set "idcregpath2=HKLM\SOFTWARE\WOW6432Node\Black Isle\Icewind Dale - Heart of Winter"
set "idcregpath3=HKLM\SOFTWARE\WOW6432Node\Black Isle\Icewind Dale - Heart of Winter: Trials of the Luremaster"
set "idcrootdir=%gamerootdir%\Icewind Dale Complete"

rem Delete registry keys
rem HKLM rootkey access seems to be restricted to administrators. It doesn’t
rem really make sense to include these.
rem
rem reg delete "%idcregpath1%" /f
rem reg delete "%idcregpath2%" /f
rem reg delete "%idcregpath3%" /f

rem Delete log file(s)
del "%idcrootdir%\*.log"

rem Delete cache
del "%idcrootdir%\Cache\Data\*.bif"

rem Delete keybinds
del "%idcrootdir%\Keymap*"

rem Delete configuration
del "%idcrootdir%\icewind*"

rem Delete characters
del "%idcrootdir%\Characters\*.chr"
del "%idcrootdir%\Characters\*.res"

rem Delete savegame folder
rd /q /s "%idcrootdir%\mpsave"

rem Inkslinger

set "inkslingerlldir=%userprofile%\AppData\LocalLow\Gateway\Inkslinger"
set "inkslingerregpath=HKCU\SOFTWARE\Gateway\Inkslinger"

rem Delete Inkslinger folder
rd /q /s "%inkslingerlldir%"

rem Delete registry key
reg delete "%inkslingerregpath%" /f

rem Indiana Jones and the Fate of Atlantis
rem GOG edition, ScummVM emulation

set "ijatfoarootdir=%gamerootdir%\Indiana Jones and the Fate of Atlantis"
set "svmregpath=HKCU\SOFTWARE\scummvm.org"
set "svmadpath=%appdata%\ScummVM"

rem Delete registry key
reg delete "%svmregpath%" /f

rem Delete AppData folder
rd /q /s "%svmadpath%"

rem Delete configuration
del "%ijatfoarootdir%\atlantis.ini"

rem Delete savegames
del "%ijatfoarootdir%\saves\*.s*"

rem Indiana Jones and the Infernal Machine

set "ijatimregpath=HKCU\SOFTWARE\LucasArts Entertainment Company LLC\Indiana Jones and the Infernal Machine"
set "ijatimrootdir=%gamerootdir%\Infernal Machine"

rem Delete registry key
reg delete "%ijatimregpath%" /f

rem Delete savegames
del "%ijatimrootdir%\SaveGames\*.nds"

rem Indiana Jones and the Last Crusade
rem GOG edition, ScummVM emulation

set "ijatlcrootdir=%gamerootdir%\Indiana Jones and The Last Crusade"
set "svmregpath=HKCU\SOFTWARE\scummvm.org"
set "svmadpath=%appdata%\ScummVM"

rem Delete registry key
reg delete "%svmregpath%" /f

rem Delete AppData folder
rd /q /s "%svmadpath%"

rem Delete configuration
del "%ijatlcrootdir%\last-crusade.ini"

rem Delete savegames
del "%ijatlcrootdir%\saves\*.s*"

rem Inside

set "insideaddir=%appdata%\Playdead\Inside"
set "insidelldir=%userprofile%\AppData\LocalLow\Playdead\INSIDE"
set "insideregpath=HKCU\Software\Playdead\INSIDE"

rem Delete Inside folder
rd /q /s "%insideaddir%"

rem Delete LocalLow INSIDE folder
rd /q /s "%insidelldir%"

rem Delete INSIDE registry key
reg delete "%insideregpath%" /f

rem Jazz Jackrabbit Collection
rem GOG edition, emulated in DOSBox

set "jjcrootdir=%gamerootdir%\Jazz Jackrabbit"

rem Delete DOSBox log file
del "%jjcrootdir%\DOSBOX\stdout*"

rem Delete savegames
del "%jjcrootdir%\cloud_saves\SAVE*"

rem Delete Holiday Hare 1995 folder
rd /q /s "%jjcrootdir%\cloud_saves\HH95"

rem Jazz Jackrabbit 2

set "jj2regpath1=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Epic MegaGames\Jazz Creation Station"
set "jj2regpath2=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Epic MegaGames\Jazz Jackrabbit 2 Secret Files"
set "jj2regpath3=HKCU\SOFTWARE\Epic MegaGames\Jazz Creation Station"
set "jj2regpath4=HKCU\SOFTWARE\Epic MegaGames\Jazz Jackrabbit 2 Secret Files"
set "jj2regpath5=HKLM\SOFTWARE\WOW6432Node\Epic MegaGames\Jazz Creation Station"
set "jj2regpath6=HKLM\SOFTWARE\WOW6432Node\Epic MegaGames\Jazz Jackrabbit 2 Secret Files"
set "jj2regpath7=HKLM\SOFTWARE\WOW6432Node\Epic MegaGames\Jazz Jackrabbit 2 Special Edition"
set "jj2rootdir=%gamerootdir%\Jazz Jackrabbit 2"

rem Delete log file
del "%jj2rootdir%\*.log"

rem Delete ‘Jazz Creation Station’ configuration
del "%jj2rootdir%\JCS.ini"

rem Delete configuration
del "%jj2rootdir%\*.CFG"

rem Delete savegames
del "%jj2rootdir%\SAVEGAME*"

rem Delete registry keys
reg delete "%jj2regpath1%" /f
reg delete "%jj2regpath2%" /f
reg delete "%jj2regpath3%" /f
reg delete "%jj2regpath4%" /f
reg delete "%jj2regpath5%" /f
reg delete "%jj2regpath6%" /f
reg delete "%jj2regpath7%" /f

rem Jazz Jackrabbit 2 - The Christmas Chronicles

set "jj2tccregpath1=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Epic MegaGames\Jazz Jackrabbit 2 Christmas Chronicles '99"
set "jj2tccregpath2=HKCU\SOFTWARE\Epic MegaGames\Christmas Chronicles '99"
set "jj2tccregpath3=HKCU\SOFTWARE\Epic MegaGames\Jazz Jackrabbit 2 Christmas Chronicles '99"
set "jj2tccregpath4=HKLM\SOFTWARE\WOW6432Node\Epic MegaGames\Christmas Chronicles '99"
set "jj2tccrootdir=%gamerootdir%\Jazz Jackrabbit 2 CC"

rem Delete log file
del "%jj2tccrootdir%\*.log"

rem Delete ‘Jazz Creation Station’ configuration
del "%jj2tccrootdir%\Jcs.ini"

rem Delete configuration
del "%jj2tccrootdir%\*.CFG"

rem Delete savegames
del "%jj2tccrootdir%\SAVEGAME*"

rem Delete registry keys
reg delete "%jj2tccregpath1%" /f
reg delete "%jj2tccregpath2%" /f
reg delete "%jj2tccregpath3%" /f
reg delete "%jj2tccregpath4%" /f

rem Jotun - Valhalla Edition

set "jvelldir=%userprofile%\AppData\LocalLow\Thunder Lotus Games\Jotun"
set "jveregpath=HKCU\Software\Thunder Lotus Games\Jotun"

rem Delete LocalLow folder
rd /q /s "%jvelldir%"

rem Delete registry key
reg delete "%jveregpath%" /f

rem L’Amerzone

set "lamerzonerootdir=%gamerootdir%\AmerZone"

rem Delete savegames
del "%lamerzonerootdir%\*.bin"

rem Lands Of Lore - The Throne of Chaos
rem GOG edition, DOSBox emulation

set "lolttocrootdir=%gamerootdir%\Lands Of Lore"

rem Delete DOSBox log file
del "%lolttocrootdir%\DOSBOX\stdout*"

rem Delete DOSBox configuration
del "%lolttocrootdir%\dosboxLOL1.conf"

rem Delete temporary level file, configuration and savegames
del /q "%lolttocrootdir%\cloud_saves\*"

rem Layers of Fear

set "loflldir=%userprofile%\AppData\LocalLow\Bloober Team\Layers of Fear"
set "lofregpath=HKCU\SOFTWARE\Bloober Team\Layers of Fear"

rem Delete registry key
reg delete "%lofregpath%" /f

rem Delete LocalLow folder
rd /q /s "%loflldir%"

rem Legacy of Kain: Soul Reaver

set "loksrdir=%gamerootdir%\Legacy of Kain Soul Reaver"
set "loksrregpath=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Crystal Dynamics\Legacy of Kain: Soul Reaver"

rem Delete savegame file
del "%loksrdir%\*.her"

rem Delete registry key
reg delete "%loksrregpath%" /f

rem Mafia

set "mafiaregpath=HKCU\SOFTWARE\Illusion Softworks\Mafia"
set "mafiarootdir=%gamerootdir%\Mafia"

rem Delete log file
del "%mafiarootdir%\log.txt"

rem Delete registry key
reg delete "%mafiaregpath%" /f

rem Delete savegame files
del /q "%mafiarootdir%\savegame\*"

rem Master Spy

set "masterspydir=%localappdata%\Master Spy"

rem Delete local Master Spy directory
rd /q /s "%masterspydir%"

rem Medal of Honor - Pacific Assault

set "mohpadir=%userprofile%\Documents\EA Games\Medal of Honor Pacific Assault(tm)"
set "mohparegkeypath=HKCU\SOFTWARE\EA Games\Medal of Honor Pacific Assault"

rem Delete registry key
reg delete "%mohparegkeypath%" /f

rem Delete folder
rd /q /s "%mohpadir%"

rem Metal Gear

set "mgrootdir=%gamerootdir%\Metal Gear"

rem Delete DirectX configuration
del "%mgrootdir%\dxcfg.ini"

rem Delete configuration
del "%mgrootdir%\settings.ini"

rem Delete savegame data
del /q "%mgrootdir%\SaveData\*"

rem Metal Gear Solid

set "mgsregpath=HKCU\SOFTWARE\Metal Gear Solid"
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

rem Delete registry key
reg delete "%mgsregpath%" /f

rem Metro 2033 Redux

set "m2033dir=%userprofile%\Documents\4A Games\Metro Redux"
set "m2033laddir=%localappdata%\4A Games\Metro Redux"

rem Delete Metro Redux directory
rd /q /s "%m2033dir%"

rem Delete local AppData directory
rd /q /s "%m2033laddir%"

rem Delete registry key
reg delete "HKCU\Software\4A-Games\Metro Redux" /f

rem Mirror’s Edge

set "medir=%userprofile%\Documents\EA Games\Mirror's Edge"

rem Delete Mirror’s Edge directory
rd /q /s "%medir%"

rem Mount & Blade

set "mbaddir=%appdata%\Mount&Blade"
set "mbrootdir=%gamerootdir%\Mount and Blade"
set "mbsavedir=%userprofile%\Documents\Mount&Blade Savegames"

rem Delete savegame folder
rd /q /s "%mbsavedir%"

rem Delete Mount & Blade AppData folder
rd /q /s "%mbaddir%"

rem Delete log file
del "%mbrootdir%\rgl_log.txt"

rem Delete Mount & Blade registry key
reg delete "HKCU\SOFTWARE\MountAndBladeKeys" /f

rem Mount & Blade Warband

set "mbwaddir=%appdata%\Mount&Blade Warband"
set "mbwuserdir=%userprofile%\Documents\Mount&Blade Warband"
set "mbwrootdir=%gamerootdir%\Mount and Blade - Warband"
set "mbwsavedir=%userprofile%\Documents\Mount&Blade Warband Savegames"

rem Delete Mount & Blade Warband user directory
rd /q /s "%mbwuserdir%"

rem Delete Mount & Blade Warband log file
del "%mbwrootdir%\rgl_log.txt"

rem Delete Mount & Blade Warband registry key
reg delete "HKCU\SOFTWARE\MountAndBladeWarbandKeys" /f

rem Delete Mount & Blade Warband AppData directory
rd /q /s "%mbwaddir%"

rem Delete Mount & Blade Warband savegame directory
rd /q /s "%mbwsavedir%"

rem Never Alone

set "nadir=%userprofile%\AppData\LocalLow\E-Line Media\Never Alone"
set "naregpath=HKCU\SOFTWARE\E-Line Media\Never Alone"
set "narootdir=%gamerootdir%\Never Alone"

rem Delete log files
del "%narootdir%\Never_Alone_Data\*.log"
del "%narootdir%\Never_Alone_Data\*.txt"

rem Delete registry key
reg delete "%naregpath%" /f

rem Delete LocalLow folder
rd /q /s "%nadir%"

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

set "onntregpath=HKCU\Software\Oddworld Inhabitants, Inc.\Oddworld New 'n' Tasty"
set "onntrootdir=%gamerootdir%\Oddworld - New 'n' Tasty"

rem Delete all files in savegame folder
del /q "%onntrootdir%\SaveGame\*"

rem Delete Unity log file
del "%onntrootdir%\NNT_Data\output_log.txt"

rem Delete registry key
reg delete "%onntregpath%" /f

rem Omikron: The Nomad Soul

set "otnsrootdir=%gamerootdir%\Omikron - The Nomad Soul"

rem Delete configuration, keybinds and savegames
del "%otnsrootdir%\IAM\GAMES"

rem Open Arena

set "oaaddir=%appdata%\OpenArena"
set "oarootdir=%gamerootdir%\Open Arena"

rem Delete Open Arena AppData folder
rd /q /s "%oaaddir%"

rem Delete log file
del "%oarootdir%\stderr.txt"

rem Outlast

set "outlastdir=%userprofile%\Documents\My Games\Outlast"

rem Delete Outlast user directory
rd /q /s "%outlastdir%"

rem Painkiller

set "pkregpath1=HKCU\Software\PeopleCanFly\PainEditor"
set "pkregpath2=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\PeopleCanFly\Painkiller"
set "pkregpath3=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Aureal"
set "pk1rootdir=%gamerootdir%\Painkiller Black"

rem Delete configuration file
del "%pk1rootdir%\Bin\config.ini"

rem Delete savegame folders and savegames
rd /q /s "%pk1rootdir%\SaveGames"

rem Delete registry key
reg delete "%pkregpath1%" /f
reg delete "%pkregpath2%" /f
reg delete "%pkregpath3%" /f

rem Penumbra: Overture

set "poverturedir=%userprofile%\Documents\Penumbra Overture"

rem Delete keybinds, log files, settings and savegames
rd /q /s "%poverturedir%"

rem Penumbra: Black Plague
rem Penumbra: Requiem

set "penumbradir=%userprofile%\Documents\Penumbra"

rem Delete keybinds, log files, savegames and settings
rd /q /s "%penumbradir%"

rem Planescape: Torment

set "pstrootdir=%gamerootdir%\Planescape Torment"

rem Delete save folder
rd /q /s "%pstrootdir%\save"

rem Delete cache files
del /q "%pstrootdir%\cache\*"

rem Delete configuration file
del "%pstrootdir%\Torment.ini"

rem Delete log files
del "%pstrootdir%\*.log"

rem Delete error log file
del "%pstrootdir%\*.err"

rem Port Royale

set "portroyalerootdir=%gamerootdir%\Port Royale"

rem Delete log files
del "%portroyalerootdir%\*.2DL"

rem Delete player .aim files
del "%portroyalerootdir%\Run\Player*"

rem Delete options file
del "%portroyalerootdir%\Save\*.sav"

rem Delete savegames
del "%portroyalerootdir%\Save\*.mrk"

rem POSTAL Plus
rem Retail version

set "postalrootdir=%gamerootdir%\Postal2STP\PostalClassic&Uncut"

rem Delete level files
del "%postalrootdir%\levels\*.rgn"
del "%postalrootdir%\levels\*.rlm"

rem Delete configuration file
del "%postalrootdir%\*.ini"

rem Delete savegames and highscores
del "%postalrootdir%\res\SaveGame\*.gme"

rem POSTAL
rem Steam version

rem Note: Cannot be launched without Steam client

set "postalsteamaddir=%appdata%\RunningWithScissors\Postal Plus"

rem Delete configuration file
del "%postalsteamaddir%\*.INI"

rem Delete savegames
del "%postalsteamaddir%\steamcloud\*.gme"

rem Delete savegames and remote cache file from Steam’s userdata folder
rem
rem This section is broken. Need to find out how to programatically get the
rem userdata user ID. In this case the user ID is simply replaced with an
rem asterisk for ease of use. As far as I know, Steam app IDs in contrary to
rem user IDs are static, so it should be relatively safe to use app ID 232770.

rem del "C:\Program Files (x86)\Steam\userdata\*\232770\*.vdf"
rem del "C:\Program Files (x86)\Steam\userdata\*\232770\remote\*.gme"

rem POSTAL 2
rem Retail version

set "postal2rootdir=%gamerootdir%\Postal2STP"

rem Delete log files
del "%postal2rootdir%\System\*.log"

rem Removing the uninstall log file is a bad idea, since this prevents you from
rem uninstalling the Retail version due to information in uninstal.log
rem del "%postal2rootdir%\*.log"

rem Delete Unreal level editor configuration file
del "%postal2rootdir%\System\unrealed.ini"

rem Delete Unreal level editor map files
rem
rem Whenever you use the Unreal level editor, it leaves behind a log file, a
rem configuration file and when you decide to save a map you worked on, map
rem files. Deleting all map files with a wildcard doesn’t really make sense
rem because this erases all map files, not just the ones left behind by the
rem Unreal level editor. As a result, I decided to comment out the following
rem section, because I doubt its usefulness.
rem
rem del "%postal2rootdir%\Maps\*.fuk"

rem Delete configuration, keybinds and savegame information
del "%postal2rootdir%\System\Postal2.ini"
del "%postal2rootdir%\System\SavedGameInfo.ini"
del "%postal2rootdir%\System\User.ini"

rem Delete savegames
del "%postal2rootdir%\Save\*.usa"

rem POSTAL 2 - Apocalypse Weekend
rem Retail version

set "postal2awrootdir=%gamerootdir%\Postal2STP\ApocalypseWeekend"

rem Delete log files
del "%postal2awrootdir%\System\*.log"

rem Delete Unreal level editor configuration file
del "%postal2awrootdir%\System\unrealed.ini"

rem Delete configuration, keybinds and savegame information
del "%postal2awrootdir%\System\ApocalypseWeekend.ini"
del "%postal2awrootdir%\System\Postal2.ini"
del "%postal2awrootdir%\System\SavedGameInfo.ini"
del "%postal2awrootdir%\System\User.ini"

rem Delete savegames
del "%postal2awrootdir%\AWSave\*.usa"

rem POSTAL 2
rem Steam version

set "postal2steamrootdir=%steamdefaultlibdir%\POSTAL2Complete"

rem Delete log file
del "%postal2steamrootdir%\System\*.log"

rem Delete configuration, keybinds, savegame information and entry fix file
del "%postal2steamrootdir%\System\EntryFix.ini"
del "%postal2steamrootdir%\System\Postal2.ini"
del "%postal2steamrootdir%\System\SavedGameInfo.ini"
del "%postal2steamrootdir%\System\User.ini"

rem Delete savegames
del "%postal2steamrootdir%\Save\*.usa"

rem POSTAL 2 - Paradise Lost
rem Steam version

set "postal2plsteamrootdir=%steamdefaultlibdir%\POSTAL2Complete\Paradise Lost"

rem Delete log file
del "%postal2plsteamrootdir%\System\*.log"

rem Backup configuration files
del "%postal2plsteamrootdir%\System\EntryFix.ini"
del "%postal2plsteamrootdir%\System\ParadiseLost.ini"
del "%postal2plsteamrootdir%\System\SavedGameInfo.ini"
del "%postal2plsteamrootdir%\System\User.ini"

rem Delete savegames
del "%postal2plsteamrootdir%\PLSave\*.usa"

rem POSTAL 2 - Share The Pain
rem Steam version

set "postal2stpsteamrootdir=%steamdefaultlibdir%\POSTAL2Complete\ShareThePain"

rem Delete log file
del "%postal2stpsteamrootdir%\System\*.log"

rem Delete configuration files
del "%postal2stpsteamrootdir%\System\Postal2MP.ini"
del "%postal2stpsteamrootdir%\System\User.ini"

rem POSTAL Redux
rem Steam version

set "postalreduxdir=%localappdata%\PostalREDUX"

rem Delete local AppData folder
rd /q /s "%postalreduxdir%"

rem Quake

set "nglideconfigregpath=HKCU\SOFTWARE\Zeus Software\nGlide"
set "q1rootdir=%gamerootdir%\Quake"

rem Delete DOSBox log file
del "%q1rootdir%\DOSBox\stdout*"

rem Delete configuration files
del "%q1rootdir%\id1\*.cfg"

rem Delete savegames
del "%q1rootdir%\id1\*.SAV"

rem Quake mission pack: Scourge of Armagon

rem Delete configuration files
del "%q1rootdir%\hipnotic\*.cfg"

rem Delete savegames
del "%q1rootdir%\hipnotic\*.SAV"

rem Quake mission pack 2: Dissolution of Eternity

rem Delete configuration files
del "%q1rootdir%\rogue\*.CFG"

rem Delete savegames
del "%q1rootdir%\rogue\*.SAV"

rem QuakeWorld

rem Delete configuration files
del "%q1rootdir%\qw\*.cfg

rem Delete nGlide configuration registry key
reg delete "%nglideconfigregpath%" /f

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

set "redfactionregpath=HKCU\SOFTWARE\Volition\Red Faction"
set "redfactionrootdir=%gamerootdir%\Red Faction"

rem Delete savegames
del /q "%redfactionrootdir%\savegame\*.svl"

rem Delete configuration file
del "%redfactionrootdir%\*.cfg"

rem Delete D3D file
del "%redfactionrootdir%\*.id"

rem Delete banlist
del "%redfactionrootdir%\banlist.txt"

rem Delete console history
del "%redfactionrootdir%\console_history"

rem Delete registry key
reg delete "%redfactionregpath%" /f

rem Remothered - Tormented Fathers

set "rtfladdir=%localappdata%\Remothered"

rem Delete Remothered directory
rd /q /s "%rtfladdir%"

rem Ritual of the Moon

set "rotmlldir=%userprofile%\AppData\LocalLow\Kara Stone\R o t M"
set "rotmregpath=HKCU\SOFTWARE\Kara Stone\R o t M"

rem Delete LocalLow folder
rd /q /s "%rotmlldir%"

rem Delete registry key
reg delete "%rotmregpath%" /f

rem RollerCoaster Tycoon Deluxe

set "rctdregpath=HKLM\SOFTWARE\WOW6432Node\Fish Technology Group\RollerCoaster Tycoon Setup"
set "rctdrootdir=%gamerootdir%\RollerCoaster Tycoon Deluxe"

rem Delete CSS0.DAT file
del "%rctdrootdir%\Data\CSS0.DAT"

rem Delete screenshots
del "%rctdrootdir%\*.PCX"

rem Delete configuration
del "%rctdrootdir%\Data\*.cfg"

rem Delete savegames
del "%rctdrootdir%\Saved Games\*.SV4"

rem Delete registry key
rem Throws an ‘Access denied’ message; therefore commented out
rem reg delete "%rctdregpath%" /f

rem Runo

set "runolldir=%userprofile%\AppData\LocalLow\Kratti\Runo"
set "runoregpath=HKCU\SOFTWARE\Kratti\Runo"

rem Delete LocalLow folder
rd /q /s "%runolldir%"

rem Delete registry key
reg delete "%runoregpath%" /f

rem S.T.A.L.K.E.R. Чистое Небо
rem English title: S.T.A.L.K.E.R. Clear Sky

set "scsdir=%userprofile%\Documents\Stalker-STCS"
set "scsregpath=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\GSC Game World\STALKER-STCS"

rem Delete S.T.A.L.K.E.R. Clear Sky user directory
rd /q /s "%scsdir%"

rem Delete registry key
reg delete "%scsregpath%" /f

rem S.T.A.L.K.E.R. Shadow of Chernobyl

set "sshocdir=%userprofile%\Documents\Stalker-SHOC"
set "sshocregkeypath=HKLM\SOFTWARE\WOW6432Node\GSC Game World\STALKER-SHOC"

rem Delete registry key
reg delete "%sshocregkeypath%" /f

rem Delete S.T.A.L.K.E.R. Shadow of Chernobyl user directory
rd /q /s "%sshocdir%"

rem Sacred Gold

set "sacredrootdir=%gamerootdir%\Sacred Gold"

rem Delete log files
del "%sacredrootdir%\*.log"

rem Delete exported characters and savegames
del /q "%sacredrootdir%\save\*"

rem Delete configuration files
del "%sacredrootdir%\*.cfg"

rem Delete GLOBAL.TXT
del "%sacredrootdir%\GLOBAL.TXT"

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
del /q "%sstferootdir%\Players\*.plr"

rem Delete console history
del "%sstferootdir%\Temp\ConsoleHistory.txt"

rem Delete persistent symbol file
del "%sstferootdir%\Scripts\PersistentSymbols.ini"

rem Delete all savegames from player profile 0
del /q "%sstferootdir%\SaveGame\Player0\*"
del /q "%sstferootdir%\Savegame\Player0\Quick\*"

rem Delete .vis files
del /q "%sstferootdir%\Levels\*.vis"

rem Serious Sam: The Second Encounter

set "gamespyregpath=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\GameSpy\games"
set "sstseregpath=HKCU\SOFTWARE\CroTeam"
set "sstserootdir=%gamerootdir%\Serious Sam The Second Encounter"

rem Delete log files
del "%sstserootdir%\*.log"

rem Delete SeriousSkaStudio files
del "%sstserootdir%\*.aal"
del "%sstserootdir%\*.aml"
del "%sstserootdir%\*.asl"
del "%sstserootdir%\*.ba"
del "%sstserootdir%\*.bm"
del "%sstserootdir%\*.bs"
del "%sstserootdir%\*.smc"

rem Delete dec.txt
del "%sstserootdir%\Bin\*.txt"

rem Delete .RPT files
del "%sstserootdir%\Bin\*.RPT"

rem Delete control files
del "%sstserootdir%\Controls\Controls*"

rem Delete GMS file
del "%sstserootdir%\Data\*.gms"

rem Delete demos
del "%sstserootdir%\Demos\Demo*"

rem Delete .vis files
del "%sstserootdir%\Levels\LevelsMP\*.vis"

rem Delete console history
del "%sstserootdir%\Temp\*.txt"

rem Delete temporary demos
del "%sstserootdir%\Temp\*.dem"

rem Delete screenshots
del "%sstserootdir%\ScreenShots\*.tga

rem Delete .plr files
del "%sstserootdir%\Players\*.plr"

rem Delete persistent symbols file, which contains setting values
del "%sstserootdir%\Scripts\PersistentSymbols.ini"

rem Delete savegame folder
rd /q /s "%sstserootdir%\SaveGame"

rem Delete registry keys
reg delete "%gamespyregpath%" /f
reg delete "%sstseregpath%" /f

rem Sludge Life

set "sludgelifelldir=%userprofile%\AppData\LocalLow\TerriVellmann\SludgeLife"
set "sludgeliferegpath=HKCU\Software\TerriVellmann\SludgeLife"
set "sludgeliferootdir=%gamerootdir%\Sludge Life"

rem Delete pictures
del "%sludgeliferootdir%\PICS\*.png"

rem Delete savegame
del "%sludgeliferootdir%\save.txt"

rem Delete local low directory
rd /q /s "%sludgelifelldir%"

rem Delete registry key
reg delete "%sludgeliferegpath%" /f

rem Soldiers: Heroes of World War II

set "showw2regkeypath1=HKLM\SOFTWARE\WOW6432Node\Codemasters\Soldiers"
set "showw2regkeypath2=HKLM\SOFTWARE\WOW6432Node\Codemasters\Soldiers - Heroes of World War II"
set "showw2rootdir=%gamerootdir%\Soldiers - Heroes of World War II"

rem Delete log file
del "%showw2rootdir%\*.log"

rem Delete registry keys
reg delete "%showw2regkeypath1%" /f
reg delete "%showw2regkeypath2%" /f

rem Delete profile folder
rd /q /s "%showw2rootdir%\profiles"

rem SOMA

set "somadir=%userprofile%\Documents\My Games\Soma"

rem Delete the Soma folder. Files here include configuration, log files,
rem an empty first start flag, profile folders which in turn contain savegames,
rem user bindings and user settings

rd /q /s "%somadir%"

rem Spear of Destiny
rem GOG edition, DOSBox emulation

set "sodrootdir=%gamerootdir%\Spear of Destiny"

rem Delete DOSBox log file
del "%sodrootdir%\DOSBOX\stdout*"

rem Delete folders M1, M2, M3
rd /q /s "%sodrootdir%\cloud_saves\M1"
rd /q /s "%sodrootdir%\cloud_saves\M2"
rd /q /s "%sodrootdir%\cloud_saves\M3"

rem SPY Fox - Dry Cereal

set "sfdcsavedir=C:\hegames"

rd /q /s "%sfdcsavedir%"

rem Sudden Strike

set "suddenstrikerootdir=%gamerootdir%\Sudden Strike"

rem Delete savegames
rd /q /s "%suddenstrikerootdir%\SaveGames"

rem Delete .ini file
del "%suddenstrikerootdir%\sudtest.ini"

rem Delete ratings data
del "%suddenstrikerootdir%\ratings\*.rtc"

rem Sudden Strike - Resource War

set "ssrwrootdir=%gamerootdir%\Sudden Strike Resource War"

rem Delete configuration
del "%ssrwrootdir%\sudtest.ini"

rem Delete edit3 configuration
del "%ssrwrootdir%\Edit3.ini"

rem Delete edit3 maps
rd /q /s "%ssrwrootdir%\maps.src"

rem Delete savegames folder
rd /q /s "%ssrwrootdir%\plr\savegames"

rem Sudden Strike II

set "edit3regpath=HKCU\SOFTWARE\Fireglow\edit3"
set "suddenstrike2rootdir=%gamerootdir%\Sudden Strike 2"

rem Delete edit3 configuration
del "%suddenstrike2rootdir%\Edit3.ini"

rem Delete edit3 maps
rd /q /s "%suddenstrike2rootdir%\maps.src"

rem Delete configuration
del "%suddenstrike2rootdir%\sudtest.ini"

rem Delete savegames folder
rd /q /s "%suddenstrike2rootdir%\plr\savegames"

rem Delete edit3 registry key
reg delete "%edit3regpath%" /f

rem Sunless Sea

set "sunlesslldir=%userprofile%\AppData\LocalLow\Failbetter Games\Sunless Sea"
set "sunlessregpath=HKCU\SOFTWARE\Failbetter Games\Sunless Sea"

rem Delete Sunless Sea folder
rd /q /s "%sunlesslldir%"

rem Delete registry key
reg delete "%sunlessregpath%" /f

rem SuperTux

set "supertuxdir=%appdata%\SuperTux"

rem Delete SuperTux AppData folder
rd /q /s "%supertuxdir%"

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
del "%syberiarootdir%\debug.log"

rem Delete Syberia savegame directory
rd /q /s "%syberiasavedir%"

rem Syberia II

set "syb2rootdir=%gamerootdir%\Syberia 2"
set "syb2savedir=%userprofile%\Documents\Syberia 2 Saves"

rem Delete Syberia II debug log file
del "%syb2rootdir%\debug.log"

rem Delete Syberia II savegame directory
rd /q /s "%syb2savedir%"

rem System Shock
rem GOG edition, DOSBox emulation
rem
rem Known as ‘System Shock - Classic Edition’

set "sscerootdir=%gamerootdir%\System Shock - Classic Edition"

rem Delete DOSBox log file
del "%sscerootdir%\dosbox_windows\stdout*"

rem Delete configuration
del "%sscerootdir%\SSHOCK\CYB*"

rem Delete savegames
del "%sscerootdir%\SSHOCK\DATA\CURRSAVE*"
del "%sscerootdir%\SSHOCK\DATA\SAVGAM*"

rem Terraria

set "terrariadir=%userprofile%\Documents\My Games\Terraria"
set "terrariaregpath=HKCU\SOFTWARE\Terraria"
set "terrariarootdir=%gamerootdir%\Terraria"

rem Delete Terraria registry key (which, as far as I know is empty)
reg delete "%terrariaregpath%" /f

rem Delete ban list
del "%terrariarootdir%\banlist.txt"

rem Delete Terraria folder
rd /q /s "%terrariadir%"

rem The Alto Collection

set "taclldir=%userprofile%\AppData\LocalLow\Team Alto"
set "tacregpath=HKCU\SOFTWARE\Team Alto\The Alto Collection"

rem Delete analytical information and log file
rd /q /s "%taclldir%"

rem Delete configuration and savegame data
reg delete "%tacregpath%" /f

rem The Cat Lady

set "tclsavedir=%userprofile%\Saved Games\The Cat Lady"

rem Delete savegame directory
rd /q /s "%tclsavedir%"

rem The Elder Scrolls: Arena
rem GOG edition, DOSBox emulation

set "tesarenarootdir=%gamerootdir%\Arena"

rem Delete DOSBox log file
del "%tesarenarootdir%\DOSBOX\stdout*"

rem Delete DOSBox configuration file
del "%tesarenarootdir%\dosbox_arena.conf"

rem Delete data
del /q "%tesarenarootdir%\cloud_saves\*"

rem The Elder Scrolls III: Morrowind

set "tes3edregpath=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Bethesda Softworks\TES3 Editor"
set "tes3regpath=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Bethesda Softworks\Morrowind"
set "tes3rootdir=%gamerootdir%\Morrowind"

rem Delete savegames
del /q "%tes3rootdir%\Saves\*.ess"

rem Delete configuration file
del "%tes3rootdir%\Morrowind.ini"

rem Delete journal
del "%tes3rootdir%\Journal.htm"

rem Delete warning log
del "%tes3rootdir%\Warnings.txt"

rem Delete program flow log
del "%tes3rootdir%\ProgramFlow.txt"

rem Delete registry key
reg delete "%tes3regpath%" /f
reg delete "%tes3edregpath%" /f

rem The Infectious Madness of Doctor Dekker

set "timoddaddir=%appdata%\timodd"
set "timoddrootdir=%gamerootdir%\The Infectious Madness of Doctor Dekker"

rem Delete AppData folder
rd /q /s "%timoddaddir%"

rem Delete init.json settings file
del "%timoddrootdir%\resources\app\init.json"

rem The Longest Journey

set "tljregpath=HKCU\SOFTWARE\Paper Sun\Roots"
set "tljrootdir=%gamerootdir%\The Longest Journey"

rem Delete preferences file
del "%tljrootdir%\preferences.ini"

rem Delete savegame folders and savegames
rd /q /s "%tljrootdir%\Save"

rem Delete registry key
reg delete "%tljregpath%" /f

rem The Mystery of the Druids

set "tmotdregpath1=HKCU\SOFTWARE\House of Tales\Mystery of the Druids"
set "tmotdregpath2=HKCU\SOFTWARE\House of Tales\The Mystery of the Druids"
set "tmotdrootdir=%gamerootdir%\The Mystery of the Druids"

rem Delete log file
del "%tmotdrootdir%\*.log"

rem Delete lastgame file
del "%tmotdrootdir%\lastgame"

rem Delete registry keys
reg delete "%tmotdregpath1%" /f
reg delete "%tmotdregpath2%" /f

rem Delete savegames
del "%tmotdrootdir%\SAVEGAME\*.edd"

rem The Suicide of Rachel Foster

set "tsorfladdir=%localappdata%\Daedalic Entertainment GmbH\The Suicide of Rachel Foster"

rem Delete local AppData folder
rd /q /s "%tsorfladdir%"

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

rem This War of Mine

set "twomaddir=%appdata%\11bitstudios\This War Of Mine"
set "twomdocdir=%userprofile%\Documents\This War of Mine"

rem Delete AppData folder
rd /q /s "%twomaddir%"

rem Delete documents folder
rd /q /s "%twomdocdir%"

rem Through the Woods

set "ttwlldir=%userprofile%\AppData\LocalLow\Antagonist\ThroughTheWoods"
set "ttwregpath=HKCU\SOFTWARE\Antagonist\ThroughTheWoods"
set "ttwrootdir=%gamerootdir%\Through the Woods"

rem Delete analytical data
rd /q /s "%ttwlldir%"

rem Delete registry key
reg delete "%ttwregpath%" /f

rem Delete JSON files
del "%ttwrootdir%\Through the Woods_Data\*.json"

rem Tom Clancy’s Splinter Cell

set "tcscrootdir=%gamerootdir%\Splinter Cell"

rem Delete savegames
rd /q /s "%tcscrootdir%\Save"

rem Delete configuration files
del "%tcscrootdir%\system\SplinterCell.ini"
del "%tcscrootdir%\system\SplinterCellUser.ini"

rem Tomb Raider
rem GOG edition, DOSBox emulation

set "tombraiderrootdir=%gamerootdir%\Tomb Raider 1"

rem Delete log files
del "%tombraiderrootdir%\DOSBOX\*.log"
del "%tombraiderrootdir%\DOSBOX\*.txt"

rem Delete .3df files
del "%tombraiderrootdir%\TOMBRAID\*.3DF"

rem Delete settings
del "%tombraiderrootdir%\TOMBRAID\*.DAT"

rem Delete savegames
del "%tombraiderrootdir%\TOMBRAID\SAVEGAME*"

rem Тургор
rem English title: The Void

set "thevoiddir=%userprofile%\Documents\My Games\Void"
set "turgordir=%userprofile%\Documents\My Games\Turgor"
set "thevoidrootdir=%gamerootdir%\The Void"
set "turgorrootdir=%gamerootdir%\Turgor"
set "turgorpddir=%programdata%\Ice-pick Lodge\Turgor"
set "thevoidpddir=%programdata%\Ice-pick Lodge\Void"
set "turgorregpath=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Ice-pick Lodge\Turgor"
set "thevoidregpath=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Ice-pick Lodge\Void"

rem Remove settings file
del "%turgorrootdir%\data\settings.xml"
del "%thevoidrootdir%\data\settings.xml"

rem Remove ‘ProgramData’ folders
rd /q /s "%turgorpddir%"
rd /q /s "%thevoidpddir%"

rem Remove ‘My Games’ folders
rd /q /s "%turgordir%"
rd /q /s "%thevoiddir%"

rem Remove registry key
reg delete "%turgorregpath%" /f
reg delete "%thevoidregpath%" /f

rem Ultima I
rem GOG edition, DOSBox emulation

set "ultimarootdir=%gamerootdir%\Ultima 1"

rem Delete DOSBox log file
del "%ultimarootdir%\DOSBOX\stdout*"

rem Delete characters
del "%ultimarootdir%\cloud_saves\*.U1"

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

set "uplinkrootdir=%gamerootdir%\Uplink"

rem Delete all files in the users directory. Files here contain user file,
rem temporary user file backup, options file and a debug log
del /q "%uplinkrootdir%\users\*"

rem Delete all files in temporary user folder
del /q "%uplinkrootdir%\userstmp\*"

rem Vampire’s Dawn 2

set "vd2rootdir=%gamerootdir%\Vampire's Dawn 2"

rem Delete savegames
del /q "%vd2rootdir%\*.lsd"

rem Warhammer 40,000 - Rites of War

set "wh40krowrootdir=%gamerootdir%\WARHAMMER 40K Rites of War"

rem Delete row.int file
del "%wh40krowrootdir%\*.int"

rem Delete customised armies
del "%wh40krowrootdir%\save\Armies\*.arm"

rem Delete all user scenario files
del /q "%wh40krowrootdir%\userscen\*"

rem Delete savegames
del "%wh40krowrootdir%\save\*.csv"

rem What Remains of Edith Finch

set "wroefdir=%localappdata%\FinchGame"

rem Delete LocalAppData folder
rd /q /s "%wroefdir%"

rem Wiedźmin
rem English title: The Witcher

set "tw1dir=%userprofile%\Documents\The Witcher"
set "tw1laddir=%localappdata%\The Witcher"
set "tw1regpath=HKCU\Software\CD Projekt RED\Witcher"

rem Delete Witcher local appdata folder
rem Contains multiple folders and log files
rd /q /s "%tw1laddir%"

rem Delete Witcher user directory
rd /q /s "%tw1dir%"

rem Delete Witcher registry key
reg delete "%tw1regpath%" /f

rem Wolfenstein 3D
rem GOG version, DOSBox emulation

set "w3drootdir=%gamerootdir%\Wolfenstein 3D"

rem Delete DOSBox log file
del "%w3drootdir%\DOSBOX\stdout*"

rem Delete configuration and savegames
del "%w3drootdir%\cloud_saves\*.WL6"

rem Worms
rem GOG edition, DOSBox emulation
rem
rem Known as ‘Worms United’

set "wormsrootdir=%gamerootdir%\Worms United"

rem Delete DOSBox log file
del "%wormsrootdir%\DOSBOX\stdout*"

rem Delete DOSBox configuration file
del "%wormsrootdir%\dosboxWORMS.conf"

rem Delete configuration file
del "%wormsrootdir%\cloud_saves\*.CFG"

rem Worms Armageddon

set "waregpath=HKCU\SOFTWARE\Team17SoftwareLTD\WormsArmageddon"
set "warootdir=%gamerootdir%\Worms Armageddon"

rem Delete games data
del /q "%warootdir%\User\Games\*"

rem Delete team data
del /q "%warootdir%\User\Teams\*"

rem Delete custom.dat file
del "%warootdir%\custom.dat"

rem Delete land.dat file
del "%warootdir%\DATA\land.dat"

rem Delete registry key
reg delete "%waregpath%" /f

echo Worms Armageddon: Done.
echo.

rem X-COM: UFO Defense
rem GOG edition, DOSBox emulation

set "xcudrootdir=%gamerootdir%\X-COM UFO Defense"

rem Delete DOSBox log file
del "%xcudrootdir%\DOSBOX\stdout*"

rem Delete MVOL.DAT file
del "%xcudrootdir%\cloud_saves\*.DAT"

rem Delete savegame folders
rem
rem rd /q /s "%xcudrootdir%\cloud_saves\GAME*" throws the message
rem ‘The filename, directory name, or volume label syntax is incorrect.’
rem
rem Although it is bad practice, delete the entire cloud_saves folder instead
rem Another workaround would be:
rem rd /q /s "%xcudrootdir%\cloud_saves\GAME_1"
rem rd /q /s "%xcudrootdir%\cloud_saves\GAME_2"
rem rd /q /s "%xcudrootdir%\cloud_saves\GAME_3"
rem rd /q /s "%xcudrootdir%\cloud_saves\GAME_4"
rem rd /q /s "%xcudrootdir%\cloud_saves\GAME_5"
rem rd /q /s "%xcudrootdir%\cloud_saves\GAME_6"
rem rd /q /s "%xcudrootdir%\cloud_saves\GAME_7"
rem rd /q /s "%xcudrootdir%\cloud_saves\GAME_8"
rem rd /q /s "%xcudrootdir%\cloud_saves\GAME_9"
rem rd /q /s "%xcudrootdir%\cloud_saves\GAME_10"
rd /q /s "%xcudrootdir%\cloud_saves"

rem Delete SOUND folder
rd /q /s "%xcudrootdir%\cloud_saves\SOUND"

rem Delete DOSBox configuration file
del "%xcudrootdir%\dosbox_xcomud.conf"

rem XIII

set "xiiirootdir=%gamerootdir%\XIII"

rem Delete sound log
del "%xiiirootdir%\usnd_log.txt"

rem Delete video debug file
del "%xiiirootdir%\system\Debug_video.txt"

rem Delete XIII log file
del "%xiiirootdir%\system\XIII.log"

rem Delete XIII configuration file
del "%xiiirootdir%\system\XIII.ini"

rem Delete profiles, which also contain savegame data
del "%xiiirootdir%\Save\*.pro"

pause
