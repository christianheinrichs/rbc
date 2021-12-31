@echo off

rem This script restores gamestates, which include profiles, savegames, setting
rem files etc.

rem Write the path to your game directory here
set "gamerootdir="

title Gamestate restore script

mode con cols=100

echo Gamestate restore script running
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

set "ahwmfrootdir=%gamerootdir%\A Hand With Many Fingers"
set "ahwmfsavedir=%userprofile%\AppData\LocalLow\Colestia\A Hand With Many Fingers\saves"

rem Installation check
if exist "%ahwmfrootdir%" (
	rem Restore savegame file
	if exist "A Hand With Many Fingers\saves\*.save" (
		echo A Hand With Many Fingers: Restoring savegame file
		xcopy /e /i /y "A Hand With Many Fingers\saves\*.save" "%ahwmfsavedir%"
		echo.
	) else (
		echo A Hand With Many Fingers: Savegame backup not found. Skipping...
		echo.
	)

	rem Restore registry keys
	if exist "A Hand With Many Fingers\ahwmf.reg" (
		echo A Hand With Many Fingers: Restoring settings
		reg import "A Hand With Many Fingers\ahwmf.reg"
		echo.
	) else (
		echo A Hand With Many Fingers: Registry keys backup not found. Skipping...
		echo.
	)
) else (
	echo A Hand With Many Fingers: Installation not found. Skipping...
	echo.
)

echo A Hand With Many Fingers: Done.
echo.

rem Alan Wake

set "awdir=%userprofile%\Documents\Remedy\AlanWake_GOG_Version"
set "awrootdir=%gamerootdir%\Alan Wake"

rem Installation check
if exist "%awrootdir%" (
	rem Restore config file, keybinds, resolution settings and savegames
	if exist "Alan Wake" (
		echo Alan Wake: Restoring config file, keybinds, resolution settings, savegames
		xcopy /e /i /y "Alan Wake" %awdir%
		echo.
	) else (
		echo Alan Wake: Backup not found. Skipping...
		echo.
	)
) else (
	echo Alan Wake: Installation not found. Skipping...
	echo.
)

echo Alan Wake: Done.
echo.

rem Alan Wake’s American Nightmare

set "awandir=%userprofile%\Documents\Remedy\AmericanNightmare_GOG_Version"
set "awanrootdir=%gamerootdir%\Alan Wake American Nightmare"

rem Installation check
if exist "%awanrootdir%" (
	rem Restore config file (which contains Arcade score data), keybinds,
	rem resolution, settings and savegames
	if exist "Alan Wake's American Nightmare" (
		echo Alan Wake's American Nightmare: Backing up config file, keybinds, resolution settings, savegames
		xcopy /e /i /y "Alan Wake's American Nightmare" %awandir%
		echo.
	) else (
		echo Alan Wake's American Nightmare: Backup not found. Skipping...
		echo.
	)
) else (
	echo Alan Wake's American Nightmare: Installation not found. Skipping...
	echo.
)

echo Alan Wake's American Nightmare: Done.
echo.

rem Aliens Versus Predator - Classic 2000

set "avpc2kdir1=%localappdata%\AvPGold"
set "avpc2kdir2=%localappdata%\Rebellion\AvP Classic"
set "avpc2krootdir=%gamerootdir%\Aliens versus Predator Classic"

rem Restore profiles, savegames and video configuration
if exist "Aliens Versus Predator - Classic 2000\AvP Classic" (
	echo Aliens Versus Predator - Classic 2000: Restoring profiles, savegames and video configuration
	xcopy /e /i /y "Aliens Versus Predator - Classic 2000\AvP Classic" "%avpc2kdir2%"
	echo.
) else (
	echo Aliens Versus Predator - Classic 2000: AvP Classic folder not found. Skipping...
	echo.
)

rem Restore Launcher.ini
if exist "Aliens Versus Predator - Classic 2000\AvPGold" (
	echo Aliens Versus Predator - Classic 2000: Restoring Launcher.ini
	xcopy /e /i /y "Aliens Versus Predator - Classic 2000\AvPGold" "%avpc2kdir1%"
	echo.
) else (
	echo Aliens Versus Predator - Classic 2000: AvPGold folder not found. Skipping...
	echo.
)

rem Restore configuration
if exist "Aliens Versus Predator - Classic 2000\CONFIG.CFG" (
	echo Aliens Versus Predator - Classic 2000: Restoring configuration
	copy "Aliens Versus Predator - Classic 2000\CONFIG.CFG" "%avpc2krootdir%"
	echo.
) else (
	echo Aliens Versus Predator - Classic 2000: Configuration not found. Skipping...
	echo.
)

echo Aliens Versus Predator - Classic 2000: Done.
echo.

rem Amnesia: A Machine for Pigs

set "aamfpdir=%userprofile%\Documents\Amnesia\Pig"
set "aamfprootdir=%gamerootdir%\Amnesia - A Machine For Pigs"

rem Installation check
if exist "%aamfprootdir%" (
	rem Restore Amnesia\Pig folder
	if exist "Amnesia - A Machine for Pigs" (
		echo Amnesia: A Machine for Pigs - Restoring profile folder, first start flag and main settings
		xcopy /e /i /y "Amnesia - A Machine for Pigs" "%aamfpdir%"
		echo.
	) else (
		echo Amnesia: A Machine for Pigs - Backup not found. Skipping...
		echo.
	)
) else (
	echo Amnesia: A Machine for Pigs - Installation not found. Skipping...
	echo.
)

echo Amnesia: A Machine for Pigs - Done.
echo.

rem Amnesia - The Dark Descent

set "atdddir=%userprofile%\Documents\Amnesia\Main"
set "atddrootdir=%gamerootdir%\Amnesia - The Dark Descent"

rem Installation check
if exist "%atddrootdir%" (
	rem Restore Amnesia\Main folder
	if exist "Amnesia - The Dark Descent" (
		echo Amnesia - The Dark Descent: Restoring profile folder, first start flag and main settings
		xcopy /e /i /y "Amnesia - The Dark Descent" "%atdddir%"
		echo.
	) else (
		echo Amnesia - The Dark Descent: Backup not found. Skipping...
		echo.
	)
) else (
	echo Amnesia - The Dark Descent: Installation not found. Skipping...
	echo.
)

echo Amnesia - The Dark Descent: Done.
echo.

rem Anachronox

set "anoxrootdir=%gamerootdir%\Anachronox"

rem Installation check
if exist "%anoxrootdir%" (
	rem Restore SAVE folder
	if exist Anachronox\SAVE (
		echo Anachronox: Restoring SAVE folder
		xcopy /e /i /y Anachronox\SAVE %anoxrootdir%\anoxdata\SAVE
		echo.
	) else (
		echo Anachronox: SAVE folder backup not found. Skipping...
		echo.
	)
) else (
	echo Anachronox: Installation not found. Skipping...
	echo.
)

echo Anachronox: Done.
echo.

rem ANNO 1602

set "anno1602rootdir=%gamerootdir%\ANNO1602"

rem Installation check
if exist "%anno1602rootdir%" (
	rem Restore savegames
	if exist "ANNO 1602\Savegame" (
		echo ANNO 1602: Restoring savegames
		xcopy /e /i /y "ANNO 1602\Savegame" %anno1602rootdir%\Savegame
		echo.
	) else (
		echo ANNO 1602: Savegame backup not found. Skipping...
		echo.
	)

	rem Restore Game.dat
	if exist "ANNO 1602\Game.dat" (
		echo ANNO 1602: Restoring Game.dat file
		copy "ANNO 1602"\Game.dat %anno1602rootdir%
		echo.
	) else (
		echo ANNO 1602: Game.dat backup not found. Skipping...
		echo.
	)

	rem Restore registry keys
	if exist "ANNO 1602\anno1602.reg" (
		echo ANNO 1602: Restoring registry keys
		reg import "ANNO 1602\anno1602.reg"
		echo.
	) else (
		echo ANNO 1602: Registry keys backup not found. Skipping...
		echo.
	)
) else (
	echo ANNO 1602: Installation not found. Skipping...
	echo.
)

echo ANNO 1602: Done.
echo.

rem Baldur’s Gate

set "bgrootdir=%gamerootdir%\Baldur's Gate"

rem Installation check
if exist "%bgrootdir%" (
	rem Restore savegames
	if exist "Baldur's Gate\Save" (
		echo Baldur's Gate: Restoring savegames
		xcopy /e /i /y "Baldur's Gate\Save" "%bgrootdir%\Save"
		echo.
	) else (
		echo Baldur's Gate: Savegames backup not found. Skipping...
		echo.
	)

	rem Restore configuration file
	if exist "Baldur's Gate\Baldur.ini" (
		echo Baldur's Gate: Restoring configuration file
		xcopy /i /y "Baldur's Gate\Baldur.ini" "%bgrootdir%"
		echo.
	) else (
		echo Baldur's Gate: Configuration backup not found. Skipping...
		echo.
	)

	rem Restore characters
	if exist "Baldur's Gate\Characters\*.chr" (
		echo Baldur's Gate: Restoring characters
		xcopy /e /i /y "Baldur's Gate\Characters" "%bgrootdir%\Characters"
		echo.
	) else (
		echo Baldur's Gate: Character backup not found. Skipping...
		echo.
	)
) else (
	echo Baldur's Gate: Installation not found. Skipping...
	echo.
)

echo Baldur's Gate: Done.
echo.

rem Baldur’s Gate: Enhanced Edition

set "bgeedir=%userprofile%\Documents\Baldur's Gate - Enhanced Edition"

rem Installation check
if exist "%bgeedir%" (
	rem Restore savegames, ‘The Black Pits’ savegames, characters, character
	rem biographies, portraits and the Baldur.lua script
	if exist "Baldur's Gate - Enhanced Edition" (
		echo Baldur's Gate: Enhanced Edition - Restoring folder
		xcopy /e /i /y "Baldur's Gate - Enhanced Edition" "%bgeedir%"
		echo.
	) else (
		echo Baldur's Gate: Enhanced Edition - Folder backup not found. Skipping...
		echo.
	)
) else (
	echo Baldur's Gate: Enhanced Edition - Installation not found. Skipping...
)

echo Baldur's Gate: Enhanced Edition - Done.
echo.

rem Barrow Hill - Curse of the Ancient Circle

set "bh1rootdir=%gamerootdir%\Barrow Hill - Curse of the Ancient Circle"

rem Installation check
if exist "%bh1rootdir%" (
	rem Restore savegames
	if exist "Barrow Hill - Curse of the Ancient Circle\*.sav" (
		echo Barrow Hill - Curse of the Ancient Circle: Restoring savegames
		xcopy /i /y "Barrow Hill - Curse of the Ancient Circle\*.sav" "%bh1rootdir%"
		echo.
	) else (
		echo Barrow Hill - Curse of the Ancient Circle: Savegames backup not found. Skipping...
		echo.
	)

	rem Restore settings
	if exist "Barrow Hill - Curse of the Ancient Circle\*.mat" (
		echo Barrow Hill - Curse of the Ancient Circle: Restoring settings
		copy "Barrow Hill - Curse of the Ancient Circle\*.mat" "%bh1rootdir%"
		echo.
	) else (
		echo Barrow Hill - Curse of the Ancient Circle: Settings backup not found. Skipping...
		echo.
	)
) else (
	echo Barrow Hill - Curse of the Ancient Circle: Installation not found. Skipping...
	echo.
)

echo Barrow Hill - Curse of the Ancient Circle: Done.
echo.

rem Battle Realms

set "br1rootdir=%gamerootdir%\Battle Realms"

rem Installation check
if exist "%br1rootdir%" (
	rem Restore savegames
	if exist "Battle Realms\Saved Games\*.br1" (
		echo Battle Realms: Restoring savegames
		xcopy /e /i /y "Battle Realms\Saved Games" "%br1rootdir%\Saved Games"
		echo.
	) else (
		echo Battle Realms: Savegames backup not found. Skipping...
		echo.
	)

	rem Restore configuration file
	if exist "Battle Realms\*.ini" (
		echo Battle Realms: Restoring configuration file
		xcopy /i /y "Battle Realms\*.ini" "%br1rootdir%"
		echo.
	) else (
		echo Battle Realms: Configuration backup not found. Skipping...
		echo.
	)

	rem Restore registry keys
		if exist "Battle Realms\br1.reg" (
			echo Battle Realms: Restoring registry keys
			reg import "Battle Realms\br1.reg"
			echo.
		) else (
			echo Battle Realms: Registry keys backup not found. Skipping...
			echo.
		)

	rem Restore Serpent DLL file
	if exist "Battle Realms\Scripts\Serpent 5E_F.dll" (
		echo Battle Realms: Restoring Serpent DLL file
		copy "Battle Realms\Scripts\Serpent 5E_F.dll" "%br1rootdir%\Scripts"
		echo.
	) else (
		echo Battle Realms: Serpent DLL backup not found. Skipping...
		echo.
	)
) else (
	echo Battle Realms: Installation not found. Skipping...
	echo.
)

echo Battle Realms: Done.
echo.

rem Becherov

set "becherovrootdir=%gamerootdir%\Becherov"

rem Installation check
if exist "%becherovrootdir%" (
	rem Restore profile data
	if exist Becherov\Data\Player\*.dat (
		echo Becherov: Restoring profile data
		xcopy /i /y Becherov\Data\Player\*.dat %becherovrootdir%\Data\Player
		echo.
	) else (
		echo Becherov: Profile data backup not found. Skipping...
		echo.
	)

	rem Restore registry keys
	if exist Becherov\becherov.reg (
		echo Becherov: Restoring registry keys
		reg import Becherov\becherov.reg
		echo.
	) else (
		echo Becherov: Registry keys backup not found. Skipping...
		echo.
	)
) else (
	echo Becherov: Installation not found. Skipping...
	echo.
)

echo Becherov: Done.
echo.

rem BioShock

set "bs1dir=%appdata%\Bioshock"
set "bs1rootdir=%gamerootdir%\BioShock"
set "bs1sgdir=%userprofile%\Documents\Bioshock\SaveGames"

rem Installation check
if exist "%bs1rootdir%" (
	rem Restore savegames
	if exist BioShock\SaveGames\*.bsb (
		echo BioShock: Restoring savegames
		xcopy /e /i /y "BioShock\SaveGames" %bs1sgdir%
		echo.
	) else (
		echo BioShock: Savegames backup not found. Skipping...
		echo.
	)

	rem Restore memory file, configuration and keybinds
	if exist BioShock\AppData (
		echo BioShock: Restoring memory file, configuration and keybinds
		xcopy /e /i /y BioShock\AppData %bs1dir%
		echo.
	) else (
		echo BioShock: AppData backup not found. Skipping...
		echo.
	)
) else (
	echo BioShock: Installation not found. Skipping...
	echo.
)

echo BioShock: Done.
echo.

rem Blood Omen: Legacy of Kain

set "bolokrootdir=%gamerootdir%\Blood Omen"

rem Installation check
if exist "%bolokrootdir%" (
	rem Restore savegames
	if exist "Blood Omen - Legacy of Kain\Saves\*.sav" (
		echo Blood Omen: Legacy of Kain - Restoring savegames
		xcopy /e /i /y "Blood Omen - Legacy of Kain\Saves" "%bolokrootdir%\Saves"
		echo.
	) else (
		echo Blood Omen: Legacy of Kain - Savegames backup not found. Skipping...
		echo.
	)

	rem Restore configuration files and PTEMP.TMP
	if exist "Blood Omen - Legacy of Kain\Cfg\*.cfg" (
		if exist "Blood Omen - Legacy of Kain\Cfg\*.TMP" (
			echo Blood Omen: Legacy of Kain - Restoring configuration files and PTEMP.TMP
			xcopy /e /i /y  "Blood Omen - Legacy of Kain\Cfg\*.cfg" "%bolokrootdir%\Cfg"
			xcopy /e /i /y  "Blood Omen - Legacy of Kain\Cfg\*.TMP" "%bolokrootdir%\Cfg"
			echo.
		)
	) else (
		echo Blood Omen: Legacy of Kain - Configuration files and PTEMP.TMP backup not found. Skipping...
		echo.
	)

	rem Restore DirectX configuration
	if exist "Blood Omen - Legacy of Kain\dxcfg.ini" (
		echo Blood Omen: Legacy of Kain - Restoring DirectX configuration
		xcopy /i /y "Blood Omen - Legacy of Kain\dxcfg.ini" "%bolokrootdir%"
		echo.
	) else (
		echo Blood Omen: Legacy of Kain - DirectX configuration backup not found. Skipping...
		echo.
	)

	rem Restore registry keys
	echo Blood Omen: Legacy of Kain - Restoring registry keys
	reg import "Blood Omen - Legacy of Kain\bolok.reg"
) else (
	echo Blood Omen: Legacy of Kain - Installation not found. Skipping...
	echo.
)

echo Blood Omen: Legacy of Kain - Done.
echo.

rem Buddy Simulator 1984

set "bs1984datadir=%userprofile%\Documents\Buddy Simulator 1984"
set "bs1984rootdir=%gamerootdir%\Buddy Simulator 1984"

rem Installation check
if exist "%bs1984rootdir%" (
	rem Restore DATA folder
	if exist "Buddy Simulator 1984\DATA" (
		echo Buddy Simulator 1984: Restoring data folder
		xcopy /e /i /y "Buddy Simulator 1984\DATA" "%bs1984datadir%"
		echo.
	) else (
		echo Buddy Simulator 1984: DATA backup not found. Skipping...
		echo.
	)

	rem Restore memories
	if exist "Buddy Simulator 1984\Memories" (
		echo Buddy Simulator 1984: Restoring memories
		copy "Buddy Simulator 1984\Memories\*" "%bs1984rootdir%\Buddy Simulator 1984_Data\StreamingAssets\Memories"
		echo.
	) else (
		echo Buddy Simulator 1984: Memory backup not found. Skipping...
		echo.
	)

	rem Restore registry keys
	if exist "Buddy Simulator 1984\buddy-sim-1984.reg" (
		echo Buddy Simulator 1984: Restoring registry keys
		reg import "Buddy Simulator 1984\buddy-sim-1984.reg"
		echo.
	) else (
		echo Buddy Simulator 1984: Registry keys backup not found. Skipping...
		echo.
	)
) else (
	echo Buddy Simulator 1984: Installation not found. Skipping...
	echo.
)

echo Buddy Simulator 1984: Done.
echo.

rem Cave Story

set "cavestoryrootdir=%gamerootdir%\Cave Story"

rem Installation check
if exist "%cavestoryrootdir%" (
	rem Copy .dat into the game’s root directory
	if exist "Cave Story\*.dat" (
		echo Cave Story: Restoring configuration and profile data
		copy "Cave Story\*.dat" %cavestorydir%
		echo.
	) else (
		echo Cave Story: Configuration and profile data backup not found. Skipping...
		echo.
	)

	rem Restore window.rect
	if exist "Cave Story\*.rect" (
		echo Cave Story: Restoring window.rect file
		copy "Cave Story\*.rect" %cavestorydir%
		echo.
	) else (
		echo Cave Story: window.rect backup not found. Skipping...
		echo.
	)
) else (
	echo Cave Story: Installation not found. Skipping...
	echo.
)

echo Cave Story: Done.
echo.

rem Chaser

set "chaserrootdir=%gamerootdir%\Chaser"

rem Installation check
if exist "%chaserrootdir%" (
	rem Restore savegames
	if exist Chaser\Save\*.sav (
		echo Chaser: Restoring savegames
		copy Chaser\Save\*.sav %chaserrootdir%\Save
		echo.
	) else (
		echo Chaser: Savegame backup not found. Skipping...
		echo.
	)

	rem Restore keybinds and settings
	if exist Chaser\Users\*.cfg (
		echo Chaser: Restoring keybinds and settings
		copy Chaser\Users\*.cfg %chaserrootdir%\Save\Users
		echo.
	) else (
		echo Chaser: Keybinds and settings backup not found. Skipping...
		echo.
	)
) else (
	echo Chaser: Installation not found. Skipping...
	echo.
)

echo Chaser: Done.
echo.

rem Crashday

set "crashdayrootdir=%gamerootdir%\Crashday"

rem Installation check
if exist "%crashdayrootdir%" (
	rem Restore savegames and last user file
	if exist Crashday\savegame\*.sav (
		echo Crashday: Restoring last user file and savegames
		xcopy /e /i /y Crashday\savegame %crashdayrootdir%\savegame
		echo.
	) else (
		echo Crashday: Savegames backup not found. Skipping...
		echo.
	)

	rem Restore minigame highscores
	if exist Crashday\career\minigame\*.hig (
		echo Crashday: Restoring minigame highscores
		xcopy /i /y Crashday\career\minigame\*.hig %crashdayrootdir%\career\minigame
		echo.
	) else (
		echo Crashday: Minigame highscores backup not found. Skipping...
		echo.
	)

	rem Restore track highscores and replay file
	if exist Crashday\trkdata\tracks\*.hig (
		echo Crashday: Restoring track highscores and replay file
		xcopy /i /y Crashday\trkdata\tracks\*.hig %crashdayrootdir%\trkdata\tracks
		copy "Crashday\trkdata\tracks\_!replay!_.trk" %crashdayrootdir%\trkdata\tracks
		echo.
	) else (
		echo Crashday: Highscores backup not found. Skipping...
		echo.
	)

	rem Restore replays
	if exist Crashday\replays\*.rpl (
		echo Crashday: Restoring replays
		xcopy /e /i /y Crashday\replays %crashdayrootdir%\replays
		echo.
	) else (
		echo Crashday: Replays backup not found. Skipping...
		echo.
	)

	rem Restore configuration files
	if exist Crashday\contrldx.cfg (
		if exist Crashday\propsfx.cfg (
			if exist Crashday\sounddx.cfg (
				echo Crashday: Restoring configuration files
				copy Crashday\contrldx.cfg %crashdayrootdir%
				copy Crashday\propsfx.cfg %crashdayrootdir%
				copy Crashday\sounddx.cfg %crashdayrootdir%
				echo.
				)
			)
	) else (
		echo Crashday: Configuration files backup not found. Skipping...
		echo.
	)

	rem Restore quickchat file
	if exist Crashday\quickchat.txt (
		echo Crashday: Backing up quickchat file
		copy %crashdayrootdir%\quickchat.txt Crashday
		echo.
	) else (
		echo Crashday: Quickchat backup not found. Skipping...
		echo.
	)
) else (
	echo Crashday: Installation not found. Skipping...
	echo.
)

echo Crashday: Done.
echo.

rem Darkest Dungeon

set "dddir=%userprofile%\Documents\Darkest"
set "darkestrootdir=%gamerootdir%\Darkest Dungeon"

rem Installation check
if exist "%darkestrootdir%" (
	rem Restore JSON files
	if exist "Darkest Dungeon" (
		echo Darkest Dungeon: Restoring JSON files
		xcopy /e /i /y "Darkest Dungeon" %dddir%
		echo.
	) else (
		echo Darkest Dungeon: Folder not found. Skipping...
		echo.
	)
) else (
	echo Darkest Dungeon: Installation not found. Skipping...
	echo.
)

echo Darkest Dungeon: Done.
echo.

rem Dear Devere

set "ddrootdir=%gamerootdir%\Dear Devere"

rem Installation check
if exist "%ddrootdir%" (
	rem Restore savegames
	if exist "Dear Devere\game\saves" (
		echo Dear Devere: Restoring savegames
		xcopy /i /y "Dear Devere\game\saves\*" "%ddrootdir%\game\saves"
		echo.
	) else (
		echo Dear Devere: Savegame backup not found. Skipping...
		echo.
	)

	rem Restore screenshots
	if exist "Dear Devere\*.png" (
		echo Dear Devere: Restoring screenshots
		xcopy /i /y "Dear Devere\*.png" "%ddrootdir%"
		echo.
	) else (
		echo Dear Devere: Screenshot backup not found. Skipping...
		echo.
	)
) else (
	echo Dear Devere: Installation not found. Skipping...
	echo.
)

echo Dear Devere: Done.
echo.

rem Diablo (Classic)

set "diablorootdir=%gamerootdir%\Diablo"

rem Installation check
if exist "%diablorootdir%" (
	rem Restore savegame files
	if exist Diablo\Classic\*.sv (
		echo "Diablo (Classic): Restoring savegame files"
		xcopy /i /y Diablo\Classic\*.sv %diablorootdir%
		echo.
	) else (
		echo "Diablo (Classic): Savegames backup not found. Skipping..."
		echo.
	)
) else (
	echo "Diablo (Classic): Installation not found. Skipping..."
	echo.
)

echo Diablo (Classic): Done.
echo.

rem Diablo

rem Installation check
if exist "%diablorootdir%" (
	rem Restore savegame files
	if exist Diablo\DX\*.sv (
		echo Diablo: Restoring savegame files
		xcopy /i /y Diablo\DX\*.sv %diablorootdir%\dx
		echo.
	) else (
		echo Diablo: Savegame backup not found. Skipping...
		echo.
	)

	rem Restore DirectX configuration
	if exist Diablo\DX\dxcfg.ini (
		echo Diablo: Restoring DirectX configuration
		copy Diablo\DX\dxcfg.ini %diablorootdir%\dx
		echo.
	) else (
		echo Diablo: DirectX configuration backup not found. Skipping...
		echo.
	)
) else (
	echo Diablo: Installation not found. Skipping...
	echo.
)

echo Diablo: Done.
echo.

rem Diablo: Hellfire

rem Installation check
if exist "%diablorootdir%" (
	rem Restore savegame files
	if exist Diablo\Hellfire\*.hsv (
		echo Diablo: Hellfire - Restoring savegame files
		xcopy /i /y Diablo\Hellfire\*.hsv %diablorootdir%\hellfire
		echo.
	) else (
		echo Diablo: Hellfire - Savegame backup not found. Skipping...
		echo.
	)
) else (
	echo Diablo: Hellfire - Installation not found. Skipping...
	echo.
)

echo Diablo: Hellfire - Done.
echo.

rem Diablo II

set "d2rootdir=%gamerootdir%\Diablo II"
set "d2sgdir=%userprofile%\Saved Games\Diablo II"

rem Installation check
if exist "%d2rootdir%" (
	rem Restore savegame files
	if exist "Diablo II\Saved Games\*.d2s" (
		echo Diablo II: Restoring savegames
		xcopy /e /i /y "Diablo II\Saved Games" "%d2sgdir%"
		echo.
	) else (
		echo Diablo II: Savegames backup not found. Skipping...
		echo.
	)

	rem Restore default.key file
	if exist "Diablo II\default.key" (
		echo Diablo II: Restoring default.key file
		copy "Diablo II\default.key" "%d2rootdir%"
		echo.
	) else (
		echo Diablo II: default.key backup not found. Skipping...
		echo.
	)

	rem Restore registry keys
	if exist "Diablo II\d2.reg" (
		echo Diablo II: Restoring registry keys
		reg import "Diablo II\d2.reg"
		echo.
	) else (
		echo Diablo II: Registry keys backup not found. Skipping...
		echo.
	)
) else (
	echo Diablo II: Installation not found. Skipping...
	echo.
)

echo Diablo II: Done.
echo.

rem Die Gilde

set "gilderootdir=%gamerootdir%\Die Gilde"

rem Installation check
if exist "%gilderootdir%" (
	rem Restore savegames
	if exist "Die Gilde\Resources\gamedata\saves\*.SAV" (
		echo Die Gilde: Restoring savegames
		xcopy /i /y "Die Gilde\Resources\gamedata\saves\*.SAV" "%gilderootdir%\Resources\gamedata\saves"
		echo.
	) else (
		echo Die Gilde: Savegame backup not found. Skipping...
		echo.
	)

	rem Restore configuration
	if exist "Die Gilde\game.ini" (
		echo Die Gilde: Restoring configuration
		xcopy /i /y "Die Gilde\game.ini" "%gilderootdir%"
		echo.
	) else (
		echo Die Gilde: Configuration backup not found. Skipping...
		echo.
	)

	rem Restore registry keys
	if exist "Die Gilde\gilde.reg" (
		echo Die Gilde: Restoring registry keys
		reg import "Die Gilde\gilde.reg"
		echo.
	) else (
		echo Die Gilde: Registry keys backup not found. Skipping...
		echo.
	)
) else (
	echo Die Gilde: Installation not found. Skipping...
	echo.
)

echo Die Gilde: Done.
echo.

rem Die Völker

set "dvrootdir=%gamerootdir%\Alien Nations"

rem Installation check
if exist "%dvrootdir%" (
	rem Restore configuration and savegame files
	if exist "Die Voelker\Savegames" (
		echo Die Voelker: Restoring configuration and savegame files
		xcopy /e /i /y "Die Voelker\Savegames" "%dvdir%\Savegames"
		echo.
	) else (
		echo Die Voelker: Savegames folder not found. Skipping...
		echo.
	)
) else (
	echo Die Voelker: Installation not found. Skipping...
	echo.
)

echo Die Voelker: Done.
echo.

rem Driver

set "driverrootdir=%gamerootdir%\Driver"

rem Installation check
if exist "%driverrootdir%" (
	rem Restore highscores, replays and savegames
	if exist "Driver\Saves\*.BIN" (
		echo Driver: Restoring highscores, replays and savegames
		xcopy /e /i /y Driver\Saves %driverrootdir%\Saves
		echo.
	) else (
		echo Driver: No replays or savegames backup found. Skipping...
		echo.
	)

	rem Restore temporary user replay data
	if exist "Driver\ReplayData\User\$TEMP$.CFG" (
		echo Driver: Restoring temporary user replay data
		copy "Driver\ReplayData\User\$TEMP$.CFG" "%driverrootdir%\ReplayData\User"
		copy "Driver\ReplayData\User\$TEMP$.PADS" "%driverrootdir%\ReplayData\User"
		echo.
	) else (
		echo Driver: Temporary user replay data backup not found. Skipping...
		echo.
	)

	rem Restore start position file
	if exist "Driver\*.X" (
		echo Driver: Restoring start position file
		xcopy /i /y Driver\*.X %driverrootdir%
		echo.
	) else (
		echo Driver: No start position file backup found. Skipping...
		echo.
	)

	rem Restore configuration
	if exist "Driver\CONFIG.DAT" (
		echo Driver: Restoring configuration
		copy Driver\CONFIG.DAT %driverrootdir%
		echo.
	) else (
		echo Driver: Configuration backup not found. Skipping...
		echo.
	)
) else (
	echo Driver: Installation not found. Skipping...
	echo.
)

echo Driver: Done.
echo.

rem Dungeon Keeper 2

set "dk2rootdir=%gamerootdir%\Dungeon Keeper 2"

rem Installation check
if exist "%dk2rootdir%" (
	rem Restore savegames
	if exist "Dungeon Keeper 2\Data\Save\*.SAV" (
		echo Dungeon Keeper 2: Restoring savegames
		xcopy /e /i /y "Dungeon Keeper 2\Data\Save" "%dk2rootdir%\Data\Save"
		echo.
	) else (
		echo Dungeon Keeper 2: Savegames backup not found. Skipping...
		echo.
	)

	rem Restore highscores
	if exist "Dungeon Keeper 2\Data\Settings\*.dat" (
		echo Dungeon Keeper 2: Restoring highscores
		xcopy /e /i /y "Dungeon Keeper 2\Data\Settings" "%dk2rootdir%\Data\Settings"
		echo.
	) else (
		echo Dungeon Keeper 2: Highscores backup not found. Skipping...
		echo.
	)

	rem Restore configuration
	if exist "Dungeon Keeper 2\dk2-conf.reg" (
		echo Dungeon Keeper 2: Restoring configuration
		reg import "Dungeon Keeper 2\dk2-conf.reg"
		echo.
	) else (
		echo Dungeon Keeper 2: Configuration backup not found. Skipping...
		echo.
	)

	rem Restore version number registry keys
	if exist "Dungeon Keeper 2\dk2-version.reg" (
		echo Dungeon Keeper 2: Restoring version number registry keys
		reg import "Dungeon Keeper 2\dk2-version.reg" /y
		echo.
	) else (
		echo Dungeon Keeper 2: Version number registry keys backup not found. Skipping...
		echo.
	)
) else (
	echo Dungeon Keeper 2: Installation not found. Skipping...
	echo.
)

echo Dungeon Keeper 2: Done.
echo.

rem else Heart.Break()

set "ehbrootdir=%gamerootdir%\ElseHeartbreak"

rem Installation check
if exist "%ehbrootdir%" (
	rem Restore savegame files
	if exist "Else Heartbreak\Saves\*.json" (
		echo "else Heart.Break(): Restoring JSON savegame files"
		copy "Else Heartbreak\Saves\*.json" "%ehbrootdir%\ElseHeartbreak_Data\Saves"
		echo.
	) else (
		echo "else Heart.Break(): Savegames not found. Skipping..."
		echo.
	)

	rem Restore registry keys
	if exist "Else Heartbreak\else-heartbreak.reg" (
		echo "else Heart.Break(): Restoring settings"
		reg import "Else Heartbreak\else-heartbreak.reg"
		echo.
	) else (
		echo "else Heart.Break(): Registry keys not found. Skipping..."
		echo.
	)
) else (
	echo "else Heart.Break(): Installation not found. Skipping..."
	echo.
)

echo else Heart.Break(): Done.
echo.

rem Enigmatis - The Ghosts of Maple Creek

set "etgomcdir=%appdata%\Artifex Mundi\Enigmatis_TheGhostOfMapleCreek"

if exist "Enigmatis - The Ghosts of Maple Creek\CE\profile\*.prf" (
	echo Enigmatis - The Ghosts of Maple Creek: Restoring profile folder
	xcopy /e /i /y "Enigmatis - The Ghosts of Maple Creek\CE\profile" "%etgomcdir%"
	echo.
) else (
	echo Enigmatis - The Ghosts of Maple Creek: Profiles not found. Skipping...
	echo.
)

echo Enigmatis - The Ghosts of Maple Creek: Done.
echo.

rem Europa Universalis

set "eu1rootdir=%gamerootdir%\Europa Universalis"

rem Installation check
if exist "%eu1rootdir%" (
	rem Restore savegames
	if exist "Europa Universalis\Scenarios\Save Games" (
		echo Europa Universalis: Restoring savegames
		xcopy /e /i /y "Europa Universalis\Scenarios\Save Games" "%eu1rootdir%\Scenarios\Save Games"
		echo.
	) else (
		echo Europa Universalis: Savegames backup not found. Skipping...
		echo.
	)

	rem Restore configuration
	if exist "Europa Universalis\*.eu" (
		echo Europa Universalis: Restoring configuration
		copy "Europa Universalis\*.eu" "%eu1rootdir%"
		echo.
	) else (
		echo Europa Universalis: Configuration backup not found. Skipping...
		echo.
	)
) else (
	echo Europa Universalis: Installation not found. Skipping...
	echo.
)

echo Europa Universalis: Done.
echo.

rem Europa Universalis II

set "eu2rootdir=%gamerootdir%\Europa Universalis 2"

rem Installation check
if exist "%eu2rootdir%" (
	rem Restore savegames
	if exist "Europa Universalis II\Scenarios\save games" (
		echo Europa Universalis II: Restoring savegames
		xcopy /e /i /y "Europa Universalis II\Scenarios\save games" "%eu2rootdir%\Scenarios\save games"
		echo.
	) else (
		echo Europa Universalis II: Savegames backup not found. Skipping...
		echo.
	)

	rem Restore history file
	if exist "Europa Universalis II\history.txt" (
		echo Europa Universalis II: Restoring history file
		copy "Europa Universalis II\history.txt" "%eu2rootdir%"
		echo.
	) else (
		echo Europa Universalis II: History file backup not found. Skipping...
		echo.
	)

	rem Restore configuration
	if exist "Europa Universalis II\*.eu" (
		echo Europa Universalis II: Restoring configuration
		copy "Europa Universalis II\*.eu" "%eu2rootdir%"
		echo.
	) else (
		echo Europa Universalis II: Configuration backup not found. Skipping...
		echo.
	)

	rem Restore settings
	if exist "Europa Universalis II\settings.cfg" (
		echo Europa Universalis II: Restoring settings
		copy "Europa Universalis II\settings.cfg" "%eu2rootdir%"
		echo.
	) else (
		echo Europa Universalis II: Settings backup not found. Skipping...
	)
) else (
	echo Europa Universalis II: Installation not found. Skipping...
	echo.
)

echo Europa Universalis II: Done.
echo.

rem FaeFever

set "ffrootdir=%gamerootdir%\FaeFever"
set "fflldir=%userprofile%\AppData\LocalLow\MonkeyWizardEntertainment\FaeFever"

rem Installation check
if exist "%ffrootdir%" (
	rem Restore savegames and settings
	if exist "FaeFever\Save" (
		echo FaeFever: Restoring savegames and settings
		xcopy /e /i /y "FaeFever\Save" "%fflldir%\Save"
		echo.
	) else (
		echo FaeFever: Save folder backup not found. Skipping...
		echo.
	)

	rem Restore registry keys
	if exist "FaeFever\faefever.reg" (
		echo FaeFever: Restoring registry keys
		reg import FaeFever\faefever.reg
		echo.
	) else (
		echo FaeFever: Registry keys backup not found. Skipping...
		echo.
	)
) else (
	echo FaeFever: Installation not found. Skipping...
	echo.
)

echo FaeFever: Done.
echo.

rem Firewatch

set "fwlldir=%userprofile%\AppData\LocalLow\CampoSanto\Firewatch"
set "fwrootdir=%gamerootdir%\Firewatch"

rem Installation check
if exist "%fwrootdir%" (
	rem Restore localisation file, keybinds, photos and savegames
	if exist Firewatch\CampoSanto (
		echo Firewatch: Restoring localisation file, keybinds, photos and savegames
		xcopy /e /i /y Firewatch\CampoSanto %fwlldir%
		echo.
	) else (
		echo Firewatch: Backup not found. Skipping...
		echo.
	)

	rem Restore settings
	if exist Firewatch\firewatch.reg (
		echo Firewatch: Restoring settings
		reg import Firewatch\firewatch.reg
		echo.
	) else (
		echo Firewatch: Settings backup not found. Skipping...
		echo.
	)
) else (
	echo Firewatch: Installation not found. Skipping...
	echo.
)

echo Firewatch: Done.
echo.

rem Gothic

set "g1rootdir=%gamerootdir%\Gothic"

rem Installation check
if exist "%g1rootdir%" (
	rem Restore savegames
	if exist Gothic\Saves (
		echo Gothic: Restoring savegames
		xcopy /e /i /y Gothic\Saves %g1rootdir%\Saves
		echo.
	) else (
		echo Gothic: Savegames backup not found. Skipping...
		echo.
	)

	rem Backup configuration file
	if exist Gothic\system\*.INI (
		echo Gothic: Restoring configuration file
		xcopy /i /y Gothic\system\*.INI %g1rootdir%\system
		echo.
	) else (
		echo Gothic: Configuration backup not found. Skipping...
		echo.
	)
) else (
	echo Gothic: Installation not found. Skipping...
	echo.
)

echo Gothic: Done.
echo.

rem Gothic II

set "g2rootdir=%gamerootdir%\Gothic II Gold"

rem Installation check
if exist "%g2rootdir%" (
	rem Restore savegames
	if exist "Gothic II\Saves" (
		echo Gothic II: Restoring savegames
		xcopy /e /i /y "Gothic II\Saves" "%g2rootdir%\Saves"
		echo.
	) else (
		echo Gothic II: Savegames backup not found. Skipping...
		echo.
	)

	rem Backup configuration file
	if exist "Gothic II\system\*.INI" (
		echo Gothic II: Restoring configuration file
		xcopy /i /y "Gothic II\system\*.INI" "%g2rootdir%\system"
		echo.
	) else (
		echo Gothic II: Configuration file backup not found. Skipping...
		echo.
	)
) else (
	echo Gothic II: Installation not found. Skipping...
	echo.
)

echo Gothic II: Done.
echo.

rem Grand Theft Auto

set "gta1rootdir=%gamerootdir%\Grand Theft Auto"

rem Installation check
if exist "%gta1rootdir%" (
	rem Restore .dat file
	if exist "Grand Theft Auto\GTADATA\*.dat" (
		echo Grand Theft Auto: Restoring .dat file
		copy "Grand Theft Auto\GTADATA\*.dat" "%gta1rootdir%\GTADATA"
		echo.
	) else (
		echo Grand Theft Auto: .dat file backup not found. Skipping...
		echo.
	)

	rem Restore replay file
	if exist "Grand Theft Auto\GTADATA\REPLAY.REP" (
		echo Grand Theft Auto: Restoring replay file
		copy "Grand Theft Auto\GTADATA\REPLAY.REP" "%gta1rootdir%\GTADATA"
		echo.
	) else (
		echo Grand Theft Auto: Replay file backup not found. Skipping...
		echo.
	)

	rem Restore language settings and key configuration
	if exist "Grand Theft Auto\gta-settings.reg" (
		echo Grand Theft Auto: Restoring language settings and key configuration
		reg import "Grand Theft Auto\gta-settings.reg"
		echo.
	) else (
		echo Grand Theft Auto: Registry keys backup not found. Skipping...
		echo.
	)
) else (
	echo Grand Theft Auto: Installation not found. Skipping...
	echo.
)

echo Grand Theft Auto: Done.
echo.

rem Grand Theft Auto III

set "gta3dir=%userprofile%\Documents\GTA3 User Files"
set "gta3rootdir=%gamerootdir%\Grand Theft Auto 3"

rem Installation check
if exist "%gta3rootdir%" (
	rem Restore settings file and savegames
	if exist "GTA III" (
		echo Grand Theft Auto III: Restoring settings and savegames
		xcopy /e /i /y "GTA III" "%gta3dir%"
		echo.
	) else (
		echo Grand Theft Auto III: Backup not found. Skipping...
		echo.
	)
) else (
	echo Grand Theft Auto III: Installation not found. Skipping...
	echo.
)

echo GTA III: Done.
echo.

rem Grand Theft Auto: Vice City

set "gtavcdir=%userprofile%\Documents\GTA Vice City User Files"
set "gtavcrootdir=%gamerootdir%\Grand Theft Auto Vice City"

rem Installation check
if exist "%gtavcrootdir%" (
	rem Restore settings file and savegames
	if exist "GTA Vice City" (
		echo Grand Theft Auto: Vice City - Restoring settings and savegames
		xcopy /e /i /y "GTA Vice City" "%gtavcdir%"
		echo.
	) else (
		echo Grand Theft Auto: Vice City - Backup not found. Skipping...
		echo.
	)
) else (
	echo Grand Theft Auto: Vice City - Installation not found. Skipping...
	echo.
)

echo Grand Theft Auto: Vice City - Done.
echo.

rem Grand Theft Auto: San Andreas

set "gtasadir=%userprofile%\Documents\GTA San Andreas User Files"
set "gtasarootdir=%gamerootdir%\Grand Theft Auto San Andreas"

rem Installation check
if exist "%gtasarootdir%" (
	rem Restore settings file, savegames, gallery and user tracks
	if exist "GTA - San Andreas" (
		echo Grand Theft Auto: San Andreas - Restoring user folder
		xcopy /e /i /y "GTA - San Andreas" "%gtasadir%"
		echo.
	) else (
		echo Grand Theft Auto: San Andreas - Backup not found. Skipping...
		echo.
	)
) else (
	echo Grand Theft Auto: San Andreas - Installation not found. Skipping...
	echo.
)

echo Grand Theft Auto: San Andreas - Done.
echo.

rem Hacknet

set "hacknetdir=%userprofile%\Documents\My Games\Hacknet"
set "hnrootdir=%gamerootdir%\Hacknet"

rem Installation check
if exist "%hnrootdir%" (
	rem Restore Accounts folder
	if exist Hacknet\Accounts (
		echo Hacknet: Restoring Accounts folder
		xcopy /e /i /y Hacknet\Accounts "%hacknetdir%\Accounts"
		echo.
	) else (
		echo Hacknet: Accounts folder backup not found. Skipping...
		echo.
	)

	rem Restore settings
	if exist Hacknet\Settings.txt (
		echo Hacknet: Restoring settings
		copy Hacknet\Settings.txt %hnrootdir%
		echo.
	) else (
		echo Hacknet: Settings file backup not found. Skipping...
		echo.
	)
) else (
	echo Hacknet: Installation not found. Skipping...
	echo.
)

echo Hacknet: Done.
echo.

rem Hearts of Iron

set "hoirootdir=%gamerootdir%\Hearts of Iron"

rem Installation check
if exist "%hoirootdir%" (
	rem Restore savegames
	if exist "Hearts of Iron\Scenarios\Save Games\*.eug" (
		echo Hearts of Iron: Restoring savegames
		xcopy /e /i /y "Hearts of Iron\Scenarios\Save Games" "%hoirootdir%\scenarios\save games"
		echo.
	) else (
		echo Hearts of Iron: Savegames backup not found. Skipping...
		echo.
	)

	rem Restore configuration
	if exist "Hearts of Iron\*.eu" (
		echo Hearts of Iron: Restoring configuration
		copy "Hearts of Iron\*.eu" "%hoirootdir%"
		echo.
	) else (
		echo Hearts of Iron: Configuration backup not found. Skipping...
		echo.
	)

	rem Restore history file
	if exist "Hearts of Iron\history.txt" (
		echo Hearts of Iron: Restoring history file
		copy "Hearts of Iron\history.txt" "%hoirootdir%"
		echo.
	) else (
		echo Hearts of Iron: History file backup not found. Skipping...
		echo.
	)
) else (
	echo Hearts of Iron: Installation not found. Skipping...
	echo.
)

echo Hearts of Iron: Done.
echo.

rem Hellblade - Senua’s Sacrifice

set "hbdir=%userprofile%\AppData\Local\HellbladeGame"
set "hbrootdir=%gamerootdir%\HellbladeSenuasSacrifice"

rem Installation check
if exist "%hbrootdir%" (
	rem Copy savegame file into the game’s savegame folder
	if exist "Hellblade - Senua's Sacrifice\SaveGames\*.sav" (
		echo Hellblade - Senua's Sacrifice: Restoring savegame
		xcopy /i /y "Hellblade - Senua's Sacrifice\SaveGames\*.sav" %hbdir%\Saved\SaveGames
		echo.
	) else (
		echo Hellblade - Senua's Sacrifice: Savegame backup not found. Skipping...
		echo.
	)

	rem Restore user settings file
	if exist "Hellblade - Senua's Sacrifice\*.ini" (
		echo Hellblade - Senua's Sacrifice: Restoring user settings
		xcopy /i /y "Hellblade - Senua's Sacrifice\*.ini" %hbdir%\Saved\Config\WindowsNoEditor
		echo.
	) else (
		echo Hellblade - Senua's Sacrifice: User settings backup not found. Skipping...
		echo.
	)
) else (
	echo Hellblade - Senua's Sacrifice: Installation not found. Skipping...
	echo.
)

echo Hellblade - Senua's Sacrifice: Done.
echo.

rem Hitman - Codename 47

set "hc47rootdir=%gamerootdir%\Hitman Codename 47"

rem Installation check
if exist "%hc47rootdir%" (
	rem Restore savegames
	if exist "Hitman - Codename 47\*.sav" (
		echo Hitman - Codename 47: Restoring savegames
		copy "Hitman - Codename 47\*.sav" "%hc47rootdir%"
		echo.
	) else (
		echo Hitman - Codename 47: Savegames backup not found. Skipping...
		echo.
	)

	rem Restore keybinds and sound settings
	if exist "Hitman - Codename 47\*.cfg" (
		echo Hitman - Codename 47: Restoring keybinds and sound settings
		copy "Hitman - Codename 47\*.cfg" "%hc47rootdir%"
		echo.
	) else (
		echo Hitman - Codename 47: Keybinds and sound settings backup not found. Skipping...
		echo.
	)

	rem Restore configuration file
	if exist "Hitman - Codename 47\Hitman.ini" (
		echo Hitman - Codename 47: Restoring configuration
		copy "Hitman - Codename 47\Hitman.ini" "%hc47rootdir%"
		echo.
	) else (
		echo Hitman - Codename 47: Configuration backup not found. Skipping...
		echo.
	)
) else (
	echo Hitman - Codename 47: Installation not found. Skipping...
	echo.
)

echo Hitman - Codename 47: Done.
echo.

rem Hotline Miami Original

set "hmrootdir=%gamerootdir%\Hotline Miami"

rem Installation check
if exist "%hmrootdir%" (
	if exist "Hotline Miami Original\achievements.dat" (
		if exist "Hotline Miami Original\mask.nfo" (
			if exist "Hotline Miami Original\pause.bmp" (
				if exist "Hotline Miami Original\saves.dat" (
					if exist "Hotline Miami Original\stats.sav" (
						if exist "Hotline Miami Original\tempsave.sav" (
							rem Restore savegame files
							echo Hotline Miami Original: Restoring gamestate
							copy "Hotline Miami Original\achievements.dat" "%hmrootdir%"
							copy "Hotline Miami Original\mask.nfo" "%hmrootdir%"
							copy "Hotline Miami Original\pause.bmp" "%hmrootdir%"
							copy "Hotline Miami Original\saves.dat" "%hmrootdir%"
							copy "Hotline Miami Original\stats.sav" "%hmrootdir%"
							copy "Hotline Miami Original\tempsave.sav" "%hmrootdir%"
						)
					)
				)
			)
		)
	)
) else (
	echo Hotline Miami Original: Installation not found. Skipping...
	echo.
)

echo Hotline Miami Original: Done.
echo.

rem Hotline Miami Updated

set "hmudir=%userprofile%\Documents\My Games\HotlineMiami"

rem Installation check
if exist "%hmrootdir%" (
	rem Restore configuration and save data
	if exist "Hotline Miami Updated" (
		echo Hotline Miami Updated: Restoring configuration and save data
		xcopy /e /i /y "Hotline Miami Updated" "%hmudir%"
		echo.
	) else (
		echo Hotline Miami Updated: Backup folder not found. Skipping...
		echo.
	)
) else (
	echo Hotline Miami Updated: Installation not found. Skipping...
	echo.
)

echo Hotline Miami Updated: Done.
echo.

rem Inkslinger

set "inkslingerrootdir=%gamerootdir%\Inkslinger"

rem Installation check
if exist "%inkslingerrootdir%" (
	rem Restore registry keys
	if exist Inkslinger\inkslinger.reg (
		echo Inkslinger: Restoring registry keys
		reg import Inkslinger\inkslinger.reg
		echo.
	) else (
		echo Inkslinger: Registry keys backup not found. Skipping...
		echo.
	)
)

echo Inkslinger: Done.
echo.

rem Inside

set "insidedir=%appdata%\Playdead\Inside"
set "insiderootdir=%gamerootdir%\Inside"

rem Installation check
if exist "%insiderootdir%" (
	rem Copy savegame file into the game’s savegame folder
	if exist Inside\*.sav (
		echo Inside: Restoring savegame
		xcopy /i /y Inside\*.sav %insidedir%
		echo.
	) else (
		echo Inside: Savegame backup not found. Skipping...
		echo.
	)

	rem Restore registry keys
	if exist Inside\inside.reg (
		echo Inside: Restoring settings
		reg import Inside\inside.reg
		echo.
	) else (
		echo Inside: Registry keys backup not found. Skipping...
	)
) else (
	echo Inside: Installation not found. Skipping...
	echo.
)

echo Inside: Done.
echo.

rem Jotun - Valhalla Edition

set "jvelldir=%userprofile%\AppData\LocalLow\Thunder Lotus Games\Jotun"
set "jverootdir=%gamerootdir%\Jotun Valhalla Edition"

rem Installation check
if exist "%jverootdir%" (
	rem Copy savegame file into the game’s savegame folder
	if exist "Jotun - Valhalla Edition\*.sav" (
		echo Jotun - Valhalla Edition: Restoring savegame and options
		xcopy /i /y "Jotun - Valhalla Edition\*.sav" "%jvelldir%"
		echo.
	) else (
		echo Jotun - Valhalla Edition: Option and savegame backup not found. Skipping...
		echo.
	)
) else (
	echo Jotun - Valhalla Edition: Installation not found. Skipping...
	echo.
)

echo Jotun - Valhalla Edition: Done.
echo.

rem L’Amerzone

set "larootdir=%gamerootdir%\AmerZone"

rem Installation check
if exist "%larootdir%" (
	rem Restore savegames
	if exist "L'Amerzone\*.bin" (
		echo L'Amerzone: Restoring savegames
		xcopy /i /y "L'Amerzone\*.bin" %larootdir%
		echo.
	) else (
		echo L'Amerzone: Savegames backup not found. Skipping...
		echo.
	)
) else (
	echo L'Amerzone: Installation not found. Skipping...
	echo.
)

echo L'Amerzone: Done.
echo.

rem Layers of Fear
rem Layers of Fear: Inheritance

set "loflldir=%userprofile%\AppData\LocalLow\Bloober Team\Layers of Fear"

rem Restore savegames
if exist "Layers of Fear\Savegames\*.dat" (
	echo Layers of Fear: Restoring savegames
	xcopy /i /y "Layers of Fear\Savegames\*.dat" "%loflldir%\0"
	echo.
) else (
	echo Layers of Fear: Savegame backup not found. Skipping...
	echo.
)

rem Restore configuration files
if exist "Layers of Fear\cfg\*.xml" (
	echo Layers of Fear: Restoring configuration files
	xcopy /i /y "Layers of Fear\cfg\*.xml" "%loflldir%\0\cfg"
	echo.
) else (
	echo Layers of Fear: Configuration files backup not found. Skipping...
	echo.
)

rem Restore registry keys
if exist "Layers of Fear\*.reg" (
	echo Layers of Fear: Restoring registry keys
	reg import "Layers of Fear\lof.reg"
	echo.
) else (
	echo Layers of Fear: Registry keys backup not found. Skipping...
	echo.
)

echo Layers of Fear: Done.
echo.

rem Legacy of Kain: Soul Reaver

set "loksrrootdir=%gamerootdir%\Legacy of Kain Soul Reaver"

rem Installation check
if exist "%loksrrootdir%" (
	rem Restore savegame file
	if exist "Legacy of Kain - Soul Reaver\*.her" (
		echo Legacy of Kain: Soul Reaver - Restoring savegame file
		xcopy /i /y "Legacy of Kain - Soul Reaver\*.her" "%loksrrootdir%"
		echo.
	) else (
		echo Legacy of Kain: Soul Reaver - Savegame file backup not found. Skipping...
		echo.
	)
) else (
	echo Legacy of Kain: Soul Reaver - Installation not found. Skipping...
	echo.
)

echo Legacy of Kain: Soul Reaver - Done.
echo.

rem Mafia

set "mafiarootdir=%gamerootdir%\Mafia"

rem Installation check
if exist "%mafiarootdir%" (
	rem Restore savegame files
	if exist Mafia\savegame (
		echo Mafia: Restoring savegame files
		xcopy /e /i /y Mafia\savegame "%mafiarootdir%\savegame"
		echo.
	) else (
		echo Mafia: Backup folder not found. Skipping...
		echo.
	)

	rem Restore registry keys
	if exist "Mafia\mafia.reg" (
		echo Mafia: Restoring registry keys
		reg import Mafia\mafia.reg
		echo.
	) else (
		echo Mafia: Registry keys backup not found. Skipping...
		echo.
	)
) else (
	echo Mafia: Installation not found. Skipping...
	echo.
)

echo Mafia: Done.
echo.

rem Master Spy

set "masterspydir=%localappdata%\Master Spy"
set "masterspyrootdir=%gamerootdir%\Master Spy"

rem Installation check
if exist "%masterspyrootdir%" (
	rem Copy local storage files into the game’s local storage
	if exist "Master Spy\*.localstorage" (
		if exist "Master Spy\*.localstorage-journal" (
			echo Master Spy: Restoring local storage state
			xcopy /i /y "Master Spy\*.localstorage" "%masterspydir%\Local Storage"
			copy "Master Spy\*.localstorage-journal" "%masterspydir%\Local Storage"
			echo.
		)
	) else (
		echo Master Spy: Local storage backup not found. Skipping...
		echo.
	)
) else (
	echo Master Spy: Installation not found. Skipping...
	echo.
)

echo Master Spy: Done.
echo.

rem Metal Gear

set "mgrootdir=%gamerootdir%\Metal Gear"

rem Installation check
if exist "%mgrootdir%" (
	rem Restore savegame data
	if exist "Metal Gear\SaveData\*.bin" (
		echo Metal Gear: Restoring savegame data
		xcopy /i /y "Metal Gear\SaveData\*.bin" "%mgrootdir%\SaveData"
		echo.
	) else (
		echo Metal Gear: Savegame data backup not found. Skipping...
		echo.
	)

	rem Restore settings
	if exist "Metal Gear\settings.ini" (
		echo Metal Gear: Restoring settings
		xcopy /i /y "Metal Gear\settings.ini" "%mgrootdir%"
		echo.
	) else (
		echo Metal Gear: Settings backup not found. Skipping...
		echo.
	)

	rem Restore DirectX configuration
	if exist "Metal Gear\dxcfg.ini" (
		echo Metal Gear: Restoring DirectX configuration
		xcopy /i /y "Metal Gear\dxcfg.ini" "%mgrootdir%"
		echo.
	) else (
		echo Metal Gear: DirectX configuration backup not found. Skipping...
		echo.
	)
) else (
	echo Metal Gear: Installation not found. Skipping...
	echo.
)

echo Metal Gear: Done.
echo.

rem Metal Gear Solid

set "mgsrootdir=%gamerootdir%\Metal Gear Solid"

rem Installation check
if exist "%mgsrootdir%" (
	rem Restore savegames
	if exist "Metal Gear Solid\SavedGames" (
		echo Metal Gear Solid: Restoring savegames
		xcopy /e /i /y "Metal Gear Solid\SavedGames" "%mgsrootdir%\SavedGames"
		echo.
	) else (
		echo Metal Gear Solid: SavedGames backup not found. Skipping...
		echo.
	)

	rem Restore configuration files
	if exist "Metal Gear Solid\*.cfg" (
		echo Metal Gear Solid: Restoring MGS configuration files
		xcopy /i /y "Metal Gear Solid\*.cfg" "%mgsrootdir%"
		echo.
	) else (
		echo Metal Gear Solid: Configuration backup not found. Skipping...
		echo.
	)

	rem Restore DirectX configuration
	if exist "Metal Gear Solid\dxcfg.ini" (
		echo Metal Gear Solid: Restoring DirectX configuration
		copy "Metal Gear Solid\dxcfg.ini" "%mgsrootdir%"
		echo.
	) else (
		echo Metal Gear Solid: DirectX configuration backup not found. Skipping...
		echo.
	)

	rem Restore VR records
	if exist "Metal Gear Solid\records.vr" (
		echo Metal Gear Solid: Restoring VR records
		copy "Metal Gear Solid\records.vr" "%mgsrootdir%"
		echo.
	) else (
		echo Metal Gear Solid: VR records backup not found. Skipping...
		echo.
	)

	rem Restore photos
	if exist "Metal Gear Solid\PHOTOS\*.bmp" (
		echo Metal Gear Solid: Restoring photos
		xcopy /e /i /y "Metal Gear Solid\PHOTOS" "%mgsrootdir%\PHOTOS"
		echo.
	) else (
		echo Metal Gear Solid: Photos backup not found. Skipping...
		echo.
	)

	rem Restore registry keys
	if exist "Metal Gear Solid\mgs.reg" (
		echo Metal Gear Solid: Restoring registry keys
		reg import "Metal Gear Solid\mgs.reg"
		echo.
	) else (
		echo Metal Gear Solid: Registry keys backup not found. Skipping...
		echo.
	)
) else (
	echo Metal Gear Solid: Installation not found. Skipping...
	echo.
)

echo Metal Gear Solid: Done.
echo.

rem Metro 2033 Redux

set "m2033reduxdir=%userprofile%\Documents\4A Games\Metro Redux\2033"
set "m2033reduxladdir=%localappdata%\4A Games\Metro Redux\2033"
set "m2033reduxrootdir=%gamerootdir%\Metro 2033 Redux"

rem Installation check
if exist "%m2033reduxrootdir%" (
	rem Restore autosave file
	if exist "Metro 2033 Redux\Savegames\*" (
		echo Metro 2033 Redux: Restoring autosave and player files
		xcopy /i /y "Metro 2033 Redux\Savegames\*" "%m2033reduxdir%"
		echo.
	) else (
		echo Metro 2033 Redux: Autosave and player files backup not found. Skipping...
		echo.
	)

	rem Restore user keybinds and settings
	if exist "Metro 2033 Redux\*.cfg" (
		echo Metro 2033 Redux: Restoring keybinds and settings
		copy "Metro 2033 Redux\*.cfg" "%m2033reduxladdir%"
		echo.
	) else (
		echo Metro 2033 Redux: Keybinds and settings backup not found. Skipping...
		echo.
	)
) else (
	echo Metro 2033 Redux: Installation not found. Skipping...
	echo.
)

echo Metro 2033 Redux: Done.
echo.

rem Mirror’s Edge

set "medir=%userprofile%\Documents\EA Games\Mirror's Edge"
set "merootdir=%gamerootdir%\Mirror's Edge"

rem Installation check
if exist "%merootdir%" (
	rem Copy savegame file into the game’s savegame folder
	if exist "Mirror's Edge\*.dat" (
		echo Mirror's Edge: Restoring savegame file
		xcopy /i /y "Mirror's Edge\*.dat" "%medir%\TdGame\Savefiles"
		echo.
	) else (
		echo Mirror's Edge: Savegame backup not found. Skipping...
		echo.
	)

	rem Copy configuration file into the game’s config folder
	if exist "Mirror's Edge\*.ini" (
		echo Mirror's Edge: Restoring configuration and keybinds file
		xcopy /i /y "Mirror's Edge\*.ini" "%medir%\TdGame\Config"
		echo.
	) else (
		echo Mirror's Edge: Configuration and keybinds backup not found. Skipping...
		echo.
	)
) else (
	echo Mirror's Edge: Installation not found. Skipping...
	echo.
)

echo Mirror's Edge: Done.
echo.

rem Mount & Blade

set "mbaddir=%appdata%\Mount&Blade"
set "mbrootdir=%gamerootdir%\Mount and Blade"
set "mbsavedir=%userprofile%\Documents\Mount&Blade Savegames"

rem Installation check
if exist "%mbrootdir%" (
	rem Restore savegame files
	if exist "Mount & Blade\Savegames" (
		echo Mount and Blade: Restoring savegames
		xcopy /e /i /y "Mount & Blade\Savegames" "%mbsavedir%\Native"
		echo.
	) else (
		echo Mount and Blade: Savegames backup not found. Skipping...
		echo.
	)

	rem Restore configuration and options file
	if exist "Mount & Blade\Config" (
		echo Mount and Blade: Restoring configuration and options file
		xcopy /i /y "Mount & Blade\Config" "%mbaddir%"
		echo.
	) else (
		echo Mount and Blade: Configuration and options backup not found. Skipping...
		echo.
	)
) else (
	echo Mount and Blade: Installation not found. Skipping...
	echo.
)

echo Mount and Blade: Done.
echo.

rem Mount & Blade Warband

set "mbwdir=%userprofile%\Documents\Mount&Blade Warband"
set "mbwrootdir=%gamerootdir%\Mount and Blade - Warband"
set "mbwsavedir=%userprofile%\Documents\Mount&Blade Warband Savegames"

rem Installation check
if exist "%mbwrootdir%" (
	rem Restore savegame files
	if exist "Mount & Blade Warband\Savegames" (
		echo Mount and Blade: Warband - Restoring savegame files
		xcopy /e /i /y "Mount & Blade Warband\Savegames" "%mbwsavedir%\Native"
		echo.
	) else (
		echo Mount and Blade: Warband - Savegames backup not found. Skipping...
		echo.
	)

	rem Restore configuration file
	if exist "Mount & Blade Warband\Config\*.txt" (
		echo Mount and Blade: Warband - Restoring config file
		xcopy /i /y "Mount & Blade Warband\Config\*.txt" "%mbwdir%"
		echo.
	) else (
		echo Mount and Blade: Warband - Config file backup not found. Skipping...
		echo.
	)
) else (
	echo Mount and Blade: Warband - Installation not found. Skipping...
	echo.
)

echo Mount and Blade: Warband - Done.
echo.

rem Mount & Blade Warband - Viking Conquest

set "mbwdir=%userprofile%\Documents\Mount&Blade Warband"
set "mbwvcrootdir=%gamerootdir%\Mount and Blade - Warband\Modules\Viking Conquest"
set "mbwvcsavedir=%userprofile%\Documents\Mount&Blade Warband Savegames\Viking Conquest"

rem Installation check
if exist "%mbwvcrootdir%" (
	rem Restore savegame files
	if exist "Mount & Blade Warband - Viking Conquest\*.sav" (
		echo Mount and Blade Warband: Viking Conquest - Restoring savegames
		xcopy /i /y "Mount & Blade Warband - Viking Conquest\*.sav" "%mbwvcsavedir%"
		echo.
	) else (
		echo Mount and Blade Warband: Viking Conquest - Savegames backup not found. Skipping...
		echo.
	)

	rem Restore config file
	if exist "Mount & Blade Warband - Viking Conquest\*.txt" (
		echo Mount and Blade Warband: Viking Conquest - Restoring configuration file
		xcopy /i /y "Mount & Blade Warband - Viking Conquest\*.txt" "%mbwdir%"
		echo.
	) else (
		echo Mount and Blade Warband: Viking Conquest - Configuration file backup not found. Skipping...
		echo.
	)
) else (
	echo Mount and Blade Warband: Viking Conquest - Installation not found. Skipping...
	echo.
)

echo Mount and Blade Warband: Viking Conquest - Done.
echo.

rem Never Alone

set "nadir=%userprofile%\AppData\LocalLow\E-Line Media\Never Alone"

rem Restore savegame data
if exist "Never Alone\*.dat" (
	echo Never Alone: Restoring savegame
	xcopy /i /y "Never Alone\*.dat" "%nadir%"
	echo.
) else (
	echo Never Alone: Savegame backup not found. Skipping...
	echo.
)

rem Restore registry keys
echo Never Alone: Restoring registry keys
reg import "Never Alone\na.reg"

echo Never Alone: Done.
echo.

rem Oddworld: Abe’s Oddysee

set "oaorootdir=%gamerootdir%\Abes Oddysee"

rem Installation check
if exist "%oaorootdir%" (
	rem Restore savegames
	if exist "Oddworld - Abe's Oddysee\*.sav" (
		echo Oddworld: Abe's Oddysee - Restoring savegames
		xcopy /i /y "Oddworld - Abe's Oddysee\*.sav" "%oaorootdir%"
		echo.
	) else (
		echo Oddworld: Abe's Oddysee - Savegames backup not found. Skipping...
		echo.
	)

	rem Restore configuration
	if exist "Oddworld - Abe's Oddysee\abe.ini" (
		echo Oddworld: Abe's Oddysee - Restoring configuration
		copy "Oddworld - Abe's Oddysee\abe.ini" "%oaorootdir%"
		echo.
	) else (
		echo Oddworld: Abe's Oddysee - Configuration backup not found. Skipping...
		echo.
	)
) else (
	echo Oddworld: Abe's Oddysee - Installation not found. Skipping...
	echo.
)

echo Oddworld: Abe's Oddysee - Done.
echo.

rem Oddworld: Abe’s Exoddus

set "oaerootdir=%gamerootdir%\Abes Exoddus"

rem Installation check
if exist "%oaerootdir%" (
	rem Restore savegames
	if exist "Oddworld - Abe's Exoddus\*.sav" (
		echo Oddworld: Abe's Exoddus - Restoring savegames
		xcopy /i /y "Oddworld - Abe's Exoddus\*.sav" "%oaerootdir%"
		echo.
	) else (
		echo Oddworld: Abe's Exoddus - Savegames backup not found. Skipping...
		echo.
	)

	rem Restore configuration
	if exist "Oddworld - Abe's Exoddus\abe2.ini" (
		echo Oddworld: Abe's Exoddus - Restoring configuration
		copy "Oddworld - Abe's Exoddus\abe2.ini" "%oaerootdir%"
		echo.
	) else (
		echo Oddworld: Abe's Exoddus - Configuration backup not found. Skipping...
		echo.
	)
) else (
	echo Oddworld: Abe's Exoddus - Installation not found. Skipping...
	echo.
)

echo Oddworld: Abe's Exoddus - Done.
echo.

rem Oddworld - New 'n' Tasty

set "onntrootdir=%gamerootdir%\Oddworld - New 'n' Tasty"

rem Installation check
if exist "%onntrootdir%" (
	rem Copy save slot files into the game’s savegame directory
	if exist "Oddworld - New 'n' Tasty\SaveGame\*.NnT" (
		echo Oddworld - New 'n' Tasty: Restoring save slot files
		xcopy /i /y "Oddworld - New 'n' Tasty\SaveGame\*.NnT" "%onntrootdir%\SaveGame"
		echo.
	) else (
		echo Oddworld - New 'n' Tasty: Save slot files backup not found. Skipping...
		echo.
	)
) else (
	echo Oddworld - New 'n' Tasty: Installation not found. Skipping...
	echo.
)

echo Oddworld - New 'n' Tasty: Done.
echo.

rem Omikron: The Nomad Soul

set "otnsrootdir=%gamerootdir%\Omikron - The Nomad Soul"

rem Installation check
if exist "%otnsrootdir%" (
	rem Restore configuration, keybinds and savegames
	if exist "Omikron - The Nomad Soul\GAMES" (
		echo Omikron: The Nomad Soul - Restoring configuration, keybinds and savegames
		copy "Omikron - The Nomad Soul\GAMES" "%otnsrootdir%\IAM"
		echo.
	) else (
		echo Omikron: The Nomad Soul - GAMES file backup not found. Skipping...
		echo.
	)
) else (
	echo Omikron: The Nomad Soul - Installation not found. Skipping...
	echo.
)

echo Omikron: The Nomad Soul - Done.
echo.

rem Open Arena

set "oaaddir=%appdata%\OpenArena"
set "oarootdir=%gamerootdir%\Open Arena"

rem Installation check
if exist "%oarootdir%" (
	rem Restore Open Arena AppData folder
	if exist "Open Arena" (
		echo Open Arena: Restoring AppData folder
		xcopy /e /i /y "Open Arena" %oaaddir%
		echo.
	) else (
		echo Open Arena: Backup not found. Skipping...
		echo.
	)
) else (
	echo Open Arena: Installation not found. Skipping...
	echo.
)

echo Open Arena: Done.
echo.

rem Outlast

set "oldir=%userprofile%\Documents\My Games\Outlast"
set "olrootdir=%gamerootdir%\Outlast"

rem Installation check
if exist "%olrootdir%" (
	rem Restore profile and savegame files
	if exist Outlast\SaveData\* (
		echo Outlast: Restoring profile and savegame files
		xcopy /i /y Outlast\SaveData\* "%oldir%\OLGame\SaveData"
		echo.
	) else (
		echo Outlast: SaveData backup not found. Skipping...
		echo.
	)

	rem Restore config folder
	if exist Outlast\Config (
		echo Outlast: Restoring config folder
		xcopy /e /i /y Outlast\Config "%oldir%\OLGame\Config"
		echo.
	) else (
		echo Outlast: Config backup not found. Skipping...
		echo.
	)
) else (
	echo Outlast: Installation not found. Skipping...
	echo.
)

echo Outlast: Done.
echo.

rem Painkiller

set "pkrootdir=%gamerootdir%\Painkiller Black"

rem Installation check
if exist "%pkrootdir%" (
	rem Restore savegames and folder structure
	if exist Painkiller\SaveGames (
		echo Painkiller: Restoring savegames
		xcopy /e /i /y Painkiller\SaveGames "%pkrootdir%\SaveGames"
		echo.
	) else (
		echo Painkiller: Savegames backup not found. Skipping...
		echo.
	)

	rem Restore config file
	if exist Painkiller\*.ini (
		echo Painkiller: Restoring config file
		copy Painkiller\*.ini "%pkrootdir%\Bin"
		echo.
	) else (
		echo Painkiller: Config file backup not found. Skipping...
		echo.
	)

	rem Restore registry keys
	if exist Painkiller\painkiller-1.reg (
		if exist Painkiller\painkiller-2.reg (
			echo Painkiller: Restoring registry keys
			reg import Painkiller\painkiller-1.reg
			reg import Painkiller\painkiller-2.reg
			echo.
		)
	) else (
		echo Painkiller: Registry keys backup not found. Skipping...
		echo.
	)
) else (
	echo Painkiller: Installation not found. Skipping...
	echo.
)

echo Painkiller: Done.
echo.

rem Penumbra: Black Plague

set "pbpdir=%userprofile%\Documents\Penumbra\Black Plague"
set "pbprootdir=%gamerootdir%\Penumbra - Black Plague"

rem Installation check
if exist "%pbprootdir%" (
	rem Restore keybinds, savegames and settings
	if exist "Penumbra - Black Plague" (
		echo Penumbra: Black Plague - Restoring keybinds, savegames and settings
		xcopy /e /i /y "Penumbra - Black Plague" "%pbpdir%"
		echo.
	) else (
		echo Penumbra: Black Plague - Backup not found. Skipping...
		echo.
	)
) else (
	echo Penumbra: Black Plague - Installation not found. Skipping...
	echo.
)

echo Penumbra: Black Plague - Done.
echo.

rem Penumbra: Overture

set "podir=%userprofile%\Documents\Penumbra Overture"
set "porootdir=%gamerootdir%\Penumbra - Overture"

rem Installation check
if exist "%porootdir%" (
	rem Restore keybinds, savegames and settings
	if exist "Penumbra - Overture" (
		echo Penumbra: Overture - Restoring keybinds, settings and savegames
		xcopy /e /i /y "Penumbra - Overture" "%podir%"
		echo.
	) else (
		echo Penumbra: Overture - Backup not found. Skipping...
		echo.
	)
) else (
	echo Penumbra: Overture - Installation not found. Skipping...
	echo.
)

echo Penumbra: Overture - Done.
echo.

rem Penumbra: Requiem

set "prdir=%userprofile%\Documents\Penumbra\Requiem"
set "prrootdir=%gamerootdir%\Penumbra - Black Plague\redist"

rem Installation check
if exist "%prrootdir%\Requiem.exe" (
	rem Restore keybinds, savegames and settings
	if exist "Penumbra - Requiem" (
		echo Penumbra: Requiem - Restoring keybinds, savegames and settings
		xcopy /e /i /y "Penumbra - Requiem" %prdir%
		echo.
	) else (
		echo Penumbra: Requiem - Backup not found. Skipping...
		echo.
	)
) else (
	echo Penumbra: Requiem - Installation not found. Skipping...
	echo.
)

echo Penumbra: Requiem - Done.
echo.

rem Planescape: Torment

set "ptrootdir=%gamerootdir%\Planescape Torment"

rem Installation check
if exist "%ptrootdir%" (
	rem Restore save folder
	if exist "Planescape - Torment\save" (
		echo Planescape: Torment - Restoring save folder
		xcopy /e /i /y "Planescape - Torment\save" "%ptrootdir%\save"
		echo.
	) else (
		echo Planescape: Torment - Save folder backup not found. Skipping...
		echo.
	)

	rem Restore cache folder
	if exist "Planescape - Torment\cache" (
		echo Planescape: Torment - Restoring cache folder
		xcopy /e /i /y "Planescape - Torment\cache" "%ptrootdir%\cache"
		echo.
	) else (
		echo Planescape: Torment - Cache folder backup not found. Skipping...
		echo.
	)

	rem Restore configuration file
	if exist "Planescape - Torment\Torment.ini" (
		echo Planescape: Torment - Restoring configuration file
		copy "Planescape - Torment\Torment.ini" "%ptrootdir%"
		echo.
	) else (
		echo Planescape: Torment - Configuration backup not found. Skipping...
		echo.
	)
) else (
	echo Planescape: Torment - Installation not found. Skipping...
	echo.
)

echo Planescape: Torment - Done.
echo.

rem Port Royale

set "prrootdir=%gamerootdir%\Port Royale"

rem Installation check
if exist "%prrootdir%" (
	rem Restore options and savegames
	if exist "Port Royale\Save\*.mrk" (
		echo Port Royale: Restoring options and savegames
		xcopy /e /i /y "Port Royale\Save" "%prrootdir%\Save"
		echo.
	) else (
		echo Port Royale: Savegame backup not found. Skipping...
		echo.
	)

	rem Restore player .aim files
	if exist "Port Royale\Run\Player*" (
		echo Port Royale: Restoring player .aim files
		xcopy /i /y "Port Royale\Run\Player*" "%prrootdir%\Run"
		echo.
	) else (
		echo Port Royale: Player .aim backup not found. Skipping...
		echo.
	)
) else (
	echo Port Royale: Installation not found. Skipping...
	echo.
)

echo Port Royale: Done.
echo.

rem Postal Plus

set "p1rootdir=%gamerootdir%\Postal2STP\PostalClassic&Uncut"

rem Installation check
if exist "%p1rootdir%" (
	rem Restore savegames and highscores
	if exist "Postal Plus\res\SaveGame" (
		echo Postal Plus: Restoring savegames and highscores
		xcopy /e /i /y "Postal Plus\res\SaveGame" "%p1rootdir%\res\SaveGame"
		echo.
	) else (
		echo Postal Plus: SaveGame folder backup not found. Skipping...
		echo.
	)

	rem Restoring configuration
	if exist "Postal Plus\*.ini" (
		echo Postal Plus: Restoring configuration
		copy "Postal Plus\*.ini" "%p1rootdir%"
		echo.
	) else (
		echo Postal Plus: Configuration backup not found. Skipping...
		echo.
	)
) else (
	echo Postal Plus: Installation not found. Skipping...
	echo.
)

echo Postal Plus: Done.
echo.

rem Postal 2

set "p2rootdir=%gamerootdir%\Postal2STP"

rem Installation check
if exist "%p2rootdir%" (
	rem Restore savegames
	if exist "Postal 2\Save" (
		echo Postal 2: Restoring savegames
		xcopy /e /i /y "Postal 2\Save" "%p2rootdir%\Save"
		echo.
	) else (
		echo Postal 2: Save folder backup not found. Skipping...
		echo.
	)

	rem Restore configuration, keybinds and savegame information
	if exist "Postal 2\System\Postal2.ini" (
		if exist "Postal 2\System\SavedGameInfo.ini" (
			if exist "Postal 2\System\User.ini" (
				echo Postal 2: Restoring configuration, keybinds and savegame information
				copy "Postal 2\System\Postal2.ini" "%p2rootdir%\System"
				copy "Postal 2\System\SavedGameInfo.ini" "%p2rootdir%\System"
				copy "Postal 2\System\User.ini" "%p2rootdir%\System"
				echo.
			)
		)
	) else (
		echo Postal 2: Configuration, keybinds and savegame backup not found. Skipping...
		echo.
	)
) else (
	echo Postal 2: Installation not found. Skipping...
	echo.
)

echo Postal 2: Done.
echo.

rem Quake II

set "q2rootdir=%gamerootdir%\Quake II"

rem Installation check
if exist "%q2rootdir%" (
	rem Restore savegames
	if exist "Quake II\Base\save" (
		echo Quake II: Restoring savegames
		xcopy /e /i /y "Quake II\Base\save" "%q2rootdir%\baseq2\save"
		echo.
	) else (
		echo Quake II: Savegame backup not found. Skipping...
		echo.
	)

	rem Restore configuration and keybinds
	if exist "Quake II\Base\*.cfg" (
		echo Quake II: Restoring keybinds and configuration
		copy "Quake II\Base\*.cfg" "%q2rootdir%\baseq2"
		echo.
	) else (
		echo Quake II: Keybinds and configuration backup not found. Skipping...
		echo.
	)
) else (
	echo Quake II: Installation not found. Skipping...
	echo.
)

echo Quake II: Done.
echo.

rem Quake II mission pack: The Reckoning

rem Installation check
if exist "%q2rootdir%\xatrix" (
	rem Restore savegames
	if exist "Quake II\The Reckoning\save" (
		echo Quake II mission pack: The Reckoning - Restoring savegames
		xcopy /e /i /y "Quake II\The Reckoning\save" "%q2rootdir%\xatrix\save"
		echo.
	) else (
		echo Quake II mission pack: The Reckoning - Savegame backup not found. Skipping...
		echo.
	)

	rem Restore keybinds and configuration
	if exist "Quake II\The Reckoning\*.cfg" (
		echo Quake II mission pack: The Reckoning - Restoring keybinds and configuration
		copy "Quake II\The Reckoning\*.cfg" "%q2rootdir%\xatrix"
		echo.
	) else (
		echo Quake II mission pack: The Reckoning - Configuration and keybinds backup not found. Skipping...
		echo.
	)
) else (
	echo Quake II mission pack: The Reckoning - Installation not found
	echo.
)

echo Quake II mission pack: The Reckoning - Done.
echo.

rem Quake II mission pack 2: Ground Zero

rem Installation check
if exist "%q2rootdir%\rogue" (
	rem Restore savegames
	if exist "Quake II\Ground Zero\save" (
		echo Quake II mission pack 2: Ground Zero - Restoring savegames
		xcopy /e /i /y "Quake II\Ground Zero\save" "%q2rootdir%\rogue\save"
		echo.
	) else (
		echo Quake II mission pack 2: Ground Zero - Savegame backup not found. Skipping...
		echo.
	)

	rem Restore keybinds and configuration
	if exist "Quake II\Ground Zero\*.cfg" (
		echo Quake II mission pack 2: Ground Zero - Restoring keybinds and configuration
		copy "Quake II\Ground Zero\*.cfg" "%q2rootdir%\rogue"
		echo.
	) else (
		echo Quake II mission pack 2: Ground Zero - Configuration and keybinds backup not found. Skipping...
		echo.
	)
) else (
	echo Quake II mission pack 2: Ground Zero - Installation not found. Skipping...
	echo.
)

echo Quake II mission pack 2: Ground Zero - Done.
echo.

rem Quake II - The Eraser Bot

rem Installation check
if exist "%q2rootdir%\Eraser" (
	rem Restore keybinds and configuration file
	if exist "Quake II\The Eraser Bot\config.cfg" (
		echo Quake II - The Eraser Bot: Restoring keybinds and configuration
		xcopy /i /y "Quake II\The Eraser Bot\config.cfg" "%q2rootdir%\Eraser"
		echo.
	) else (
		echo Quake II - The Eraser Bot: Configuration and keybinds backup not found. Skipping...
		echo.
	)
) else (
	echo Quake II - The Eraser Bot: Installation not found. Skipping...
	echo.
)

echo Quake II - The Eraser Bot:  Done.
echo.

rem Quake III

set "q3rootdir=%gamerootdir%\Quake III Arena"

rem Installation check
if exist "%q3rootdir%" (
	rem Restore configuration files
	if exist "Quake III\*.cfg" (
		echo Quake III: Restoring configuration files
		copy "Quake III\*.cfg" "%q3rootdir%\baseq3\"
		echo.
	) else (
		echo Quake III: Configuration backup not found. Skipping...
		echo.
	)
) else (
	echo Quake III: Installation not found. Skipping...
	echo.
)

echo Quake III: Done.
echo.

rem Red Faction

set "rfrootdir=%gamerootdir%\Red Faction"

rem Installation check
if exist "%rfrootdir%" (
	rem Restore savegames
	if exist "Red Faction\savegame" (
		echo Red Faction: Restoring savegames
		xcopy /e /i /y "Red Faction\savegame" "%rfrootdir%\savegame"
		echo.
	) else (
		echo Red Faction: Savegame backup not found. Skipping...
		echo.
	)

	rem Restore configuration file
	if exist "Red Faction\*.cfg" (
		echo Red Faction: Restoring configuration file
		xcopy /i /y "Red Faction\*.cfg" "%rfrootdir%"
		echo.
	) else (
		echo Red Faction: Configuration file backup not found. Skipping...
		echo.
	)

	rem Restore D3D file
	if exist "Red Faction\*.id" (
		echo Red Faction: Restoring D3D file
		xcopy /i /y "Red Faction\*.id" "%rfrootdir%"
		echo.
	) else (
		echo Red Faction: D3D file backup not found. Skipping...
		echo.
	)

	rem Restore registry keys
	if exist "Red Faction\rf.reg" (
		echo Red Faction: Restoring registry keys
		reg import "Red Faction\rf.reg"
		echo.
	) else (
		echo Red Faction: Registry keys backup not found. Skipping...
		echo.
	)
) else (
	echo Red Faction: Installation not found. Skipping...
	echo.
)

echo Red Faction: Done.
echo.

rem Remothered - Tormented Fathers

set "rtfladdir=%localappdata%\Remothered"
set "rtfrootdir=%gamerootdir%\Remothered Tormented Fathers"

rem Installation check
if exist "%rtfrootdir%" (
	rem Restore savegame files
	if exist "Remothered - Tormented Fathers\*.sav" (
		echo Remothered - Tormented Fathers: Restoring savegames and settings
		xcopy /i /y "Remothered - Tormented Fathers\*.sav" "%rtfladdir%\Saved\SaveGames"
		echo.
	) else (
		echo Remothered - Tormented Fathers: Savegames and settings backup not found. Skipping...
		echo.
	)
) else (
	echo Remothered -Tormented Fathers: Installation not found. Skipping...
	echo.
)

echo Remothered - Tormented Fathers: Done.
echo.

rem Ritual of the Moon

set "rotmrootdir=%gamerootdir%\Ritual of the Moon"

rem Installation check
if exist "%rotmrootdir%" (
	rem Restore registry keys
	if exist "Ritual of the Moon\rotm.reg" (
		echo Ritual of the Moon: Restoring progress and settings
		reg import "Ritual of the Moon\rotm.reg"
		echo.
	) else (
		echo Ritual of the Moon: Registry keys backup not found. Skipping...
		echo.
	)
) else (
	echo Ritual of the Moon: Installation not found. Skipping...
	echo.
)

echo Ritual of the Moon: Done.
echo.

rem S.T.A.L.K.E.R. - Clear Sky

set "scsdir=%userprofile%\Documents\stalke~1"
set "scsrootdir=%gamerootdir%\S.T.A.L.K.E.R. Clear Sky"

rem Installation check
if exist "%scsrootdir%" (
	rem Restore savegames and savegame textures
	if exist "S.T.A.L.K.E.R. Clear Sky\savedgames\*" (
		echo S.T.A.L.K.E.R. - Clear Sky: Restoring savegames and savegame textures
		xcopy /i /y "S.T.A.L.K.E.R. Clear Sky\savedgames\*" "%scsdir%\savedgames"
		echo.
	) else (
		echo S.T.A.L.K.E.R. - Clear Sky: Savegame backup not found. Skipping...
		echo.
	)

	rem Restore keybinds and settings
	if exist "S.T.A.L.K.E.R. Clear Sky\user.ltx" (
		echo S.T.A.L.K.E.R. - Clear Sky: Restoring keybinds and settings
		copy "S.T.A.L.K.E.R. Clear Sky\user.ltx" "%scsdir%"
		echo.
	) else (
		echo S.T.A.L.K.E.R. - Clear Sky: Keybinds and settings backup not found. Skipping...
		echo.
	)
) else (
	echo S.T.A.L.K.E.R. - Clear Sky: Installation not found. Skipping...
	echo.
)

echo S.T.A.L.K.E.R. - Clear Sky: Done.
echo.

rem S.T.A.L.K.E.R. Shadow of Chernobyl

set "sshocdir=%userprofile%\Documents\Stalker-SHOC"
set "sshocrootdir=%gamerootdir%\S.T.A.L.K.E.R. Shadow of Chernobyl"

rem Installation check
if exist "%sshocrootdir%" (
	rem Restore savegame textures and saves
	if exist "S.T.A.L.K.E.R. Shadow of Chernobyl\savedgames\*.sav" (
		echo S.T.A.L.K.E.R. Shadow of Chernobyl: Restoring savegame textures and saves
		xcopy /i /y "S.T.A.L.K.E.R. Shadow of Chernobyl\savedgames\*" "%sshocdir%\savedgames"
		echo.
	) else (
		echo S.T.A.L.K.E.R. Shadow of Chernobyl: Savegame backup not found. Skipping...
		echo.
	)

	rem Restore user keybinds and settings
	if exist "S.T.A.L.K.E.R. Shadow of Chernobyl\user.ltx" (
		echo S.T.A.L.K.E.R. Shadow of Chernobyl: Restoring user.ltx file
		xcopy /i /y "S.T.A.L.K.E.R. Shadow of Chernobyl\user.ltx" "%sshocdir%"
		echo.
	) else (
		echo S.T.A.L.K.E.R. Shadow of Chernobyl: user.ltx backup not found. Skipping...
		echo.
	)
) else (
	echo S.T.A.L.K.E.R. Shadow of Chernobyl: Installation not found. Skipping...
	echo.
)

echo S.T.A.L.K.E.R. Shadow of Chernobyl: Done.
echo.

rem Sacred Gold

set "sgrootdir=%gamerootdir%\Sacred Gold"

rem Installation check
if exist "%sgrootdir%" (
	rem Restore exported characters and savegames
	if exist "Sacred Gold\save" (
		echo Sacred Gold: Restoring exported characters and savegames
		xcopy /e /i /y "Sacred Gold\save" "%sgrootdir%\save"
		echo.
	) else (
		echo Sacred Gold: Character and savegame backup not found. Skipping...
		echo.
	)

	rem Restore configuration files
	if exist "Sacred Gold\*.cfg" (
		echo Sacred Gold: Restoring configuration files
		xcopy /i /y "Sacred Gold\*.cfg" "%sgrootdir%"
		echo.
	) else (
		echo Sacred Gold: Configuration files backup not found. Skipping...
		echo.
	)
) else (
	echo Sacred Gold: Installation not found. Skipping...
	echo.
)

echo Sacred Gold: Done.
echo.

rem Saints Row: The Third

set "sr3dir=%localappdata%\Saints Row The Third"

rem Restore profile and save data
if exist "Saints Row 3\savedir.sr3d_pc" (
	if exist "Saints Row 3\sr3def_profile" (
		if exist "Saints Row 3\*.sr3s_pc" (
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
		)
	)
) else (
	echo Saints Row 3: Profile and save data not found. Skipping...
	echo.
)

echo Saints Row 3: Done.
echo.

rem Serious Sam: The First Encounter

set "sstferootdir=%gamerootdir%\Serious Sam The First Encounter"

rem Installation check
if exist "%sstferootdir%" (
	rem Restore control files
	if exist "Serious Sam - The First Encounter\Controls\*.ctl" (
		echo Serious Sam: The First Encounter - Restoring control files
		xcopy /i /y "Serious Sam - The First Encounter\Controls\*.ctl" "%sstferootdir%\Controls"
		echo.
	) else (
		echo Serious Sam: The First Encounter - Control files backup not found. Skipping...
		echo.
	)

	rem Restore .plr files
	if exist "Serious Sam - The First Encounter\Players\*.plr" (
		echo Serious Sam: The First Encounter - Restoring .plr files
		xcopy /i /y "Serious Sam - The First Encounter\Players\*.plr" "%sstferootdir%\Players"
		echo.
	) else (
		echo Serious Sam: The First Encounter - .plr files backup not found. Skipping...
		echo.
	)

	rem Restore savegame files
	if exist "Serious Sam - The First Encounter\SaveGame" (
		echo Serious Sam: The First Encounter - Restoring savegame files
		xcopy /e /i /y "Serious Sam - The First Encounter\SaveGame" "%sstferootdir%\SaveGame"
		echo.
	) else (
		echo Serious Sam: The First Encounter - Savegame backup not found. Skipping...
		echo.
	)

	rem Restore persistent symbols file, which contains setting values
	if exist "Serious Sam - The First Encounter\Scripts\PersistentSymbols.ini" (
		echo Serious Sam: The First Encounter - Restoring persistent symbols file
		copy "Serious Sam - The First Encounter\Scripts\PersistentSymbols.ini" "%sstferootdir%\Scripts"
		echo.
	) else (
		echo Serious Sam: The First Encounter - Persistent symbols file backup not found. Skipping...
		echo.
	)
) else (
	echo Serious Sam: The First Encounter - Installation not found. Skipping...
	echo.
)

echo Serious Sam: The First Encounter: Done.
echo.

rem Sludge Life

set "slrootdir=%gamerootdir%\Sludge Life"

if exist "%slrootdir%" (
	rem Restore pictures
	if exist "Sludge Life\PICS\*.png" (
		echo Sludge Life: Restoring pictures
		xcopy /e /i /y "Sludge Life\PICS" "%slrootdir%\PICS"
		echo.
	) else (
		echo Sludge Life: Pictures backup not found. Skipping...
		echo.
	)

	rem Copy savegame file into the game’s root directory
	if exist "Sludge Life\save.txt" (
		echo Sludge Life: Restoring savegame file
		copy "Sludge Life\save.txt" "%slrootdir%"
		echo.
	) else (
		echo Sludge Life: Savegame file backup not found. Skipping...
		echo.
	)

	rem Restore registry keys. Settings are stored here
	if exist "Sludge Life\sludgelife.reg" (
		echo Sludge Life: Restoring registry keys
		reg import "Sludge Life\sludgelife.reg"
		echo.
	) else (
		echo Sludge Life: Registry keys backup not found. Skipping...
		echo.
	)
) else (
	echo Sludge Life: Installation not found. Skipping...
	echo.
)

echo Sludge Life: Done.
echo.

rem SOMA

set "somadir=%userprofile%\Documents\My Games\Soma"
set "somarootdir=%gamerootdir%\SOMA"

if exist "%somarootdir%" (
	rem Restore Soma\Main folder
	if exist SOMA (
		echo SOMA: Restoring profile folder, first start flag and main settings
		xcopy /e /i /y SOMA "%somadir%"
		echo.
	) else (
		echo SOMA: Backup not found. Skipping...
		echo.
	)
) else (
	echo SOMA: Installation not found. Skipping...
	echo.
)

echo SOMA: Done.
echo.

rem SPY Fox - Dry Cereal

set "sfdcsavedir=C:\hegames"

rem Restore savegames
if exist "SPY Fox - Dry Cereal\*" (
	echo SPY Fox - Dry Cereal: Restoring savegames
	xcopy /i /y "SPY Fox - Dry Cereal\*" %sfdcsavedir%
	echo.
) else (
	echo SPY Fox - Dry Cereal: Savegame backup not found. Skipping...
	echo.
)

echo SPY Fox - Dry Cereal: Done.
echo.

rem Sudden Strike

set "ssrootdir=%gamerootdir%\Sudden Strike"

rem Installation check
if exist "%ssrootdir%" (
	rem Restore savegames
	if exist "Sudden Strike\SaveGames" (
		echo Sudden Strike: Restoring savegames
		xcopy /e /i /y "Sudden Strike\SaveGames" "%ssrootdir%\SaveGames"
		echo.
	) else (
		echo Sudden Strike: Savegame backup not found. Skipping...
		echo.
	)

	rem Restore .ini file
	if exist "Sudden Strike\sudtest.ini" (
		echo Sudden Strike: Restoring .ini file
		copy "Sudden Strike\sudtest.ini" "%ssrootdir%"
		echo.
	) else (
		echo Sudden Strike: .ini file backup not found. Skipping...
		echo.
	)

	rem Restore ratings data
	if exist "Sudden Strike\ratings\*.rtc" (
		echo Sudden Strike: Restoring ratings data
		xcopy /i /y "Sudden Strike\ratings\*.rtc" "%ssrootdir%\ratings"
		echo.
	) else (
		echo Sudden Strike: Ratings data backup not found. Skipping...
		echo.
	)
) else (
	echo Sudden Strike: Installation not found. Skipping...
	echo.
)

echo Sudden Strike: Done.
echo.

rem SWAT 4

set "swat4rootdir=%gamerootdir%\SWAT 4"

rem Installation check
if exist "%swat4rootdir%" (
	rem Copy all .ini files into the game’s system directory
	if exist "SWAT 4" (
		echo SWAT 4: Restoring .ini files
		copy "SWAT 4\*" "%swat4rootdir%\Content\System"
		echo.
	) else (
		echo SWAT 4: Backup not found. Skipping...
		echo.
	)
) else (
	echo SWAT 4: Installation not found. Skipping...
	echo.
)

echo SWAT 4: Done.
echo.

rem Syberia

set "syberiarootdir=%gamerootdir%\Syberia"
set "syberiasavedir=%userprofile%\Documents\Syberia Saves"

rem Installation check
if exist "%syberiarootdir%" (
	rem Restore config and savegame files
	if exist Syberia (
		echo Syberia: Restoring configuration file and savegames
		xcopy /i /y Syberia\* "%syberiasavedir%"
		echo.
	) else (
		echo Syberia: Backup not found. Skipping...
		echo.
	)
) else (
	echo Syberia: Installation not found. Skipping...
	echo.
)

echo Syberia: Done.
echo.

rem Syberia II

set "syb2rootdir=%gamerootdir%\Syberia 2"
set "syb2savedir=%userprofile%\Documents\Syberia 2 Saves"

rem Installation check
if exist "%syb2rootdir%" (
	rem Restore config and savegame files
	if exist "Syberia 2" (
		echo Syberia II: Restoring configuration and savegames
		xcopy /i /y "Syberia 2\*" "%syb2savedir%"
		echo.
	) else (
		echo Syberia II: Backup not found. Skipping...
		echo.
	)
) else (
	echo Syberia II: Installation not found. Skipping...
	echo.
)

echo Syberia II: Done.
echo.

rem The Alto Collection

set "tacrootdir=%gamerootdir%\The Alto Collection"

rem Installation check
if exist "%tacrootdir%" (
	rem Restore configuration and savegame data
	if exist "The Alto Collection\tac.reg" (
		echo The Alto Collection: Restoring configuration and savegame data
		reg import "The Alto Collection\tac.reg"
		echo.
	) else (
		echo The Alto Collection: Registry keys backup not found. Skipping...
		echo.
	)
) else (
	echo The Alto Collection: Installation not found. Skipping...
	echo.
)

echo The Alto Collection: Done.
echo.

rem The Cat Lady

set "tclrootdir=%gamerootdir%\The Cat Lady"
set "tclsavedir=%userprofile%\Saved Games\The Cat Lady"

rem Installation check
if exist "%tclrootdir%" (
	rem Restore settings and savegame files
	if exist "The Cat Lady" (
		echo The Cat Lady: Restoring settings and savegames
		xcopy /i /y  "The Cat Lady\*" "%tclsavedir%"
		echo.
	) else (
		echo The Cat Lady: Backup not found. Skipping...
		echo.
	)
) else (
	echo The Cat Lady: Installation not found. Skipping...
	echo.
)

echo The Cat Lady: Done.
echo.

rem The Elder Scrolls III: Morrowind

set "tes3rootdir=%gamerootdir%\Morrowind"

rem Installation check
if exist "%tes3rootdir%" (
	rem Restore savegames
	if exist Morrowind\Saves (
		echo The Elder Scrolls III: Morrowind - Restoring savegames
		xcopy /e /i /y Morrowind\Saves "%tes3rootdir%\Saves"
		echo.
	) else (
		echo The Elder Scrolls III: Morrowind - Savegame backup not found. Skipping...
		echo.
	)

	rem Restore configuration file
	if exist Morrowind\Morrowind.ini (
		echo The Elder Scrolls III: Morrowind - Restoring configuration file
		copy Morrowind\Morrowind.ini "%tes3rootdir%"
		echo.
	) else (
		echo The Elder Scrolls III: Morrowind - Configuration file backup not found. Skipping...
		echo.
	)

	rem Restore journal
	if exist Morrowind\Journal.htm (
		echo The Elder Scrolls III: Morrowind - Restoring journal
		copy Morrowind\Journal.htm "%tes3rootdir%"
		echo.
	) else (
		echo The Elder Scrolls III: Morrowind - Journal backup not found. Skipping...
		echo.
	)

	rem Restore registry keys
	if exist Morrowind\morrowind.reg (
		echo The Elder Scrolls III: Morrowind - Restoring registry keys
		reg import Morrowind\morrowind.reg
		echo.
	) else (
		echo The Elder Scrolls III: Morrowind - Registry keys backup not found. Skipping...
		echo.
	)
) else (
	echo The Elder Scrolls III: Morrowind - Installation not found. Skipping...
	echo.
)

echo The Elder Scrolls III: Morrowind - Done.
echo.

rem The Infectious Madness of Doctor Dekker

set "timoddrootdir=%gamerootdir%\The Infectious Madness of Doctor Dekker"
set "timoddsavedir=%userprofile%\AppData\Roaming\timodd"

rem Installation check
if exist "%timoddrootdir%" (
	rem Copy savegame files into the game’s savegame folder
	if exist "The Infectious Madness of Doctor Dekker\*.json" (
		echo The Infectious Madness of Doctor Dekker: Restoring JSON savegame files
		xcopy /i /y "The Infectious Madness of Doctor Dekker\*.json" "%timoddsavedir%"
		echo.
	) else (
		echo The Infectious Madness of Doctor Dekker: JSON savegame backup not found. Skipping...
		echo.
	)

	rem Restore init.json file
	if exist "The Infectious Madness of Doctor Dekker\settings\init.json" (
		echo The Infectious Madness of Doctor Dekker: Restoring settings
		copy "The Infectious Madness of Doctor Dekker\settings\init.json" "%timoddrootdir%\resources\app"
		echo.
	) else (
		echo The Infectious Madness of Doctor Dekker: Settings backup not found. Skipping...
		echo.
	)
) else (
	echo The Infectious Madness of Doctor Dekker: Installation not found. Skipping...
	echo.
)

echo The Infectious Madness of Doctor Dekker: Done.
echo.

rem The Longest Journey

set "tljrootdir=%gamerootdir%\The Longest Journey"

rem Installation check
if exist "%tljrootdir%" (
	rem Restore savegame index, profile data, savegames, thumbnails
	if exist "The Longest Journey\Save" (
		echo The Longest Journey: Restoring savegame index, profile data, savegames and thumbnails
		xcopy /e /i /y "The Longest Journey\Save" "%tljrootdir%\Save"
		echo.
	) else (
		echo The Longest Journey: Save folder backup not found. Skipping...
		echo.
	)

	rem Restore game settings
	if exist "The Longest Journey\preferences.ini" (
		echo The Longest Journey: Restoring game settings
		copy "The Longest Journey\preferences.ini" "%tljrootdir%"
		echo.
	) else (
		echo The Longest Journey: Game settings backup not found. Skipping...
		echo.
	)
) else (
	echo The Longest Journey: Installation not found. Skipping...
	echo.
)

echo The Longest Journey: Done.
echo.

rem The Suicide of Rachel Foster

set "tsorfrootdir=%gamerootdir%\The Suicide of Rachel Foster"
set "tsorfsavedir=%localappdata%\Daedalic Entertainment GmbH\The Suicide of Rachel Foster\Saved"

rem Installation check
if exist "%tsorfrootdir%" (
	rem Restore savegame files
	if exist "The Suicide of Rachel Foster\SaveGames\*.sav" (
		echo The Suicide of Rachel Foster: Restoring savegame file and game options
		xcopy /i /y "The Suicide of Rachel Foster\SaveGames\*.sav" "%tsorfsavedir%\SaveGames"
		echo.
	) else (
		echo The Suicide of Rachel Foster: Savegame file and game options backup not found. Skipping...
		echo.
	)

	rem Restore user settings
	if exist "The Suicide of Rachel Foster\*.ini" (
		echo The Suicide of Rachel Foster: Restoring user settings
		xcopy /i /y "The Suicide of Rachel Foster\*.ini" "%tsorfsavedir%\Config\WindowsNoEditor"
		echo.
	) else (
		echo The Suicide of Rachel Foster: User settings backup not found. Skipping...
		echo.
	)
) else (
	echo The Suicide of Rachel Foster: Installation not found. Skipping...
	echo.
)

echo The Suicide of Rachel Foster: Done.
echo.

rem The Witcher

set "tw1rootdir=%gamerootdir%\The Witcher Enhanced Edition"
set "tw1savedir=%userprofile%\Documents\The Witcher\saves"

rem Installation check
if exist "%tw1rootdir%" (
	rem Restore savegame files
	if exist "The Witcher\*.TheWitcherSave" (
		echo The Witcher: Restoring savegame files
		xcopy /i /y "The Witcher\*.TheWitcherSave" "%tw1savedir%"
		echo.
	) else (
		echo The Witcher: Savegame backup not found. Skipping...
		echo.
	)

	rem Restore settings via registry keys
	if exist "The Witcher\tw1-settings.reg" (
		echo The Witcher: Restoring settings via registry keys
		reg import "The Witcher\tw1-settings.reg"
		echo.
	) else (
		echo The Witcher: Registry keys backup not found. Skipping...
		echo.
	)
) else (
	echo The Witcher: Installation not found. Skipping...
	echo.
)

echo The Witcher: Done.
echo.

rem Thief: The Dark Project

set "ttdprootdir=%gamerootdir%\Thief Gold"

rem Installation check
if exist "%ttdprootdir%" (
	rem Restore mission start save file
	if exist Thief\*.sav (
		echo Thief: The Dark Project - Restoring mission start save file
		xcopy /i /y Thief\*.sav "%ttdprootdir%"
		echo.
	) else (
		echo Thief: The Dark Project - Mission start save file backup not found. Skipping...
		echo.
	)

	rem Restore savegames
	if exist Thief\SAVES\*.sav (
		echo Thief: The Dark Project - Restoring savegames
		xcopy /i /y Thief\SAVES\*.sav "%ttdprootdir%\SAVES"
		echo.
	) else (
		echo Thief: The Dark Project - Savegames backup not found. Skipping...
		echo.
	)

	rem Restore configuration
	if exist Thief\cam.cfg (
		echo Thief: The Dark Project - Restoring configuration
		xcopy /i /y "Thief\cam.cfg" "%ttdprootdir%"
		echo.
	) else (
		echo Thief: The Dark Project - Configuration backup not found. Skipping...
		echo.
	)

	rem Restore keybinds
	if exist Thief\user.bnd (
		echo Thief: The Dark Project - Restoring keybinds
		xcopy /i /y "Thief\user.bnd" "%ttdprootdir%"
		echo.
	) else (
		echo Thief: The Dark Project - Keybinds backup not found. Skipping...
		echo.
	)
) else (
	echo Thief: The Dark Project - Installation not found. Skipping...
	echo.
)

echo Thief: The Dark Project - Done.
echo.

rem Tom Clancy’s Splinter Cell

set "tcscrootdir=%gamerootdir%\Splinter Cell"

rem Installation check
if exist "%tcscrootdir%" (
	rem Restore savegames
	if exist "Splinter Cell\Save" (
		echo Tom Clancy's Splinter Cell: Restoring savegames
		xcopy /e /i /y "Splinter Cell\Save" "%tcscrootdir%\Save"
		echo.
	) else (
		echo Tom Clancy's Splinter Cell: Savegames backup not found. Skipping...
		echo.
	)

	rem Restore configuration files
	if exist "Splinter Cell\system\SplinterCell.ini" (
		if exist "Splinter Cell\system\SplinterCellUser.ini" (
			echo Tom Clancy's Splinter Cell: Restoring configuration files
			copy "Splinter Cell\system\SplinterCell.ini" "%tcscrootdir%\system"
			copy "Splinter Cell\system\SplinterCellUser.ini" "%tcscrootdir%\system"
			echo.
		)
	) else (
		echo Tom Clancy's Splinter Cell: Configuration files backup not found. Skipping...
		echo.
	)
) else (
	echo Tom Clancy's Splinter Cell: Installation not found. Skipping...
	echo.
)

echo Tom Clancy's Splinter Cell: Done.
echo.

rem Тургор
rem English title: The Void

set "thevoiddir=%userprofile%\Documents\My Games\Void"
set "turgordir=%userprofile%\Documents\My Games\Turgor"
set "thevoidrootdir=%gamerootdir%\The Void"
set "turgorrootdir=%gamerootdir%\Turgor"
set "turgorpddir=%programdata%\Ice-pick Lodge\Turgor"
set "thevoidpddir=%programdata%\Ice-pick Lodge\Void"

rem Тургор: Restore savegames
if exist "Turgor\Savegames\*.sav" (
	echo Turgor: Restoring savegames
	xcopy /e /i /y "Turgor\Savegames" "%turgordir%\Savegames"
	echo.
) else (
	echo Turgor: Savegame backup not found. Skipping...
	echo.
)

rem The Void: Restore savegames
if exist "The Void\Savegames\*.sav" (
	echo The Void: Restoring savegames
	xcopy /e /i /y "The Void\Savegames" "%thevoiddir%\Savegames"
	echo.
) else (
	echo The Void: Savegame backup not found. Skipping...
	echo.
)

rem Тургор: Restore settings
if exist "Turgor\settings\settings.xml" (
	echo Turgor: Restoring settings
	xcopy /i /y "Turgor\settings\settings.xml" "%turgorrootdir%\data"
	echo.
) else (
	echo Turgor: Settings XML file backup not found. Skipping...
	echo.
)

rem The Void: Restore settings
if exist "The Void\settings\settings.xml" (
	echo The Void: Restoring settings
	xcopy /i /y "The Void\settings\settings.xml" "%thevoidrootdir%\data"
	echo.
) else (
	echo The Void: Settings XML file backup not found. Skipping...
	echo.
)

rem Тургор: Restore render and sound settings
if exist "Turgor\settings\rcfg*" (
	if exist "Turgor\settings\scfg*" (
		echo Turgor: Restoring render and sound settings
		xcopy /i /y "Turgor\settings\rcfg*" "%turgorpddir%"
		xcopy /i /y "Turgor\settings\scfg*" "%turgorpddir%"
		echo.
	)
) else (
	echo Turgor: Render and sound settings backup not found. Skipping...
	echo.
)

rem The Void: Backup render and sound settings
if exist "The Void\settings\rcfg*" (
	if exist "The Void\settings\scfg*" (
		echo The Void: Restoring render and sound settings
		xcopy /i /y "The Void\settings\rcfg*" "%thevoidpddir%"
		xcopy /i /y "The Void\settings\scfg*" "%thevoidpddir%"
		echo.
	)
) else (
	echo The Void: Render and sound settings backup not found. Skipping...
	echo.
)

rem Тургор: Restore registry keys
if exist "Turgor\turgor.reg" (
	echo Turgor: Restoring registry keys
	reg import "Turgor\turgor.reg"
	echo.
) else (
	echo Turgor: Registry keys backup not found. Skipping...
	echo.
)

rem The Void: Restore registry keys
if exist "The Void\the-void.reg" (
	echo The Void: Restoring registry keys
	reg import "The Void\the-void.reg"
	echo.
) else (
	echo The Void: Registry keys backup not found. Skipping...
	echo.
)

echo Turgor: Done.
echo The Void: Done.
echo.

rem Unreal

set "unrealrootdir=%gamerootdir%\Unreal Gold"

rem Installation check
if exist "%unrealrootdir%" (
	rem Restore savegames
	if exist Unreal\Save (
		echo Unreal: Restoring savegames
		xcopy /e /i /y Unreal\Save "%unrealrootdir%\Save"
		echo.
	) else (
		echo Unreal: Savegame backup not found. Skipping...
		echo.
	)

	rem Restore configuration and keybinds
	if exist "Unreal\System\Unreal.ini" (
		if exist "Unreal\System\User.ini" (
			echo Unreal: Restoring configuration and keybinds
			copy "Unreal\System\Unreal.ini" "%unrealrootdir%\System"
			copy "Unreal\System\User.ini" "%unrealrootdir%\System"
			echo.
		)
	) else (
		echo Unreal: Configuration and keybinds backup not found. Skipping...
		echo.
	)
) else (
	echo Unreal: Installation not found. Skipping...
	echo.
)

echo Unreal: Done.
echo.

rem Unreal II - The Awakening

set "unreal2rootdir=%gamerootdir%\Unreal 2 - The Awakening"

rem Installation check
if exist "%unreal2rootdir%" (
	rem Restore savegames
	if exist "Unreal II\Save" (
		echo Unreal II - The Awakening: Restoring savegames
		xcopy /e /i /y "Unreal II\Save" "%unreal2rootdir%\singleplayer\Save"
		echo.
	) else (
		echo Unreal II - The Awakening: Savegame backup not found. Skipping...
		echo.
	)

	rem Restore configuration and keybinds
	if exist "Unreal II\System\Unreal2.ini" (
		if exist "Unreal II\System\User.ini" (
			echo Unreal II - The Awakening: Restoring configuration and keybinds
			copy "Unreal II\System\Unreal2.ini" "%unreal2rootdir%\singleplayer\System"
			copy "Unreal II\System\User.ini" "%unreal2rootdir%\singleplayer\System"
			echo.
		)
	) else (
		echo Unreal II - The Awakening: Configuration and keybinds backup not found. Skipping.
		echo.
	)

	rem Restore Golem file
	if exist "Unreal II\System\Golem.u" (
		echo Unreal II - The Awakening: Restoring Golem file
		copy "Unreal II\System\Golem.u" "%unreal2rootdir%\singleplayer\System"
		echo.
	) else (
		echo Unreal II - The Awakening: Golem file backup not found. Skipping...
		echo.
	)
) else (
	echo Unreal II - The Awakening: Installation not found. Skipping...
	echo.
)

echo Unreal II - The Awakening: Done.
echo.

rem Uplink

set "ulrootdir=%gamerootdir%\Uplink"

rem Installation check
if exist "%ulrootdir%" (
	rem Copy user files into Uplink’s users folder
	if exist Uplink\*.usr (
		echo Uplink: Restoring user files
		xcopy /i /y Uplink\*.usr "%ulrootdir%\users"
		echo.
	) else (
		echo Uplink: User files backup not found. Skipping...
		echo.
	)

	rem Copy options file into Uplink’s users folder
	if exist Uplink\options (
		echo Uplink: Restoring options file
		copy Uplink\options "%ulrootdir%\users"
		echo.
	) else (
		echo Uplink: Options file backup not found. Skipping...
		echo.
	)
) else (
	echo Uplink: Installation not found. Skipping...
	echo.
)

echo Uplink: Done.
echo.

rem Vampire’s Dawn 2

set "vd2rootdir=%gamerootdir%\Vampire's Dawn 2"

rem Installation check
if exist "%vd2rootdir%" (
	rem Restore savegame files
	if exist "Vampires Dawn 2\*.lsd" (
		echo Vampire's Dawn 2: Restoring savegames
		copy "Vampires Dawn 2\*.lsd" "%vd2rootdir%"
		echo.
	) else (
		echo Vampire's Dawn 2: Savegame backup not found. Skipping...
		echo.
	)
) else (
	echo Vampire's Dawn 2: Installation not found. Skipping...
	echo.
)

echo Vampire's Dawn 2: Done.
echo.

rem What Remains of Edith Finch

set "wroefdir=%localappdata%\FinchGame"

rem Restore savegame
rem Since the game creates a random ID suffix combined with the machine name,
rem the existence check is being done on the SaveGames folder instead of the
rem actual savegame. Not sure how to solve this.
if exist "What Remains of Edith Finch\Saved\SaveGames" (
	echo What Remains of Edith Finch: Restoring savegame
	xcopy /e /i /y "What Remains of Edith Finch\Saved\SaveGames" "%wroefdir%\Saved\SaveGames"
	echo.
) else (
	echo What Remains of Edith Finch: Savegame folder backup not found. Skipping...
	echo.
)

rem Restore game user settings file and Engine settings file
if exist "What Remains of Edith Finch\Saved\Config\WindowsNoEditor\*.ini" (
	echo What Remains of Edith Finch: Restoring configuration files
	if not exist "%wroefdir%\Saved\Config\WindowsNoEditor" (
		md "%wroefdir%\Saved\Config\WindowsNoEditor"
	)

	xcopy /i /y "What Remains of Edith Finch\Saved\Config\WindowsNoEditor\Engine.ini" "%wroefdir%\Saved\Config\WindowsNoEditor"
	xcopy /i /y "What Remains of Edith Finch\Saved\Config\WindowsNoEditor\GameUserSettings.ini" "%wroefdir%\Saved\Config\WindowsNoEditor"
	echo.
) else (
	echo What Remains of Edith Finch: Configuration backup not found. Skipping...
	echo.
)

echo What Remains of Edith Finch: Done.
echo.

rem Worms Armageddon

set "warootdir=%gamerootdir%\Worms Armageddon"

rem Installation check
if exist "%warootdir%" (
	rem Restore games data
	if exist "Worms Armageddon\Games" (
		echo Worms Armageddon: Restoring games data
		xcopy /e /i /y "Worms Armageddon\Games" "%warootdir%\User\Games"
		echo.
	) else (
		echo Worms Armageddon: Games data backup not found. Skipping...
		echo.
	)

	rem Restore team data
	if exist "Worms Armageddon\Teams" (
		echo Worms Armageddon: Restoring team data
		xcopy /e /i /y "Worms Armageddon\Teams" "%warootdir%\User\Teams"
		echo.
	) else (
		echo Worms Armageddon: Team data backup not found. Skipping...
		echo.
	)

	rem Restore custom.dat file
	if exist "Worms Armageddon\custom.dat" (
		echo Worms Armageddon: Restoring custom.dat file
		xcopy /i /y "Worms Armageddon\custom.dat" "%warootdir%"
		echo.
	) else (
		echo Worms Armageddon: custom.dat backup not found. Skipping...
		echo.
	)

	rem Restore land.dat file
	if exist "Worms Armageddon\DATA\land.dat" (
		echo Worms Armageddon: Restoring land.dat file
		copy "Worms Armageddon\DATA\land.dat" "%warootdir%\DATA"
		echo.
	) else (
		echo Worms Armageddon: land.dat file backup not found. Skipping...
		echo.
	)

	rem Restore registry keys
	if exist "Worms Armageddon\wa.reg" (
		echo Worms Armageddon: Restoring registry keys
		reg import "Worms Armageddon\wa.reg"
		echo.
	) else (
		echo Worms Armageddon: Registry keys backup not found. Skipping...
		echo.
	)
) else (
	echo Worms Armageddon: Installation not found. Skipping...
	echo.
)

echo Worms Armageddon: Done.
echo.

rem XIII

set "xiiirootdir=%gamerootdir%\XIII"

rem Installation check
if exist "%xiiirootdir%" (
	rem Restore profiles and savegames
	if exist XIII\Save\*.pro (
		echo XIII: Restoring profiles and savegames
		xcopy /e /i /y XIII\Save "%xiiirootdir%\Save"
		echo.
	) else (
		echo XIII: Profile backup not found. Skipping...
		echo.
	)

	rem Restore configuration file
	if exist XIII\system\XIII.ini (
		echo XIII: Restoring configuration file
		xcopy /i /y XIII\system\XIII.ini "%xiiirootdir%\system"
		echo.
	) else (
		echo XIII: Configuration file backup not found. Skipping...
		echo.
	)
) else (
	echo XIII: Installation not found. Skipping...
	echo.
)

echo XIII: Done.
echo.

pause
