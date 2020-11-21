; Copyright (c) 2007-2009, Niels Martin Hansen
;
; Redistribution and use in source and binary forms, with or without
; modification, are permitted provided that the following conditions are met:
;
;   * Redistributions of source code must retain the above copyright notice,
;     this list of conditions and the following disclaimer.
;   * Redistributions in binary form must reproduce the above copyright notice,
;     this list of conditions and the following disclaimer in the documentation
;     and/or other materials provided with the distribution.
;   * Neither the name of the Aegisub Group nor the names of its contributors
;     may be used to endorse or promote products derived from this software
;     without specific prior written permission.
;
; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
; ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
; LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
; CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
; SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
; CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
; ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
; POSSIBILITY OF SUCH DAMAGE.
;
; -----------------------------------------------------------------------------
;
; AEGISUB
;
; Website: http://www.aegisub.org/
; Contact: mailto:nielsm@indvikleren.dk
;

[Components]
Name: "main"; Description: "Main Files"; Types: full compact custom; Flags: fixed
Name: "macros"; Description: "Automation Scripts"; Types: full
Name: "macros\bundled"; Description: "Bundled macros"; Types: full
Name: "macros\demos"; Description: "Example macros/Demos"; Types: full
#ifdef DEPCTRL
Name: "macros\modules"; Description: "Modules"; Types: full
Name: "macros\modules\depctrl"; Description: "DependencyControl"; Types: full
Name: "macros\modules\yutils"; Description: "YUtils"; Types: full
Name: "macros\modules\luajson"; Description: "LuaJSON"; Types: full
#endif
Name: "dictionaries"; Description: "Spellcheck Dictionaries"; Types: full
Name: "dictionaries\en_US"; Description: "English (US)"; Types: full
Name: "translations"; Description: "Aegisub Translations"; Types: full
Name: "fonts"; Description: "Bundled fonts"; Types: full

[Tasks]
Name: "startmenuicon"; Description: "{cm:StartMenuIcon}"; GroupDescription: "{cm:AdditionalIcons}"
Name: "checkforupdates"; Description: "{cm:CheckForUpdates}"; GroupDescription: "{cm:UpdatesGroup}"

[Files]
; main
DestDir: {app}; Source: install\bin\aegisub{#ARCH}.exe; Flags: ignoreversion; Components: main
DestDir: {app}; Source: license.txt; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libwinpthread-1.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libwinpthread-1.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libgcc_s_seh-1.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libstdc++-6.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libass-9.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libffms2-4.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libfftw3-3.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libiconv-2.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libicuin67.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libicuuc67.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libopenal-1.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\wxbase30u_gcc_custom.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\wxbase30u_xml_gcc_custom.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\wxmsw30u_adv_gcc_custom.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\wxmsw30u_core_gcc_custom.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\wxmsw30u_gl_gcc_custom.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\wxmsw30u_stc_gcc_custom.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\zlib1.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libwinpthread-1.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libgcc_s_seh-1.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libstdc++-6.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libass-9.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libffms2-4.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libfftw3-3.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libiconv-2.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libicuin67.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libicuuc67.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\wxbase30u_gcc_custom.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libopenal-1.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\wxbase30u_xml_gcc_custom.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\wxmsw30u_adv_gcc_custom.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\wxmsw30u_core_gcc_custom.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\wxmsw30u_gl_gcc_custom.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\wxmsw30u_stc_gcc_custom.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\zlib1.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libfontconfig-1.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libfreetype-6.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libfribidi-0.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libharfbuzz-0.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\avcodec-58.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\avformat-58.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\avutil-56.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\swresample-3.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\swscale-5.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\wxmsw30u_stc_gcc_custom.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libexpat-1.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libjpeg-8.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libpng16-16.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libtiff-5.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libopenjp2-7.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libbrotlidec.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libintl-8.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libbz2-1.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libgraphite2.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libglib-2.0-0.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libaom.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libcelt0-2.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libdav1d.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libmp3lame-0.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\liblzma-5.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libmfx-1.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libmp3lame-0.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libopencore-amrnb-0.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libopencore-amrwb-0.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libmp3lame-0.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libopus-0.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libspeex-1.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libtheoradec-1.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libtheoraenc-1.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libvorbis-0.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libvorbisenc-2.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libvpx-1.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libwavpack-1.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libwebp-7.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libwebpmux-3.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libx264-159.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\wxmsw30u_stc_gcc_custom.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libopenjp2-7.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libbluray-2.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libgnutls-30.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libmodplug-1.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\librtmp-1.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libsrt.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libxml2-2.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libvulkan-1.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libzstd.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libbrotlicommon.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libmp3lame-0.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libmp3lame-0.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libgmp-10.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libhogweed-6.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libidn2-0.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libnettle-8.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libp11-kit-0.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libtasn1-6.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\wxmsw30u_stc_gcc_custom.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libmp3lame-0.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\wxmsw30u_stc_gcc_custom.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libicudt67.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libmp3lame-0.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libopenjp2-7.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libx265.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\xvidcore.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libpcre-1.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libogg-0.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libunistring-2.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libffi-7.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libgsm.dll; Flags: ignoreversion; Components: main
DestDir: {app}; Source: libs\libcrypto-1_1-x64.dll; Flags: ignoreversion; Components: main

[Icons]
Name: {commonprograms}\Aegisub; Filename: {app}\aegisub{#ARCH}.exe; WorkingDir: {app}; IconIndex: 0; Tasks: startmenuicon; Comment: Create and edit subtitle files

[Registry]
; Register in App Paths so the user can conveniently enter 'aegisub' in their Run box
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\aegisub{#ARCH}.exe"; ValueType: string; ValueName: ""; ValueData: "{app}\aegisub{#ARCH}.exe"; Flags: uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\aegisub.exe"; ValueType: string; ValueName: ""; ValueData: "{app}\aegisub{#ARCH}.exe"; Flags: uninsdeletekey

[Run]
Filename: {app}\aegisub{#ARCH}.exe; Description: {cm:LaunchProgram,Aegisub}; Flags: nowait postinstall skipifsilent

[InstallDelete]
Type: files; Name: "{app}\ffms2_64.dll"
Type: files; Name: "{app}\ffms2_32.dll"
