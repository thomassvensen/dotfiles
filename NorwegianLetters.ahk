#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
~::<
\::`
^[::a
!^a::å
!^o::ø
+!^o::Ø
!^;::æ
!^j::
    send {Down}
return
!^k::
    send {Up}
return
!^h::
    send {Left}
return
!^l::
    send {Right}
return
^Space:: WinSet, AlwaysOnTop, ,A
