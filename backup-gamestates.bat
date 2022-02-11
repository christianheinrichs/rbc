@echo off

rem rbc: Gamestate backup script
rem Last modified on 11 February 2022

rem This script should backup profiles, settings and savegames, which are herein
rem collectively referred to as gamestate.

rem Write the path to your game directory here
set "gamerootdir="

title rbc: Gamestate backup script

mode con cols=100

echo Gamestate backup script running
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

set "ahwmfregpath=HKCU\SOFTWARE\Colestia\A Hand With Many Fingers"
set "ahwmfsavedir=%userprofile%\AppData\LocalLow\Colestia\A Hand With Many Fingers\saves"

rem Backup savegame file
if exist "%ahwmfsavedir%" (
	echo A Hand With Many Fingers: Backing up savegame file
	xcopy /e /i /y "%ahwmfsavedir%" "A Hand With Many Fingers\saves"
	echo.
) else (
	echo A Hand With Many Fingers: Savegame directory not found. Skipping...
	echo.
)

rem Export registry key into file
echo A Hand With Many Fingers: Backing up registry key
reg export "%ahwmfregpath%" "A Hand With Many Fingers\ahwmf.reg" /y

echo A Hand With Many Fingers: Done.
echo.

rem Alan Wake

set "awdir=%userprofile%\Documents\Remedy\AlanWake_GOG_Version"

rem Backup config file , keybinds, resolution settings and savegames
if exist "%awdir%" (
	echo Alan Wake: Backing up config file, keybinds, resolution settings, savegames
	xcopy /e /i /y "%awdir%" "Alan Wake"
	echo.
) else (
	echo Alan Wake: Directory not found. Skipping...
	echo.
)

echo Alan Wake: Done.
echo.

rem Alan Wake’s American Nightmare

set "awandir=%userprofile%\Documents\Remedy\AmericanNightmare_GOG_Version"

rem Backup config file (which contains Arcade score data), keybinds, resolution
rem settings and savegames
if exist "%awandir%" (
	echo Alan Wake's American Nightmare: Backing up config file, keybinds, resolution settings, savegames
	xcopy /e /i /y "%awandir%" "Alan Wake's American Nightmare"
	echo.
) else (
	echo Alan Wake's American Nightmare: Directory not found. Skipping...
	echo.
)

echo Alan Wake's American Nightmare: Done.
echo.

rem Aliens Versus Predator - Classic 2000

set "avpc2kdir1=%localappdata%\AvPGold"
set "avpc2kdir2=%localappdata%\Rebellion\AvP Classic"
set "avpc2krootdir=%gamerootdir%\Aliens versus Predator Classic"

rem Backup profiles, savegames and video configuration
if exist "%avpc2kdir2%" (
	echo Aliens Versus Predator - Classic 2000: Backing up profiles, savegames and video configuration
	xcopy /e /i /y "%avpc2kdir2%" "Aliens Versus Predator - Classic 2000\AvP Classic"
	echo.
) else (
	echo Aliens Versus Predator - Classic 2000: AvP Classic folder not found. Skipping...
	echo.
)

rem Backup Launcher.ini
if exist "%avpc2kdir1%" (
	echo Aliens Versus Predator - Classic 2000: Backing up Launcher.ini
	xcopy /e /i /y "%avpc2kdir1%" "Aliens Versus Predator - Classic 2000\AvPGold"
	echo.
) else (
	echo Aliens Versus Predator - Classic 2000: AvPGold folder not found. Skipping...
	echo.
)

rem Backup configuration
if exist "%avpc2krootdir%\CONFIG.CFG" (
	echo Aliens Versus Predator - Classic 2000: Backing up configuration
	copy "%avpc2krootdir%\CONFIG.CFG" "Aliens Versus Predator - Classic 2000"
	echo.
) else (
	echo Aliens Versus Predator - Classic 2000: Configuration not found. Skipping...
	echo.
)

echo Aliens Versus Predator - Classic 2000: Done.
echo.

rem Amnesia: A Machine For Pigs

set "aamfpdir=%userprofile%\Documents\Amnesia\Pig"

rem Backup Amnesia\Pig folder
if exist "%aamfpdir%" (
	echo Amnesia: A Machine For Pigs - Backing up profile folder, first start flag and main settings
	xcopy /e /exclude:exclude.txt /i /y "%aamfpdir%" "Amnesia - A Machine for Pigs"
	echo.
) else (
	echo Amnesia: A Machine For Pigs - Folder not found. Skipping...
	echo.
)

echo Amnesia: A Machine For Pigs - Done.
echo.

rem Amnesia: The Dark Descent

set "atdddir=%userprofile%\Documents\Amnesia\Main"

rem Backup Amnesia\Main folder
if exist "%atdddir%" (
	echo Amnesia: The Dark Descent - Backing up profile folder, first start flag and main settings
	xcopy /e /exclude:exclude.txt /i /y "%atdddir%" "Amnesia - The Dark Descent"
	echo.
) else (
	echo Amnesia: The Dark Descent - Folder not found. Skipping...
	echo.
)

echo Amnesia: The Dark Descent - Done.
echo.

rem Anachronox

set "anoxrootdir=%gamerootdir%\Anachronox"

rem Backup SAVE folder
if exist "%anoxrootdir%\anoxdata\SAVE" (
	echo Anachronox: Backing up SAVE folder
	xcopy /e /i /y "%anoxrootdir%\anoxdata\SAVE" "Anachronox\SAVE"
	echo.
) else (
	echo Anachronox: SAVE folder not found. Skipping...
	echo.
)

echo Anachronox: Done.
echo.

rem ANNO 1602

set "anno1602regpath=HKCU\SOFTWARE\ANNO1602"
set "anno1602rootdir=%gamerootdir%\ANNO1602"

rem Backup savegames
if exist "%anno1602rootdir%\Savegame" (
	echo ANNO 1602: Backing up savegames
	xcopy /e /i /y "%anno1602rootdir%\Savegame" "ANNO 1602\Savegame"
	echo.
) else (
	echo ANNO 1602: Savegame folder not found. Skipping...
	echo.
)

rem Backup Game.dat
if exist "%anno1602rootdir%\Game.dat" (
	echo ANNO 1602: Backing up Game.dat file
	copy "%anno1602rootdir%\Game.dat" "ANNO 1602"
	echo.
) else (
	echo ANNO 1602: Game.dat file not found. Skipping...
	echo.
)

rem Backup registry key
echo ANNO 1602: Backing up registry key
reg export "%anno1602regpath%" "ANNO 1602\anno1602.reg" /y

echo ANNO 1602: Done.
echo.

rem Baldur’s Gate

set "baldursgaterootdir=%gamerootdir%\Baldur's Gate"

rem Backup savegames
if exist "%baldursgaterootdir%\Save" (
	echo Baldur's Gate: Backing up savegames
	xcopy /e /i /y "%baldursgaterootdir%\Save" "Baldur's Gate\Save"
	echo.
) else (
	echo Baldur's Gate: Savegame folder not found. Skipping...
	echo.
)

rem Backup configuration file
if exist "%baldursgaterootdir%\Baldur.ini" (
	echo Baldur's Gate: Backing up configuration file
	xcopy /i /y "%baldursgaterootdir%\Baldur.ini" "Baldur's Gate"
	echo.
) else (
	echo Baldur's Gate: Configuration file not found. Skipping...
	echo.
)

rem Backup characters
if exist "%baldursgaterootdir%\Characters\*.chr" (
	echo Baldur's Gate: Backing up characters
	xcopy /e /i /y "%baldursgaterootdir%\Characters" "Baldur's Gate\Characters"
	echo.
) else (
	echo Baldur's Gate: Characters not found. Skipping...
	echo.
)

echo Baldur's Gate: Done.
echo.

rem Baldur’s Gate: Enhanced Edition

set "bgeedir=%userprofile%\Documents\Baldur's Gate - Enhanced Edition"

rem Backup savegames, ‘The Black Pits’ savegames, characters, character
rem biographies, portraits and the Baldur.lua script
if exist "%bgeedir%" (
	echo Baldur's Gate: Enhanced Edition - Backing up folder
	xcopy /e /i /y "%bgeedir%" "Baldur's Gate - Enhanced Edition"
	echo.
) else (
	echo Baldur's Gate: Enhanced Edition - Folder not found. Skipping...
	echo.
)

echo Baldur's Gate: Enhanced Edition - Done.
echo.

rem Barrow Hill - Curse of the Ancient Circle

set "bh1rootdir=%gamerootdir%\Barrow Hill - Curse of the Ancient Circle"

rem Backup savegames
if exist "%bh1rootdir%\*.sav" (
	echo Barrow Hill - Curse of the Ancient Circle: Backing up savegames
	xcopy /i /y "%bh1rootdir%\*.sav" "Barrow Hill - Curse of the Ancient Circle"
	echo.
) else (
	echo Barrow Hill - Curse of the Ancient Circle: Savegames not found. Skipping...
	echo.
)

rem Backup settings
if exist "%bh1rootdir%\*.mat" (
	echo Barrow Hill - Curse of the Ancient Circle: Backing up settings
	copy "%bh1rootdir%\*.mat" "Barrow Hill - Curse of the Ancient Circle"
	echo.
) else (
	echo Barrow Hill - Curse of the Ancient Circle: Settings not found. Skipping...
	echo.
)

echo Barrow Hill - Curse of the Ancient Circle: Done.
echo.

rem Battle Realms

set "br1regpath=HKCU\SOFTWARE\Liquid Entertainment\Battle Realms"
set "br1rootdir=%gamerootdir%\Battle Realms"

rem Backup savegames
if exist "%br1rootdir%\Saved Games\*.br1" (
	echo Battle Realms: Backing up savegames
	xcopy /e /i /y "%br1rootdir%\Saved Games" "Battle Realms\Saved Games"
	echo.
) else (
	echo Battle Realms: Savegames not found. Skipping...
	echo.
)

rem Backup configuration file
if exist "%br1rootdir%\*.ini" (
	echo Battle Realms: Backing up configuration file
	xcopy /i /y "%br1rootdir%\*.ini" "Battle Realms"
	echo.
) else (
	echo Battle Realms: Configuration file not found. Skipping...
	echo.
)

rem Backup registry key
echo Battle Realms: Backing up registry key
reg export "%br1regpath%" "Battle Realms\br1.reg" /y
echo.

rem Backup Serpent DLL file
if exist "%br1rootdir%\Scripts\Serpent 5E_F.dll" (
	if not exist "Battle Realms\Scripts" (
		echo Battle Realms: Backing up Serpent DLL file
		md "Battle Realms\Scripts"
		copy "%br1rootdir%\Scripts\Serpent 5E_F.dll" "Battle Realms\Scripts"
		echo.
	) else (
		echo Battle Realms: Backing up Serpent DLL file
		copy "%br1rootdir%\Scripts\Serpent 5E_F.dll" "Battle Realms\Scripts"
		echo.
	)
) else (
	echo Battle Realms: Serpent DLL file not found. Skipping...
	echo.
)

echo Battle Realms: Done.
echo.

rem Becherov

set "becherovregpath=HKCU\SOFTWARE\Inputwish\Becherov"
set "becherovrootdir=%gamerootdir%\Becherov"

rem Backup profile data
if exist "%becherovrootdir%\Data\Player\*.dat" (
	echo Becherov: Backing up profile data
	xcopy /i /y "%becherovrootdir%\Data\Player\*.dat" "Becherov\Data\Player"
	echo.
) else (
	echo Becherov: Profile data not found. Skipping...
	echo.
)

rem Backup registry key
echo Becherov: Backing up registry key
reg export "%becherovregpath%" "Becherov\becherov.reg" /y

echo Becherov: Done.
echo.

rem BioShock

set "bs1dir=%appdata%\Bioshock"
set "bs1sgdir=%userprofile%\Documents\Bioshock\SaveGames"

rem Backup savegames
if exist "%bs1sgdir%\*.bsb" (
	echo BioShock: Backing up savegames
	xcopy /e /i /y "%bs1sgdir%" "BioShock\SaveGames"
	echo.
) else (
	echo BioShock: Savegames not found. Skipping...
	echo.
)

rem Backup memory file, configuration and keybinds
if exist "%bs1dir%\*.ini" (
	echo BioShock: Backing up memory file, configuration and keybinds
	xcopy /e /i /y "%bs1dir%" "BioShock\AppData"
	echo.
) else (
	echo BioShock: .ini files not found. Skipping...
	echo.
)

echo BioShock: Done.
echo.

rem Blood Omen: Legacy of Kain

set "bolokregpath=HKCU\SOFTWARE\LegacyOfKain"
set "bolokrootdir=%gamerootdir%\Blood Omen"

rem Backup savegames
if exist "%bolokrootdir%\Saves\*.sav" (
	echo Blood Omen: Legacy of Kain - Backing up savegames
	xcopy /e /i /y "%bolokrootdir%\Saves" "Blood Omen - Legacy of Kain\Saves"
	echo.
) else (
	echo Blood Omen: Legacy of Kain - Savegames not found. Skipping...
	echo.
)

rem Backup configuration files and PTEMP.TMP
if exist "%bolokrootdir%\Cfg\*.cfg" (
	if exist "%bolokrootdir%\Cfg\*.TMP" (
		echo Blood Omen: Legacy of Kain - Backing up configuration files and PTEMP.TMP
		xcopy /e /i /y "%bolokrootdir%\Cfg\*.cfg" "Blood Omen - Legacy of Kain\Cfg"
		xcopy /e /i /y "%bolokrootdir%\Cfg\*.TMP" "Blood Omen - Legacy of Kain\Cfg"
		echo.
	)
) else (
	echo Blood Omen: Legacy of Kain - Configuration files and PTEMP.TMP not found. Skipping...
	echo.
)

rem Backup DirectX configuration
if exist "%bolokrootdir%\dxcfg.ini" (
	echo Blood Omen: Legacy of Kain - Backing up DirectX configuration
	xcopy /i /y "%bolokrootdir%\dxcfg.ini" "Blood Omen - Legacy of Kain"
	echo.
) else (
	echo Blood Omen: Legacy of Kain - DirectX configuration not found. Skipping...
	echo.
)

rem Backup registry key
echo Blood Omen: Legacy of Kain - Backing up registry key
reg export "%bolokregpath%" "Blood Omen - Legacy of Kain\bolok.reg" /y

echo Blood Omen: Legacy of Kain - Done.
echo.

rem Buddy Simulator 1984

set "bs1984datadir=%userprofile%\Documents\Buddy Simulator 1984"
set "bs1984regpath=HKCU\SOFTWARE\Not a Sailor Studios\Buddy Simulator 1984"
set "bs1984rootdir=%gamerootdir%\Buddy Simulator 1984"

rem Backup DATA folder
if exist "%bs1984datadir%" (
	echo Buddy Simulator 1984: Backing up data folder
	xcopy /e /i /y "%bs1984datadir%" "Buddy Simulator 1984\DATA"
	echo.
) else (
	echo Buddy Simulator 1984: Data folder not found. Skipping...
	echo.
)

rem Backup memories
if exist "%bs1984rootdir%\Buddy Simulator 1984_Data\StreamingAssets\Memories" (
	echo Buddy Simulator 1984: Backing up memories
	copy "%bs1984rootdir%\Buddy Simulator 1984_Data\StreamingAssets\Memories\*" "Buddy Simulator 1984\Memories"
	echo.
) else (
	echo Buddy Simulator 1984: Memories not found. Skipping...
	echo.
)

rem Export registry key into file
echo Buddy Simulator 1984: Backing up registry key
reg export "%bs1984regpath%" "Buddy Simulator 1984\buddy-sim-1984.reg" /y

echo Buddy Simulator 1984: Done.
echo.

rem Call of Cthulhu: Dark Corners of the Earth

set "cocdcotedir=%userprofile%\Documents\Bethesda\Call of Cthulhu"
set "cocdcoteregpath=HKCU\SOFTWARE\Bethesda Softworks\Call Of Cthulhu DCoTE"

rem Backup automatic save, options and manual savegames
if exist "%cocdcotedir%" (
	echo Call of Cthulhu: Dark Corners of the Earth - Backing up folder
	xcopy /e /i /y "%cocdcotedir%" "Call of Cthulhu - Dark Corners of the Earth"
	echo.
) else (
	echo Call of Cthulhu: Dark Corners of the Earth - Folder not found. Skipping...
	echo.
)

rem Backup registry key
reg export "%cocdcoteregpath%" "Call of Cthulhu - Dark Corners of the Earth\cocdcote.reg" /y

echo Call of Cthulhu: Dark Corners of the Earth - Done.
echo.

rem Cave Story

set "cavestoryrootdir=%gamerootdir%\Cave Story"

rem Copy profile data from the game’s root directory into ‘Cave Story’ folder
if exist "%cavestoryrootdir%\*.dat" (
	echo Cave Story: Backing up configuration and profile data
	xcopy /i /y "%cavestoryrootdir%\*.dat" "Cave Story"
	echo.
) else (
	echo Cave Story: Configuration and profile data not found. Skipping...
	echo.
)

rem Back up window.rect
if exist "%cavestoryrootdir%\*.rect" (
	echo Cave Story: Backing up window.rect
	copy "%cavestoryrootdir%\*.rect" "Cave Story"
	echo.
) else (
	echo Cave Story: window.rect not found. Skipping...
	echo.
)

echo Cave Story: Done.
echo.

rem Chaser

set "chaserrootdir=%gamerootdir%\Chaser"

rem Backup savegames
if exist "%chaserrootdir%\Save\*.sav" (
	echo Chaser: Backing up savegames
	xcopy /i /y "%chaserrootdir%\Save\*.sav" "Chaser\Save"
	echo.
) else (
	echo Chaser: Savegames not found. Skipping...
	echo.
)

rem Backup Users folder
if exist "%chaserrootdir%\Save\Users\*.cfg" (
	echo Chaser: Backing up user keybinds and settings
	xcopy /e /i /y "%chaserrootdir%\Save\Users" "Chaser\Save\Users"
	echo.
) else (
	echo Chaser: Configuration file not found. Skipping...
	echo.
)

echo Chaser: Done.
echo.

rem Crashday

set "crashdayrootdir=%gamerootdir%\Crashday"

rem Backup savegames and last user file
if exist "%crashdayrootdir%\savegame\*.sav" (
	echo Crashday: Backing up last user file and savegames
	xcopy /e /i /y "%crashdayrootdir%\savegame" "Crashday\savegame"
	echo.
) else (
	echo Crashday: Savegames not found. Skipping...
	echo.
)

rem Backup minigame highscores
if exist "%crashdayrootdir%\career\minigame\*.hig" (
	echo Crashday: Backing up minigame highscores
	xcopy /i /y "%crashdayrootdir%\career\minigame\*.hig" "Crashday\career\minigame"
	echo.
) else (
	echo Crashday: Minigame highscores not found. Skipping...
	echo.
)

rem Backup track highscores and replay file
if exist "%crashdayrootdir%\trkdata\tracks\*.hig" (
	echo Crashday: Backing up track highscores and replay file
	xcopy /i /y "%crashdayrootdir%\trkdata\tracks\*.hig" "Crashday\trkdata\tracks"
	copy "%crashdayrootdir%\trkdata\tracks\_!replay!_.trk" "Crashday\trkdata\tracks"
	echo.
) else (
	echo Crashday: Highscores not found. Skipping...
	echo.
)

rem Backup replays
if exist "%crashdayrootdir%\replays\*.rpl" (
	echo Crashday: Backing up replays
	xcopy /e /i /y "%crashdayrootdir%\replays" "Crashday\replays"
	echo.
) else (
	echo Crashday: Replays not found. Skipping...
	echo.
)

rem Backup configuration files
if exist "%crashdayrootdir%\contrldx.cfg" (
	if exist "%crashdayrootdir%\propsfx.cfg" (
		if exist "%crashdayrootdir%\sounddx.cfg" (
			echo Crashday: Backing up configuration files
			if not exist "Crashday" (
				md "Crashday"
				copy "%crashdayrootdir%\contrldx.cfg" "Crashday"
				copy "%crashdayrootdir%\propsfx.cfg" "Crashday"
				copy "%crashdayrootdir%\sounddx.cfg" "Crashday"
				echo.
			) else (
				copy "%crashdayrootdir%\contrldx.cfg" "Crashday"
				copy "%crashdayrootdir%\propsfx.cfg" "Crashday"
				copy "%crashdayrootdir%\sounddx.cfg" "Crashday"
				echo.
			)
		)
	)
) else (
	echo Crashday: Configuration files not found. Skipping...
	echo.
)

rem Backup quickchat file
if exist "%crashdayrootdir%\quickchat.txt" (
	echo Crashday: Backing up quickchat file
	md "Crashday"
	copy "%crashdayrootdir%\quickchat.txt" "Crashday"
	echo.
) else (
	copy "%crashdayrootdir%\quickchat.txt" "Crashday"
	echo.
)

echo Crashday: Done.
echo.

rem Dagon by H. P. Lovecraft

set "dagondir=%userprofile%\AppData\LocalLow\BitGolem\Dagon"
set "dagonregpath=HKCU\SOFTWARE\BitGolem\Dagon"

rem Backup savegame
if exist "%dagondir%\*.es3" (
	echo Dagon: Backing up savegame
	xcopy /i /y "%dagondir%\*.es3" "Dagon"
	echo.
) else (
	echo Dagon: Savegame not found. Skipping...
	echo.
)

rem Backup registry key
echo Dagon: Backing up registry key
reg export "%dagonregpath%" "Dagon\dagon.reg" /y
echo.

echo Dagon: Done.
echo.

rem Darkest Dungeon

set "darkestdir=%userprofile%\Documents\Darkest"

rem Copy JSON files into ‘Darkest Dungeon’ directory
if exist "%darkestdir%" (
	echo Darkest Dungeon: Backing up profiles and persistent options file
	xcopy /e /i /y "%darkestdir%" "Darkest Dungeon"
	echo.
) else (
	echo Darkest Dungeon: Folder not found. Skipping...
	echo.
)

echo Darkest Dungeon: Done.
echo.

rem Dear Devere

set "devererootdir=%gamerootdir%\Dear Devere"

rem Backup savegame
if exist "%devererootdir%\game\saves\*.save" (
	echo Dear Devere: Backing up savegames
	xcopy /i /y "%devererootdir%\game\saves\*" "Dear Devere\game\saves"
	echo.
) else (
	echo Dear Devere: Savegames not found. Skipping...
	echo.
)

rem Backup screenshots
if exist "%devererootdir%\*.png" (
	echo Dear Devere: Backing up screenshots
	xcopy /i /y "%devererootdir%\*.png" "Dear Devere"
	echo.
) else (
	echo Dear Devere: Screenshots not found. Skipping...
	echo.
)

echo Dear Devere: Done.
echo.

rem Diablo (Classic)

set "diablorootdir=%gamerootdir%\Diablo"

rem Backup savegame files
if exist "%diablorootdir%\*.sv" (
	echo "Diablo (Classic): Backing up savegame files"
	xcopy /i /y "%diablorootdir%\*.sv" "Diablo\Classic"
	echo.
) else (
	echo "Diablo (Classic): Savegames not found. Skipping..."
	echo.
)

echo Diablo (Classic): Done.
echo.

rem Diablo

rem Backup savegame files
if exist "%diablorootdir%\dx\*.sv" (
	echo Diablo: Backing up savegame files
	xcopy /i /y "%diablorootdir%\dx\*.sv" "Diablo\DX"
	echo.
) else (
	echo Diablo: Savegames not found. Skipping...
	echo.
)

rem Backup DirectX configuration
if exist "%diablorootdir%\dx\dxcfg.ini" (
	echo Diablo: Backing up DirectX configuration
	copy "%diablorootdir%\dx\dxcfg.ini" "Diablo\DX"
	echo.
) else (
	echo Diablo: DirectX configuration not found. Skipping...
	echo.
)

echo Diablo: Done.
echo.

rem Diablo: Hellfire

rem Backup savegame files
if exist "%diablorootdir%\hellfire\*.hsv" (
	echo Diablo: Hellfire - Backing up savegame files
	xcopy /i /y "%diablorootdir%\hellfire\*.hsv" "Diablo\Hellfire"
	echo.
) else (
	echo Diablo: Hellfire - Savegames not found. Skipping...
	echo.
)

echo Diablo: Hellfire - Done.
echo.

rem Diablo II

set "d2regpath=HKCU\SOFTWARE\Blizzard Entertainment\Diablo II"
set "d2rootdir=%gamerootdir%\Diablo II"
set "d2sgdir=%userprofile%\Saved Games\Diablo II"

rem Backup savegame files
if exist "%d2sgdir%\*.d2s" (
	echo Diablo II: Backing up savegame files
	xcopy /e /i /y "%d2sgdir%" "Diablo II\Saved Games"
	echo.
) else (
	echo Diablo II: Savegames not found. Skipping...
	echo.
)

rem Backup default.key file
if exist "%d2rootdir%\default.key" (
	echo Diablo II: Backing up default.key file
	copy "%d2rootdir%\default.key" "Diablo II"
	echo.
) else (
	echo Diablo II: default.key file not found. Skipping...
	echo.
)

rem Backup registry key
echo Diablo II: Backing up registry key
reg export "%d2regpath%" "Diablo II\d2.reg" /y

echo Diablo II: Done.
echo.

rem Die Gilde

set "gilderegpath=HKCU\SOFTWARE\Ahead Entertainment"
set "gilderootdir=%gamerootdir%\Die Gilde"

rem Backup savegames
if exist "%gilderootdir%\Resources\gamedata\saves\*.SAV" (
	echo Die Gilde: Backing up savegames
	xcopy /i /y "%gilderootdir%\Resources\gamedata\saves\*.SAV" "Die Gilde\Resources\gamedata\saves"
	echo.
) else (
	echo Die Gilde: Savegames not found. Skipping...
	echo.
)

rem Backup configuration
if exist "%gilderootdir%\game.ini" (
	echo Die Gilde: Backing up configuration
	xcopy /i /y "%gilderootdir%\game.ini" "Die Gilde"
	echo.
) else (
	echo Die Gilde: Configuration not found. Skipping...
	echo.
)

rem Backup registry key
echo Die Gilde: Backing up registry key
reg export "%gilderegpath%" "Die Gilde\gilde.reg" /y

echo Die Gilde: Done.
echo.

rem Die Völker
rem English title: Alien Nations

set "dievoelkerrootdir=%gamerootdir%\Alien Nations"

rem Backup configuration and savegame files
if exist "%dievoelkerrootdir%\Savegames" (
	echo Die Voelker: Backing up configuration and savegame files
	xcopy /e /i /y "%dievoelkerrootdir%\Savegames" "Die Voelker\Savegames"
	echo.
) else (
	echo Die Voelker: Savegames folder not found. Skipping...
	echo.
)

echo Die Voelker: Done.
echo.

rem Driver

set "driverrootdir=%gamerootdir%\Driver"

rem Backup highscores, replays and savegames
if exist "%driverrootdir%\Saves\*.BIN" (
	echo Driver: Backing up highscores, replays and savegames
	xcopy /e /i /y "%driverrootdir%\Saves" "Driver\Saves"
	echo.
) else (
	echo Driver: No replays or savegames found. Skipping...
	echo.
)

rem Backup temporary user replay data
if exist "%driverrootdir%\ReplayData\User\$TEMP$.CFG" (
	echo Driver: Backing up temporary user replay data

	if not exist "Driver\ReplayData\User" (
		md "Driver\ReplayData\User"
		copy "%driverrootdir%\ReplayData\User\$TEMP$.CFG" "Driver\ReplayData\User"
		copy "%driverrootdir%\ReplayData\User\$TEMP$.PADS" "Driver\ReplayData\User"
	) else (
		copy "%driverrootdir%\ReplayData\User\$TEMP$.CFG" "Driver\ReplayData\User"
		copy "%driverrootdir%\ReplayData\User\$TEMP$.PADS" "Driver\ReplayData\User"
	)

	echo.
) else (
	echo Driver: Temporary user replay data not found. Skipping...
	echo.
)

rem Backup start position file
if exist "%driverrootdir%\*.X" (
	echo Driver: Backing up start position file
	xcopy /i /y "%driverrootdir%\*.X" "Driver"
	echo.
) else (
	echo Driver: No start position file found. Skipping...
	echo.
)

rem Backup configuration
if exist "%driverrootdir%\CONFIG.DAT" (
	echo Driver: Backing up configuration

	if not exist "Driver" (
		md "Driver"
		copy "%driverrootdir%\CONFIG.DAT" "Driver"
	) else (
		copy "%driverrootdir%\CONFIG.DAT" "Driver"
	)

	echo.
) else (
	echo Driver: Configuration not found. Skipping...
	echo.
)

rem Dungeon Keeper 2

set "dk2rootdir=%gamerootdir%\Dungeon Keeper 2"
set "dk2confregpath=HKCU\SOFTWARE\Bullfrog Productions Ltd\Dungeon Keeper II"
set "dk2versionregpath=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Bullfrog Productions Ltd\Dungeon Keeper II"

rem Backup savegames
if exist "%dk2rootdir%\Data\Save\*.SAV" (
	echo Dungeon Keeper 2: Backing up savegames
	xcopy /e /i /y "%dk2rootdir%\Data\Save" "Dungeon Keeper 2\Save"
	echo.
) else (
	echo Dungeon Keeper 2: Savegames not found. Skipping...
	echo.
)

rem Backup highscores
if exist "%dk2rootdir%\Data\Settings\*.dat" (
	echo Dungeon Keeper 2: Backing up highscores
	xcopy /e /i /y "%dk2rootdir%\Data\Settings" "Dungeon Keeper 2\Data\Settings"
	echo.
) else (
	echo Dungeon Keeper 2: Highscores not found. Skipping...
	echo.
)

rem Backup configuration
echo Dungeon Keeper 2: Backing up configuration
reg export "%dk2confregpath%" "Dungeon Keeper 2\dk2-conf.reg" /y
echo.

rem Backup version number registry key
echo Dungeon Keeper 2: Backing up version number registry key
reg export "%dk2versionregpath%" "Dungeon Keeper 2\dk2-version.reg" /y

echo Dungeon Keeper 2: Done.
echo.

rem else Heart.Break()

set "ehbregpath=HKCU\SOFTWARE\Miman\Else Heartbreak"
set "ehbrootdir=%gamerootdir%\ElseHeartbreak"

rem Copy JSON savegame files into ‘Saves’ folder
if exist "%ehbrootdir%\ElseHeartbreak_Data\Saves\*.json" (
	echo "else Heart.Break(): Backing up JSON savegames folder"
	xcopy /i /y "%ehbrootdir%\ElseHeartbreak_Data\Saves\*.json" "Else Heartbreak\Saves"
	echo.
) else (
	echo "else Heart.Break(): Savegames not found. Skipping..."
	echo.
)

rem Export registry key. Settings are stored in them.
echo else Heart.Break(): Backing up registry key
reg export "%ehbregpath%" "Else Heartbreak\else-heartbreak.reg" /y

echo else Heart.Break(): Done.
echo.

rem Enigmatis - The Ghosts of Maple Creek

set "etgomcdir=%appdata%\Artifex Mundi\Enigmatis_TheGhostOfMapleCreek"

if exist "%etgomcdir%\CE\profile\*.prf" (
	echo Enigmatis - The Ghosts of Maple Creek: Backing up profile folder
	xcopy /e /i /y "%etgomcdir%\CE\profile" "Enigmatis - The Ghosts of Maple Creek\CE\profile"
	echo.
) else (
	echo Enigmatis - The Ghosts of Maple Creek: Profiles not found. Skipping...
	echo.
)

echo Enigmatis - The Ghosts of Maple Creek: Done.
echo.

rem Europa Universalis

set "eu1rootdir=%gamerootdir%\Europa Universalis"

rem Backup savegames
if exist "%eu1rootdir%\Scenarios\Save Games" (
	echo Europa Universalis: Backing up savegames
	xcopy /e /i /y "%eu1rootdir%\Scenarios\Save Games" "Europa Universalis\Scenarios\Save Games"
	echo.
) else (
	echo Europa Universalis: Savegame folder not found. Skipping...
	echo.
)

rem Backup configuration
if exist "%eu1rootdir%\*.eu" (
	echo Europa Universalis: Backing up configuration
	copy "%eu1rootdir%\*.eu" "Europa Universalis"
	echo.
) else (
	echo Europa Universalis: Configuration not found. Skipping...
	echo.
)

echo Europa Universalis: Done.
echo.

rem Europa Universalis II

set "eu2rootdir=%gamerootdir%\Europa Universalis 2"

rem Backup savegames
if exist "%eu2rootdir%\Scenarios\save games" (
	echo Europa Universalis II: Backing up savegames
	xcopy /e /i /y "%eu2rootdir%\Scenarios\save games" "Europa Universalis II\Scenarios\save games"
	echo.
) else (
	echo Europa Universalis II: Savegame folder not found. Skipping...
	echo.
)

rem Backup history file
if exist "%eu2rootdir%\history.txt" (
	echo Europa Universalis II: Backing up history file
	copy "%eu2rootdir%\history.txt" "Europa Universalis II"
	echo.
) else (
	echo Europa Universalis II: History file not found. Skipping...
	echo.
)

rem Backup configuration
if exist "%eu2rootdir%\*.eu" (
	echo Europa Universalis II: Backing up configuration
	copy "%eu2rootdir%\*.eu" "Europa Universalis II"
	echo.
) else (
	echo Europa Universalis II: Configuration not found. Skipping...
	echo.
)

rem Backup settings
if exist "%eu2rootdir%\settings.cfg" (
	echo Europa Universalis II: Backing up settings
	copy "%eu2rootdir%\settings.cfg" "Europa Universalis II"
	echo.
) else (
	echo Europa Universalis II: Settings not found. Skipping...
	echo.
)

echo Europa Universalis II: Done.
echo.

rem FaeFever

set "faefeverlldir=%userprofile%\AppData\LocalLow\MonkeyWizardEntertainment\FaeFever"
set "faefeverregpath=HKCU\SOFTWARE\MonkeyWizardEntertainment\FaeFever"

rem Backup savegames and settings
if exist "%faefeverlldir%" (
	echo FaeFever: Backing up savegames and settings
	xcopy /e /i /y "%faefeverlldir%\Save" "FaeFever\Save"
	echo.
) else (
	echo FaeFever: LocalLow directory not found. Skipping...
	echo.
)

rem Backup registry key
echo FaeFever: Backing up registry key
reg export "%faefeverregpath%" "FaeFever\faefever.reg" /y

echo FaeFever: Done.
echo.

rem Firewatch

set "fwlldir=%userprofile%\AppData\LocalLow\CampoSanto\Firewatch"
set "fwregpath=HKCU\SOFTWARE\CampoSanto\Firewatch"

rem Backup localisation file, keybinds, photos and savegames
if exist "%fwlldir%" (
	echo Firewatch: Backing up localisation file, keybinds, photos and savegames
	xcopy /e /i /y "%fwlldir%" "Firewatch\CampoSanto"
	echo.
) else (
	echo Firewatch: LocalLow directory not found. Skipping...
	echo.
)

rem Backup settings
echo Firewatch: Backing up settings
reg export "%fwregpath%" "Firewatch\firewatch.reg" /y

echo Firewatch: Done.
echo.

rem Gothic

set "g1rootdir=%gamerootdir%\Gothic"

rem Backup savegames
if exist "%g1rootdir%\Saves" (
	echo Gothic: Backing up savegames
	xcopy /e /i /y "%g1rootdir%\Saves" "Gothic\Saves"
	echo.
) else (
	echo Gothic: Saves folder not found. Skipping...
	echo.
)

rem Backup configuration file
if exist "%g1rootdir%\system\*.INI" (
	echo Gothic: Backing up configuration file
	xcopy /i /y "%g1rootdir%\system\*.INI" "Gothic\system"
	echo.
) else (
	echo Gothic: Configuration not found. Skipping...
	echo.
)

echo Gothic: Done.
echo.

rem Gothic II

set "g2rootdir=%gamerootdir%\Gothic II Gold"

rem Backup savegames
if exist "%g2rootdir%\Saves" (
	echo Gothic II: Backing up savegames
	xcopy /e /i /y "%g2rootdir%\Saves" "Gothic II\Saves"
	echo.
) else (
	echo Gothic II: Saves folder not found. Skipping...
	echo.
)

rem Backup configuration file
if exist "%g2rootdir%\system\*.INI" (
	echo Gothic II: Backing up configuration file
	xcopy /i /y "%g2rootdir%\system\*.INI" "Gothic II\system"
	echo.
) else (
	echo Gothic II: Configuration file not found. Skipping...
	echo.
)

echo Gothic II: Done.
echo.

rem Grand Theft Auto

set "gtaregpath=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\DMA Design\Grand Theft Auto"
set "gtarootdir=%gamerootdir%\Grand Theft Auto"

rem Backup .dat file
if exist "%gtarootdir%\GTADATA\*.dat" (
	echo Grand Theft Auto: Backing up .dat file
	xcopy /i /y "%gtarootdir%\GTADATA\*.dat" "Grand Theft Auto\GTADATA"
	echo.
) else (
	echo Grand Theft Auto: .dat file not found. Skipping...
	echo.
)

rem Backup replay file
if exist "%gtarootdir%\GTADATA\REPLAY.REP" (
	echo Grand Theft Auto: Backing up replay file
	copy "%gtarootdir%\GTADATA\REPLAY.REP" "Grand Theft Auto\GTADATA"
	echo.
) else (
	echo Grand Theft Auto: Replay file not found. Skipping...
	echo.
)

rem Backup language settings and key configuration
echo Grand Theft Auto: Backing up language settings and key configuration
reg export "%gtaregpath%" "Grand Theft Auto\gta-settings.reg" /y

echo Grand Theft Auto: Done.
echo.

rem Grand Theft Auto III

set "gta3dir=%userprofile%\Documents\GTA3 User Files"

rem Backup settings file and savegames
if exist "%gta3dir%\*.b" (
	if exist "%gta3dir%\*.set" (
		echo Grand Theft Auto III: Backing up settings and savegames
		xcopy /i /y "%gta3dir%\*" "GTA III"
		echo.
	)
) else (
	echo Grand Theft Auto III: Savegames and settings file not found. Skipping...
	echo.
)

echo Grand Theft Auto III: Done.
echo.

rem Grand Theft Auto: Vice City

set "gtavcdir=%userprofile%\Documents\GTA Vice City User Files"

rem Backup settings file and savegames
if exist "%gtavcdir%\*.b" (
	if exist "%gtavcdir%\*.set" (
		echo Grand Theft Auto: Vice City - Backing up settings file and savegames
		xcopy /i /y "%gtavcdir%\*" "GTA Vice City"
		echo.
	)
) else (
	echo Grand Theft Auto: Vice City - Savegames and settings file not found. Skipping...
	echo.
)

echo Grand Theft Auto: Vice City - Done.
echo.

rem Grand Theft Auto: San Andreas

set "gtasadir=%userprofile%\Documents\GTA San Andreas User Files"

rem Backup settings file, savegames, gallery and user tracks
if exist "%gtasadir%\*.b" (
	if exist "%gtasadir%\*.set" (
		echo Grand Theft Auto: San Andreas - Backing up user folder
		xcopy /e /i /y "%gtasadir%" "GTA - San Andreas"
		echo.
	)
) else (
	echo Grand Theft Auto: San Andreas - User files not found. Skipping...
	echo.
)

echo Grand Theft Auto: San Andreas - Done.
echo.

rem Hacknet

set "hacknetdir=%userprofile%\Documents\My Games\Hacknet"
set "hacknetrootdir=%gamerootdir%\Hacknet"

rem Copy Accounts.txt and XML savegame file into Hacknet directory
if exist "%hacknet%\Accounts\*.txt" (
	if exist "%hacknet%\Accounts\*.xml" (
		echo Hacknet: Backing up Accounts.txt and XML savegame file
		xcopy /i /y "%hacknetdir%\Accounts\*" "Hacknet\Accounts"
		echo.
	)
) else (
	echo Hacknet: Accounts.txt and XML savegame not found. Skipping...
	echo.
)

rem Backup settings
if exist "%hacknetrootdir%\Settings.txt" (
	echo Hacknet: Backing up settings
	copy "%hacknetrootdir%\Settings.txt" "Hacknet"
	echo.
) else (
	echo Hacknet: Settings file not found. Skipping...
	echo.
)

echo Hacknet: Done.
echo.

rem Hearts of Iron

set "hoirootdir=%gamerootdir%\Hearts of Iron"

rem Backup savegames
if exist "%hoirootdir%\scenarios\save games\*.eug" (
	echo Hearts of Iron: Backing up savegames
	xcopy /e /i /y "%hoirootdir%\scenarios\save games" "Hearts of Iron\Scenarios\Save Games"
	echo.
) else (
	echo Hearts of Iron: Savegames not found. Skipping...
	echo.
)

rem Backup configuration
if exist "%hoirootdir%\*.eu" (
	echo Hearts of Iron: Backing up configuration
	copy "%hoirootdir%\*.eu" "Hearts of Iron"
	echo.
) else (
	echo Hearts of Iron: Configuration not found. Skipping...
	echo.
)

rem Backup history file
if exist "%hoirootdir%\history.txt" (
	echo Hearts of Iron: Backing up history file
	copy "%hoirootdir%\history.txt" "Hearts of Iron"
	echo.
) else (
	echo Hearts of Iron: History file not found. Skipping...
	echo.
)

echo Hearts of Iron: Done.
echo.

rem Hellblade - Senua’s Sacrifice

set "hellbladedir=%localappdata%\HellbladeGame"

rem Backup savegame file
if exist "%hellbladedir%\Saved\SaveGames\*.sav" (
	echo Hellblade - Senua's Sacrifice: Backing up savegame file
	xcopy /i /y "%hellbladedir%\Saved\SaveGames\*.sav" "Hellblade - Senua's Sacrifice\SaveGames"
	echo.
) else (
	echo Hellblade - Senua's Sacrifice: Savegame not found. Skipping...
	echo.
)

rem Backup user settings file
if exist "%hellbladedir%\Saved\Config\WindowsNoEditor\GameUserSettings.ini" (
	echo Hellblade - Senua's Sacrifice: Backing up user settings
	copy "%hellbladedir%\Saved\Config\WindowsNoEditor\GameUserSettings.ini" "Hellblade - Senua's Sacrifice"
	echo.
) else (
	echo Hellblade - Senua's Sacrifice: User settings not found. Skipping...
	echo.
)

echo Hellblade - Senua's Sacrifice: Done.
echo.

rem Hitman - Codename 47

set "hc47rootdir=%gamerootdir%\Hitman Codename 47"

rem Backup savegames
if exist "%hc47rootdir%\*.sav" (
	echo Hitman - Codename 47: Backing up savegames
	xcopy /i /y "%hc47rootdir%\*.sav" "Hitman - Codename 47"
	echo.
) else (
	echo Hitman - Codename 47: Savegames not found. Skipping...
	echo.
)

rem Backup keybinds and sound settings
if exist "%hc47rootdir%\*.cfg" (
	echo Hitman - Codename 47: Backing up keybinds and sound settings
	copy "%hc47rootdir%\*.cfg" "Hitman - Codename 47"
	echo.
) else (
	echo Hitman - Codename 47: Keybinds and sound settings not found. Skipping...
	echo.
)

rem Backup configuration file
if exist "%hc47rootdir%\Hitman.ini" (
	echo Hitman - Codename 47: Backing up configuration
	copy "%hc47rootdir%\Hitman.ini" "Hitman - Codename 47"
	echo.
) else (
	echo Hitman - Codename 47: Configuration not found. Skipping...
	echo.
)

echo Hitman - Codename 47: Done.
echo.

rem Hotline Miami Original

set "hmrootdir=%gamerootdir%\Hotline Miami"

rem Copy savegame files from the game’s root directory into
rem ‘Hotline Miami Original’ folder
if exist "%hmrootdir%\achievements.dat" (
	if exist "%hmrootdir%\mask.nfo" (
		if exist "%hmrootdir%\pause.bmp" (
			if exist "%hmrootdir%\saves.dat" (
				if exist "%hmrootdir%\stats.sav" (
					if exist "%hmrootdir%\tempsave.sav" (
						rem Create folder structure
						echo Hotline Miami Original: Creating folder structure
						md "Hotline Miami Original"

						echo Hotline Miami Original: Backing up savegame files
						copy "%hmrootdir%\achievements.dat" "Hotline Miami Original"
						copy "%hmrootdir%\mask.nfo" "Hotline Miami Original"
						copy "%hmrootdir%\pause.bmp" "Hotline Miami Original"
						copy "%hmrootdir%\saves.dat" "Hotline Miami Original"
						copy "%hmrootdir%\stats.sav" "Hotline Miami Original"
						copy "%hmrootdir%\tempsave.sav" "Hotline Miami Original"

						echo Hotline Miami Original: Done.
						echo.
					)
				)
			)
		)
	)
) else (
	echo Hotline Miami Original: Savegame files not found. Skipping...
	echo.
)

rem Hotline Miami Updated

set "hmudir=%userprofile%\Documents\My Games\HotlineMiami"

rem Backup configuration and save data
if exist "%hmudir%\*.cfg" (
	if exist "%hmudir%\*.sav" (
		echo Hotline Miami Updated: Backing up configuration and save data
		xcopy /e /exclude:exclude.txt /i /y "%hmudir%" "Hotline Miami Updated"
		echo.
	)
) else (
	echo Hotline Miami Updated: Configuration and save data not found. Skipping...
	echo.
)

echo Hotline Miami Updated: Done.
echo.

rem Inkslinger

set "inkslingerregpath=HKCU\SOFTWARE\Gateway"
set "inkslingerrootdir=%gamerootdir%\Inkslinger"

if exist "%inkslingerrootdir%" (
	rem Create folder structure
	echo Inkslinger: Creating folder structure
	md "Inkslinger"

	rem Export registry key into file
	echo Inkslinger: Backing up registry key
	reg export "%inkslingerregpath%" "Inkslinger\inkslinger.reg" /y

	echo.
) else (
	echo Inkslinger: Game installation not found. Skipping...
	echo.
)

echo Inkslinger: Done.
echo.

rem Inside

set "insidedir=%appdata%\Playdead\Inside"
set "insideregpath=HKCU\SOFTWARE\Playdead\INSIDE"

rem Backup savegame files
if exist "%insidedir%\*.sav" (
	echo Inside: Backing up savegame file
	xcopy /i /y "%insidedir%\*.sav" "Inside"
	echo.
) else (
	echo Inside: Savegame not found. Skipping...
	echo.
)

rem Back up registry key. Settings are stored here
echo Inside: Backing up registry key
reg export "%insideregpath%" "Inside\inside.reg" /y

echo Inside: Done.
echo.

rem Jotun - Valhalla Edition

set "jvelldir=%userprofile%\AppData\LocalLow\Thunder Lotus Games\Jotun"

rem Backup options and savegame file
if exist "%jvelldir%\*.sav" (
	echo Jotun - Valhalla Edition: Backing up options and savegame file
	xcopy /i /y "%jvelldir%\*.sav" "Jotun - Valhalla Edition"
	echo.
) else (
	echo Jotun - Valhalla Edition: Options and savegame file not found. Skipping...
	echo.
)

echo Jotun - Valhalla Edition: Done.
echo.


rem L’Amerzone
rem English title: Amerzone

set "lamerzonerootdir=%gamerootdir%\AmerZone"

rem Backup savegames
if exist "%lamerzonerootdir%\*.bin" (
	echo L'Amerzone: Backing up savegames
	xcopy /i /y "%lamerzonerootdir%\*.bin" "L'Amerzone"
	echo.
) else (
	echo L'Amerzone: Savegames not found. Skipping...
	echo.
)

echo L'Amerzone: Done.
echo.

rem Layers of Fear
rem Layers of Fear: Inheritance

set "loflldir=%userprofile%\AppData\LocalLow\Bloober Team\Layers of Fear"
set "lofregpath=HKCU\SOFTWARE\Bloober Team\Layers of Fear"

rem Backup savegames
if exist "%loflldir%\0\*.dat" (
	echo Layers of Fear: Backing up savegames
	xcopy /i /y "%loflldir%\0\*.dat" "Layers of Fear\Savegames"
	echo.
) else (
	echo Layers of Fear: Savegames not found. Skipping...
	echo.
)

rem Backup configuration files
if exist "%loflldir%\0\cfg\*.xml" (
	echo Layers of Fear: Backing up configuration files
	xcopy /i /y "%loflldir%\0\cfg\*.xml" "Layers of Fear\cfg"
	echo.
) else (
	echo Layers of Fear: Configuration files not found. Skipping...
	echo.
)

rem Backup registry key
echo Layers of Fear: Backing up registry key
reg export "%lofregpath%" "Layers of Fear\lof.reg" /y
echo.

echo Layers of Fear: Done.
echo.

rem Legacy of Kain: Soul Reaver

set "loksrrootdir=%gamerootdir%\Legacy of Kain Soul Reaver"

rem Backup savegame file
if exist "%loksrrootdir%\*.her" (
	echo Legacy of Kain: Soul Reaver - Backing up savegame file
	xcopy /i /y "%loksrrootdir%\*.her" "Legacy of Kain - Soul Reaver"
	echo.
) else (
	echo Legacy of Kain: Soul Reaver - Savegame file not found. Skipping...
	echo.
)

echo Legacy of Kain: Soul Reaver - Done.
echo.

rem Mafia

set "mafiaregpath=HKCU\SOFTWARE\Illusion Softworks\Mafia"
set "mafiarootdir=%gamerootdir%\Mafia"

rem Backup savegame files
if exist "%mafiarootdir%\savegame\*.sav" (
	echo Mafia: Backing up savegame files
	xcopy /e /i /y "%mafiarootdir%\savegame" "Mafia\savegame"
	echo.
) else (
	echo Mafia: Savegame files not found. Skipping...
	echo.
)

rem Backup registry key
echo Mafia: Backing up registry key
reg export "%mafiaregpath%" "Mafia\mafia.reg" /y
echo.

echo Mafia: Done.
echo.

rem Master Spy

set "masterspydir=%localappdata%\Master Spy"

rem Copy all files from the game’s local storage into ‘Master Spy’ directory
if exist "%masterspydir%\Local Storage\*" (
	echo Master Spy: Backing up local storage
	xcopy /i /y "%masterspydir%\Local Storage\*" "Master Spy"
	echo.
) else (
	echo Master Spy: Local storage files not found. Skipping...
	echo.
)

echo Master Spy: Done.
echo.

rem Metal Gear

set "mgrootdir=%gamerootdir%\Metal Gear"

rem Backup savegame data
if exist "%mgrootdir%\SaveData\*.bin" (
	echo Metal Gear: Backing up savegame data
	xcopy /i /y "%mgrootdir%\SaveData\*.bin" "Metal Gear\SaveData"
	echo.
) else (
	echo Metal Gear: Savegame data not found. Skipping...
	echo.
)

rem Backup settings
if exist "%mgrootdir%\settings.ini" (
	echo Metal Gear: Backing up settings
	xcopy /i /y "%mgrootdir%\settings.ini" "Metal Gear"
	echo.
) else (
	echo Metal Gear: Settings file not found. Skipping...
	echo.
)

rem Backup DirectX configuration
if exist "%mgrootdir%\dxcfg.ini" (
	echo Metal Gear: Backing up DirectX configuration
	xcopy /i /y "%mgrootdir%\dxcfg.ini" "Metal Gear"
	echo.
) else (
	echo Metal Gear: DirectX configuration not found. Skipping...
	echo.
)

echo Metal Gear: Done.
echo.

rem Metal Gear Solid

set "mgsregpath=HKCU\SOFTWARE\Metal Gear Solid"
set "mgsrootdir=%gamerootdir%\Metal Gear Solid"

rem Backup savegames
if exist "%mgsrootdir%\SavedGames" (
	echo Metal Gear Solid: Backing up savegames
	xcopy /e /i /y "%mgsrootdir%\SavedGames" "Metal Gear Solid\SavedGames"
	echo.
) else (
	echo Metal Gear Solid: SavedGames folder not found. Skipping...
	echo.
)

rem Backup configuration files
if exist "%mgsrootdir%\*.cfg" (
	echo Metal Gear Solid: Backing up MGS configuration files
	xcopy /i /y "%mgsrootdir%\*.cfg" "Metal Gear Solid"
	echo.
) else (
	echo Metal Gear Solid: Configuration files not found. Skipping...
	echo.
)

rem Backup DirectX configuration
if exist "%mgsrootdir%\dxcfg.ini" (
	echo Metal Gear Solid: Backing up DirectX configuration
	copy "%mgsrootdir%\dxcfg.ini" "Metal Gear Solid"
	echo.
) else (
	echo Metal Gear Solid: DirectX configuration not found. Skipping...
	echo.
)

rem Backup VR records
if exist "%mgsrootdir%\records.vr" (
	echo Metal Gear Solid: Backing up VR records
	copy "%mgsrootdir%\records.vr" "Metal Gear Solid"
	echo.
) else (
	echo Metal Gear Solid: VR records not found. Skipping...
	echo.
)

rem Backup photos
if exist "%mgsrootdir%\PHOTOS\*.bmp" (
	echo Metal Gear Solid: Backing up photos
	xcopy /e /i /y "%mgsrootdir%\PHOTOS" "Metal Gear Solid\PHOTOS"
	echo.
) else (
	echo Metal Gear Solid: Photos not found. Skipping...
	echo.
)

rem Backup registry key
echo Metal Gear Solid: Backing up registry key
reg export "%mgsregpath%" "Metal Gear Solid\mgs.reg" /y

echo Metal Gear Solid: Done.
echo.

rem Metro 2033 Redux

set "m2033reduxdir=%userprofile%\Documents\4A Games\Metro Redux\2033"
set "m2033reduxladdir=%localappdata%\4A Games\Metro Redux\2033"

rem Backup autosave file and player files
if exist "%m2033reduxdir%\*" (
	echo Metro 2033 Redux: Backing up autosave and player files
	xcopy /i /y "%m2033reduxdir%\*" "Metro 2033 Redux\Savegames"
	echo.
) else (
	echo Metro 2033 Redux: Autosave and player files not found. Skipping...
	echo.
)

rem Backup user keybinds and settings
if exist "%m2033reduxladdir%\*.cfg" (
	echo Metro 2033 Redux: Backing up keybinds and settings
	copy "%m2033reduxladdir%\*.cfg" "Metro 2033 Redux"
	echo.
) else (
	echo Metro 2033 Redux: Keybinds and settings not found. Skipping...
	echo.
)

echo Metro 2033 Redux: Done.
echo.

rem Mirror’s Edge

set "medir=%userprofile%\Documents\EA Games\Mirror's Edge"

rem Copy savegame file from game’s savegame directory
if exist "%medir%\TdGame\Savefiles\*.dat" (
	echo Mirror's Edge: Backing up savegame file
	xcopy /i /y "%medir%\TdGame\Savefiles\*.dat" "Mirror's Edge"
	echo.
) else (
	echo Mirror's Edge: Savegame file not found. Skipping.
	echo.
)

rem Backup keybinds and settings file
if exist "%medir%\TdGame\Config\*.ini" (
	echo Mirror's Edge: Backing up configuration and keybinds file
	copy "%medir%\TdGame\Config\*.ini" "Mirror's Edge"
	echo.
) else (
	echo Mirror's Edge: Configuration and keybinds file not found. Skipping...
	echo.
)

echo Mirror's Edge: Done.
echo.

rem Mount & Blade

set "mbaddir=%appdata%\Mount&Blade"
set "mbsavedir=%userprofile%\Documents\Mount&Blade Savegames"

rem Backup savegame files
if exist "%mbsavedir%\Native" (
	echo Mount and Blade: Backing up savegames
	xcopy /e /i /y "%mbsavedir%\Native" "Mount & Blade\Savegames"
	echo.
) else (
	echo Mount and Blade: Savegames not found. Skipping...
	echo.
)

rem Backup configuration and options file
if exist "%mbaddir%" (
	echo Mount and Blade: Backing up configuration and options file
	xcopy /i /y "%mbaddir%" "Mount & Blade\Config"
	echo.
) else (
	echo Mount and Blade: Configuration and options file not found. Skipping...
	echo.
)

echo Mount and Blade: Done.
echo.

rem Mount & Blade Warband

set "mbwdir=%userprofile%\Documents\Mount&Blade Warband"
set "mbwsavedir=%userprofile%\Documents\Mount&Blade Warband Savegames"

rem Backup savegame files
if exist "%mbwsavedir%\Native" (
	echo Mount and Blade: Warband - Backing up savegame files
	xcopy /e /i /y "%mbwsavedir%\Native" "Mount & Blade Warband\Savegames"
	echo.
) else (
	echo Mount and Blade: Warband - Savegames not found. Skipping...
	echo.
)

rem Backup configuration file
if exist "%mbwdir%\*.txt" (
	echo Mount and Blade: Warband - Backing up config file
	xcopy /i /y "%mbwdir%\*.txt" "Mount & Blade Warband\Config"
	echo.
) else (
	echo Mount and Blade: Warband - Config file not found. Skipping...
	echo.
)

echo Mount and Blade: Warband - Done.
echo.

rem Mount & Blade Warband - Viking Conquest

set "mbwdir=%userprofile%\Documents\Mount&Blade Warband"
set "mbwvcsavedir=%userprofile%\Documents\Mount&Blade Warband Savegames\Viking Conquest"

rem Backup savegame files
if exist "%mbwvcsavedir%\*.sav" (
	echo Mount and Blade: Warband - Viking Conquest: Backing up savegames
	xcopy /i /y "%mbwvcsavedir%\*.sav" "Mount & Blade Warband - Viking Conquest"
	echo.
) else (
	echo Mount and Blade: Warband - Viking Conquest: Savegames not found. Skipping...
	echo.
)

rem Backup configuration file
if exist "%mbwdir%\*.txt" (
	echo Mount and Blade: Warband - Viking Conquest: Backing up configuration file
	copy "%mbwdir%\*.txt" "Mount & Blade Warband - Viking Conquest"
	echo.
) else (
	echo Mount and Blade: Warband - Viking Conquest: Configuration file not found. Skipping...
	echo.
)

echo Mount and Blade: Warband - Viking Conquest: Done.
echo.

rem Never Alone

set "nadir=%userprofile%\AppData\LocalLow\E-Line Media\Never Alone"
set "naregpath=HKCU\SOFTWARE\E-Line Media\Never Alone"

rem Backup savegame data
if exist "%nadir%\*.dat" (
	echo Never Alone: Backing up savegame
	xcopy /i /y "%nadir%\*.dat" "Never Alone"
	echo.
) else (
	echo Never Alone: Savegame not found. Skipping...
	echo.
)

rem Backup registry key
echo Never Alone: Backing up registry key
reg export "%naregpath%" "Never Alone\neveralone.reg" /y

echo Never Alone: Done.
echo.

rem Oddworld: Abe’s Oddysee

set "oaorootdir=%gamerootdir%\Abes Oddysee"

rem Backup savegames
if exist "%oaorootdir%\*.sav" (
	echo Oddworld: Abe's Oddysee - Backing up savegames
	xcopy /i /y "%oaorootdir%\*.sav" "Oddworld - Abe's Oddysee"
	echo.
) else (
	echo Oddworld: Abe's Oddysee - Savegames not found. Skipping...
	echo.
)

rem Backup configuration
if exist "%oaorootdir%\abe.ini" (
	echo Oddworld: Abe's Oddysee - Backing up configuration
	copy "%oaorootdir%\abe.ini" "Oddworld - Abe's Oddysee"
	echo.
) else (
	echo Oddworld: Abe's Oddysee - Configuration not found. Skipping...
	echo.
)

echo Oddworld: Abe's Oddysee - Done.
echo.

rem Oddworld: Abe’s Exoddus

set "oaerootdir=%gamerootdir%\Abes Exoddus"

rem Backup savegames
if exist "%oaerootdir%\*.sav" (
	echo Oddworld: Abe's Exoddus - Backing up savegames
	xcopy /i /y "%oaerootdir%\*.sav" "Oddworld - Abe's Exoddus"
	echo.
) else (
	echo Oddworld: Abe's Exoddus - Savegames not found. Skipping...
	echo.
)

rem Backup configuration
if exist "%oaerootdir%\abe2.ini" (
	echo Oddworld: Abe's Exoddus - Backing up configuration
	copy "%oaerootdir%\abe2.ini" "Oddworld - Abe's Exoddus"
	echo.
) else (
	echo Oddworld: Abe's Exoddus - Configuration not found. Skipping...
	echo.
)

echo Oddworld: Abe's Exoddus - Done.
echo.

rem Oddworld - New 'n' Tasty

set "onntrootdir=%gamerootdir%\Oddworld - New 'n' Tasty"

rem Backup files from the game’s savegame folder
if exist "%onntrootdir%\SaveGame\*.NnT" (
	echo Oddworld - New 'n' Tasty: Backing up savegames and settings
	xcopy /i /y "%onntrootdir%\SaveGame\*.NnT" "Oddworld - New 'n' Tasty\SaveGame"
	echo.
) else (
	echo Oddworld - New 'n' Tasty: Savegames and settings not found. Skipping...
	echo.
)

echo Oddworld - New 'n' Tasty: Done.
echo.

rem Omikron: The Nomad Soul

set "otnsrootdir=%gamerootdir%\Omikron - The Nomad Soul"

rem Backup configuration, keybinds and savegames
if exist "%otnsrootdir%\IAM\GAMES" (
	echo Omikron: The Nomad Soul - Backing up configuration, keybinds and savegames
	md "Omikron - The Nomad Soul"
	copy "%otnsrootdir%\IAM\GAMES" "Omikron - The Nomad Soul"
	echo.
) else (
	echo Omikron: The Nomad Soul - GAMES file not found. Skipping...
	echo.
)

echo Omikron: The Nomad Soul - Done.
echo.

rem Open Arena

set "oaaddir=%appdata%\OpenArena"

rem Backup Open Arena AppData folder
if exist "%oaaddir%" (
	echo Open Arena: Backing up AppData folder
	xcopy /e /i /y "%oaaddir%" "Open Arena"
	echo.
) else (
	echo Open Arena: AppData folder not found. Skipping...
	echo.
)

echo Open Arena: Done.
echo.

rem Outlast

set "outlastdir=%userprofile%\Documents\My Games\Outlast"

rem Backup profile and savegame files
if exist "%outlastdir%\OLGame\SaveData" (
	echo Outlast: Backing up profile and savegame files
	xcopy /i /y "%outlastdir%\OLGame\SaveData\*" "Outlast\SaveData"
	echo.
) else (
	echo Outlast: SaveData folder not found. Skipping...
)

rem Backup config folder
if exist "%outlastdir%\OLGame\Config" (
	echo Outlast: Backing up config folder
	xcopy /e /i /y "%outlastdir%\OLGame\Config" "Outlast\Config"
	echo.
) else (
	echo Outlast: Configuration folder not found. Skipping...
	echo.
)

echo Outlast: Done.
echo.

rem Painkiller

set "pkregpath1=HKCU\SOFTWARE\PeopleCanFly"
set "pkregpath2=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\PeopleCanFly"
set "pkrootdir=%gamerootdir%\Painkiller Black"

rem Backup savegames and folder structure
if exist "%pkrootdir%\SaveGames" (
	echo Painkiller: Backing up savegames
	xcopy /e /i /y "%pkrootdir%\SaveGames" "Painkiller\SaveGames"
	echo.
) else (
	echo Painkiller: SaveGames folder not found. Skipping...
	echo.
)

rem Back up config file
if exist "%pkrootdir%\Bin\*.ini" (
	echo Painkiller: Backing up configuration file
	copy "%pkrootdir%\Bin\*.ini" "Painkiller"
	echo.
) else (
	echo Painkiller: Configuration file not found. Skipping...
	echo.
)

rem Back up registry key
echo Painkiller: Backing up registry key
reg export "%pkregpath1%" "Painkiller\painkiller-1.reg" /y
reg export "%pkregpath2%" "Painkiller\painkiller-2.reg" /y

echo Painkiller: Done.
echo.

rem Penumbra: Black Plague

set "pbpdir=%userprofile%\Documents\Penumbra\Black Plague"

rem Backup keybinds, savegames and settings
if exist "%pbpdir%" (
	echo Penumbra: Black Plague - Backing up keybinds, savegames and settings
	xcopy /e /exclude:exclude.txt /i /y "%pbpdir%" "Penumbra - Black Plague"
	echo.
) else (
	echo Penumbra: Black Plague - Folder not found. Skipping...
	echo.
)

echo Penumbra: Black Plague - Done.
echo.

rem Penumbra: Overture

set "podir=%userprofile%\Documents\Penumbra Overture"

rem Backup keybinds, savegames and settings
if exist "%podir%" (
	echo Penumbra: Overture - Backing up keybinds, settings and savegames
	xcopy /e /exclude:exclude.txt /i /y "%podir%" "Penumbra - Overture"
	echo.
) else (
	echo Penumbra: Overture - Folder not found. Skipping...
)

echo Penumbra: Overture - Done.
echo.

rem Penumbra: Requiem

set "prdir=%userprofile%\Documents\Penumbra\Requiem"

rem Backup keybinds, savegames and settings
if exist "%prdir%" (
	echo Penumbra: Requiem - Backing up keybinds, savegames and settings
	xcopy /e /exclude:exclude.txt /i /y "%prdir%" "Penumbra - Requiem"
	echo.
) else (
	echo Penumbra: Requiem - Folder not found. Skipping...
)

echo Penumbra: Requiem - Done.
echo.

rem Planescape: Torment

set "ptrootdir=%gamerootdir%\Planescape Torment"

rem Backup save folder
if exist "%ptrootdir%\save" (
	echo Planescape: Torment - Backing up save folder
	xcopy /e /i /y "%ptrootdir%\save" "Planescape - Torment\save"
	echo.
) else (
	echo Planescape: Torment - Save folder not found. Skipping...
	echo.
)

rem Backup cache folder
if exist "%ptrootdir%\cache" (
	echo Planescape: Torment - Backing up cache folder
	xcopy /e /i /y "%ptrootdir%\cache" "Planescape - Torment\cache"
	echo.
) else (
	echo Planescape: Torment - Cache folder not found. Skipping...
	echo.
)

rem Backup configuration file
if exist "%ptrootdir%\Torment.ini" (
	echo Planescape: Torment - Backing up configuration file
	copy "%ptrootdir%\Torment.ini" "Planescape - Torment"
	echo.
) else (
	echo Planescape: Torment - Configuration file not found. Skipping...
	echo.
)

echo Planescape: Torment - Done.
echo.

rem Port Royale

set "portroyalerootdir=%gamerootdir%\Port Royale"

rem Backup options and savegames
if exist "%portroyalerootdir%\Save\*.mrk" (
	echo Port Royale: Backing up options and savegames
	xcopy /e /i /y "%portroyalerootdir%\Save" "Port Royale\Save"
	echo.
) else (
	echo Port Royale: Savegames not found. Skipping...
	echo.
)

rem Backup player .aim files
if exist "%portroyalerootdir%\Run\Player*" (
	echo Port Royale: Backing up player .aim files
	xcopy /i /y "%portroyalerootdir%\Run\Player*" "Port Royale\Run"
	echo.
) else (
	echo Port Royale: Player .aim files not found. Skipping...
	echo.
)

echo Port Royale: Done.
echo.

rem Postal Plus

set "p1rootdir=%gamerootdir%\Postal2STP\PostalClassic&Uncut"

rem Back up savegames and highscores
if exist "%p1rootdir%\res\SaveGame" (
	echo Postal Plus: Backing up savegames and highscores
	xcopy /e /i /y "%p1rootdir%\res\SaveGame" "Postal Plus\res\SaveGame"
	echo.
) else (
	echo Postal Plus: SaveGame folder not found. Skipping...
	echo.
)

rem Backup configuration
if exist "%p1rootdir%\*.ini" (
	echo Postal Plus: Backing up configuration
	copy "%p1rootdir%\*.ini" "Postal Plus"
	echo.
) else (
	echo Postal Plus: Configuration file not found. Skipping...
	echo.
)

echo Postal Plus: Done.
echo.

rem Postal 2

set "p2rootdir=%gamerootdir%\Postal2STP"

rem Backup savegames
if exist "%p2rootdir%\Save\*.usa" (
	echo Postal 2: Backing up savegames
	xcopy /e /i /y "%p2rootdir%\Save" "Postal 2\Save"
	echo.
) else (
	echo Postal 2: Savegames not found. Skipping...
	echo.
)

rem Backup configuration, keybinds and savegame information
if exist "%p2rootdir%\System\Postal2.ini" (
	if exist "%p2rootdir%\System\SavedGameInfo.ini" (
		if exist "%p2rootdir%\System\User.ini" (
			echo Postal 2: Backing up configuration, keybinds and savegame information
			md "Postal 2\System"
			copy "%p2rootdir%\System\Postal2.ini" "Postal 2\System"
			copy "%p2rootdir%\System\SavedGameInfo.ini" "Postal 2\System"
			copy "%p2rootdir%\System\User.ini" "Postal 2\System"
			echo.
		)
	)
) else (
	echo Postal 2: Configuration, keybinds, savegame information not found. Skipping...
	echo.
)

echo Postal 2: Done.
echo.

rem Quake II

set "q2rootdir=%gamerootdir%\Quake II"

rem Backup savegames
if exist "%q2rootdir%\baseq2\save" (
	echo Quake II: Backing up savegames
	xcopy /e /i /y "%q2rootdir%\baseq2\save" "Quake II\Base\save"
	echo.
) else (
	echo Quake II: Save folder not found. Skipping...
	echo.
)

rem Backup configuration and keybinds
if exist "%q2rootdir%\baseq2\*.cfg" (
	echo Quake II: Backing up keybinds and configuration
	copy "%q2rootdir%\baseq2\*.cfg" "Quake II\Base"
	echo.
) else (
	echo Quake II: Configuration files not found. Skipping...
	echo.
)

echo Quake II: Done.
echo.

rem Quake II mission pack: The Reckoning

rem Backup savegames
if exist "%q2rootdir%\xatrix\save" (
	echo Quake II mission pack: The Reckoning - Backing up savegames
	xcopy /e /i /y "%q2rootdir%\xatrix\save" "Quake II\The Reckoning\save"
	echo.
) else (
	echo Quake II mission pack: The Reckoning - Save folder not found. Skipping...
	echo.
)

rem Backup keybinds and configuration file
if exist "%q2rootdir%\xatrix\*.cfg" (
	echo Quake II mission pack: The Reckoning - Backing up keybinds and configuration
	copy "%q2rootdir%\xatrix\*.cfg" "Quake II\The Reckoning"
	echo.
) else (
	echo Quake II mission pack: The Reckoning - Configuration and keybinds not found. Skipping...
	echo.
)

echo Quake II mission pack: The Reckoning - Done.
echo.

rem Quake II mission pack 2: Ground Zero

rem Backup savegames
if exist "%q2rootdir%\rogue\save" (
	echo Quake II mission pack 2: Ground Zero - Backing up savegames
	xcopy /e /i /y "%q2rootdir%\rogue\save" "Quake II\Ground Zero\save"
	echo.
) else (
	echo Quake II mission pack 2: Ground Zero - Save folder not found. Skipping...
	echo.
)

rem Backup keybinds and configuration file
if exist "%q2rootdir%\rogue\*.cfg" (
	echo Quake II mission pack 2: Ground Zero - Restoring keybinds and configuration
	copy "%q2rootdir%\rogue\*.cfg" "Quake II\Ground Zero"
	echo.
) else (
	echo Quake II mission pack 2: Ground Zero - Configuration and keybinds not found. Skipping...
	echo.
)

echo Quake II mission pack 2: Ground Zero - Done.
echo.

rem Quake II - The Eraser Bot

rem Backup keybinds and configuration file
if exist "%q2rootdir%\Eraser\config.cfg" (
	echo Quake II - The Eraser Bot: Backing up keybinds and configuration
	xcopy /i /y "%q2rootdir%\Eraser\config.cfg" "Quake II\The Eraser Bot"
	echo.
) else (
	echo Quake II - The Eraser Bot: Configuration and keybinds not found. Skipping...
	echo.
)

echo Quake II - The Eraser Bot:  Done.
echo.

rem Quake III

set "q3rootdir=%gamerootdir%\Quake III Arena"

rem Backup configuration files
if exist "%q3rootdir%\baseq3\*.cfg" (
	echo Quake III: Backing up configuration files
	xcopy /i /y "%q3rootdir%\baseq3\*.cfg" "Quake III"
	echo.
) else (
	echo Quake III: Configuration files not found. Skipping...
	echo.
)

echo Quake III: Done.
echo.

rem Red Faction

set "redfactionregpath=HKCU\SOFTWARE\Volition\Red Faction"
set "redfactionrootdir=%gamerootdir%\Red Faction"

rem Backup savegames
if exist "%redfactionrootdir%\savegame" (
	echo Red Faction: Backing up savegames
	xcopy /e /i /y "%redfactionrootdir%\savegame" "Red Faction\savegame"
	echo.
) else (
	echo Red Faction: Savegame folder not found. Skipping...
	echo.
)

rem Backup configuration file
if exist "%redfactionrootdir%\*.cfg" (
	echo Red Faction: Backing up configuration file
	xcopy /i /y "%redfactionrootdir%\*.cfg" "Red Faction"
	echo.
) else (
	echo Red Faction: Configuration file not found. Skipping...
	echo.
)

rem Backup D3D file
if exist "%redfactionrootdir%\*.id" (
	echo Red Faction: Backing up D3D file
	xcopy /i /y "%redfactionrootdir%\*.id" "Red Faction"
	echo.
) else (
	echo Red Faction: D3D file not found. Skipping...
)

rem Backup registry key
echo Red Faction: Backing up registry key
reg export "%redfactionregpath%" "Red Faction\rf.reg" /y

echo Red Faction: Done.
echo.

rem Remothered - Tormented Fathers

set "rtfladdir=%localappdata%\Remothered"

rem Backup savegame files
if exist "%rtfladdir%\Saved\SaveGames\*.sav" (
	echo Remothered - Tormented Fathers: Backing up savegames and settings
	xcopy /i /y "%rtfladdir%\Saved\SaveGames\*.sav" "Remothered - Tormented Fathers"
	echo.
) else (
	echo Remothered - Tormented Fathers: Savegames and settings not found. Skipping...
	echo.
)

echo Remothered - Tormented Fathers: Done.
echo.

rem Ritual of the Moon

set "rotmregpath=HKCU\SOFTWARE\Kara Stone\R o t M"
set "rotmrootdir=%gamerootdir%\Ritual of the Moon"

rem Backup registry key
if exist "%rotmrootdir%" (
	rem Create folder structure
	echo Ritual of the Moon: Creating folder structure
	md "Ritual of the Moon"

	echo Ritual of the Moon: Backing up progress and settings
	reg export "%rotmregpath%" "Ritual of the Moon\rotm.reg" /y

	echo.
) else (
	echo Ritual of the Moon: Game installation not found. Skipping...
	echo.
)

rem S.T.A.L.K.E.R. Чистое Небо
rem English title: S.T.A.L.K.E.R. Clear Sky

set "scsdir=%userprofile%\Documents\stalke~1"

rem Backup savegames and savegame textures
if exist "%scsdir%\savedgames\*" (
	echo S.T.A.L.K.E.R. Clear Sky: Backing up savegames and savegame textures
	xcopy /i /y "%scsdir%\savedgames\*" "S.T.A.L.K.E.R. Clear Sky\savedgames"
	echo.
) else (
	echo S.T.A.L.K.E.R. Clear Sky: Savegame files not found. Skipping...
	echo.
)

rem Backup keybinds and settings
if exist "%scsdir%\user.ltx" (
	echo S.T.A.L.K.E.R. Clear Sky: Backing up keybinds and settings
	copy "%scsdir%\user.ltx" "S.T.A.L.K.E.R. Clear Sky"
	echo.
) else (
	echo S.T.A.L.K.E.R. Clear Sky: Keybinds and settings file not found. Skipping...
	echo.
)

echo S.T.A.L.K.E.R. Clear Sky: Done.
echo.

rem S.T.A.L.K.E.R. Shadow of Chernobyl

set "sshocdir=%userprofile%\Documents\Stalker-SHOC"

rem Backup savegame textures and saves
if exist "%sshocdir%\savedgames\*.sav" (
	echo S.T.A.L.K.E.R. Shadow of Chernobyl: Backing up savegame textures and saves
	xcopy /i /y "%sshocdir%\savedgames\*" "S.T.A.L.K.E.R. Shadow of Chernobyl\savedgames"
	echo.
) else (
	echo S.T.A.L.K.E.R. Shadow of Chernobyl: Savegames not found. Skipping...
	echo.
)

rem Backup user keybinds and settings
if exist "%sshocdir%\user.ltx" (
	echo S.T.A.L.K.E.R. Shadow of Chernobyl: Backing up user.ltx file
	xcopy /i /y "%sshocdir%\user.ltx" "S.T.A.L.K.E.R. Shadow of Chernobyl"
	echo.
) else (
	echo S.T.A.L.K.E.R. Shadow of Chernobyl: user.ltx file not found. Skipping...
	echo.
)

echo S.T.A.L.K.E.R. Shadow of Chernobyl: Done.
echo.

rem Sacred Gold

set "sacredrootdir=%gamerootdir%\Sacred Gold"

rem Backup exported characters and savegames
if exist "%sacredrootdir%\save" (
	echo Sacred Gold: Backing up exported characters and savegames
	xcopy /e /i /y "%sacredrootdir%\save" "Sacred Gold\save"
	echo.
) else (
	echo Sacred Gold: save folder not found. Skipping...
	echo.
)

rem Backup configuration files
if exist "%sacredrootdir%\*.cfg" (
	echo Sacred Gold: Backing up configuration files
	xcopy /i /y "%sacredrootdir%\*.cfg" "Sacred Gold"
	echo.
) else (
	echo Sacred Gold: Configuration files not found. Skipping...
	echo.
)

echo Sacred Gold: Done.
echo.

rem Saints Row: The Third

set "sr3dir=%localappdata%\Saints Row The Third"

rem Backup savegame files
if exist "%sr3dir%\savedir.sr3d_pc" (
	if exist "%sr3dir%\*.sr3s_pc" (
		if exist "%sr3dir%\sr3def_profile" (
			echo Saints Row 3: Backing up savegame files

			xcopy /i /y "%sr3dir%\savedir.sr3d_pc" "Saints Row 3"
			copy "%sr3dir%\*.sr3s_pc" "Saints Row 3"
			copy "%sr3dir%\sr3def_profile" "Saints Row 3"
			echo.
		)
	)
) else (
	echo Saints Row 3: Savegame files not found. Skipping...
)

echo Saints Row 3: Done.
echo.

rem Serious Sam: The First Encounter

set "sstferootdir=%gamerootdir%\Serious Sam The First Encounter"

rem Backup control files
if exist "%sstferootdir%\Controls\*.ctl" (
	echo Serious Sam: The First Encounter - Backing up control files
	xcopy /i /y "%sstferootdir%\Controls\*.ctl" "Serious Sam - The First Encounter\Controls"
	echo.
) else (
	echo Serious Sam: The First Encounter - Control files not found. Skipping...
	echo.
)

rem Backup .plr files
if exist "%sstferootdir%\Players\*.plr" (
	echo Serious Sam: The First Encounter - Backing up .plr files
	xcopy /i /y "%sstferootdir%\Players\*.plr" "Serious Sam - The First Encounter\Players"
	echo.
) else (
	echo Serious Sam: The First Encounter - .plr files not found. Skipping...
	echo.
)

rem Backup savegame files
if exist "%sstferootdir%\SaveGame" (
	echo Serious Sam: The First Encounter - Backing up savegame files
	xcopy /e /i /y "%sstferootdir%\SaveGame" "Serious Sam - The First Encounter\SaveGame"
	echo.
) else (
	echo Serious Sam: The First Encounter - SaveGame folder not found. Skipping...
	echo.
)

rem Backup persistent symbols file, which contains setting values
if exist "%sstferootdir%\Scripts\PersistentSymbols.ini" (
	echo Serious Sam: The First Encounter - Backing up persistent symbols file
	md "Serious Sam - The First Encounter\Scripts"
	copy "%sstferootdir%\Scripts\PersistentSymbols.ini" "Serious Sam - The First Encounter\Scripts"
	echo.
) else (
	echo Serious Sam: The First Encounter - Persistent symbols file not found. Skipping...
	echo.
)

echo Serious Sam: The First Encounter - Done.
echo.

rem Sludge Life

set "slregpath=HKCU\SOFTWARE\TerriVellmann\SludgeLife"
set "slrootdir=%gamerootdir%\Sludge Life"

rem Back up pictures
if exist "%slrootdir%\PICS\*.png" (
	echo Sludge Life: Backing up pictures
	xcopy /e /i /y "%slrootdir%\PICS" "Sludge Life\PICS"
	echo.
) else (
	echo Sludge Life: Pictures not found. Skipping...
	echo.
)

rem Backup savegame file from the game’s root directory
if exist "%slrootdir%\save.txt" (
	echo Sludge Life: Backing up savegame file
	copy "%slrootdir%\save.txt" "Sludge Life"
	echo.
) else (
	echo Sludge Life: Savegame file not found. Skipping...
	echo.
)

rem Backup registry key. Settings are stored here
echo Sludge Life: Backing up registry key
reg export "%slregpath%" "Sludge Life\sludgelife.reg" /y
echo.

echo Sludge Life: Done.
echo.

rem SOMA

set "somadir=%userprofile%\Documents\My Games\Soma"

rem Backup Soma\Main folder
if exist "%somadir%" (
	echo SOMA: Backing up profile folder, first start flag and main settings
	xcopy /e /exclude:exclude.txt /i /y "%somadir%" "SOMA"
	echo.
) else (
	echo SOMA: Folder not found. Skipping...
	echo.
)

echo SOMA: Done.
echo.

rem SPY Fox - Dry Cereal

set "sfdcsavedir=C:\hegames"

rem Backup savegames
if exist "%sfdcsavedir%" (
	echo SPY Fox - Dry Cereal: Backing up savegames
	xcopy /i /y "%sfdcsavedir%\*" "SPY Fox - Dry Cereal"
	echo.
) else (
	echo SPY Fox - Dry Cereal: hegames folder not found. Skipping...
	echo.
)

echo SPY Fox - Dry Cereal: Done.
echo.

rem Sudden Strike

set "ssrootdir=%gamerootdir%\Sudden Strike"

rem Backup savegames
if exist "%ssrootdir%\SaveGames" (
	echo Sudden Strike: Backing up savegames
	xcopy /e /i /y "%ssrootdir%\SaveGames" "Sudden Strike\SaveGames"
	echo.
) else (
	echo Sudden Strike: SaveGames folder not found. Skipping...
	echo.
)

rem Backup .ini file
if exist "%ssrootdir%\sudtest.ini" (
	echo Sudden Strike: Backing up .ini file
	copy "%ssrootdir%\sudtest.ini" "Sudden Strike"
	echo.
) else (
	echo Sudden Strike: .ini file not found. Skipping...
	echo.
)

rem Backup ratings data
if exist "%ssrootdir%\ratings\*.rtc" (
	echo Sudden Strike: Backing up ratings data
	xcopy /i /y "%ssrootdir%\ratings\*.rtc" "Sudden Strike\ratings"
	echo.
) else (
	echo Sudden Strike: Ratings data not found. Skipping...
	echo.
)

echo Sudden Strike: Done.
echo.

rem Sunless Sea

set "sunlesslldir=%userprofile%\AppData\LocalLow\Failbetter Games\Sunless Sea"
set "sunlessregpath=HKCU\SOFTWARE\Failbetter Games\Sunless Sea"

rem Backup Sunless Sea folder with the exclusion of analytical data
if exist "%sunlesslldir%" (
	echo Sunless Sea: Backing up LocalLow folder
	rem For some reason, the /l argument makes the process of copying over 3000
	rem files much faster. This is caused by the backing up of the icons in the
	rem ‘images’ folder.
	xcopy /e /exclude:exclude.txt /i /l /y "%sunlesslldir%" "Sunless Sea\LocalLow"
	echo.
) else (
	echo Sunless Sea: LocalLow folder not found. Skipping...
	echo.
)

rem Backup registry key
echo Sunless Sea: Backing up registry key
reg export "%sunlessregpath%" "Sunless Sea\sunless-sea.reg" /y

echo Sunless Sea: Done.
echo.

rem SWAT 4

set "swat4sysdir=%gamerootdir%\SWAT 4\Content\System"

rem Backup .ini files responsible for campaign progress, dynamic loadout state,
rem mission results, SWAT 4 general settings, SWAT 4 GUI state and user
rem configuration
if exist "%swat4sysdir%\Campaign.ini" (
	if exist "%swat4sysdir%\DynamicLoadout.ini" (
		if exist "%swat4sysdir%\MissionResults.ini" (
			if exist "%swat4sysdir%\Swat4.ini" (
				if exist "%swat4sysdir%\SwatGUIState.ini" (
					if exist "%swat4sysdir%\User.ini" (
						rem Create folder structure
						echo SWAT 4: Creating folder structure
						md "SWAT 4"

						echo SWAT 4: Backing up .ini files
						copy "%swat4sysdir%\Campaign.ini" "SWAT 4"
						copy "%swat4sysdir%\DynamicLoadout.ini" "SWAT 4"
						copy "%swat4sysdir%\MissionResults.ini" "SWAT 4"
						copy "%swat4sysdir%\Swat4.ini" "SWAT 4"
						copy "%swat4sysdir%\SwatGUIState.ini" "SWAT 4"
						copy "%swat4sysdir%\User.ini" "SWAT 4"

						echo.
					)
				)
			)
		)
	)
) else (
	echo SWAT 4: .ini files not found. Skipping...
)

echo SWAT 4: Done.
echo.

rem Syberia

set "syberiasavedir=%userprofile%\Documents\Syberia Saves"

rem Backup configuration and savegame files
if exist "%syberiasavedir%\*.sav" (
	echo Syberia: Backing up configuration and savegames
	xcopy /i /y "%syberiasavedir%\*" "Syberia"
	echo.
) else (
	echo Syberia: Savegames not found. Skipping...
	echo.
)

echo Syberia: Done.
echo.

rem Syberia II

set "syb2savedir=%userprofile%\Documents\Syberia 2 Saves"

rem Backup config and savegame files
if exist "%syb2savedir%\*.sav" (
	echo Syberia II: Backing up configuration and savegames
	xcopy /i /y "%syb2savedir%\*" "Syberia 2"
	echo.
) else (
	echo Syberia II: Savegames not found. Skipping...
	echo.
)

echo Syberia II: Done.
echo.

rem The Alto Collection

set "tacregpath=HKCU\SOFTWARE\Team Alto\The Alto Collection"
set "tacrootdir=%gamerootdir%\The Alto Collection"

if exist "%tacrootdir%" (
	rem Create folder structure
	md "The Alto Collection"

	rem Backup configuration and savegame data
	echo The Alto Collection: Backing up configuration and save data
	reg export "%tacregpath%" "The Alto Collection\tac.reg" /y

	echo.
) else (
	echo The Alto Collection: Installation not found. Skipping...
	echo.
)

echo The Alto Collection: Done.
echo.

rem The Cat Lady

set "tclsavedir=%userprofile%\Saved Games\The Cat Lady"

rem Backup settings and savegame files
if exist "%tclsavedir%\agssave*" (
	echo The Cat Lady: Backing up settings and savegames
	xcopy /i /y "%tclsavedir%\*" "The Cat Lady"
	echo.
) else (
	echo The Cat Lady: Savegames not found. Skipping...
)

echo The Cat Lady: Done.
echo.

rem The Elder Scrolls III: Morrowind

set "tes3regpath=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Bethesda Softworks"
set "tes3rootdir=%gamerootdir%\Morrowind"

rem Backup savegames
if exist "%tes3rootdir%\Saves\*.ess" (
	echo The Elder Scrolls III: Morrowind - Backing up savegames
	xcopy /e /i /y "%tes3rootdir%\Saves" "Morrowind\Saves"
	echo.
) else (
	echo The Elder Scrolls III: Morrowind - Savegames not found. Skipping...
	echo.
)

rem Backup configuration file
if exist "%tes3rootdir%\Morrowind.ini" (
	echo The Elder Scrolls III: Morrowind - Backing up configuration file
	copy "%tes3rootdir%\Morrowind.ini" "Morrowind"
	echo.
) else (
	echo The Elder Scrolls III: Morrowind - Configuration file not found. Skipping...
	echo.
)

rem Backup journal
if exist "%tes3rootdir%\Journal.htm" (
	echo The Elder Scrolls III: Morrowind - Backing up journal
	copy "%tes3rootdir%\Journal.htm" "Morrowind"
	echo.
) else (
	echo The Elder Scrolls III: Morrowind - Journal not found. Skipping...
	echo.
)

rem Backup registry key
echo The Elder Scrolls III: Morrowind - Backing up registry key
reg export "%tes3regpath%" "Morrowind\morrowind.reg" /y

echo The Elder Scrolls III: Morrowind - Done.
echo.

rem The Infectious Madness of Doctor Dekker

set "timoddrootdir=%gamerootdir%\The Infectious Madness of Doctor Dekker"
set "timoddsavedir=%userprofile%\AppData\Roaming\timodd"

rem Backup savegame files from the game’s savegame folder
if exist "%timoddsavedir%\*.json" (
	echo The Infectious Madness of Doctor Dekker: Backing up JSON savegame files
	xcopy /i /y "%timoddsavedir%\*.json" "The Infectious Madness of Doctor Dekker"
	echo.
) else (
	echo The Infectious Madness of Doctor Dekker: JSON savegame files not found. Skipping...
	echo.
)

rem Backup init.json file
if exist "%timoddrootdir%\resources\app\init.json" (
	echo The Infectious Madness of Doctor Dekker: Backing up settings
	copy "%timoddrootdir%\resources\app\init.json" "The Infectious Madness of Doctor Dekker\settings"
	echo.
) else (
	echo The Infectious Madness of Doctor Dekker: Settings not found. Skipping...
	echo.
)

echo The Infectious Madness of Doctor Dekker: Done.
echo.

rem The Longest Journey

set "tljrootdir=%gamerootdir%\The Longest Journey"

rem Backup savegame index, profile data, savegames, thumbnails
if exist "%tljrootdir%\Save" (
	echo The Longest Journey: Backing up savegame index, profile data, savegames and thumbnails
	xcopy /e /i /y "%tljrootdir%\Save" "The Longest Journey\Save"
	echo.
) else (
	echo The Longest Journey: Save folder not found. Skipping...
	echo.
)

rem Backup game settings
if exist "%tljrootdir%\preferences.ini" (
	echo The Longest Journey: Backing up game settings
	copy "%tljrootdir%\preferences.ini" "The Longest Journey"
	echo.
) else (
	echo The Longest Journey: Game settings not found. Skipping...
	echo.
)

echo The Longest Journey: Done.
echo.

rem The Suicide of Rachel Foster

set "tsorfsavedir=%localappdata%\Daedalic Entertainment GmbH\The Suicide of Rachel Foster\Saved"

rem Backup savegame files
if exist "%tsorfsavedir%\SaveGames\*.sav" (
	echo The Suicide of Rachel Foster: Backing up savegame file and game options
	xcopy /i /y "%tsorfsavedir%\SaveGames\*.sav" "The Suicide of Rachel Foster\SaveGames"
	echo.
) else (
	echo The Suicide of Rachel Foster: Savegame and game options files not found. Skipping...
	echo.
)

rem Backup user settings
if exist "%tsorfsavedir%\Config\WindowsNoEditor\GameUserSettings.ini" (
	echo The Suicide of Rachel Foster: Backing up user settings
	copy "%tsorfsavedir%\Config\WindowsNoEditor\GameUserSettings.ini" "The Suicide of Rachel Foster"
	echo.
) else (
	echo The Suicide of Rachel Foster: User settings not found. Skipping...
	echo.
)

echo The Suicide of Rachel Foster: Done.
echo.

rem Wiedźmin
rem English title: The Witcher

set "tw1regpath=HKCU\SOFTWARE\CD Projekt RED\Witcher"
set "tw1savedir=%userprofile%\Documents\The Witcher\saves"

rem Backup savegame files
if exist "%tw1savedir%\*.TheWitcherSave" (
	echo The Witcher: Backing up savegame files
	xcopy /i /y "%tw1savedir%\*.TheWitcherSave" "The Witcher"
	echo.
) else (
	echo The Witcher: Savegame files not found. Skipping...
	echo.
)

rem Export registry key into file
echo The Witcher: Backing up registry key
reg export "%tw1regpath%" "The Witcher\tw1-settings.reg" /y

echo The Witcher: Done.
echo.

rem Thief: The Dark Project

set "ttdprootdir=%gamerootdir%\Thief Gold"

rem Backup mission start save file
if exist "%ttdprootdir%\*.sav" (
	echo Thief: The Dark Project - Backing up mission start save file
	xcopy /i /y "%ttdprootdir%\*.sav" "Thief"
	echo.
) else (
	echo Thief: The Dark Project - Mission start save file not found. Skipping...
	echo.
)

rem Backup savegames
if exist "%ttdprootdir%\SAVES\*.sav" (
	echo Thief: The Dark Project - Backing up savegames
	xcopy /i /y "%ttdprootdir%\SAVES\*.sav" "Thief\SAVES"
	echo.
) else (
	echo Thief: The Dark Project - Savegames not found. Skipping...
	echo.
)

rem Backup configuration
if exist "%ttdprootdir%\cam.cfg" (
	echo Thief: The Dark Project - Backing up configuration
	xcopy /i /y "%ttdprootdir%\cam.cfg" "Thief"
	echo.
) else (
	echo Thief: The Dark Project - Configuration not found. Skipping...
	echo.
)

rem Backup keybinds
if exist "%ttdprootdir%\user.bnd" (
	echo Thief: The Dark Project - Backing up keybinds
	xcopy /i /y "%ttdprootdir%\user.bnd" "Thief"
	echo.
) else (
	echo Thief: The Dark Project - Keybinds not found. Skipping...
	echo.
)

echo Thief: The Dark Project - Done.
echo.

rem Tom Clancy’s Splinter Cell

set "tcscrootdir=%gamerootdir%\Splinter Cell"

rem Backup savegames
if exist "%tcscrootdir%\Save" (
	echo Tom Clancy's Splinter Cell: Backing up savegames
	xcopy /e /i /y "%tcscrootdir%\Save" "Splinter Cell\Save"
	echo.
) else (
	echo Tom Clancy's Splinter Cell: Save folder not found. Skipping...
	echo.
)

rem Backup configuration files
if exist "%tcscrootdir%\system\SplinterCell.ini" (
	if exist "%tcscrootdir%\system\SplinterCellUser.ini" (
		echo Tom Clancy's Splinter Cell: Backing up configuration files
		md "Splinter Cell\system"
		copy "%tcscrootdir%\system\SplinterCell.ini" "Splinter Cell\system"
		copy "%tcscrootdir%\system\SplinterCellUser.ini" "Splinter Cell\system"
		echo.
	)
) else (
	echo Tom Clancy's Splinter Cell: Configuration files not found. Skipping...
	echo.
)

echo Tom Clancy's Splinter Cell: Done.
echo.

rem Тургор
rem English title: The Void

set "thevoiddir=%userprofile%\Documents\My Games\Void"
set "turgordir=%userprofile%\Documents\My Games\Turgor"
set "thevoidrootdir=%gamerootdir%\The Void"
set "thevoidregpath=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Ice-pick Lodge\Void"
set "turgorregpath=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Ice-pick Lodge\Turgor"
set "turgorrootdir=%gamerootdir%\Turgor"
set "turgorpddir=%programdata%\Ice-pick Lodge\Turgor"
set "thevoidpddir=%programdata%\Ice-pick Lodge\Void"

rem Тургор: Backup savegames
if exist "%turgordir%\Savegames\*.sav" (
	echo Turgor: Backing up savegames
	xcopy /e /i /y "%turgordir%\Savegames" "Turgor\Savegames"
	echo.
) else (
	echo Turgor: Savegames not found. Skipping...
	echo.
)

rem The Void: Backup savegames
if exist "%thevoiddir%\Savegames\*.sav" (
	echo The Void: Backing up savegames
	xcopy /e /i /y "%turgordir%\Savegames" "The Void\Savegames"
	echo.
) else (
	echo The Void: Savegames not found. Skipping...
	echo.
)

rem Тургор: Backup settings
if exist "%turgorrootdir%\data\settings.xml" (
	echo Turgor: Backing up settings

	if not exist "Turgor\settings" (
		md "Turgor\settings"
	)

	xcopy /i /y "%turgorrootdir%\data\settings.xml" "Turgor\settings"
	echo.
) else (
	echo Turgor: Settings XML file not found. Skipping...
	echo.
)

rem The Void: Backup settings
if exist "%thevoidrootdir%\data\settings.xml" (
	echo The Void: Backing up settings

	if not exist "The Void\settings" (
		md "The Void\settings"
	)

	xcopy /i /y "%thevoidrootdir%\data\settings.xml" "The Void\settings"
	echo.
) else (
	echo The Void: Settings XML file not found. Skipping...
	echo.
)

rem Тургор: Backup render and sound settings
if exist "%turgorpddir%\*.xml" (
	echo Turgor: Backing up render and sound settings
	xcopy /e /i /y "%turgorpddir%" "Turgor\settings"
	echo.
) else (
	echo Turgor: Render and sound settings not found. Skipping...
	echo.
)

rem The Void: Backup render and sound settings
if exist "%thevoidpddir%\*.xml" (
	echo The Void: Backing up render and sound settings
	xcopy /e /i /y "%thevoidpddir%" "The Void\settings"
	echo.
) else (
	echo The Void: Render and sound settings not found. Skipping...
	echo.
)

rem Тургор: Export registry key
echo Turgor: Backing up registry key
reg export "%turgorregpath%" "Turgor\turgor.reg" /y
echo.

rem The Void: Export registry key
echo The Void: Backing up registry key
reg export "%thevoidregpath%" "The Void\the-void.reg" /y
echo.

echo Turgor: Done.
echo The Void: Done.
echo.

rem Unreal

set "unrealrootdir=%gamerootdir%\Unreal Gold"

rem Backup savegames
if exist "%unrealrootdir%\Save\*.usa" (
	echo Unreal: Backing up savegames
	xcopy /e /i /y "%unrealrootdir%\Save" "Unreal\Save"
	echo.
) else (
	echo Unreal: Savegames not found. Skipping...
	echo.
)

rem Backup configuration and keybinds
if exist "%unrealrootdir%\System\Unreal.ini" (
	if exist "%unrealrootdir%\System\User.ini" (
		echo Unreal: Backing up configuration and keybinds
		md "Unreal\System"
		copy "%unrealrootdir%\System\Unreal.ini" "Unreal\System"
		copy "%unrealrootdir%\System\User.ini" "Unreal\System"
		echo.
	)
) else (
	echo Unreal: Configuration and keybinds not found. Skipping...
	echo.
)

echo Unreal: Done.
echo.

rem Unreal II - The Awakening

set "unreal2rootdir=%gamerootdir%\Unreal 2 - The Awakening"

rem Backup savegames
if exist "%unreal2rootdir%\singleplayer\Save\*.usa" (
	echo Unreal II - The Awakening: Backing up savegames
	xcopy /e /i /y "%unreal2rootdir%\singleplayer\Save" "Unreal II\Save"
	echo.
) else (
	echo Unreal II - The Awakening: Savegames not found. Skipping...
	echo.
)

rem Backup configuration and keybinds
if exist "%unreal2rootdir%\singleplayer\System\Unreal2.ini" (
	if exist "%unreal2rootdir%\singleplayer\System\User.ini" (
		echo Unreal II - The Awakening: Backing up configuration and keybinds
		md "Unreal II\System"
		copy "%unreal2rootdir%\singleplayer\System\Unreal2.ini" "Unreal II\System"
		copy "%unreal2rootdir%\singleplayer\System\User.ini" "Unreal II\System"
		echo.
	)
) else (
	echo Unreal II - The Awakening: Configuration and keybinds not found. Skipping...
	echo.
)

rem Backup Golem file
if exist "%unreal2rootdir%\singleplayer\System\Golem.u" (
	echo Unreal II - The Awakening: Backing up Golem file
	copy "%unreal2rootdir%\singleplayer\System\Golem.u" "Unreal II\System"
	echo.
) else (
	echo Unreal II - The Awakening: Golem file not found. Skipping...
	echo.
)

echo Unreal II - The Awakening: Done.
echo.

rem Uplink

set "uplinkrootdir=%gamerootdir%\Uplink"

rem Copy user files from Uplink’s users directory
if exist "%uplinkrootdir%\users\*.usr" (
	echo Uplink: Backing up user files
	xcopy /i /y "%uplinkrootdir%\users\*.usr" "Uplink"
	echo.
) else (
	echo Uplink: User files not found. Skipping...
	echo.
)

rem Copy options file from Uplink’s users directory
if exist "%uplinkrootdir%\users\options" (
	echo Uplink: Backing up options file
	copy "%uplinkrootdir%\users\options" "Uplink"
	echo.
) else (
	echo Uplink: Options file not found. Skipping...
	echo.
)

echo Uplink: Done.
echo.

rem Vampire’s Dawn 2

set "vd2rootdir=%gamerootdir%\Vampire's Dawn 2"

rem Backup savegame files
if exist "%vd2rootdir%\*.lsd" (
	echo Vampire's Dawn 2: Backing up savegames
	xcopy /i /y "%vd2rootdir%\*.lsd" "Vampires Dawn 2"
	echo.
) else (
	echo Vampire's Dawn 2: Savegames not found. Skipping...
	echo.
)

echo Vampire's Dawn 2: Done.
echo.

rem What Remains of Edith Finch

set "wroefdir=%localappdata%\FinchGame"

rem Backup savegame
rem
rem Since the game creates a random ID suffix combined with the machine name,
rem the existence check is being done on the SaveGames folder instead of the
rem actual savegame. Not sure how to solve this.
if exist "%wroefdir%\Saved\SaveGames" (
	echo What Remains of Edith Finch: Backing up savegame
	xcopy /e /i /y "%wroefdir%\Saved\SaveGames" "What Remains of Edith Finch\Saved\SaveGames"
	echo.
) else (
	echo What Remains of Edith Finch: Savegame folder not found. Skipping...
	echo.
)

rem Backup game user settings file and Engine settings file
rem The rest of the .ini files seem to be empty, so there is no reason to back
rem them up
if exist "%wroefdir%\Saved\Config\WindowsNoEditor\*.ini" (
	echo What Remains of Edith Finch: Backing up configuration files

	if not exist "What Remains of Edith Finch\Saved\Config\WindowsNoEditor" (
		md "What Remains of Edith Finch\Saved\Config\WindowsNoEditor"
	)

	xcopy /i /y "%wroefdir%\Saved\Config\WindowsNoEditor\Engine.ini" "What Remains of Edith Finch\Saved\Config\WindowsNoEditor"
	xcopy /i /y "%wroefdir%\Saved\Config\WindowsNoEditor\GameUserSettings.ini" "What Remains of Edith Finch\Saved\Config\WindowsNoEditor"
	echo.
) else (
	echo What Remains of Edith Finch: Configuration files not found. Skipping...
	echo.
)

echo What Remains of Edith Finch: Done.
echo.

rem Worms Armageddon

set "waregpath=HKCU\SOFTWARE\Team17SoftwareLTD\WormsArmageddon"
set "warootdir=%gamerootdir%\Worms Armageddon"

rem Backup games data
if exist "%warootdir%\User\Games\*.WAgame" (
	echo Worms Armageddon: Backing up games data
	xcopy /e /i /y "%warootdir%\User\Games" "Worms Armageddon\Games"
	echo.
) else (
	echo Worms Armageddon: Games data not found. Skipping...
	echo.
)

rem Backup team data
if exist "%warootdir%\User\Teams\*.WGT" (
	echo Worms Armageddon: Backing up team data
	xcopy /e /i /y "%warootdir%\User\Teams" "Worms Armageddon\Teams"
	echo.
) else (
	echo Worms Armageddon: Team data not found. Skipping...
	echo.
)

rem Backup custom.dat file
if exist "%warootdir%\custom.dat" (
	echo Worms Armageddon: Backing up custom.dat file
	xcopy /i /y "%warootdir%\custom.dat" "Worms Armageddon"
	echo.
) else (
	echo Worms Armageddon: custom.dat file not found. Skipping...
	echo.
)

rem Backup land.dat file
if exist "%warootdir%\DATA\land.dat" (
	echo Worms Armageddon: Backing up land.dat file
	md "Worms Armageddon\DATA"
	copy "%warootdir%\DATA\land.dat" "Worms Armageddon\DATA"
	echo.
) else (
	echo Worms Armageddon: land.dat file not found. Skipping...
	echo.
)

rem Backup registry key
echo Worms Armageddon: Backing up registry key
reg export "%waregpath%" "Worms Armageddon\wa.reg" /y

echo Worms Armageddon: Done.
echo.

rem XIII

set "xiiirootdir=%gamerootdir%\XIII"

rem Backup profile and savegames
if exist "%xiiirootdir%\Save\*.pro" (
	echo XIII: Backing up profile and savegames
	xcopy /e /i /y "%xiiirootdir%\Save" "XIII\Save"
	echo.
) else (
	echo XIII: Profiles not found. Skipping...
	echo.
)

rem Backup configuration file
if exist "%xiiirootdir%\system\XIII.ini" (
	echo XIII: Backing up configuration file
	md XIII\system
	xcopy /i /y "%xiiirootdir%\system\XIII.ini" "XIII\system"
	echo.
) else (
	echo XIII: Configuration file not found. Skipping...
	echo.
)

echo XIII: Done.
echo.

pause
