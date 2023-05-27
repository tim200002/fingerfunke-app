# Changelog 

## 0.5.5

### Bug Fixes
- Feed wird nicht geupdated wenn Filter verändert wird

### Features

### Miscellaneous
- Großer Änderung für unseren Feed. Es gibt jetzt keinen Filter mehr für alte Feed, stattdessen started man immer bei den neuen Posts kann jetzt aber (paginiert) in beide Richtungen scrollen. Das ganze braucht natürlich noch ein bisschen testing, also bittet testet es!



## 0.5.4

### Bug Fixes
- Chat-Funktion bei einem Event ist für jeden einsehbar. Wäre es besser es so einzustellen, dass es nur für Teilnehmende einzusehen ist?
- Beim Aufnehmen eines Videos für den Post, bleibt nach dem runterzählen ein grauer Streifen auf der linken Seite.

### Features

### Miscellaneous



## 0.5.3

### Bug Fixes
- Buffer Overflow in Chat beim Keyboard (Input ist jetzt in Safe Area gewrapped)
- Videos sollten jetzt ohne Audio gezeigt werden (bitte jemand testen)

### Features

### Miscellaneous
- Better Pagination. Creation of Pagination and Widget are separated again. This allws me to prefetch chat messages.



## 0.5.2

### Bug Fixes

### Features

### Miscellaneous
- Setup full CI/CD setup for automatic releases to firebase app distribution



## 0.5.1

### Bug Fixes
- Post bleibt nach Löschen weiterhin im Thread
- Standort auf Karte aussuchen funktioniert nicht. Wo eine Karte erscheinen sollte, erscheint alles grau (besonders unterwegs, im Zug...etc)
- Neue Posts erscheinen nicht im Feed ohne Neu-Laden der App
- Rückmeldungen an Entwickler-Team können nicht abgeschickt werden

### Features
- Neue Pagination mit Firestore Native Library

### Miscellaneous
- Worked on CI/CD pipeline