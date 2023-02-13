@echo off

rem rbc: Gamestate backup script
rem Last modified on 13 February 2023

rem This script should backup profiles, settings and savegames, which are
rem herein collectively referred to as gamestate.

rem Write the path to your game directory here
set "gamerootdir="

rem Steam default game folder
set "steamdefaultlibdir=C:\Program Files (x86)\Steam\steamapps\common"

rem Steam alternative library
rem set "steamlibdir=S:\Users\User\Games\SteamLibrary"

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
if exist "%ahwmfsavedir%\*.save" (
	echo A Hand With Many Fingers: Backing up savegame file
	xcopy /e /i /y "%ahwmfsavedir%" "A Hand With Many Fingers\saves"
	echo.
) else (
	echo A Hand With Many Fingers: Savegame file not found. Skipping...
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

rem Alpha Polaris

set "alphapolarisregpath=HKCU\SOFTWARE\TurmoilGames\AlphaPolaris"
set "alphapolarissgdir=%userprofile%\Saved Games\Alpha Polaris"

rem Backup savegames
if exist "%alphapolarissgdir%\*.dsv" (
	echo Alpha Polaris: Backing up savegames
	xcopy /i /y "%alphapolarissgdir%\*.dsv" "Alpha Polaris\Savegames"
	echo.
) else (
	echo Alpha Polaris: Savegames not found. Skipping...
	echo.
)

rem Backup options
if exist "%alphapolarissgdir%\*.dat" (
	echo Alpha Polaris: Backing up options file
	xcopy /i /y "%alphapolarissgdir%\*.dat" "Alpha Polaris\Options"
	echo.
) else (
	echo Alpha Polaris: Options file not found. Skipping...
	echo.
)

rem Backup registry key
echo Alpha Polaris: Backing up registry key
reg export "%alphapolarisregpath%" "Alpha Polaris\alpha-polaris.reg" /y
echo.

echo Alpha Polaris: Done.
echo.

rem Amnesia: A Machine For Pigs

set "aamfpdir=%userprofile%\Documents\Amnesia\Pig"

rem Backup Amnesia\Pig folder with the exclusion of two log files
if exist "%aamfpdir%" (
	echo Amnesia: A Machine For Pigs - Backing up profile folder, first start flag and main settings
	xcopy /e /exclude:exclude\aamfp-exclude.txt /i /y "%aamfpdir%" "Amnesia - A Machine for Pigs"
	echo.
) else (
	echo Amnesia: A Machine For Pigs - Folder not found. Skipping...
	echo.
)

echo Amnesia: A Machine For Pigs - Done.
echo.

rem Amnesia: The Dark Descent

set "atdddir=%userprofile%\Documents\Amnesia\Main"

rem Backup Amnesia\Main folder with the exclusion of two log files
if exist "%atdddir%" (
	echo Amnesia: The Dark Descent - Backing up profile folder, first start flag and main settings
	xcopy /e /exclude:exclude\atdd-exclude.txt /i /y "%atdddir%" "Amnesia - The Dark Descent"
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
echo.

echo ANNO 1602: Done.
echo.

rem ArmA: Armed Assault

set "armadocdir1=%userprofile%\Documents\ArmA"
set "armadocdir2=%userprofile%\Documents\ArmA Other Profiles"
set "armaregkeypath1=HKCU\SOFTWARE\Bohemia Interactive Studio\ArmA"
set "armaregkeypath2=HKLM\SOFTWARE\WOW6432Node\Bohemia Interactive Studio\ArmA"

rem Backup main profile folder
if exist "%armadocdir1%" (
	echo ArmA: Armed Assault - Backing up main profile folder
	xcopy /e /i /y "%armadocdir1%" "ArmA - Armed Assault\ArmA"
	echo.
) else (
	echo ArmA: Armed Assault - Main profile folder not found. Skipping...
	echo.
)

rem Backup other profile folder
if exist "%armadocdir2%" (
	echo ArmA: Armed Assault - Backing up other profile folder
	xcopy /e /i /y "%armadocdir2%" "ArmA - Armed Assault\ArmA - Other Profiles"
	echo.
) else (
	echo ArmA: Armed Assault - Other profile folder not found. Skipping...
	echo.
)

rem Backup registry keys
echo ArmA: Armed Assault - Backing up registry keys
reg export "%armaregkeypath1%" "ArmA - Armed Assault\arma-1.reg" /y
reg export "%armaregkeypath2%" "ArmA - Armed Assault\arma-2.reg" /y
echo.

echo ArmA: Armed Assault - Done.
echo.

rem Arma: Cold War Assault

set "acwaregkeypath=HKLM\SOFTWARE\WOW6432Node\Bohemia Interactive Studio\ColdWarAssault"
set "acwarootdir=%gamerootdir%\Arma Cold War Assault"

rem Backup ‘Users’ folder
rem Checking for all the profile folders within Users is too complicated for
rem me, so the existence of the folder itself is checked, however pointless
rem that may seem
if exist "%acwarootdir%\Users" (
	echo Arma: Cold War Assault - Backing up Users folder
	xcopy /e /i /y "%acwarootdir%\Users" "Arma - Cold War Assault\Users"
	echo.
) else (
	echo Arma: Cold War Assault - Users folder not found. Skipping...
	echo.
)

rem Backup configuration file
if exist "%acwarootdir%\ColdWarAssault.cfg" (
	echo Arma: Cold War Assault - Backing up configuration
	xcopy /i /y "%acwarootdir%\ColdWarAssault.cfg" "Arma - Cold War Assault"
	echo.
) else (
	echo Arma: Cold War Assault - Configuration file not found. Skipping...
	echo.
)

rem Backup registry key
echo Arma: Cold War Assault - Backing up registry key
reg export "%acwaregkeypath%" "Arma - Cold War Assault\acwa.reg" /y
echo.

echo Arma: Cold War Assault - Done.
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

rem Bio Menace
rem GOG edition, DOSBox emulation

set "biomenacerootdir=%gamerootdir%\Bio Menace"

rem Backup savegames
if exist "%biomenacerootdir%\cloud_saves\SAVEGAM*" (
	echo Bio Menace: Backing up savegames
	xcopy /i /y "%biomenacerootdir%\cloud_saves\SAVEGAM*" "Bio Menace\Savegames"
	echo.
) else (
	echo Bio Menace: Savegames not found. Skipping...
	echo.
)

rem Backup configuration
if exist "%biomenacerootdir%\cloud_saves\CONFIG*" (
	echo Bio Menace: Backing up configuration
	xcopy /i /y "%biomenacerootdir%\cloud_saves\CONFIG*" "Bio Menace\Configuration"
	echo.
) else (
	echo Bio Menace: Configuration not found. Skipping...
	echo.
)

rem Backup DOSBox configuration file
if exist "%biomenacerootdir%\dosbox_biomenace.conf" (
	echo Bio Menace: Backing up DOSBox configuration file
	xcopy /i /y "%biomenacerootdir%\dosbox_biomenace.conf" "Bio Menace"
	echo.
) else (
	echo Bio Menace: DOSBox configuration file not found. Skipping...
	echo.
)

echo Bio Menace: Done.
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

rem Blair Witch

set "blairwitchdir=%localappdata%\Blairwitch"

rem Backup .sav files. In this case, savegames, an ‘input rebinding’ file, a
rem player profile and an achievements file
if exist "%blairwitchdir%\Saved\SaveGames\*.sav" (
	echo Blair Witch: Backing up .sav files
	xcopy /i /y "%blairwitchdir%\Saved\SaveGames\*.sav" "Blair Witch\Savegames"
	echo.
) else (
	echo Blair Witch: .sav files not found. Skipping...
	echo.
)

rem Backup configuration files
if exist "%blairwitchdir%\Saved\Config\WindowsNoEditor\*.ini" (
	echo Blair Witch: Backing up configuration files
	xcopy /i /y "%blairwitchdir%\Saved\Config\WindowsNoEditor\*.ini" "Blair Witch\Configuration"
	echo.
) else (
	echo Blair Witch: Configuration files not found. Skipping...
	echo.
)

echo Blair Witch: Done.
echo.

rem Blitzkrieg

set "blitzkriegregpath=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Nival Interactive\Blitzkrieg"
set "blitzkriegrootdir=%gamerootdir%\Blitzkrieg"

rem Backup savegames
if exist "%blitzkriegrootdir%\saves\*.sav" (
	echo Blitzkrieg: Backing up savegames
	xcopy /i /y "%blitzkriegrootdir%\saves\*.sav" "Blitzkrieg\saves"
	echo.
) else (
	echo Blitzkrieg: Savegames not found. Skipping...
	echo.
)

rem Backup chapters folder
if exist "%blitzkriegrootdir%\data\scenarios\chapters" (
	echo Blitzkrieg: Backing up chapters folder
	xcopy /e /i /y "%blitzkriegrootdir%\data\scenarios\chapters" "Blitzkrieg\data\scenarios\chapters"
	echo.
) else (
	echo Blitzkrieg: Chapters folder not found. Skipping...
	echo.
)

rem Backup configuration
if exist "%blitzkriegrootdir%\config.cfg" (
	echo Blitzkrieg: Backing up configuration
	xcopy /i /y "%blitzkriegrootdir%\config.cfg" "Blitzkrieg"
	echo.
) else (
	echo Blitzkrieg: Configuration not found. Skipping...
	echo.
)

rem Backup registry key
echo Blitzkrieg: Backing up registry key
reg export "%blitzkriegregpath%" "Blitzkrieg\blitzkrieg.reg" /y
echo.

rem Backup address book
if exist "%blitzkriegrootdir%\data\*.xml" (
	echo Blitzkrieg: Backing up address book
	xcopy /i /y "%blitzkriegrootdir%\data\*.xml" "Blitzkrieg\data"
	echo.
) else (
	echo Blitzkrieg: Address book not found. Skipping...
	echo.
)

echo Blitzkrieg: Done.
echo.

rem Blitzkrieg Anthology: Burning Horizon - Rolling Thunder

set "babhrtregpath=HKLM\SOFTWARE\WOW6432Node\CDV Software Entertainment AG\Blitzkrieg Rolling Thunder"
set "babhrtrootdir=%gamerootdir%\Blitzkrieg BHRT"

rem Backup savegames
if exist "%babhrtrootdir%\Run\saves\*.sav" (
	echo Blitzkrieg Anthology: Burning Horizon - Rolling Thunder - Backing up savegames
	xcopy /i /y "%babhrtrootdir%\Run\saves\*.sav" "Blitzkrieg Anthology - Burning Horizon - Rolling Thunder\Run\saves"
	echo.
) else (
	echo Blitzkrieg Anthology: Burning Horizon - Rolling Thunder - Savegames not found. Skipping...
	echo.
)

rem Backup configuration
if exist "%babhrtrootdir%\Run\config.cfg" (
	echo Blitzkrieg Anthology: Burning Horizon - Rolling Thunder - Backing up configuration
	xcopy /i /y "%babhrtrootdir%\Run\config.cfg" "Blitzkrieg Anthology - Burning Horizon - Rolling Thunder\Run"
	echo.
) else (
	echo Blitzkrieg Anthology: Burning Horizon - Rolling Thunder - Configuration not found. Skipping...
	echo.
)

rem Backup chapters folder
if exist "%babhrtrootdir%\Run\data\scenarios\chapters" (
	echo Blitzkrieg Anthology: Burning Horizon - Rolling Thunder - Backing up chapters folder
	xcopy /e /i /y "%babhrtrootdir%\Run\data\scenarios\chapters" "Blitzkrieg Anthology - Burning Horizon - Rolling Thunder\Run\data\scenarios\chapters"
	echo.
) else (
	echo Blitzkrieg Anthology: Burning Horizon - Rolling Thunder - Chapters folder not found. Skipping...
	echo.
)

rem Backup registry key
echo Blitzkrieg Anthology: Burning Horizon - Rolling Thunder - Backing up registry key
reg export "%babhrtregpath%" "Blitzkrieg Anthology - Burning Horizon - Rolling Thunder\babhrt.reg" /y
echo.

rem Backup address book
if exist "%babhrtrootdir%\Run\data\AddressBook.xml" (
	echo Blitzkrieg: Backing up address book
	xcopy /i /y "%babhrtrootdir%\Run\data\AddressBook.xml" "Blitzkrieg Anthology - Burning Horizon - Rolling Thunder\Run\data"
	echo.
) else (
	echo Blitzkrieg: Address book not found. Skipping...
	echo.
)

echo Blitzkrieg Anthology: Burning Horizon - Rolling Thunder - Done.
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
if exist "%bs1984rootdir%\Buddy Simulator 1984_Data\StreamingAssets\Memories\*.png" (
	echo Buddy Simulator 1984: Backing up memories
	xcopy /e /i /y "%bs1984rootdir%\Buddy Simulator 1984_Data\StreamingAssets\Memories" "Buddy Simulator 1984\Memories"
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

rem Cosmo’s Cosmic Adventure
rem GOG edition, emulated in DOSBox

set "ccarootdir=%gamerootdir%\Cosmo's Cosmic Adventure"

rem Backup savegames, SVT files and highscore file
rem I think that the actual savegames are in the SV[saveslot] format as in SV1,
rem SV2, SV3 etc. There are however SVT files also; what their purpose is, I do
rem not know. The .CFG file seems to contain highscore data.
if exist "%ccarootdir%\cloud_saves\COSMO*" (
	echo Cosmo's Cosmic Adventure: Backing up savegames, SVT files and highscores
	xcopy /i /y "%ccarootdir%\cloud_saves\COSMO*" "Cosmo's Cosmic Adventure"
	echo.
) else (
	echo Cosmo's Cosmic Adventure: Files not found. Skipping...
	echo.
)

echo Cosmo's Cosmic Adventure: Done.
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
	xcopy /i /y "%devererootdir%\game\saves\*.save" "Dear Devere\game\saves"
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

rem Backup registry key
echo "Diablo (Classic): Backing up registry key"
reg export "%diabloregpath%" "Diablo\Classic\diablo.reg" /y

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

set "dhellfireregpath=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Blizzard Entertainment\Hellfire"

rem Backup savegame files
if exist "%diablorootdir%\hellfire\*.hsv" (
	echo Diablo: Hellfire - Backing up savegame files
	xcopy /i /y "%diablorootdir%\hellfire\*.hsv" "Diablo\Hellfire"
	echo.
) else (
	echo Diablo: Hellfire - Savegames not found. Skipping...
	echo.
)

rem Backup registry key
echo Diablo: Hellfire - Backing up registry key
reg export "%dhellfireregpath%" "Diablo\Hellfire\diablo-hellfire.reg" /y
echo.

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

rem Die Siedler II - Gold Edition
rem English title: The Settlers II GOLD
rem
rem GOG edition, DOSBox emulation

set "diesiedler2rootdir=%gamerootdir%\The Settlers 2 GOLD"

rem Backup .DAT save files with the exclusion of MISSION.DAT
if exist "%diesiedler2rootdir%\SAVE\*.DAT" (
	echo Die Siedler II - Gold Edition: Backing up .DAT save files
	xcopy /exclude:exclude\ds2-exclude.txt /i /y "%diesiedler2rootdir%\SAVE\*.DAT" "Die Siedler II - Gold Edition\SAVE"
	echo.
) else (
	echo Die Siedler II - Gold Edition: .DAT save files not found. Skipping...
	echo.
)

rem Backup configuration
if exist "%diesiedler2rootdir%\SETUP.INI" (
	echo Die Siedler II - Gold Edition: Backing up configuration
	xcopy /i /y "%diesiedler2rootdir%\SETUP.INI" "Die Siedler II - Gold Edition"
	echo.
) else (
	echo Die Siedler II - Gold Edition: Configuration not found. Skipping...
	echo.
)

rem Explicit file copy workaround
if not exist "Die Siedler II - Gold Edition\DATA" (
	echo Die Siedler II - Gold Edition: Creating DATA directory
	md "Die Siedler II - Gold Edition\DATA"
	echo.
) else (
	echo Die Siedler II - Gold Edition: DATA directory already exists
	echo.
)

rem Backup EDITRES.IDX
if exist "%diesiedler2rootdir%\DATA\EDITRES.IDX" (
	echo Die Siedler II - Gold Edition: Backing up EDITRES.IDX
	xcopy /i /y "%diesiedler2rootdir%\DATA\EDITRES.IDX" "Die Siedler II - Gold Edition\DATA"
	echo.
) else (
	echo Die Siedler II - Gold Edition: EDITRES.IDX not found. Skipping...
	echo.
)

rem Backup REMAP.DAT
if exist "%diesiedler2rootdir%\DATA\REMAP.DAT" (
	echo Die Siedler II - Gold Edition: Backing up REMAP.DAT
	xcopy /i /y "%diesiedler2rootdir%\DATA\REMAP.DAT" "Die Siedler II - Gold Edition\DATA"
	echo.
) else (
	echo Die Siedler II - Gold Edition: REMAP.DAT not found. Skipping...
	echo.
)

rem Backup RESOURCE.IDX
if exist "%diesiedler2rootdir%\DATA\RESOURCE.IDX" (
	echo Die Siedler II - Gold Edition: Backing up RESOURCE.IDX
	xcopy /i /y "%diesiedler2rootdir%\DATA\RESOURCE.IDX" "Die Siedler II - Gold Edition\DATA"
	echo.
) else (
	echo Die Siedler II - Gold Edition: RESOURCE.IDX not found. Skipping...
	echo.
)

rem Explicit file copy workaround
if not exist "Die Siedler II - Gold Edition\DATA\IO" (
	echo Die Siedler II - Gold Edition: Creating DATA\IO directory
	md "Die Siedler II - Gold Edition\DATA\IO"
	echo.
) else (
	echo Die Siedler II - Gold Edition: DATA\IO directory already exists
	echo.
)

rem Backup EDITIO.IDX
if exist "%diesiedler2rootdir%\DATA\IO\EDITIO.IDX" (
	echo Die Siedler II - Gold Edition: Backing up EDITIO.IDX
	xcopy /i /y "%diesiedler2rootdir%\DATA\IO\EDITIO.IDX" "Die Siedler II - Gold Edition\DATA\IO"
	echo.
) else (
	echo Die Siedler II - Gold Edition: EDITIO.IDX not found. Skipping...
	echo.
)

rem Backup IO.IDX
if exist "%diesiedler2rootdir%\DATA\IO\IO.IDX" (
	echo Die Siedler II - Gold Edition: Backing up IO.IDX
	xcopy /i /y "%diesiedler2rootdir%\DATA\IO\IO.IDX" "Die Siedler II - Gold Edition\DATA\IO"
	echo.
) else (
	echo Die Siedler II - Gold Edition: IO.IDX not found. Skipping...
	echo.
)

rem Backup world files
if exist "%diesiedler2rootdir%\WORLDS\*.SWD" (
	echo Die Siedler II - Gold Edition: Backing up world files
	xcopy /i /y "%diesiedler2rootdir%\WORLDS\*.SWD" "Die Siedler II - Gold Edition\WORLDS"
	echo.
) else (
	echo Die Siedler II - Gold Edition: World files not found. Skipping...
	echo.
)

rem Backup world screenshots
if exist "%diesiedler2rootdir%\WORLDS\*.PCX" (
	echo Die Siedler II - Gold Edition: Backing up world screenshots
	xcopy /i /y "%diesiedler2rootdir%\WORLDS\*.PCX" "Die Siedler II - Gold Edition\WORLDS"
	echo.
) else (
	echo Die Siedler II - Gold Edition: World screenshots not found. Skipping...
	echo.
)

echo Die Siedler II - Gold Edition: Done.
echo.

rem Die Völker
rem English title: Alien Nations

set "dievoelkerrootdir=%gamerootdir%\Alien Nations"

rem Backup configuration and savegame files
if exist "%dievoelkerrootdir%\Savegames\*" (
	echo Die Voelker: Backing up configuration and savegame files
	xcopy /e /i /y "%dievoelkerrootdir%\Savegames" "Die Voelker\Savegames"
	echo.
) else (
	echo Die Voelker: Savegames folder not found. Skipping...
	echo.
)

echo Die Voelker: Done.
echo.

rem DOOM
rem GOG edition, emulated in DOSBox
rem
rem Known as ‘The Ultimate DOOM’

set "doomrootdir=%gamerootdir%\DOOM"

rem Backup savegames
if exist "%doomrootdir%\cloud_saves\*.DSG" (
	echo DOOM: Backing up savegames
	xcopy /i /y "%doomrootdir%\cloud_saves\*.DSG" "DOOM"
	echo.
) else (
	echo DOOM: Savegames not found. Skipping...
	echo.
)

rem Backup configuration
if exist "%doomrootdir%\cloud_saves\*.CFG" (
	echo DOOM: Backing up configuration
	xcopy /i /y "%doomrootdir%\cloud_saves\*.CFG" "DOOM"
	echo.
) else (
	echo DOOM: Configuration not found. Skipping...
	echo.
)

echo DOOM: Done.
echo.

rem DOOM II
rem GOG edition, emulated in DOSBox

set "doom2rootdir=%gamerootdir%\DOOM 2"

rem Backup savegames, configuration and response file
if exist "%doom2rootdir%\cloud_saves\DOOM2" (
	echo DOOM II: Backing up savegames, configuration and response file
	xcopy /e /i /y "%doom2rootdir%\cloud_saves\DOOM2" "DOOM 2"
	echo.
) else (
	echo DOOM II: Folder not found. Skipping...
	echo.
)

echo DOOM II: Done.
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

rem Dungeon Keeper
rem Deeper Dungeons
rem GOG edition, DOSBox emulation

set "dk1rootdir=%gamerootdir%\Dungeon Keeper Gold"

rem Backup SAVE folder
if exist "%dk1rootdir%\cloud_saves\SAVE" (
	echo Dungeon Keeper: Backing up SAVE folder
	xcopy /e /i /y "%dk1rootdir%\cloud_saves\SAVE" "Dungeon Keeper\SAVE"
	echo.
) else (
	echo Dungeon Keeper: SAVE folder not found. Skipping...
	echo.
)

rem Backup highscore file
if exist "%dk1rootdir%\cloud_saves\DATA\*.DAT" (
	echo Dungeon Keeper: Backing up highscore file
	xcopy /i /y "%dk1rootdir%\cloud_saves\DATA\*.DAT" "Dungeon Keeper\DATA"
	echo.
) else (
	echo Dungeon Keeper: Highscore file not found. Skipping...
	echo.
)

echo Dungeon Keeper: Done.
echo.

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

rem Final DOOM

set "finaldoomrootdir=%gamerootdir%\Final DOOM"

rem TNT: Evilution

rem Backup savegames
if exist "%finaldoomrootdir%\cloud_saves\TNT\*.DSG" (
	echo Final DOOM - TNT: Evilution - Backing up savegames
	xcopy /i /y "%finaldoomrootdir%\cloud_saves\TNT\*.DSG" "Final DOOM\TNT"
	echo.
) else (
	echo Final DOOM - TNT: Evilution - Savegames not found. Skipping...
	echo.
)

rem Backup configuration
if exist "%finaldoomrootdir%\cloud_saves\TNT\*.CFG" (
	echo Final DOOM - TNT: Evilution - Backing up configuration
	xcopy /i /y "%finaldoomrootdir%\cloud_saves\TNT\*.CFG" "Final DOOM\TNT"
	echo.
) else (
	echo Final DOOM - TNT: Evilution - Configuration not found. Skipping...
	echo.
)

rem The Plutonium Experiment

rem Backup savegames
if exist "%finaldoomrootdir%\cloud_saves\PLUTONIA\*.DSG" (
	echo Final DOOM - The Plutonium Experiment: Backing up savegames
	xcopy /i /y "%finaldoomrootdir%\cloud_saves\PLUTONIA\*.DSG" "Final DOOM\PLUTONIA"
	echo.
) else (
	echo Final DOOM - The Plutonium Experiment: Savegames not found. Skipping...
	echo.
)

rem Backup configuration
if exist "%finaldoomrootdir%\cloud_saves\PLUTONIA\*.CFG" (
	echo Final DOOM - The Plutonium Experiment: Backing up configuration
	xcopy /i /y "%finaldoomrootdir%\cloud_saves\PLUTONIA\*.CFG" "Final DOOM\PLUTONIA"
	echo.
) else (
	echo Final DOOM - The Plutonium Experiment: Configuration not found. Skipping...
	echo.
)

echo Final DOOM: Done.
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

rem Hatred

set "hatredrootdir=%gamerootdir%\Hatred"

rem Backup savegames
if exist "%hatredrootdir%\Hatred\Saved\SaveGames\*.sav" (
	echo Hatred: Backing up savegames
	xcopy /i /y "%hatredrootdir%\Hatred\Saved\SaveGames\*.sav" "Hatred\Savegames"
	echo.
) else (
	echo Hatred: Savegames not found. Skipping...
	echo.
)

rem Backup configuration files
if exist "%hatredrootdir%\Hatred\Saved\Config\WindowsNoEditor\*.ini" (
	echo Hatred: Backing up configuration files
	xcopy /i /y "%hatredrootdir%\Hatred\Saved\Config\WindowsNoEditor\*.ini" "Hatred\Configuration"
	echo.
) else (
	echo Hatred: Configuration files not found. Skipping...
	echo.
)

echo Hatred: Done.
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

rem Heretic: Shadow of the Serpent Riders
rem GOG edition, DOSBox emulation

set "hsotsrrootdir=%gamerootdir%\Heretic"

rem Backup savegames
if exist "%hsotsrrootdir%\cloud_saves\*.HSG" (
	echo Heretic: Shadow of the Serpent Riders - Backing up savegames
	xcopy /i /y "%hsotsrrootdir%\cloud_saves\*.HSG" "Heretic - Shadow of the Serpent Riders\Savegames"
	echo.
) else (
	echo Heretic: Shadow of the Serpent Riders - Savegames not found. Skipping...
	echo.
)

rem Backup configuration files
if exist "%hsotsrrootdir%\cloud_saves\*.CFG" (
	echo Heretic: Shadow of the Serpent Riders - Backing up configuration files
	xcopy /i /y "%hsotsrrootdir%\cloud_saves\*.CFG" "Heretic - Shadow of the Serpent Riders\Configuration"
	echo.
) else (
	echo Heretic: Shadow of the Serpent Riders - Configuration files not found. Skipping...
	echo.
)

rem Backup temporary deathmatch file
if exist "%hsotsrrootdir%\cloud_saves\*.TMP" (
	echo Heretic: Shadow of the Serpent Riders - Backing up temporary deathmatch file
	xcopy /i /y "%hsotsrrootdir%\cloud_saves\*.TMP" "Heretic - Shadow of the Serpent Riders"
	echo.
) else (
	echo Heretic: Shadow of the Serpent Riders - Temporary deathmatch file not found. Skipping...
	echo.
)

rem Backup DOSBox configuration file
if exist "%hsotsrrootdir%\dosbox_heretic.conf" (
	echo Heretic: Shadow of the Serpent Riders - Backing up DOSBox configuration file
	xcopy /i /y "%hsotsrrootdir%\dosbox_heretic.conf" "Heretic - Shadow of the Serpent Riders"
	echo.
) else (
	echo Heretic: Shadow of the Serpent Riders - DOSBox configuration file not found. Skipping...
	echo.
)

echo Heretic: Shadow of the Serpent Riders - Done.
echo.


rem Heroes of Might and Magic
rem GOG edition, DOSBox emulation

set "homamrootdir=%gamerootdir%\HoMM"

rem Backup savegames
if exist "%homamrootdir%\cloud_saves\GAMES\*" (
	echo Heroes of Might and Magic: Backing up savegames
	xcopy /i /y "%homamrootdir%\cloud_saves\GAMES\*" "Heroes of Might and Magic\Savegames"
	echo.
) else (
	echo Heroes of Might and Magic: Savegames not found. Skipping...
	echo.
)

rem Backup configuration
if exist "%homamrootdir%\cloud_saves\*.CFG" (
	echo Heroes of Might and Magic: Backing up configuration
	xcopy /i /y "%homamrootdir%\cloud_saves\*.CFG" "Heroes of Might and Magic\Configuration"
	echo.
) else (
	echo Heroes of Might and Magic: Configuration not found. Skipping...
	echo.
)

rem Backup DOSBox configuration
if exist "%homamrootdir%\dosboxHOMM1.conf" (
	echo Heroes of Might and Magic: Backing up DOSBox configuration
	xcopy /i /y "%homamrootdir%\dosboxHOMM1.conf" "Heroes of Might and Magic"
	echo.
) else (
	echo Heroes of Might and Magic: DOSBox configuration not found. Skipping...
	echo.
)

echo Heroes of Might and Magic: Done.
echo.

rem Heroine’s Quest: The Herald of Ragnarok

set "hqthordir=%userprofile%\Saved Games\Heroine's Quest 1.2"

rem Backup records file and savegames
if exist "%hqthordir%\*.hqthor" (
	if exist "%hqthordir%\*.dat" (
		echo Heroine's Quest: The Herald of Ragnarok - Backing up save folder
		xcopy /e /i /y "%hqthordir%" "Heroine's Quest - The Herald of Ragnarok"
		echo.
	)
) else (
	echo Heroine's Quest: The Herald of Ragnarok - Records and save files not found. Skipping...
	echo.
)

echo Heroine's Quest: The Herald of Ragnarok - Done.
echo.

rem Hexen: Beyond Heretic
rem GOG edition, DOSBox emulation

set "hexenrootdir=%gamerootdir%\HeXen"

rem Backup savegames
if exist "%hexenrootdir%\cloud_saves\HEXNDATA\*.HXS" (
	echo Hexen: Beyond Heretic - Backing up savegames
	xcopy /i /y "%hexenrootdir%\cloud_saves\HEXNDATA\*.HXS" "Hexen - Beyond Heretic\Savegames"
	echo.
) else (
	echo Hexen: Beyond Heretic - Savegames not found. Skipping...
	echo.
)

rem Backup configuration files
if exist "%hexenrootdir%\cloud_saves\*.CFG" (
	echo Hexen: Beyond Heretic - Backing up configuration files
	xcopy /i /y "%hexenrootdir%\cloud_saves\*.CFG" "Hexen - Beyond Heretic\Configuration"
	echo.
) else (
	echo Hexen: Beyond Heretic - Configuration files not found. Skipping...
	echo.
)

rem Backup temporary deathmatch file
if exist "%hexenrootdir%\cloud_saves\*.TMP" (
	echo Hexen: Beyond Heretic - Backing up temporary deathmatch file
	xcopy /i /y "%hexenrootdir%\cloud_saves\*.TMP" "Hexen - Beyond Heretic"
	echo.
) else (
	echo Hexen: Beyond Heretic - Temporary deathmatch file not found. Skipping...
	echo.
)

rem Backup DOSBox configuration
if exist "%hexenrootdir%\dosbox_hexen.conf" (
	echo Hexen: Beyond Heretic - Backing up DOSBox configuration
	xcopy /i /y "%hexenrootdir%\dosbox_hexen.conf" "Hexen - Beyond Heretic"
	echo.
) else (
	echo Hexen: Beyond Heretic - DOSBox configuration file not found. Skipping...
	echo.
)

echo Hexen: Beyond Heretic - Done.
echo.


rem Hexen: Deathkings of the Dark Citadel
rem GOG edition, DOSBox emulation

set "hdotdcrootdir=%gamerootdir%\HeXenDK"

rem Backup savegames
if exist "%hdotdcrootdir%\cloud_saves\HEXNDATA\*.HXS" (
	echo Hexen: Deathkings of the Dark Citadel - Backing up savegames
	xcopy /i /y "%hdotdcrootdir%\cloud_saves\HEXNDATA\*.HXS" "Hexen - Deathkings of the Dark Citadel\Savegames"
	echo.
) else (
	echo Hexen: Deathkings of the Dark Citadel - Savegames not found. Skipping...
	echo.
)

rem Backup configuration files
if exist "%hdotdcrootdir%\cloud_saves\*.CFG" (
	echo Hexen: Deathkings of the Dark Citadel - Backing up configuration files
	xcopy /i /y "%hdotdcrootdir%\cloud_saves\*.CFG" "Hexen - Deathkings of the Dark Citadel\Configuration"
	echo.
) else (
	echo Hexen: Deathkings of the Dark Citadel - Configuration files not found. Skipping...
	echo.
)

rem Backup temporary deathmatch file
if exist "%hdotdcrootdir%\cloud_saves\*.TMP" (
	echo Hexen: Deathkings of the Dark Citadel - Backing up temporary deathmatch file
	xcopy /i /y "%hdotdcrootdir%\cloud_saves\*.TMP" "Hexen - Deathkings of the Dark Citadel"
	echo.
) else (
	echo Hexen: Deathkings of the Dark Citadel - Temporary deathmatch file not found. Skipping...
	echo.
)

rem Backup DOSBox configuration
if exist "%hdotdcrootdir%\dosbox_hexenDK.conf" (
	echo Hexen: Deathkings of the Dark Citadel - Backing up DOSBox configuration
	xcopy /i /y "%hdotdcrootdir%\dosbox_hexenDK.conf" "Hexen - Deathkings of the Dark Citadel"
	echo.
) else (
	echo Hexen: Deathkings of the Dark Citadel - DOSBox configuration file not found. Skipping...
	echo.
)

echo Hexen: Deathkings of the Dark Citadel - Done.
echo.

rem Hexen II

set "nglideconfigregpath=HKCU\SOFTWARE\Zeus Software\nGlide2"
set "hexen2regpath=HKLM\SOFTWARE\WOW6432Node\Activision\Hexen II"
set "hexen2rootdir=%gamerootdir%\HeXen II"

rem Backup savegames
if exist "%hexen2rootdir%\data1" (
	echo Hexen II: Backing up savegames
	xcopy /e /exclude:exclude\h2-exclude.txt /i /y "%hexen2rootdir%\data1" "Hexen II\Savegames"
	echo.
) else (
	echo Hexen II: Savegames not found. Skipping...
	echo.
)

rem Backup configuration files
if exist "%hexen2rootdir%\data1\*.cfg" (
	echo Hexen II: Backing up configuration files
	xcopy /i /y "%hexen2rootdir%\data1\*.cfg" "Hexen II\Configuration"
	echo.
) else (
	echo Hexen II: Configuration files not found. Skipping...
	echo.
)

rem Backup registry key
echo Hexen II: Backing up registry key
reg export "%hexen2regpath%" "Hexen II\hexen2.reg" /y
echo.

rem Backup nGlide registry key
echo Hexen II: Backing up nGlide registry key
reg export "%nglideconfigregpath%" "Hexen II\h2-nglide.reg" /y
echo.

echo Hexen II: Done.
echo.

rem Hidden and Dangerous

set "hadregkeypath1=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Take2\Hidden and Dangerous"
set "hadregkeypath2=HKLM\SOFTWARE\WOW6432Node\Take2\Hidden and Dangerous"
set "hadrootdir=%gamerootdir%\Hidden and Dangerous\HD"

rem Backup savegames
if exist "%hadrootdir%\savegame\single\*.bin" (
	echo Hidden and Dangerous: Backing up savegames
	xcopy /i /y "%hadrootdir%\savegame\single\*.bin" "Hidden and Dangerous\savegame\single"
	echo.
) else (
	echo Hidden and Dangerous: Savegames not found. Skipping...
	echo.
)

rem Backup .ini file
if exist "%hadrootdir%\*.ini" (
	echo Hidden and Dangerous: Backing up .ini file
	rem For some reason the .ini file is marked ‘hidden’, so the /h argument is
	rem needed here
	xcopy /h /i /y "%hadrootdir%\*.ini" "Hidden and Dangerous"
	echo.
) else (
	echo Hidden and Dangerous: .ini file not found. Skipping...
	echo.
)

rem Backup registry keys
echo Hidden and Dangerous: Backing up registry keys
reg export "%hadregkeypath1%" "Hidden and Dangerous\had-1.reg" /y
reg export "%hadregkeypath2%" "Hidden and Dangerous\had-2.reg" /y
echo.

echo Hidden and Dangerous: Done.
echo.

rem Hidden and Dangerous Deluxe

set "haddregkeypath1=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Lonely Cat Games\Hidden and Dangerous Deluxe"
set "haddregkeypath2=HKCU\SOFTWARE\Insanity3D system"
set "haddregkeypath3=HKLM\SOFTWARE\WOW6432Node\Lonely Cat Games\Hidden and Dangerous Deluxe"
set "haddrootdir=%gamerootdir%\Hidden and Dangerous\HD Deluxe"

rem Backup savegames
if exist "%haddrootdir%\Savegame\*.bin" (
	echo Hidden and Dangerous Deluxe: Backing up savegames
	xcopy /i /y "%haddrootdir%\Savegame\*.bin" "Hidden and Dangerous Deluxe\Savegame"
	echo.
) else (
	echo Hidden and Dangerous Deluxe: Savegames not found. Skipping...
	echo.
)

rem Backup registry keys
echo Hidden and Dangerous Deluxe: Backing up registry keys
reg export "%haddregkeypath1%" "Hidden and Dangerous Deluxe\hadd-1.reg" /y
rem Concerning the next registry key, normally, you should simply backup the
rem ‘HD Deluxe’ key of this path, which is not easy to do, so as a
rem workaround the whole ‘Insanity3D system’ key is exported. If your username
rem is ‘User’ and your offline game directory ‘C:\Users\User\offlinegames’,
rem then you’ll see a registry key structure like this:
rem - Insanity3D system
rem   - Applications
rem     - C:
rem       - Users
rem         - User
rem           - offlinegames
rem             - Hidden and Dangerous
rem               - HD Deluxe
reg export "%haddregkeypath2%" "Hidden and Dangerous Deluxe\hadd-2.reg" /y
echo.

echo Hidden and Dangerous Deluxe: Done.
echo.

rem Hidden and Dangerous - Fight for Freedom

set "hadfffrootdir=%gamerootdir%\Hidden and Dangerous\HD FF"

rem Backup savegames
if exist "%hadfffrootdir%\savegame\single\*.bin" (
	echo Hidden and Dangerous - Fight for Freedom: Backing up savegames
	xcopy /i /y "%hadfffrootdir%\savegame\single\*.bin" "Hidden and Dangerous - Fight for Freedom\savegame\single"
	echo.
) else (
	echo Hidden and Dangerous - Fight for Freedom: Savegames not found. Skipping...
	echo.
)

rem Backup .ini file
if exist "%hadfffrootdir%\*.ini" (
	echo Hidden and Dangerous - Fight for Freedom: Backing up .ini file
	rem /h parameter needed, because of hidden file attribute
	xcopy /h /i /y "%hadfffrootdir%\*.ini" "Hidden and Dangerous - Fight for Freedom"
	echo.
) else (
	echo Hidden and Dangerous - Fight for Freedom: .ini file not found. Skipping...
	echo.
)

rem Backup controls file
if exist "%hadfffrootdir%\*.cfg" (
	echo Hidden and Dangerous - Fight for Freedom: Backing up controls file
	xcopy /i /y "%hadfffrootdir%\*.cfg" "Hidden and Dangerous - Fight for Freedom"
	echo.
) else (
	echo Hidden and Dangerous - Fight for Freedom: Controls file not found. Skipping...
	echo.
)

echo Hidden and Dangerous - Fight for Freedom: Done.
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
		xcopy /e /exclude:exclude\hmu-exclude.txt /i /y "%hmudir%" "Hotline Miami Updated"
		echo.
	)
) else (
	echo Hotline Miami Updated: Configuration and save data not found. Skipping...
	echo.
)

echo Hotline Miami Updated: Done.
echo.

rem I Have No Mouth, and I Must Scream
rem GOG edition, ScummVM emulation

set "ihnmaimsrootdir=%gamerootdir%\I Have No Mouth"

rem Backup savegames
if exist "%ihnmaimsrootdir%\saves\*.s*" (
	echo I Have No Mouth, and I Must Scream: Backing up savegames
	xcopy /i /y "%ihnmaimsrootdir%\saves\*.s*" "I Have No Mouth, and I Must Scream\Savegames"
	echo.
) else (
	echo I Have No Mouth, and I Must Scream: Savegames not found. Skipping...
	echo.
)

rem Backup configuration
if exist "%ihnmaimsrootdir%\ihnm.ini" (
	echo I Have No Mouth, and I Must Scream: Backing up configuration
	xcopy /i /y "%ihnmaimsrootdir%\ihnm.ini" "I Have No Mouth, and I Must Scream"
	echo.
) else (
	echo I Have No Mouth, and I Must Scream: Configuration not found. Skipping...
	echo.
)

echo I Have No Mouth, and I Must Scream: Done.
echo.

rem Icewind Dale Complete

set "idcregpath1=HKLM\SOFTWARE\WOW6432Node\Black Isle\Icewind Dale"
set "idcregpath2=HKLM\SOFTWARE\WOW6432Node\Black Isle\Icewind Dale - Heart of Winter"
set "idcregpath3=HKLM\SOFTWARE\WOW6432Node\Black Isle\Icewind Dale - Heart of Winter: Trials of the Luremaster"
set "idcrootdir=%gamerootdir%\Icewind Dale Complete"

rem Backup savegame folders
if exist "%idcrootdir%\mpsave" (
	echo Icewind Dale Complete: Backing up savegame folders
	xcopy /e /i /y "%idcrootdir%\mpsave" "Icewind Dale Complete\Savegames"
	echo.
) else (
	echo Icewind Dale Complete: Savegame folders not found. Skipping...
	echo.
)

rem Backup characters
if exist "%idcrootdir%\Characters\*.CHR" (
	echo Icewind Dale Complete: Backing up characters
	xcopy /e /i /y "%idcrootdir%\Characters" "Icewind Dale Complete\Characters"
	echo.
) else (
	echo Icewind Dale Complete: Character files not found. Skipping...
	echo.
)

rem Backup configuration
if exist "%idcrootdir%\icewind*" (
	echo Icewind Dale Complete: Backing up configuration
	xcopy /i /y "%idcrootdir%\icewind*" "Icewind Dale Complete\Configuration"
	echo.
) else (
	echo Icewind Dale Complete: Configuration not found. Skipping...
	echo.
)

rem Backup keybinds
if exist "%idcrootdir%\Keymap*" (
	echo Icewind Dale Complete: Backing up keybinds
	xcopy /i /y "%idcrootdir%\Keymap*" "Icewind Dale Complete\Keybinds"
	echo.
) else (
	echo Icewind Dale Complete: Keybinds not found. Skipping...
	echo.
)

rem Backup cache
if exist "%idcrootdir%\Cache\Data\*.bif" (
	echo Icewind Dale Complete: Backing up cache
	xcopy /i /y "%idcrootdir%\Cache\Data\*.bif" "Icewind Dale Complete\Cache"
	echo.
) else (
	echo Icewind Dale Complete: Cache not found. Skipping...
	echo.
)

rem Backup registry keys
echo Icewind Dale Complete: Backing up registry keys
reg export "%idcregpath1%" "Icewind Dale Complete\idc-1.reg" /y
reg export "%idcregpath2%" "Icewind Dale Complete\idc-2.reg" /y
reg export "%idcregpath3%" "Icewind Dale Complete\idc-3.reg" /y
echo.

echo Icewind Dale Complete: Done.
echo.

rem Indiana Jones and the Fate of Atlantis
rem GOG edition, ScummVM emulation

set "ijatfoarootdir=%gamerootdir%\Indiana Jones and the Fate of Atlantis"

rem Backup savegames
if exist "%ijatfoarootdir%\saves\*.s*" (
	echo Indiana Jones and the Fate of Atlantis: Backing up savegames
	xcopy /i /y "%ijatfoarootdir%\saves\*.s*" "Indiana Jones and the Fate of Atlantis\Savegames"
	echo.
) else (
	echo Indiana Jones and the Fate of Atlantis: Savegames not found. Skipping...
	echo.
)

rem Backup configuration
if exist "%ijatfoarootdir%\atlantis.ini" (
	echo Indiana Jones and the Fate of Atlantis: Backing up configuration
	xcopy /i /y "%ijatfoarootdir%\atlantis.ini" "Indiana Jones and the Fate of Atlantis"
	echo.
) else (
	echo Indiana Jones and the Fate of Atlantis: Configuration not found. Skipping...
	echo.
)

echo Indiana Jones and the Fate of Atlantis: Done.
echo.

rem Indiana Jones and the Infernal Machine

set "ijatimregpath=HKCU\SOFTWARE\LucasArts Entertainment Company LLC\Indiana Jones and the Infernal Machine"
set "ijatimrootdir=%gamerootdir%\Infernal Machine"

rem Backup savegames
if exist "%ijatimrootdir%\SaveGames\*.nds" (
	echo Indiana Jones and the Infernal Machine: Backing up savegames
	xcopy /i /y "%ijatimrootdir%\SaveGames\*.nds" "Indiana Jones and the Infernal Machine\Savegames"
	echo.
) else (
	echo Indiana Jones and the Infernal Machine: Savegames not found. Skipping...
	echo.
)

rem Backup registry key
echo Indiana Jones and the Infernal Machine: Backing up registry key
reg export "%ijatimregpath%" "Indiana Jones and the Infernal Machine\ijatim.reg" /y
echo.

echo Indiana Jones and the Infernal Machine: Done.
echo.

rem Indiana Jones and the Last Crusade
rem GOG edition, ScummVM emulation

set "ijatlcrootdir=%gamerootdir%\Indiana Jones and The Last Crusade"

rem Backup savegames
if exist "%ijatlcrootdir%\saves\*.s*" (
	echo Indiana Jones and the Last Crusade: Backing up savegames
	xcopy /i /y "%ijatlcrootdir%\saves\*.s*" "Indiana Jones and the Last Crusade\Savegames"
	echo.
) else (
	echo Indiana Jones and the Last Crusade: Savegames not found. Skipping...
	echo.
)

rem Backup configuration
if exist "%ijatlcrootdir%\last-crusade.ini" (
	echo Indiana Jones and the Last Crusade: Backing up configuration
	xcopy /i /y "%ijatlcrootdir%\last-crusade.ini" "Indiana Jones and the Last Crusade"
	echo.
) else (
	echo Indiana Jones and the Last Crusade: Configuration not found. Skipping...
	echo.
)

echo Indiana Jones and the Last Crusade: Done.
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

rem Jazz Jackrabbit Collection
rem GOG edition, emulated in DOSBox

set "jjcrootdir=%gamerootdir%\Jazz Jackrabbit"

rem Backup savegames
if exist "%jjcrootdir%\cloud_saves\SAVE*" (
	echo Jazz Jackrabbit: Backing up savegames
	xcopy /i /y "%jjcrootdir%\cloud_saves\SAVE*" "Jazz Jackrabbit"
	echo.
) else (
	echo Jazz Jackrabbit: Savegames not found. Skipping...
	echo.
)

rem Backup savegames for Holiday Hare 1995
if exist "%jjcrootdir%\cloud_saves\HH95\SAVE*" (
	echo Jazz Jackrabbit - Holiday Hare 1995: Backing up savegames
	xcopy /i /y "%jjcrootdir%\cloud_saves\HH95\SAVE*" "Jazz Jackrabbit\HH95"
	echo.
) else (
	echo Jazz Jackrabbit - Holiday Hare 1995: Savegames not found. Skipping...
	echo.
)

echo Jazz Jackrabbit Collection: Done.
echo.

rem Jazz Jackrabbit 2

set "jj2regpath1=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Epic MegaGames\Jazz Creation Station"
set "jj2regpath2=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Epic MegaGames\Jazz Jackrabbit 2 Secret Files"
set "jj2regpath3=HKCU\SOFTWARE\Epic MegaGames\Jazz Creation Station"
set "jj2regpath4=HKCU\SOFTWARE\Epic MegaGames\Jazz Jackrabbit 2 Secret Files"
set "jj2regpath5=HKLM\SOFTWARE\WOW6432Node\Epic MegaGames\Jazz Creation Station"
set "jj2regpath6=HKLM\SOFTWARE\WOW6432Node\Epic MegaGames\Jazz Jackrabbit 2 Secret Files"
set "jj2regpath7=HKLM\SOFTWARE\WOW6432Node\Epic MegaGames\Jazz Jackrabbit 2 Special Edition"
set "jj2rootdir=%gamerootdir%\Jazz Jackrabbit 2"

rem Backup savegames
if exist "%jj2rootdir%\SAVEGAME*" (
	echo Jazz Jackrabbit 2: Backing up savegames
	xcopy /i /y "%jj2rootdir%\SAVEGAME*" "Jazz Jackrabbit 2"
	echo.
) else (
	echo Jazz Jackrabbit 2: Savegames not found. Skipping...
	echo.
)

rem Backup configuration
if exist "%jj2rootdir%\*.CFG" (
	echo Jazz Jackrabbit 2: Backing up configuration
	xcopy /i /y "%jj2rootdir%\*.CFG" "Jazz Jackrabbit 2"
	echo.
) else (
	echo Jazz Jackrabbit 2: Configuration not found. Skipping...
	echo.
)

rem Backup ‘Jazz Creation Station’ configuration
if exist "%jj2rootdir%\JCS.ini" (
	echo Jazz Jackrabbit 2: Backing up Jazz Creation Station configuration
	xcopy /i /y "%jj2rootdir%\JCS.ini" "Jazz Jackrabbit 2"
	echo.
) else (
	echo Jazz Jackrabbit 2: Jazz Creation Station configuration not found. Skipping...
	echo.
)

rem Backup map files
rem
rem The following section is tricky. Backing up .j2l files causes a file
rem transfer of all .j2l files, including default maps. This part should only
rem only concern itself with custom map files. The only solution for that
rem problem I know of would be to use an exclude list containing default level
rem names. Since there are a lot of default maps however, I am not sure
rem if it’s even worth the effort. For that reason, I commented it out.
rem
rem if exist "%jj2rootdir%\*.j2l" (
rem 	echo Jazz Jackrabbit 2: Backing up map files
rem 	xcopy /exclude:jj2-j2l-exclude.txt /i /y "%jj2rootdir%\*.j2l" "Jazz Jackrabbit 2"
rem 	echo.
rem ) else (
rem 	echo Jazz Jackrabbit 2: Backing up map files
rem 	echo.
rem )

rem Backup registry keys
echo Jazz Jackrabbit 2: Backing up registry keys
reg export "%jj2regpath1%" "Jazz Jackrabbit 2\jj2-1.reg" /y
reg export "%jj2regpath2%" "Jazz Jackrabbit 2\jj2-2.reg" /y
reg export "%jj2regpath3%" "Jazz Jackrabbit 2\jj2-3.reg" /y
reg export "%jj2regpath4%" "Jazz Jackrabbit 2\jj2-4.reg" /y
reg export "%jj2regpath5%" "Jazz Jackrabbit 2\jj2-5.reg" /y
reg export "%jj2regpath6%" "Jazz Jackrabbit 2\jj2-6.reg" /y
reg export "%jj2regpath7%" "Jazz Jackrabbit 2\jj2-7.reg" /y
echo.

echo Jazz Jackrabbit 2: Done.
echo.

rem Jazz Jackrabbit 2 - The Christmas Chronicles

set "jj2tccregpath1=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Epic MegaGames\Jazz Jackrabbit 2 Christmas Chronicles '99"
set "jj2tccregpath2=HKCU\SOFTWARE\Epic MegaGames\Christmas Chronicles '99"
set "jj2tccregpath3=HKCU\SOFTWARE\Epic MegaGames\Jazz Jackrabbit 2 Christmas Chronicles '99"
set "jj2tccregpath4=HKLM\SOFTWARE\WOW6432Node\Epic MegaGames\Christmas Chronicles '99"
set "jj2tccrootdir=%gamerootdir%\Jazz Jackrabbit 2 CC"

rem Backup savegames
if exist "%jj2tccrootdir%\SAVEGAME*" (
	echo Jazz Jackrabbit 2 - The Christmas Chronicles: Backing up savegames
	xcopy /i /y "%jj2tccrootdir%\SAVEGAME*" "Jazz Jackrabbit 2 - The Christmas Chronicles"
	echo.
) else (
	echo Jazz Jackrabbit 2 - The Christmas Chronicles: Savegames not found. Skipping...
	echo.
)

rem Backup configuration
if exist "%jj2tccrootdir%\*.CFG" (
	echo Jazz Jackrabbit 2 - The Christmas Chronicles: Backing up configuration
	xcopy /i /y "%jj2tccrootdir%\*.CFG" "Jazz Jackrabbit 2 - The Christmas Chronicles"
	echo.
) else (
	echo Jazz Jackrabbit 2 - The Christmas Chronicles: Configuration not found. Skipping...
	echo.
)

rem Backup ‘Jazz Creation Station’ configuration
if exist "%jj2tccrootdir%\Jcs.ini" (
	echo Jazz Jackrabbit 2 - The Christmas Chronicles: Backing up Jazz Creation Station configuration
	xcopy /i /y "%jj2tccrootdir%\Jcs.ini" "Jazz Jackrabbit 2 - The Christmas Chronicles"
	echo.
) else (
	echo Jazz Jackrabbit 2 - The Christmas Chronicles: Jazz Creation Station configuration not found. Skipping...
	echo.
)

rem Backup registry keys
echo Jazz Jackrabbit 2 - The Christmas Chronicles: Backing up registry keys
reg export "%jj2tccregpath1%" "Jazz Jackrabbit 2 - The Christmas Chronicles\jj2tcc-1.reg" /y
reg export "%jj2tccregpath2%" "Jazz Jackrabbit 2 - The Christmas Chronicles\jj2tcc-2.reg" /y
reg export "%jj2tccregpath3%" "Jazz Jackrabbit 2 - The Christmas Chronicles\jj2tcc-3.reg" /y
reg export "%jj2tccregpath4%" "Jazz Jackrabbit 2 - The Christmas Chronicles\jj2tcc-4.reg" /y
echo.

echo Jazz Jackrabbit 2 - The Christmas Chronicles: Done.
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

rem Lands Of Lore - The Throne of Chaos
rem GOG edition, DOSBox emulation

set "lolttocrootdir=%gamerootdir%\Lands Of Lore"

rem Backup savegames
if exist "%lolttocrootdir%\cloud_saves\*.DAT" (
	echo Lands Of Lore - The Throne of Chaos: Backing up savegames
	xcopy /i /y "%lolttocrootdir%\cloud_saves\*.DAT" "Lands Of Lore - The Throne of Chaos\Savegames"
	echo.
) else (
	echo Lands Of Lore - The Throne of Chaos: Savegames not found. Skipping...
	echo.
)

rem Backup configuration
if exist "%lolttocrootdir%\cloud_saves\*.CFG" (
	echo Lands Of Lore - The Throne of Chaos: Backing up configuration
	xcopy /i /y "%lolttocrootdir%\cloud_saves\*.CFG" "Lands Of Lore - The Throne of Chaos\Configuration"
	echo.
) else (
	echo Lands Of Lore - The Throne of Chaos: Configuration not found. Skipping...
	echo.
)

rem Backup temporary level file
if exist "%lolttocrootdir%\cloud_saves\*.TMP" (
	echo Lands Of Lore - The Throne of Chaos: Backing up temporary level file
	xcopy /i /y "%lolttocrootdir%\cloud_saves\*.TMP" "Lands Of Lore - The Throne of Chaos"
	echo.
) else (
	echo Lands Of Lore - The Throne of Chaos: Temporary level file not found. Skipping...
	echo.
)

rem Backup DOSBox configuration
if exist "%lolttocrootdir%\dosboxLOL1.conf" (
	echo Lands Of Lore - The Throne of Chaos: Backing up DOSBox configuration
	xcopy /i /y "%lolttocrootdir%\dosboxLOL1.conf" "Lands Of Lore - The Throne of Chaos"
	echo.
) else (
	echo Lands Of Lore - The Throne of Chaos: DOSBox configuration not found. Skipping...
	echo.
)

echo Lands Of Lore - The Throne of Chaos: Done.
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

rem Medal of Honor - Pacific Assault

set "mohpadir=%userprofile%\Documents\EA Games\Medal of Honor Pacific Assault(tm)"
set "mohparegkeypath=HKCU\SOFTWARE\EA Games\Medal of Honor Pacific Assault"

rem Backup folder
if exist "%mohpadir%" (
	echo Medal of Honor - Pacific Assault: Backing up folder
	xcopy /e /i /y "%mohpadir%" "Medal of Honor - Pacific Assault"
	echo.
) else (
	echo Medal of Honor - Pacific Assault: Folder not found. Skipping...
	echo.
)

rem Backup registry key
echo Medal of Honor - Pacific Assault: Backing up registry key
reg export "%mohparegkeypath%" "Medal of Honor - Pacific Assault\mohpa.reg" /y
echo.

echo Medal of Honor - Pacific Assault: Done.
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
if exist "%mbsavedir%\Native\*.sav" (
	echo Mount and Blade: Backing up savegames
	xcopy /i /y "%mbsavedir%\Native\*.sav" "Mount & Blade\Savegames"
	echo.
) else (
	echo Mount and Blade: Savegames not found. Skipping...
	echo.
)

rem Backup configuration and options file
if exist "%mbaddir%\*.dat" (
	if exist "%mbaddir%\*.txt" (
		echo Mount and Blade: Backing up configuration and options file
		xcopy /i /y "%mbaddir%" "Mount & Blade\Configuration"
		echo.
	)
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
if exist "%mbwsavedir%\Native\*.sav" (
	echo Mount and Blade: Warband - Backing up savegame files
	xcopy /e /i /y "%mbwsavedir%\Native" "Mount & Blade Warband\Savegames"
	echo.
) else (
	echo Mount and Blade: Warband - Savegames not found. Skipping...
	echo.
)

rem Backup configuration file
if exist "%mbwdir%\*.txt" (
	echo Mount and Blade: Warband - Backing up configuration file
	xcopy /i /y "%mbwdir%\*.txt" "Mount & Blade Warband\Config"
	echo.
) else (
	echo Mount and Blade: Warband - Configuration file not found. Skipping...
	echo.
)

echo Mount and Blade: Warband - Done.
echo.

rem Mount & Blade Warband - Viking Conquest

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
if exist "%outlastdir%\OLGame\SaveData\*.olprofile" (
	if exist "%outlastdir%\OLGame\SaveData\*.sav" (
		echo Outlast: Backing up profile and savegame files
		xcopy /i /y "%outlastdir%\OLGame\SaveData\*" "Outlast\SaveData"
		echo.
	)
) else (
	echo Outlast: Profile and savegame files not found. Skipping...
	echo.
)

rem Backup configuration folder
if exist "%outlastdir%\OLGame\Config\*.ini" (
	echo Outlast: Backing up configuration folder
	xcopy /e /i /y "%outlastdir%\OLGame\Config" "Outlast\Config"
	echo.
) else (
	echo Outlast: Configuration folder not found. Skipping...
	echo.
)

echo Outlast: Done.
echo.

rem Painkiller

set "pkregpath1=HKCU\SOFTWARE\PeopleCanFly\PainEditor"
set "pkregpath2=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\PeopleCanFly\Painkiller"
set "pkregpath3=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\Aureal"
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

rem Back up configuration file
if exist "%pkrootdir%\Bin\*.ini" (
	echo Painkiller: Backing up configuration file
	copy "%pkrootdir%\Bin\*.ini" "Painkiller"
	echo.
) else (
	echo Painkiller: Configuration file not found. Skipping...
	echo.
)

rem Back up registry keys
echo Painkiller: Backing up registry keys
reg export "%pkregpath1%" "Painkiller\painkiller-1.reg" /y
reg export "%pkregpath2%" "Painkiller\painkiller-2.reg" /y
reg export "%pkregpath3%" "Painkiller\painkiller-3.reg" /y

echo Painkiller: Done.
echo.

rem Penumbra: Black Plague

set "pbpdir=%userprofile%\Documents\Penumbra\Black Plague"

rem Backup keybinds, savegames and settings
if exist "%pbpdir%" (
	echo Penumbra: Black Plague - Backing up keybinds, savegames and settings
	xcopy /e /exclude:exclude\pbp-exclude.txt /i /y "%pbpdir%" "Penumbra - Black Plague"
	echo.
) else (
	echo Penumbra: Black Plague - Folder not found. Skipping...
	echo.
)

echo Penumbra: Black Plague - Done.
echo.

rem Penumbra: Overture

set "poverturedir=%userprofile%\Documents\Penumbra Overture"

rem Backup keybinds, savegames and settings
if exist "%poverturedir%" (
	echo Penumbra: Overture - Backing up keybinds, settings and savegames
	xcopy /e /exclude:exclude\pot-exclude.txt /i /y "%poverturedir%" "Penumbra - Overture"
	echo.
) else (
	echo Penumbra: Overture - Folder not found. Skipping...
)

echo Penumbra: Overture - Done.
echo.

rem Penumbra: Requiem

set "prequiemdir=%userprofile%\Documents\Penumbra\Requiem"

rem Backup keybinds, savegames and settings
if exist "%prequiemdir%" (
	echo Penumbra: Requiem - Backing up keybinds, savegames and settings
	xcopy /e /exclude:exclude\prq-exclude.txt /i /y "%prequiemdir%" "Penumbra - Requiem"
	echo.
) else (
	echo Penumbra: Requiem - Folder not found. Skipping...
)

echo Penumbra: Requiem - Done.
echo.

rem Planescape: Torment

set "pstrootdir=%gamerootdir%\Planescape Torment"

rem Backup save folder
if exist "%pstrootdir%\save" (
	echo Planescape: Torment - Backing up save folder
	xcopy /e /i /y "%pstrootdir%\save" "Planescape - Torment\save"
	echo.
) else (
	echo Planescape: Torment - Save folder not found. Skipping...
	echo.
)

rem Backup cache folder
if exist "%pstrootdir%\cache\*.bif" (
	echo Planescape: Torment - Backing up cache folder
	xcopy /e /i /y "%pstrootdir%\cache" "Planescape - Torment\cache"
	echo.
) else (
	echo Planescape: Torment - Cache file not found. Skipping...
	echo.
)

rem Backup configuration file
if exist "%pstrootdir%\Torment.ini" (
	echo Planescape: Torment - Backing up configuration file
	copy "%pstrootdir%\Torment.ini" "Planescape - Torment"
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

rem POSTAL Plus
rem Retail version

set "postalrootdir=%gamerootdir%\Postal2STP\PostalClassic&Uncut"

rem Back up savegames and highscores
if exist "%postalrootdir%\res\SaveGame\*.gme" (
	echo POSTAL Plus: Backing up savegames and highscores
	xcopy /e /i /y "%postalrootdir%\res\SaveGame" "POSTAL Plus\res\SaveGame"
	echo.
) else (
	echo POSTAL Plus: Savegames not found. Skipping...
	echo.
)

rem Backup configuration
if exist "%postalrootdir%\*.ini" (
	echo POSTAL Plus: Backing up configuration
	copy "%postalrootdir%\*.ini" "POSTAL Plus"
	echo.
) else (
	echo POSTAL Plus: Configuration file not found. Skipping...
	echo.
)

rem Backup level files
if exist "%postalrootdir%\levels\*.rgn" (
	if exist "%postalrootdir%\levels\*.rlm" (
		echo POSTAL Plus: Backing up level files
		xcopy /i /y "%postalrootdir%\levels\*.rgn" "POSTAL Plus\levels"
		xcopy /i /y "%postalrootdir%\levels\*.rlm" "POSTAL Plus\levels"
		echo.
	)
) else (
	echo POSTAL Plus: Level files not found. Skipping...
	echo.
)

echo POSTAL Plus: Done.
echo.

rem POSTAL
rem Steam version

rem Note: Cannot be launched without Steam client

set "postalsteamaddir=%appdata%\RunningWithScissors\Postal Plus"

rem Backup savegames
if exist "%postalsteamaddir%\steamcloud\*.gme" (
	echo POSTAL - Steam version: Backing up savegames
	xcopy /i /y "%postalsteamaddir%\steamcloud\*.gme" "POSTAL - Steam version\Savegames"
	echo.
) else (
	echo POSTAL - Steam version: Savegames not found. Skipping...
	echo.
)

rem Backup configuration file
if exist "%postalsteamaddir%\*.INI" (
	echo POSTAL - Steam version: Backing up configuration file
	xcopy /i /y "%postalsteamaddir%\*.INI" "POSTAL - Steam version"
	echo.
) else (
	echo POSTAL - Steam version: Configuration file not found. Skipping...
	echo.
)

rem Backup savegames and remote cache file from Steam’s userdata folder
rem
rem This section is broken. Need to find out how to programatically get the
rem userdata user ID. In this case the user ID is simply replaced with an
rem asterisk for ease of use. As far as I know, Steam app IDs in contrary to
rem user IDs are static, so it should be relatively safe to use app ID 232770.
rem
rem if exist "C:\Program Files (x86)\Steam\userdata\*\232770\remote\*.gme" (
rem 	echo POSTAL - Steam version: Backing up userdata savegames
rem 	xcopy /i /y "C:\Program Files (x86)\Steam\userdata\*\232770\remote\*.gme" "POSTAL - Steam version\userdata\remote"
rem 	echo.
rem ) else (
rem 	echo POSTAL - Steam version: Userdata savegames not found. Skipping...
rem 	echo.
rem )

rem if exist "C:\Program Files (x86)\Steam\userdata\*\232770\*.vdf" (
rem 	echo POSTAL - Steam version: Backing up userdata remote cache file
rem 	xcopy /i /y "C:\Program Files (x86)\Steam\userdata\*\232770\*.vdf" "POSTAL - Steam version\userdata"
rem 	echo.
rem ) else (
rem 	echo POSTAL - Steam version: Userdata remote cache file not found. Skipping...
rem 	echo.
rem )

echo POSTAL - Steam version: Done.
echo.

rem POSTAL 2
rem Retail version

set "postal2rootdir=%gamerootdir%\Postal2STP"

rem Backup savegames
if exist "%postal2rootdir%\Save\*.usa" (
	echo POSTAL 2: Backing up savegames
	xcopy /i /y "%postal2rootdir%\Save\*.usa" "POSTAL 2\Save"
	echo.
) else (
	echo POSTAL 2: Savegames not found. Skipping...
	echo.
)

rem Backup configuration, keybinds and savegame information
if exist "%postal2rootdir%\System\Postal2.ini" (
	if exist "%postal2rootdir%\System\SavedGameInfo.ini" (
		if exist "%postal2rootdir%\System\User.ini" (
			echo POSTAL 2: Backing up configuration, keybinds and savegame information

			md "POSTAL 2\System"

			copy "%postal2rootdir%\System\Postal2.ini" "POSTAL 2\System"
			copy "%postal2rootdir%\System\SavedGameInfo.ini" "POSTAL 2\System"
			copy "%postal2rootdir%\System\User.ini" "POSTAL 2\System"

			echo.
		)
	)
) else (
	echo POSTAL 2: Configuration, keybinds, savegame information not found. Skipping...
	echo.
)

rem Backup Unreal level editor map files
rem
rem Whenever you use the Unreal level editor, it leaves behind a log file, a
rem configuration file and when you decide to save a map you worked on, map
rem files. Backing up all map files with a wildcard doesn’t really make sense
rem because this copies over all map files, not just the ones left behind by
rem the Unreal level editor. As a result, I decided to comment out the
rem following section, because I doubt its usefulness.
rem
rem if exist "%postal2rootdir%\Maps\*.fuk" (
rem 	echo POSTAL 2: Backing up map files
rem 	xcopy /i /y "%postal2rootdir%\Maps\*.fuk" "POSTAL 2\Maps"
rem 	echo.
rem ) else (
rem 	echo POSTAL 2: Map files not found. Skipping...
rem 	echo.
rem )

rem Backup Unreal level editor configuration file
if exist "%postal2rootdir%\System\unrealed.ini" (
	echo POSTAL 2: Backing up Unreal level editor configuration file
	md "POSTAL 2\System"
	copy "%postal2rootdir%\System\unrealed.ini" "POSTAL 2\System"
	echo.
) else (
	echo POSTAL 2: Unreal level editor configuration file not found. Skipping...
	echo.
)

echo POSTAL 2: Done.
echo.

rem POSTAL 2 - Apocalypse Weekend
rem Retail version

set "postal2awrootdir=%gamerootdir%\Postal2STP\ApocalypseWeekend"

rem Backup savegames
if exist "%postal2awrootdir%\AWSave\*.usa" (
	echo POSTAL 2 - Apocalypse Weekend: Backing up savegames
	xcopy /i /y "%postal2awrootdir%\AWSave\*.usa" "POSTAL 2 - Apocalypse Weekend\AWSave"
	echo.
) else (
	echo POSTAL 2 - Apocalypse Weekend: Savegames not found. Skipping...
	echo.
)

rem Backup configuration, keybinds and savegame information
if exist "%postal2awrootdir%\System\ApocalypseWeekend.ini" (
	if exist "%postal2awrootdir%\System\Postal2.ini" (
		if exist "%postal2awrootdir%\System\SavedGameInfo.ini" (
			if exist "%postal2awrootdir%\System\User.ini" (
				echo POSTAL 2 - Apocalypse Weekend: Backing up configuration, keybinds and savegame information

				md "POSTAL 2 - Apocalypse Weekend\System"

				copy "%postal2awrootdir%\System\ApocalypseWeekend.ini" "POSTAL 2 - Apocalypse Weekend\System"
				copy "%postal2awrootdir%\System\Postal2.ini" "POSTAL 2 - Apocalypse Weekend\System"
				copy "%postal2awrootdir%\System\SavedGameInfo.ini" "POSTAL 2 - Apocalypse Weekend\System"
				copy "%postal2awrootdir%\System\User.ini" "POSTAL 2 - Apocalypse Weekend\System"

				echo.
			)
		)
	)
) else (
	echo POSTAL 2 - Apocalypse Weekend: Configuration, keybinds, savegame information not found. Skipping...
	echo.
)

rem Backup Unreal level editor configuration file
if exist "%postal2awrootdir%\System\unrealed.ini" (
	echo POSTAL 2 - Apocalypse Weekend: Backing up Unreal level editor configuration file

	md "POSTAL 2 - Apocalypse Weekend\System"
	copy "%postal2awrootdir%\System\unrealed.ini" "POSTAL 2 - Apocalypse Weekend\System"
	echo.
) else (
	echo POSTAL 2 - Apocalypse Weekend: Unreal level editor configuration file not found. Skipping...
	echo.
)

echo POSTAL 2 - Apocalypse Weekend: Done.
echo.

rem POSTAL 2
rem Steam version

set "postal2steamrootdir=%steamdefaultlibdir%\POSTAL2Complete"

rem Backup savegames
if exist "%postal2steamrootdir%\Save\*.usa" (
	echo POSTAL 2 - Steam version: Backing up savegames
	xcopy /i /y "%postal2steamrootdir%\Save\*.usa" "POSTAL 2 - Steam version\Save"
	echo.
) else (
	echo POSTAL 2 - Steam version: Savegames not found. Skipping...
	echo.
)

rem Backup configuration, keybinds, savegame information and entry fix file
if exist "%postal2steamrootdir%\System\EntryFix.ini" (
	if exist "%postal2steamrootdir%\System\Postal2.ini" (
		if exist "%postal2steamrootdir%\System\SavedGameInfo.ini" (
			if exist "%postal2steamrootdir%\System\User.ini" (
				echo POSTAL 2 - Steam version: Backing up configuration, keybinds, savegame information and entry fix file

				md "POSTAL 2 - Steam version\System"

				copy "%postal2steamrootdir%\System\EntryFix.ini" "POSTAL 2 - Steam version\System"
				copy "%postal2steamrootdir%\System\Postal2.ini" "POSTAL 2 - Steam version\System"
				copy "%postal2steamrootdir%\System\SavedGameInfo.ini" "POSTAL 2 - Steam version\System"
				copy "%postal2steamrootdir%\System\User.ini" "POSTAL 2 - Steam version\System"

				echo.
			)
		)
	)
) else (
	echo POSTAL 2 - Steam version: Configuration, keybinds, savegame information and entry fix file not found. Skipping...
	echo.
)

echo POSTAL 2 - Steam version: Done.
echo.

rem POSTAL 2 - Paradise Lost
rem Steam version

set "postal2plsteamrootdir=%steamdefaultlibdir%\POSTAL2Complete\Paradise Lost"

rem Backup savegames
if exist "%postal2plsteamrootdir%\PLSave\*.usa" (
	echo POSTAL 2 - Paradise Lost: Backing up savegames
	xcopy /i /y "%postal2plsteamrootdir%\PLSave\*.usa" "POSTAL 2 - Paradise Lost\PLSave"
	echo.
) else (
	echo POSTAL 2 - Paradise Lost: Savegames not found. Skipping...
	echo.
)

rem Backup configuration files
if exist "%postal2plsteamrootdir%\System\EntryFix.ini" (
	if exist "%postal2plsteamrootdir%\System\ParadiseLost.ini" (
		if exist "%postal2plsteamrootdir%\System\SavedGameInfo.ini" (
			if exist "%postal2plsteamrootdir%\System\User.ini" (
				echo POSTAL 2 - Paradise Lost: Backing up configuration files

				md "POSTAL 2 - Paradise Lost\System"

				copy "%postal2plsteamrootdir%\System\EntryFix.ini" "POSTAL 2 - Paradise Lost\System"
				copy "%postal2plsteamrootdir%\System\ParadiseLost.ini" "POSTAL 2 - Paradise Lost\System"
				copy "%postal2plsteamrootdir%\System\SavedGameInfo.ini" "POSTAL 2 - Paradise Lost\System"
				copy "%postal2plsteamrootdir%\System\User.ini" "POSTAL 2 - Paradise Lost\System"

				echo.
			)
		)
	)
) else (
	echo POSTAL 2 - Paradise Lost: Configuration files not found. Skipping...
	echo.
)

echo POSTAL 2 - Paradise Lost: Done.
echo.

rem POSTAL 2 - Share The Pain
rem Steam version

set "postal2stpsteamrootdir=%steamdefaultlibdir%\POSTAL2Complete\ShareThePain"

rem Backup configuration files
if exist "%postal2stpsteamrootdir%\System\Postal2MP.ini" (
	if exist "%postal2stpsteamrootdir%\System\User.ini" (
		echo POSTAL 2 - Share The Pain: Backing up configuration files
		copy "%postal2stpsteamrootdir%\System\Postal2MP.ini" "POSTAL 2 - Share The Pain\System"
		copy "%postal2stpsteamrootdir%\System\User.ini" "POSTAL 2 - Share The Pain\System"
		echo.
	)
) else (
	echo POSTAL 2 - Share The Pain: Configuration files not found. Skipping...
	echo.
)

echo POSTAL 2 - Share The Pain: Done.
echo.

rem POSTAL Redux
rem Steam version

set "postalreduxdir=%localappdata%\PostalREDUX"

rem Backup savegames
if exist "%postalreduxdir%\Saved\SaveGames\*.sav" (
	echo POSTAL Redux: Backing up savegames
	xcopy /i /y "%postalreduxdir%\Saved\SaveGames\*.sav" "POSTAL Redux\Savegames"
	echo.
) else (
	echo POSTAL Redux: Savegames not found. Skipping...
	echo.
)

rem Backup configuration files
if exist "%postalreduxdir%\Saved\Config\WindowsNoEditor\*.ini" (
	echo POSTAL Redux: Backing up configuration files
	xcopy /i /y "%postalreduxdir%\Saved\Config\WindowsNoEditor\*.ini" "POSTAL Redux\Configuration"
	echo.
) else (
	echo POSTAL Redux: Configuration files not found. Skipping...
	echo.
)

echo POSTAL Redux: Done.
echo.

rem Quake

set "nglideconfigregpath=HKCU\SOFTWARE\Zeus Software\nGlide"
set "q1rootdir=%gamerootdir%\Quake"

rem Backup savegames
if exist "%q1rootdir%\id1\*.SAV" (
	echo Quake: Backing up savegames
	xcopy /i /y "%q1rootdir%\id1\*.SAV" "Quake"
	echo.
) else (
	echo Quake: Savegames not found. Skipping...
	echo.
)

rem Backup configuration files
if exist "%q1rootdir%\id1\*.cfg" (
	echo Quake: Backing up configuration files
	xcopy /i /y "%q1rootdir%\id1\*.cfg" "Quake"
	echo.
) else (
	echo Quake: Configuration files not found. Skipping...
	echo.
)

rem Quake mission pack: Scourge of Armagon

rem Backup savegames
if exist "%q1rootdir%\hipnotic\*.SAV" (
	echo Quake mission pack: Scourge of Armagon - Backing up savegames
	xcopy /i /y "%q1rootdir%\hipnotic\*.SAV" "Quake - Scourge of Armagon"
	echo.
) else (
	echo Quake mission pack: Scourge of Armagon - Savegames not found. Skipping...
	echo.
)

rem Backup configuration files
if exist "%q1rootdir%\hipnotic\*.cfg" (
	echo Quake mission pack: Scourge of Armagon - Backing up configuration files
	xcopy /i /y "%q1rootdir%\hipnotic\*.cfg" "Quake - Scourge of Armagon"
	echo.
) else (
	echo Quake mission pack: Scourge of Armagon - Configuration files not found. Skipping...
	echo.
)

rem Quake mission pack 2: Dissolution of Eternity

rem Backup savegames
if exist "%q1rootdir%\rogue\*.SAV" (
	echo Quake mission pack 2: Dissolution of Eternity - Backing up savegames
	xcopy /i /y "%q1rootdir%\rogue\*.SAV" "Quake - Dissolution of Eternity"
	echo.
) else (
	echo Quake mission pack 2: Dissolution of Eternity - Savegames not found. Skipping...
	echo.
)

rem Backup configuration files
if exist "%q1rootdir%\rogue\*.CFG" (
	echo Quake mission pack 2: Dissolution of Eternity - Backing up configuration files
	xcopy /i /y "%q1rootdir%\rogue\*.CFG" "Quake - Dissolution of Eternity"
	echo.
) else (
	echo Quake mission pack 2: Dissolution of Eternity - Configuration files not found. Skipping...
	echo.
)

rem QuakeWorld

rem Backup configuration files
if exist "%q1rootdir%\qw\*.cfg" (
	echo QuakeWorld: Backing up configuration files
	xcopy /i /y "%q1rootdir%\qw\*.cfg" "QuakeWorld"
	echo.
) else (
	echo QuakeWorld: Configuration files not found. Skipping...
	echo.
)

rem Backup registry key for nGlide configuration
echo Quake: Backing up nGlide configuration registry key
reg export "%nglideconfigregpath%" "Quake\q1-nglide.reg" /y
echo.

echo Quake: Done.
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
if exist "%redfactionrootdir%\savegame\*.svl" (
	echo Red Faction: Backing up savegames
	xcopy /e /i /y "%redfactionrootdir%\savegame" "Red Faction\savegame"
	echo.
) else (
	echo Red Faction: Savegames not found. Skipping...
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
reg export "%redfactionregpath%" "Red Faction\red-faction.reg" /y

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

rem RollerCoaster Tycoon Deluxe

set "rctdregpath=HKLM\SOFTWARE\WOW6432Node\Fish Technology Group\RollerCoaster Tycoon Setup"
set "rctdrootdir=%gamerootdir%\RollerCoaster Tycoon Deluxe"

rem Backup savegames
if exist "%rctdrootdir%\Saved Games\*.SV4" (
	echo RollerCoaster Tycoon Deluxe: Backing up savegames
	xcopy /i /y "%rctdrootdir%\Saved Games\*.SV4" "RollerCoaster Tycoon Deluxe\Savegames"
	echo.
) else (
	echo RollerCoaster Tycoon Deluxe: Savegames not found. Skipping...
	echo.
)

rem Backup configuration
if exist "%rctdrootdir%\Data\*.cfg" (
	echo RollerCoaster Tycoon Deluxe: Backing up configuration
	xcopy /i /y "%rctdrootdir%\Data\*.cfg" "RollerCoaster Tycoon Deluxe\Data"
	echo.
) else (
	echo RollerCoaster Tycoon Deluxe: Configuration not found. Skipping...
	echo.
)

rem Backup screenshots
if exist "%rctdrootdir%\*.PCX" (
	echo RollerCoaster Tycoon Deluxe: Backing up screenshots
	xcopy /i /y "%rctdrootdir%\*.PCX" "RollerCoaster Tycoon Deluxe\Screenshots"
	echo.
) else (
	echo RollerCoaster Tycoon Deluxe: Screenshots not found. Skipping...
	echo.
)

rem Backup CSS0.DAT file
if exist "%rctdrootdir%\Data\CSS0.DAT" (
	echo RollerCoaster Tycoon Deluxe: Backing up CSS0.DAT
	xcopy /i /y "%rctdrootdir%\Data\CSS0.DAT" "RollerCoaster Tycoon Deluxe\Data"
	echo.
) else (
	echo RollerCoaster Tycoon Deluxe: CSS0.DAT not found. Skipping...
	echo.
)

rem Backup registry key
echo RollerCoaster Tycoon Deluxe: Backing up registry key
reg export "%rctdregpath%" "RollerCoaster Tycoon Deluxe\rctd.reg" /y
echo.

echo RollerCoaster Tycoon Deluxe: Done.
echo.

rem Runo

set "runolldir=%userprofile%\AppData\LocalLow\Kratti\Runo"
set "runoregpath=HKCU\SOFTWARE\Kratti\Runo"

rem Backup game options file
if exist "%runolldir%\*.dat" (
	echo Runo: Backing up game options file
	xcopy /i /y "%runolldir%\*.dat" "Runo"
	echo.
) else (
	echo Runo: Game options file not found. Skipping...
	echo.
)

rem Backup core.dat
if exist "%runolldir%\full\*.dat" (
	echo Runo: Backing up core.dat
	xcopy /i /y "%runolldir%\full\*.dat" "Runo\full"
	echo.
) else (
	echo Runo: core.dat not found. Skipping...
	echo.
)

rem Backup photos
if exist "%runolldir%\*.png" (
	echo Runo: Backing up photos
	xcopy /i /y "%runolldir%\*.png" "Runo\Photos"
	echo.
) else (
	echo Runo: Photos not found. Skipping...
	echo.
)

rem Backup registry key
echo Runo: Backing up registry key
reg export "%runoregpath%" "Runo\runo.reg" /y
echo.

echo Runo: Done.
echo.

rem S.T.A.L.K.E.R. Чистое Небо
rem English title: S.T.A.L.K.E.R. Clear Sky

set "scsdir=%userprofile%\Documents\Stalker-STCS"
set "scsregpath=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\GSC Game World\STALKER-STCS"

rem Backup savegames and savegame textures
if exist "%scsdir%\savedgames\*.sav" (
	echo S.T.A.L.K.E.R. Clear Sky: Backing up savegames and savegame textures
	xcopy /i /y "%scsdir%\savedgames\*.sav" "S.T.A.L.K.E.R. Clear Sky\savedgames"
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

rem Backup registry key
echo S.T.A.L.K.E.R. Clear Sky: Backing up registry key
reg export "%scsregpath%" "S.T.A.L.K.E.R. Clear Sky\scs.reg" /y
echo.

echo S.T.A.L.K.E.R. Clear Sky: Done.
echo.

rem S.T.A.L.K.E.R. Shadow of Chernobyl

set "sshocdir=%userprofile%\Documents\Stalker-SHOC"
set "sshocregkeypath=HKLM\SOFTWARE\WOW6432Node\GSC Game World\STALKER-SHOC"

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

rem Backup registry key
echo S.T.A.L.K.E.R. Shadow of Chernobyl: Backing up registry key
reg export "%sshocregkeypath%" "S.T.A.L.K.E.R. Shadow of Chernobyl\sshoc.reg" /y

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

rem Serious Sam: The Second Encounter

set "sstseregpath1=HKCU\SOFTWARE\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\GameSpy\games"
set "sstseregpath2=HKCU\SOFTWARE\CroTeam"
set "sstserootdir=%gamerootdir%\Serious Sam The Second Encounter"

rem Backup savegame files
if exist "%sstserootdir%\SaveGame" (
	echo Serious Sam: The Second Encounter - Backing up savegame files
	xcopy /e /i /y "%sstserootdir%\SaveGame" "Serious Sam - The Second Encounter\SaveGame"
	echo.
) else (
	echo Serious Sam: The Second Encounter - SaveGame folder not found. Skipping...
	echo.
)

rem Backup demos
if exist "%sstserootdir%\Demos\Demo*" (
	echo Serious Sam: The Second Encounter - Backing up demos
	xcopy /i /y "%sstserootdir%\Demos\Demo*" "Serious Sam - The Second Encounter\Demos"
	echo.
) else (
	echo Serious Sam: The Second Encounter - Demos not found. Skipping...
	echo.
)

rem Backup temporary demos
if exist "%sstserootdir%\Temp\*.dem" (
	echo Serious Sam: The Second Encounter - Backing up temporary demos
	xcopy /i /y "%sstserootdir%\Temp\*.dem" "Serious Sam - The Second Encounter\Temporary demos"
	echo.
) else (
	echo Serious Sam: The Second Encounter - Temporary demos not found. Skipping...
	echo.
)

rem Backup screenshots
if exist "%sstserootdir%\ScreenShots\*.tga" (
	echo Serious Sam: The Second Encounter - Backing up screenshots
	xcopy /i /y "%sstserootdir%\ScreenShots\*.tga" "Serious Sam - The Second Encounter\Screenshots"
	echo.
) else (
	echo Serious Sam: The Second Encounter - Screenshots not found. Skipping...
	echo.
)

rem Backup persistent symbols file, which contains setting values
if exist "%sstserootdir%\Scripts\PersistentSymbols.ini" (
	echo Serious Sam: The Second Encounter - Backing up persistent symbols file
	md "Serious Sam - The Second Encounter\Scripts"
	copy "%sstserootdir%\Scripts\PersistentSymbols.ini" "Serious Sam - The Second Encounter\Scripts"
	echo.
) else (
	echo Serious Sam: The Second Encounter - Persistent symbols file not found. Skipping...
	echo.
)

rem Backup control files
if exist "%sstserootdir%\Controls\Controls*" (
	echo Serious Sam: The Second Encounter - Backing up control files
	xcopy /i /y "%sstserootdir%\Controls\Controls*" "Serious Sam - The Second Encounter\Controls"
	echo.
) else (
	echo Serious Sam: The Second Encounter - Control files not found. Skipping...
	echo.
)

rem Backup .plr files
if exist "%sstserootdir%\Players\*.plr" (
	echo Serious Sam: The Second Encounter - Backing up .plr files
	xcopy /i /y "%sstserootdir%\Players\*.plr" "Serious Sam - The Second Encounter\Players"
	echo.
) else (
	echo Serious Sam: The Second Encounter - .plr files not found. Skipping...
	echo.
)

rem Backup SeriousSkaStudio files
if exist "%sstserootdir%\*.smc" (
	echo Serious Sam: The Second Encounter - Backing up SeriousSkaStudio files
	xcopy /i /y "%sstserootdir%\*.aal" "Serious Sam - The Second Encounter\SeriousSkaStudio"
	xcopy /i /y "%sstserootdir%\*.aml" "Serious Sam - The Second Encounter\SeriousSkaStudio"
	xcopy /i /y "%sstserootdir%\*.asl" "Serious Sam - The Second Encounter\SeriousSkaStudio"
	xcopy /i /y "%sstserootdir%\*.ba" "Serious Sam - The Second Encounter\SeriousSkaStudio"
	xcopy /i /y "%sstserootdir%\*.bm" "Serious Sam - The Second Encounter\SeriousSkaStudio"
	xcopy /i /y "%sstserootdir%\*.bs" "Serious Sam - The Second Encounter\SeriousSkaStudio"
	xcopy /i /y "%sstserootdir%\*.smc" "Serious Sam - The Second Encounter\SeriousSkaStudio"
	echo.
) else (
	echo Serious Sam: The Second Encounter - SeriousSkaStudio files not found. Skipping...
	echo.
)

rem Backup registry keys
echo Serious Sam: The Second Encounter - Backing up registry keys
reg export "%sstseregpath1%" "Serious Sam - The Second Encounter\sstse-1.reg" /y
reg export "%sstseregpath2%" "Serious Sam - The Second Encounter\sstse-2.reg" /y
echo.

echo Serious Sam: The Second Encounter - Done.
echo.

rem Sludge Life

set "sludgeliferegpath=HKCU\SOFTWARE\TerriVellmann\SludgeLife"
set "sludgeliferootdir=%gamerootdir%\Sludge Life"

rem Back up pictures
if exist "%sludgeliferootdir%\PICS\*.png" (
	echo Sludge Life: Backing up pictures
	xcopy /e /i /y "%sludgeliferootdir%\PICS" "Sludge Life\PICS"
	echo.
) else (
	echo Sludge Life: Pictures not found. Skipping...
	echo.
)

rem Backup savegame file from the game’s root directory
if exist "%sludgeliferootdir%\save.txt" (
	echo Sludge Life: Backing up savegame file
	copy "%sludgeliferootdir%\save.txt" "Sludge Life"
	echo.
) else (
	echo Sludge Life: Savegame file not found. Skipping...
	echo.
)

rem Backup registry key. Settings are stored here
echo Sludge Life: Backing up registry key
reg export "%sludgeliferegpath%" "Sludge Life\sludgelife.reg" /y
echo.

echo Sludge Life: Done.
echo.

rem Soldiers: Heroes of World War II

set "showw2regkeypath1=HKLM\SOFTWARE\WOW6432Node\Codemasters\Soldiers"
set "showw2regkeypath2=HKLM\SOFTWARE\WOW6432Node\Codemasters\Soldiers - Heroes of World War II"
set "showw2rootdir=%gamerootdir%\Soldiers - Heroes of World War II"

rem Backup profile folders and last user file
if exist "%showw2rootdir%\profiles" (
	echo Soldiers: Heroes of World War II - Backing up profile folders and last user file
	xcopy /e /i /y "%showw2rootdir%\profiles" "Soldiers - Heroes of World War II\profiles"
	echo.
) else (
	echo Soldiers: Heroes of World War II - Profile folder not found. Skipping...
	echo.
)

rem Backup registry keys
echo Soldiers: Heroes of World War II - Backing up registry keys
reg export "%showw2regkeypath1%" "Soldiers - Heroes of World War II\showw2-1.reg" /y
reg export "%showw2regkeypath2%" "Soldiers - Heroes of World War II\showw2-2.reg" /y
echo.

echo Soldiers: Heroes of World War II - Done.
echo.

rem SOMA

set "somadir=%userprofile%\Documents\My Games\Soma"

rem Backup Soma\Main folder with the exception of log files
if exist "%somadir%" (
	echo SOMA: Backing up profile folder, first start flag and main settings
	xcopy /e /exclude:exclude\soma-exclude.txt /i /y "%somadir%" "SOMA"
	echo.
) else (
	echo SOMA: Folder not found. Skipping...
	echo.
)

echo SOMA: Done.
echo.

rem Spear of Destiny
rem GOG edition, DOSBox emulation

set "sodrootdir=%gamerootdir%\Spear of Destiny"

rem Backup M1, M2 and M3 folders
if exist "%sodrootdir%\cloud_saves" (
	echo Spear of Destiny: Backing up folders
	xcopy /e /i /y "%sodrootdir%\cloud_saves" "Spear of Destiny"
	echo.
) else (
	echo Spear of Destiny: Folders not found. Skipping...
	echo.
)

echo Spear of Destiny: Done.
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

set "suddenstrikerootdir=%gamerootdir%\Sudden Strike"

rem Backup savegames
if exist "%suddenstrikerootdir%\SaveGames" (
	echo Sudden Strike: Backing up savegames
	xcopy /e /i /y "%suddenstrikerootdir%\SaveGames" "Sudden Strike\SaveGames"
	echo.
) else (
	echo Sudden Strike: SaveGames folder not found. Skipping...
	echo.
)

rem Backup .ini file
if exist "%suddenstrikerootdir%\sudtest.ini" (
	echo Sudden Strike: Backing up .ini file
	copy "%suddenstrikerootdir%\sudtest.ini" "Sudden Strike"
	echo.
) else (
	echo Sudden Strike: .ini file not found. Skipping...
	echo.
)

rem Backup ratings data
if exist "%suddenstrikerootdir%\ratings\*.rtc" (
	echo Sudden Strike: Backing up ratings data
	xcopy /i /y "%suddenstrikerootdir%\ratings\*.rtc" "Sudden Strike\ratings"
	echo.
) else (
	echo Sudden Strike: Ratings data not found. Skipping...
	echo.
)

echo Sudden Strike: Done.
echo.

rem Sudden Strike - Resource War

set "ssrwrootdir=%gamerootdir%\Sudden Strike Resource War"

rem Backup savegames folder
if exist "%ssrwrootdir%\plr\savegames" (
	echo Sudden Strike - Resource War: Backing up savegames folder
	xcopy /e /exclude:exclude\ssrw-exclude.txt /i /y "%ssrwrootdir%\plr\savegames" "Sudden Strike - Resource War\Savegames"
	echo.
) else (
	echo Sudden Strike - Resource War: Savegames folder not found. Skipping...
	echo.
)

rem Backup configuration
if exist "%ssrwrootdir%\sudtest.ini" (
	echo Sudden Strike - Resource War: Backing up configuration
	xcopy /i /y "%ssrwrootdir%\sudtest.ini" "Sudden Strike - Resource War"
	echo.
) else (
	echo Sudden Strike - Resource War: Configuration not found. Skipping...
	echo.
)

rem Backup edit3 maps
if exist "%ssrwrootdir%\maps.src" (
	echo Sudden Strike - Resource War: Backing up edit3 maps folder
	xcopy /e /exclude:exclude.txt /i /y "%ssrwrootdir%\maps.src" "Sudden Strike - Resource War\Maps"
	echo.
) else (
	echo Sudden Strike - Resource War: edit3 maps folder not found. Skipping...
	echo.
)

rem Backup edit3 configuration
if exist "%ssrwrootdir%\Edit3.ini" (
	echo Sudden Strike - Resource War: Backing up edit3 configuration
	xcopy /i /y "%ssrwrootdir%\Edit3.ini" "Sudden Strike - Resource War"
	echo.
) else (
	echo Sudden Strike - Resource War: edit3 configuration not found. Skipping...
	echo.
)

echo Sudden Strike - Resource War: Done.
echo.

rem Sudden Strike II

set "suddenstrike2regpath=HKCU\SOFTWARE\Fireglow\edit3"
set "suddenstrike2rootdir=%gamerootdir%\Sudden Strike 2"

rem Backup savegames folder
if exist "%suddenstrike2rootdir%\plr\savegames" (
	echo Sudden Strike II: Backing up savegames folder
	xcopy /e /exclude:exclude\ss2-exclude.txt /i /y "%suddenstrike2rootdir%\plr\savegames" "Sudden Strike II\Savegames"
	echo.
) else (
	echo Sudden Strike II: Savegames folder not found. Skipping...
	echo.
)

rem Backup configuration
if exist "%suddenstrike2rootdir%\sudtest.ini" (
	echo Sudden Strike II: Backing up configuration
	xcopy /i /y "%suddenstrike2rootdir%\sudtest.ini" "Sudden Strike II"
	echo.
) else (
	echo Sudden Strike II: Configuration not found. Skipping...
	echo.
)

rem Backup edit3 maps
if exist "%suddenstrike2rootdir%\maps.src" (
	echo Sudden Strike II: Backing up edit3 maps folder
	xcopy /e /exclude:exclude.txt /i /y "%suddenstrike2rootdir%\maps.src" "Sudden Strike II\Maps"
	echo.
) else (
	echo Sudden Strike II: edit3 maps folder not found. Skipping...
	echo.
)

rem Backup edit3 configuration
if exist "%suddenstrike2rootdir%\Edit3.ini" (
	echo Sudden Strike II: Backing up edit3 configuration
	xcopy /i /y "%suddenstrike2rootdir%\Edit3.ini" "Sudden Strike II"
	echo.
) else (
	echo Sudden Strike II: edit3 configuration not found. Skipping...
	echo.
)

rem Backup edit3 registry key
echo Sudden Strike II: Backing up edit3 registry key
reg export "%suddenstrike2regpath%" "Sudden Strike II\ss2-edit3.reg" /y
echo.

echo Sudden Strike II: Done.
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
	xcopy /e /exclude:exclude\sunless-exclude.txt /i /l /y "%sunlesslldir%" "Sunless Sea\LocalLow"
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

rem SuperTux

set "supertuxdir=%appdata%\SuperTux"

rem Backup SuperTux folder structure with the exception of the console error
rem file and the console output file. Effectively, this should backup the
rem configuration file, profile folders containing savegames, addons and level
rem editor files
if exist "%supertuxdir%" (
	echo SuperTux: Backing up folder
	xcopy /e /exclude:exclude\supertux-exclude.txt /i /y "%supertuxdir%" "SuperTux"
	echo.
) else (
	echo SuperTux: Folder not found. Skipping...
	echo.
)

echo SuperTux: Done.
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

rem Backup configuration and savegame files
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

rem System Shock
rem GOG edition, DOSBox emulation
rem
rem Known as ‘System Shock - Classic Edition’

set "sscerootdir=%gamerootdir%\System Shock - Classic Edition"

rem Backup savegames
if exist "%sscerootdir%\SSHOCK\DATA\SAVGAM*" (
	echo System Shock - Classic Edition: Backing up savegames
	xcopy /i /y "%sscerootdir%\SSHOCK\DATA\CURRSAVE*" "System Shock - Classic Edition\Savegames"
	xcopy /i /y "%sscerootdir%\SSHOCK\DATA\SAVGAM*" "System Shock - Classic Edition\Savegames"
	echo.
) else (
	echo System Shock - Classic Edition: Savegames not found. Skipping...
	echo.
)

rem Backup configuration
if exist "%sscerootdir%\SSHOCK\CYB*" (
	echo System Shock - Classic Edition: Backing up configuration
	xcopy /i /y "%sscerootdir%\SSHOCK\CYB*" "System Shock - Classic Edition\Configuration"
	echo.
) else (
	echo System Shock - Classic Edition: Configuration not found. Skipping...
	echo.
)

echo System Shock - Classic Edition: Done.
echo.

rem Terraria

set "terrariadir=%userprofile%\Documents\My Games\Terraria"
set "terrariarootdir=%gamerootdir%\Terraria"

rem Backup Terraria folder
if exist "%terrariadir%" (
	echo Terraria: Backing up Terraria folder
	xcopy /e /i /y "%terrariadir%" "Terraria\Terraria"
	echo.
) else (
	echo Terraria: Terraria folder not found. Skipping...
	echo.
)

rem Backup ban list
if exist "%terrariarootdir%\banlist.txt" (
	echo Terraria: Backing up ban list
	xcopy /i /y "%terrariarootdir%\banlist.txt" "Terraria"
	echo.
) else (
	echo Terraria: Ban list not found. Skipping...
	echo.
)

echo Terraria: Done.
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

rem The Elder Scrolls: Arena
rem GOG edition, DOSBox emulation

set "tesarenarootdir=%gamerootdir%\Arena"

rem Backup data
if exist "%tesarenarootdir%\cloud_saves\*" (
	echo The Elder Scrolls: Arena - Backing up data
	xcopy /i /y "%tesarenarootdir%\cloud_saves\*" "The Elder Scrolls - Arena"
	echo.
) else (
	echo The Elder Scrolls: Arena - Data not found. Skipping...
	echo.
)

rem Backup DOSBox configuration file
if exist "%tesarenarootdir%\dosbox_arena.conf" (
	echo The Elder Scrolls: Arena - Backing up DOSBox configuration file
	xcopy /i /y "%tesarenarootdir%\dosbox_arena.conf" "The Elder Scrolls - Arena"
	echo.
) else (
	echo The Elder Scrolls: Arena - DOSBox configuration file not found. Skipping...
	echo.
)

echo The Elder Scrolls: Arena - Done.
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

set "tljregpath=HKCU\SOFTWARE\Paper Sun\Roots"
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

rem Backup registry key
echo The Longest Journey: Backing up registry key
reg export "%tljregpath%" "The Longest Journey\tlj.reg" /y
echo.

echo The Longest Journey: Done.
echo.

rem The Mystery of the Druids

set "tmotdregpath1=HKCU\SOFTWARE\House of Tales\Mystery of the Druids"
set "tmotdregpath2=HKCU\SOFTWARE\House of Tales\The Mystery of the Druids"
set "tmotdrootdir=%gamerootdir%\The Mystery of the Druids"

rem Backup savegames
if exist "%tmotdrootdir%\SAVEGAME\*.edd" (
	echo The Mystery of the Druids: Backing up savegames
	xcopy /i /y "%tmotdrootdir%\SAVEGAME\*.edd" "The Mystery of the Druids\SAVEGAME"
	echo.
) else (
	echo The Mystery of the Druids: Savegames not found. Skipping...
	echo.
)

rem Backup lastgame file
if exist "%tmotdrootdir%\lastgame" (
	echo The Mystery of the Druids: Backing up lastgame file
	xcopy /i /y "%tmotdrootdir%\lastgame" "The Mystery of the Druids"
	echo.
) else (
	echo The Mystery of the Druids: lastgame file not found. Skipping...
	echo.
)

rem Backup registry keys
echo The Mystery of the Druids: Backing up registry keys
reg export "%tmotdregpath1%" "The Mystery of the Druids\tmotd-1.reg" /y
reg export "%tmotdregpath2%" "The Mystery of the Druids\tmotd-2.reg" /y
echo.

echo The Mystery of the Druids: Done.
echo.

rem The Suicide of Rachel Foster

set "tsorfsavedir=%localappdata%\Daedalic Entertainment GmbH\The Suicide of Rachel Foster\Saved"

rem Backup savegame files
if exist "%tsorfsavedir%\SaveGames\*.sav" (
	echo The Suicide of Rachel Foster: Backing up savegame file and game options
	xcopy /i /y "%tsorfsavedir%\SaveGames\*.sav" "The Suicide of Rachel Foster\Savegames"
	echo.
) else (
	echo The Suicide of Rachel Foster: Savegame and game options files not found. Skipping...
	echo.
)

rem Backup user settings
if exist "%tsorfsavedir%\Config\WindowsNoEditor\GameUserSettings.ini" (
	echo The Suicide of Rachel Foster: Backing up user settings
	copy "%tsorfsavedir%\Config\WindowsNoEditor\GameUserSettings.ini" "The Suicide of Rachel Foster\Configuration"
	echo.
) else (
	echo The Suicide of Rachel Foster: User settings not found. Skipping...
	echo.
)

echo The Suicide of Rachel Foster: Done.
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

rem This War of Mine

set "twomaddir=%appdata%\11bitstudios\This War Of Mine"
set "twomdocdir=%userprofile%\Documents\This War of Mine"

rem Backup AppData folder
if exist "%twomaddir%" (
	echo This War of Mine: Backing up AppData folder
	xcopy /e /i /y "%twomaddir%" "This War of Mine\AppData"
	echo.
) else (
	echo This War of Mine: AppData folder not found. Skipping...
	echo.
)

rem Backup Documents folder
if exist "%twomdocdir%" (
	echo This War of Mine: Backing up Documents folder
	xcopy /e /i /y "%twomdocdir%" "This War of Mine\Documents"
	echo.
) else (
	echo This War of Mine: Documents folder not found. Skipping...
	echo.
)

echo This War of Mine: Done.
echo.

rem Through the Woods

set "ttwregpath=HKCU\SOFTWARE\Antagonist\ThroughTheWoods"
set "ttwrootdir=%gamerootdir%\Through the Woods"

rem Backup savegame, game settings and graphical settings
if exist "%ttwrootdir%\Through the Woods_Data\*.json" (
	echo Through the Woods: Backing up JSON files
	xcopy /i /y "%ttwrootdir%\Through the Woods_Data\*.json" "Through the Woods"
	echo.
) else (
	echo Through the Woods: JSON files not found. Skipping...
	echo.
)

rem Backup registry key
echo Through the Woods: Backing up registry key
reg export "%ttwregpath%" "Through the Woods\ttw.reg" /y
echo.

echo Through the Woods: Done.
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

rem Tomb Raider
rem GOG edition, DOSBox emulation

set "tombraiderrootdir=%gamerootdir%\Tomb Raider 1"

rem Backup savegames
if exist "%tombraiderrootdir%\TOMBRAID\SAVEGAME*" (
	echo Tomb Raider: Backing up savegames
	xcopy /i /y "%tombraiderrootdir%\TOMBRAID\SAVEGAME*" "Tomb Raider"
	echo.
) else (
	echo Tomb Raider: Savegames not found. Skipping...
	echo.
)

rem Backup settings
if exist "%tombraiderrootdir%\TOMBRAID\*.DAT" (
	echo Tomb Raider: Backing up settings
	xcopy /i /y "%tombraiderrootdir%\TOMBRAID\*.DAT" "Tomb Raider"
	echo.
) else (
	echo Tomb Raider: Settings file not found. Skipping...
	echo.
)

echo Tomb Raider: Done.
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

rem Ultima I
rem GOG edition, DOSBox emulation

set "ultimarootdir=%gamerootdir%\Ultima 1"

rem Backup characters
if exist "%ultimarootdir%\cloud_saves\*.U1" (
	echo Ultima I: Backing up characters
	xcopy /i /y "%ultimarootdir%\cloud_saves\*.U1" "Ultima I"
	echo.
) else (
	echo Ultima I: Characters not found. Skipping...
	echo.
)

echo Ultima I: Done.
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

rem Warhammer 40,000 - Rites of War

set "wh40krowrootdir=%gamerootdir%\WARHAMMER 40K Rites of War"

rem Backup savegames
if exist "%wh40krowrootdir%\save\*.csv" (
	echo Warhammer 40,000 - Rites of War: Backing up savegames
	xcopy /i /y "%wh40krowrootdir%\save\*.csv" "Warhammer 40,000 - Rites of War\save"
	echo.
) else (
	echo Warhammer 40,000 - Rites of War: Savegames not found. Skipping...
	echo.
)

rem Backup customised armies
if exist "%wh40krowrootdir%\save\Armies\*.arm" (
	echo Warhammer 40,000 - Rites of War: Backing up customised armies
	xcopy /i /y "%wh40krowrootdir%\save\Armies\*.arm" "Warhammer 40,000 - Rites of War\save\Armies"
	echo.
) else (
	echo Warhammer 40,000 - Rites of War: Customised armies not found. Skipping...
	echo.
)

rem Backup user scenarios
if exist "%wh40krowrootdir%\userscen\*.scn" (
	echo Warhammer 40,000 - Rites of War: Backing up user scenarios
	xcopy /i /y "%wh40krowrootdir%\userscen\*.scn" "Warhammer 40,000 - Rites of War\userscen"
	echo.
) else (
	echo Warhammer 40,000 - Rites of War: User scenarios not found. Skipping...
	echo.
)

rem Backup row.int file
if exist "%wh40krowrootdir%\*.int" (
	echo Warhammer 40,000 - Rites of War: Backing up row.int file
	xcopy /i /y "%wh40krowrootdir%\*.int" "Warhammer 40,000 - Rites of War"
	echo.
) else (
	echo Warhammer 40,000 - Rites of War: row.int file not found. Skipping...
	echo.
)

echo Warhammer 40,000 - Rites of War: Done.
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

rem Wolfenstein 3D
rem GOG version, DOSBox emulation

set "w3drootdir=%gamerootdir%\Wolfenstein 3D"

rem Backup configuration and savegames
if exist "%w3drootdir%\cloud_saves\*.WL6" (
	echo Wolfenstein 3D: Backing up configuration and savegames
	xcopy /i /y "%w3drootdir%\cloud_saves\*.WL6" "Wolfenstein 3D"
	echo.
) else (
	echo Wolfenstein 3D: Configuration and savegames not found. Skipping...
	echo.
)

echo Wolfenstein 3D: Done.
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

rem Worms
rem GOG edition, DOSBox emulation
rem
rem Known as ‘Worms United’

set "wormsrootdir=%gamerootdir%\Worms United"

rem Backup configuration file
if exist "%wormsrootdir%\cloud_saves\*.CFG" (
	echo Worms: Backing up configuration file
	xcopy /i /y "%wormsrootdir%\cloud_saves\*.CFG" "Worms"
	echo.
) else (
	echo Worms: Configuration file not found. Skipping...
	echo.
)

rem Backup DOSBox configuration file
if exist "%wormsrootdir%\dosboxWORMS.conf" (
	echo Worms: Backing up DOSBox configuration file
	xcopy /i /y "%wormsrootdir%\dosboxWORMS.conf" "Worms"
	echo.
) else (
	echo Worms: DOSBox configuration file not found. Skipping...
	echo.
)

echo Worms: Done.
echo.

rem X-COM: UFO Defense
rem GOG edition, DOSBox emulation

set "xcudrootdir=%gamerootdir%\X-COM UFO Defense"

rem Backup savegame folders with the exception of the SOUND folder. Not sure if
rem I got the MVOL.DAT dynamically modified as per in-game action, but since I
rem was not able to reproduce this behaviour, I removed it from the exclude file
if exist "%xcudrootdir%\cloud_saves" (
	echo X-COM: UFO Defense - Backing up savegame folders
	xcopy /e /exclude:exclude\xcud-exclude.txt /i /y "%xcudrootdir%\cloud_saves" "X-COM - UFO Defense\Savegames"
	echo.
) else (
	echo X-COM: UFO Defense - Savegame folders not found. Skipping...
	echo.
)

rem Backup SOUND folder
if exist "%xcudrootdir%\cloud_saves\SOUND\*.CFG" (
	echo X-COM: UFO Defense - Backing up SOUND folder
	xcopy /e /i /y "%xcudrootdir%\cloud_saves\SOUND" "X-COM - UFO Defense\SOUND"
	echo.
) else (
	echo X-COM: UFO Defense - Sound configuration not found. Skipping...
	echo.
)

rem Backup MVOL.DAT file
if exist "%xcudrootdir%\cloud_saves\*.DAT" (
	echo X-COM: UFO Defense - Backing up MVOL.DAT file
	xcopy /i /y "%xcudrootdir%\cloud_saves\*.DAT" "X-COM - UFO Defense"
	echo.
) else (
	echo X-COM: UFO Defense - MVOL.DAT file not found. Skipping...
	echo.
)

rem Backup DOSBox configuration file
if exist "%xcudrootdir%\dosbox_xcomud.conf" (
	echo X-COM: UFO Defense - Backing up DOSBox configuration file
	xcopy /i /y "%xcudrootdir%\dosbox_xcomud.conf" "X-COM - UFO Defense"
	echo.
) else (
	echo X-COM: UFO Defense - DOSBox configuration file not found. Skipping...
	echo.
)

echo X-COM: UFO Defense - Done.
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
