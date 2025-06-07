## Welcome to QtCreator Basic

This is a stripped-down version of QtCreator 3.6.1 suited for plain qmake C++ projects.

There are no more dependencies on the script and qml modules of Qt. In consequence there is
no QML/JS editor or debugger. All dependencies from QML or JS spread around the code are
commented out. All non-essential plugins were removed. Qbs support has been dropped.

### Why?

Personally I consider QtCreator version 3.x the best QtCreator ever; it was lean & mean;
the last available version was 3.6.1; fortunately it's open-source and with the code still available.

I already used this version as a basis of my [LeanCreator](https://github.com/rochus-keller/LeanCreator) which
is an IDE using my own [BUSY build system](https://github.com/rochus-keller/BUSY) instead of qmake. This IDE
has become my main workhorse since. But I still have a lot of qmake projects which I will not migrate to BUSY.

Recently, after sixteen years, I completed a generational change of my primary development machine: from the venerable
HP EliteBook 2530p to the great Lenovo Thinkpad T480. My new OS version Debian 12 "bookworm" still supports Qt5, 
but no longer QtCreator 3.x. My main Qt version on the old machine was 5.4, which was good enough for 
all my personal projects. I already used Qt 5.6.3 for [LeanQt](https://github.com/rochus-keller/LeanQt), because
it was the last version available under GPL2, which I need for some of my projects. So it's only
logical to also use Qt 5.6.3 on my "new" development machine. I only use the "basic" Qt package with 
core, network, gui and widgets. Building it on Debian Bookworm x64 was no problem. 

To build QtCreator 3.6.1 I would need a lot of stuff which I neither want nor have.
Unfortunately the build process of QtCreator gives no choice: it requires QML, even if it's just for a silly 
welcome message. Even though you can disable the plugins you don't need at runtime, you are forced to include 
everything at build time. 

And here comes QtCreator Basic.


For more information about the original QtCreator, see README_ORIG.md.

### Update 2025-06-07

The code successfully built on the T480, but it crashed when opening the options dialog (in Core::Internal::VariableChooserPrivate::updateDescription, calling QLabel::setText, evetually in operator==(QString const&, QString const&)).
Everything looks ok in the debugger; no obvious reason for the crash. It's interesting to note that I compiled some other apps with Qt 5.6.3 x64 on this machine which worked well; this would indicate a QtCreator issue, but the same code compiled and run without a crash on my EliteBook. So I thought that maybe a SIMD issue which was fixed in later Qt versions; so I tried with the Qt 5.15.8 included with Debian bookworm; to make this compile, again many changes were necessary in the QtCreaterBase source code; I even had to disable the designer plugin because none of the Debian packages seem to include the private designer parts required by the plugin. Eventually it compiled, but showed exactly the same issue, and again no obvious reason seen in the debugger. 
The search continues.
