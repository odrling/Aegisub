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

#define BUILD_GIT_VERSION_STRING "Japan7 0.9"
#define INSTALLER_VERSION 1

#define CURRENT_YEAR GetDateTimeString('yyyy', '', '');

[Setup]
AppName=Aegisub
AppVerName=Aegisub {#BUILD_GIT_VERSION_STRING}
AppVersion={#INSTALLER_VERSION}
AppPublisher=Aegisub Team
AppPublisherURL=http://www.aegisub.org/
AppSupportURL=https://github.com/TypesettingTools/Aegisub/issues
AppCopyright=2005-{#CURRENT_YEAR} The Aegisub Team
VersionInfoVersion={#INSTALLER_VERSION}
DefaultGroupName=Aegisub
AllowNoIcons=true
OutputDir=output
Compression=lzma/ultra64
SolidCompression=true
MinVersion=0,6.0
ShowLanguageDialog=yes
LanguageDetectionMethod=none
DisableProgramGroupPage=yes
UsePreviousGroup=yes
UsePreviousSetupType=no
UsePreviousAppDir=yes
UsePreviousTasks=no
UninstallDisplayIcon={app}\aegisub{#ARCH}.exe
; Default to a large welcome bitmap, suitable for large fonts
; The normal fonts version is selected by code below
WizardImageFile=welcome-large.bmp
WizardSmallImageFile=aegisub-large.bmp

OutputBaseFilename=Aegisub-Japan7-x64
VersionInfoDescription=Aegisub {#BUILD_GIT_VERSION_STRING} x64

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "ca"; MessagesFile: "compiler:Languages\Catalan.isl"
Name: "cz"; MessagesFile: "compiler:Languages\Czech.isl"
Name: "da"; MessagesFile: "compiler:Languages\Danish.isl"
Name: "de"; MessagesFile: "compiler:Languages\German.isl"
Name: "es"; MessagesFile: "compiler:Languages\Spanish.isl"
Name: "fi"; MessagesFile: "compiler:Languages\Finnish.isl"
Name: "fr_FR"; MessagesFile: "compiler:Languages\French.isl"
Name: "it"; MessagesFile: "compiler:Languages\Italian.isl"
Name: "ja"; MessagesFile: "compiler:Languages\Japanese.isl"
Name: "nl"; MessagesFile: "compiler:Languages\Dutch.isl"
Name: "pl"; MessagesFile: "compiler:Languages\Polish.isl"
Name: "pt_BR"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"
Name: "pt_PT"; MessagesFile: "compiler:Languages\Portuguese.isl"
Name: "ru"; MessagesFile: "compiler:Languages\Russian.isl"
Name: "uk_UA"; MessagesFile: "compiler:Languages\Ukrainian.isl"

[Files]
; small bitmaps (used by beautify code)
DestDir: {tmp}; Flags: dontcopy; Source: welcome.bmp
DestDir: {tmp}; Flags: dontcopy; Source: aegisub.bmp
; uninstall data (used by migration code)
DestDir: {tmp}; Flags: dontcopy; Source: legacy_filelist.txt
DestDir: {tmp}; Flags: dontcopy; Source: legacy_dirlist.txt
DestDir: {tmp}; Flags: dontcopy; Source: legacy_locales.txt
DestDir: {tmp}; Flags: dontcopy; Source: legacy_shortcutlist.txt
DestDir: {tmp}; Flags: dontcopy; Source: old_filelist.txt
DestDir: {tmp}; Flags: dontcopy; Source: old_dirlist.txt
DestDir: {tmp}; Flags: dontcopy; Source: old_locales.txt
DestDir: {tmp}; Flags: dontcopy; Source: old_shortcutlist.txt
