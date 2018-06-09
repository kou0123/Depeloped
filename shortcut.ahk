#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;========vk1Dsc07B(無変換)===========
; ---十字キーの設定、enter backspace------
vk1Dsc07B & i::Send,{Blind}{Up}
vk1Dsc07B & j::Send,{Blind}{Left}
vk1Dsc07B & k::Send,{Blind}{Down}
vk1Dsc07B & l::Send,{Blind}{Right}
vk1Dsc07B & u::Send,{Blind}{BS}
vk1Dsc07B & o::Send,{Blind}{ENTER}

; ---- テキスト編集系------
vk1Dsc07B & w::Send,{Blind}{End}+{Home}{BS}
vk1Dsc07B & r::Send,{Blind}{End}+{Home}^{c}
vk1Dsc07B & e::Send,{Blind}{End}+{Home}^{x}
vk1Dsc07B & s::Send,{Blind}+{home}
vk1Dsc07B & f::Send,{Blind}+{End}
vk1Dsc07B & c::Send,{Blind}{End}+{home}
vk1Dsc07B & d::Send,{Blind}{End}{Enter}

;「無変換+上段キー」でファンクションキーの動作をさせる
vk1Dsc07B & 1::Send,{Blind}{F1}
vk1Dsc07B & 2::Send,{Blind}{F2}
vk1Dsc07B & 3::Send,{Blind}{F3}
vk1Dsc07B & 4::Send,{Blind}{F4}
vk1Dsc07B & 5::Send,{Blind}{F5}
vk1Dsc07B & 6::Send,{Blind}{F6}
vk1Dsc07B & 7::Send,{Blind}{F7}
vk1Dsc07B & 8::Send,{Blind}{F8}
vk1Dsc07B & 9::Send,{Blind}{F9}
vk1Dsc07B & 0::Send,{Blind}{F10}
vk1Dsc07B & -::Send,{Blind}{F11}
vk1Dsc07B & ^::Send,{Blind}{F12}
vk1Dsc07B & g::Send,{Blind}^{PgUp}
vk1Dsc07B & h::Send,{Blind}^{PgDn}

;========vk1Csc079(変換)===========

;選択系の設定
vk1Csc079 & o::Send,{Blind}^{Tab}
vk1Csc079 & u::Send,{Blind}^+{Tab}
vk1Csc079 & l::AltTab
vk1Csc079 & j::ShiftAltTab
vk1Csc079 & n::Send,{Blind}!{Left}
vk1Csc079 & ,::Send,{Blind}!{Right}
vk1Csc079 & i::Send,{Blind}#{Up}
vk1Csc079 & k::Send,{Blind}#{Down}
vk1Csc079 & y::Send,{Blind}{del}
vk1Dsc07B & vk1Csc079::Send,{Blind}{vkF3sc029}
vk1Csc079 & .::Send,{Blind}{AppsKey}
vk1Csc079 & q::Send,{Blind}{ESC}

;sandSの設定
Space Up:: Send, % "{Shift Up}" (A_TimeSincePriorHotkey < 200 ? " " : "")
+Space:: Send, +{Space}
Space:: RShift