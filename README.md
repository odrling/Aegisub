## arch1t3cht's Aegisub "fork"
Go [here](#branchfeature-list) for the new features.

### Don't we have enough Aegisub forks already??
We absolutely do, and I'm aware that adding another one [doesn't sound like a good idea on paper](https://xkcd.com/927/). However,

- None of the existing forks are completely satisfying at the moment:
  - [wangqr's fork](https://github.com/wangqr/Aegisub) is actively maintained, but focussing more on stability. It's missing most of the modern features.
  - [AegisubDC](https://github.com/Ristellise/AegisubDC) has the most modern features (in particular video-panning), but is Windows-only and not actively maintained anymore.
  - [The TypesettingTools fork](https://github.com/TypesettingTools/Aegisub) is the one that will one day become the upstream version and builds relatively effortlessly on all operating systems, but at the moment it's not moving much. It's the base for this fork, and I hope to one day merge most of these additions into it.
- Only PR'ing the changes in here to various forks would cause even more chaos
- I try to convince myself that this isn't really a "fork" in the traditional sense - one which aims to provide extended support and stability fixes. It's a collection of new feature additions which I built myself, together with some of the most important new features floating around other forks.

    While this is usually also the version of Aegisub I'm currently using, I make absolutely no promises on stability. **Don't** use this version if you're just looking for any version of Aegisub - this is mostly intended for typesetting and other advanced usage.

### Organization
Being a collection of different feature additions, this repository consists of a set of branches for different features, so that they can easily be merged into other repositories. The [`feature`](https://github.com/arch1t3cht/Aegisub/tree/feature) branch merges together all the features I deem as currently usable. Due to the structure of the repository, I will be force-pushing to this branch and some of the individual branches very frequently, so they're not ideal for basing further branches on.

The `cibuilds` branch makes some CI builds of snapshots of `feature` at relevant points in time.

### Branch/Feature list
- [`folding`](https://github.com/arch1t3cht/Aegisub/tree/folding): Add the ability to visually group and collapse lines in the subtitle grid
- [`vector_clip_actions`](https://github.com/arch1t3cht/Aegisub/tree/vector_clip_actions): Make the different modes of the vector clip tool (lines, bezier curves, adding points, etc) bindable to hotkeys
- [`color_picker_fix2`](https://github.com/arch1t3cht/Aegisub/tree/color_picker_fix2): Add an option (under "Interface") to restrict the color picker to the window, which fixes the color picker on Linux in a lot of cases.
- [`avisynth`](https://github.com/arch1t3cht/Aegisub/tree/avisynth): Reenable Avisynth support on Windows (Still occasionally crashes)
- [`bugfixes`](https://github.com/arch1t3cht/Aegisub/tree/bugfixes): Various fixes, mostly relevant for compilation
- [`mix_dc`](https://github.com/arch1t3cht/Aegisub/tree/misc_dc): Miscellaneous changes taken from AegisubDC
- [`video_panning_feature`](https://github.com/arch1t3cht/Aegisub/tree/video_panning_feature): Merge [moex3's video zoom and panning](https://github.com/TypesettingTools/Aegisub/pull/150), with an OSX fix and an option to toggle the behavior of Ctrl+Zoom
- [`spectrum-frequency-mapping`](https://github.com/arch1t3cht/Aegisub/tree/spectrum-frequency-mapping): Merge EleonoreMizo's [spectrum display improvements](https://github.com/TypesettingTools/Aegisub/pull/94), and also make Shift+Scroll vertically zoom the audio display

### Troubleshooting
#### Building fails with a "CMake sandbox violation"
This is an upstream bug in meson. For now, you need to downgrade meson using `pip install meson==0.62.2`.

#### Aegisub on Linux doesn't recognize my GTK theme
This is probably because you're building with wxgtk2. Building with wxgtk3 fixes this, but causes some problems of its own (notably the broken color picker, occasional crashes when opening file dialogs from automation scripts, and general layouting issues).

The exact way of switching depends on your Linux distribution, but essentially you need to ensure that `wx-config` or the next best variant of it points to wxgtk3. If it points to wxgtk2 by default and deinstalling wxgtk2 isn't an option, you can also temporarily move it out of the path. Then, fully reconfigure meson using `meson configure --clearcache` and `meson setup --reconfigure`.

#### I get errors like "Option not found" after merging one of these branches
The changes to `default_config.json` or similar files weren't detected by meson due to missing regen dependencies. You can either merge the `bugfixes` branch or rebuild from scratch.

#### The video is desynced / Frames don't appear at the right time
This is probably due to the ffms2 seeking bug ([#394](https://github.com/FFMS/ffms2/issues/394)). On Windows, this shouldn't happen anymore. On Linux, you need to install the latest git version of ffms2 - for example the [`ffms2-git`](https://aur.archlinux.org/packages/ffms2-git) AUR package on Arch linux, or just compile it yourself.


# Aegisub

For binaries and general information [see the homepage](http://www.aegisub.org).

The bug tracker can be found at https://github.com/Aegisub/Aegisub/issues.

Support is available on [Discord](https://discord.com/invite/AZaVyPr) or [IRC](irc://irc.rizon.net/aegisub).

## Building Aegisub

### Windows

Prerequisites:

1. Visual Studio (Community edition of any recent version is fine)
2. The June 2010 DirectX SDK (the final release before DirectSound was dropped)
3. Python 3
4. Meson
5. CMake
6. Powershell execution policy set to Unrestricted

There are a few optional dependencies that must be installed and on your PATH:

1. msgfmt, to build the translations
2. InnoSetup, to build the regular installer
3. 7zip, to build the regular installer
4. Moonscript, to build the regular installer

All other dependencies are either stored in the repository or are included as submodules.

Building:

1. Clone Aegisub's repository: `git clone https://github.com/TypesettingTools/Aegisub.git`
2. From the Visual Studio "x64 Native Tools Command Prompt", generate the build directory: `meson build -Ddefault_library=static` (if building for release, add `--buildtype=release`)
3. Build with `cd build` and `ninja`

You should now have a binary: `aegisub.exe`.

Installer:

You can generate the installer with `ninja win-installer` after a successful build. This assumes a working internet connection and installation of the optional dependencies.

You can generate the portable zip with `ninja win-portable` after a successful build.

### OS X

A vaguely recent version of Xcode and the corresponding command-line tools are required.

For personal usage, you can use pip and homebrew to install almost all of Aegisub's dependencies:

    pip3 install meson
    brew install cmake ninja pkg-config  libass boost zlib ffms2 fftw hunspell
    export LDFLAGS="-L/usr/local/opt/icu4c/lib"
    export CPPFLAGS="-I/usr/local/opt/icu4c/include"
    export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig"

Once the dependencies are installed, build Aegisub with `meson build && meson compile -C build`.

#### Build dmg

```bash
meson build_static -Ddefault_library=static -Dbuildtype=debugoptimized -Dbuild_osx_bundle=true -Dlocal_boost=true
meson compile -C build_static
meson test -C build_static --verbose
meson compile osx-bundle -C build_static
meson compile osx-build-dmg -C build_static
```

## Updating Moonscript

From within the Moonscript repository, run `bin/moon bin/splat.moon -l moonscript moonscript/ > bin/moonscript.lua`.
Open the newly created `bin/moonscript.lua`, and within it make the following changes:

1. Prepend the final line of the file, `package.preload["moonscript"]()`, with a `return`, producing `return package.preload["moonscript"]()`.
2. Within the function at `package.preload['moonscript.base']`, remove references to `moon_loader`, `insert_loader`, and `remove_loader`. This means removing their declarations, definitions, and entries in the returned table.
3. Within the function at `package.preload['moonscript']`, remove the line `_with_0.insert_loader()`.

The file is now ready for use, to be placed in `automation/include` within the Aegisub repo.

## License

All files in this repository are licensed under various GPL-compatible BSD-style licenses; see LICENCE and the individual source files for more information.
The official Windows and OS X builds are GPLv2 due to including fftw3.
