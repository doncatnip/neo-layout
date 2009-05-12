TrayAktivieren() {
  global
  menu,tray,icon,%ResourceFolder%\neo_enabled.ico,,1
  menu,tray,nostandard
  menu,tray,add,�ffnen,open
    menu,helpmenu,add,About,about
    menu,helpmenu,add,Autohotkey-Hilfe,help
    menu,helpmenu,add
    menu,helpmenu,add,http://autohotkey.com/,autohotkey
    menu,helpmenu,add,http://www.neo-layout.org/,neo
  menu,tray,add,Hilfe,:helpmenu
  menu,tray,add
  menu,tray,add,%disable%,togglesuspend
  menu,tray,add
  menu,tray,add,Bearbeiten,edit
  menu,tray,add,Neu Laden,reload
  menu,tray,add
  menu,tray,add,Nicht im Systray anzeigen,hide
  menu,tray,add,%name% beenden, exitprogram
  menu,tray,default,%disable%
  menu,tray,tip,%name%

  return

help:
  Run, %A_WinDir%\hh mk:@MSITStore:autohotkey.chm
return

togglesuspend:
  Traytogglesuspend()
return

about:
  msgbox, 64, %name%  Ergonomische Tastaturbelegung, 
  (
  %name% 
  `nDas Neo-Layout ersetzt das �bliche deutsche 
  Tastaturlayout mit der Alternative Neo, 
  beschrieben auf http://neo-layout.org/. 
  `nDazu sind keine Administratorrechte n�tig. 
  `nWenn Autohotkey aktiviert ist, werden alle Tastendrucke 
  abgefangen und statt dessen eine �bersetzung weitergeschickt. 
  `nDies geschieht transparent f�r den Anwender, 
  es muss nichts installiert werden. 
  `nDie Zeichen�bersetzung kann leicht �ber das Icon im 
  Systemtray deaktiviert werden.  `n
  )
return

neo:
  run http://neo-layout.org/
return

autohotkey:
  run http://autohotkey.com/
return

open:
  ListLines ; shows the Autohotkey window
return

edit:
  edit
return

reload:
  Reload
return

hide:
  menu, tray, noicon
return

exitprogram:
  SetNumLockState, %SavedNumLockState%
  exitapp
return

}

Traytogglesuspend() {
  global
  if A_IsSuspended {
    menu, tray, rename, %enable%, %disable%
    menu, tray, tip, %name%
    menu, tray, icon, %ResourceFolder%\neo_enabled.ico,,1
    SaveNumLockState()
    SetNumLockState Off
    suspend, off ; Schaltet Suspend aus -> NEO
  } else {
    menu, tray, rename, %disable%, %enable%
    menu, tray, tip, %name% : Deaktiviert
    menu, tray, icon, %ResourceFolder%\neo_disabled.ico,,1
    SetNumLockState, %SavedNumLockState%
    suspend, on  ; Schaltet Suspend ein -> QWERTZ
  }
}

TrayAktivieren()
