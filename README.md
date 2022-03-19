RBC
===

This is the RBC. A simple abbreviation symbolising three tasks. Restore,
Backup, Clean up. A collection of three batch files which you can apply to
offline games.

#### Introduction

Video game privacy these days is turning into more and more of an issue; this
is especially true for new releases, requiring to be constantly connected to
the internet, be it due to DRM mechanisms, pseudo-DRM mechanisms or so called
game analytics. In addition to that, a lot of information is simply being left
on the operating system, either in the game folder itself, its subdirectories,
the user document folder, the various AppData folders and registry keys.

However, there are also a lot of games which work perfectly fine in offline
mode. Multiplayer games, understandably, have to be connected to the internet
or a local network, although not in every case. Offline installers can be
aquired in many ways, such as buying games on websites such as GameJolt, GOG,
itch etc.

These scripts are an attempt to keep the footprint which offline games leave
behind on your system to a minimum. There is also a backup and restore script,
so your game files don’t linger on the OS, and instead on a flash drive or
external hard drive, isolated from the operating system.

To see which games are currently supported, please read the
[SUPPORTED](SUPPORTED.md) document. This project was tested on Windows 10
64-bit.

#### Quick start guide

1. Go offline. Do this by any method of your choice. Either use a physical
   ethernet killswitch, a physical wi-fi killswitch, disable all network
   adapters or, if you really have to, pull the ethernet cable.
2. Copy all three scripts to a flash drive.
3. Install your games to a destination such as `C:\Users\User\offlinegames`
4. Declare this path as `gamerootdir` variable in the beginning of each script
5. Run the restore script by doubleclicking it. This doesn’t make sense on a
   first run though!
6. Start your gaming session.
7. When you’re done playing, run the backup script.
8. Finally, run the cleanup script and remove the flash drive.

#### A word of warning

*Although these scripts have been tested (not to the fullest extent), data loss
can still occur due to bugs and different system configurations; among other
factors. Do backup everything manually first and if you really care about the
data, encrypt it, preferably by using open source encryption software with
built-in Windows support. Do also bear in mind that despite this tool, data
might still be leaked as soon as you connect to the internet. This is simply
due to the nature of proprietary operating systems. The problem is, you don’t
really know what code is running in the background.*

#### Licensing
This project is licensed under the GNU GPL 3.0 license. To read it, please
refer to the [LICENSE](LICENSE) document.
