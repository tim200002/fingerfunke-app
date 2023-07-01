# Changelog 

## 0.9.1

### Bug Fixes
- Nicer Design for Notification Bulb

### Features

### Miscellaneous



## 0.9.0

### Bug Fixes

### Features
- show Notifcation badges with unread messages and posts

### Miscellaneous



## 0.8.0

### Bug Fixes

### Features
- Implement new filters for feed. Users can now decide whether to filter by event date or by newest.
- Implement first version of push notifications

### Miscellaneous



## 0.7.0

### Bug Fixes
- remove "beigetreten" button when I am part of posts

### Features
- add possibility to report chat message

### Miscellaneous



## 0.6.0

### Bug Fixes

### Features
- Possibility to upload images videos and pdfs with events. However, there might be some bugs here and there.

### Miscellaneous
- New way to handle caching



## 0.5.6

### Bug Fixes
- Mehr Padding für Keyboard beim Chat

### Features

### Miscellaneous
- Datenbank Restrukturierung. Es gibt jetzt ein festes Feld für das main asset und nicht länger so ein komisches Array, wo wir einfach das erste Element nehmen. Das Array können wir gerne für weitere Assets verwenden (weiterer Bilder, PDFs, ...) aber da das main Asset ja pflicht is, ergibt es für mich so deutlich mehr sinn.
- Teilnahmen und meine Posts wurden restrukturiert, so dass es keine Duplikate mehr geben sollte. All meine posts sind in meine Posts, und nur mosts an denen ich Teil genomemen habe, die nicht aber meine sind, sind bei Teilnahmen



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