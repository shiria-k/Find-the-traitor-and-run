# 🕵️ Find Traitor Pro - Garry's Mod Gamemode

Ein spannender Sandbox-basierter Gamemode, bei dem Verräter unter den Unschuldigen entlarvt werden müssen, während NPCs die Map unsicher machen.

## 🚀 Features

*   **Rollen-System:** Automatische Verteilung von Traitor- und Innocent-Rollen (skaliert mit Spieleranzahl).
*   **Spawn-Schutz:** 10 Meter Sicherheitszone um den Spawn (kein PVP/NPC-Schaden).
*   **Automatischer Start:** Das Spiel beginnt, sobald 4 Spieler den Spawn-Bereich verlassen.
*   **NPC-Bedrohung:** 15 feindliche NPCs spawnen bei Spielbeginn und jagen gezielt die Innocents.
*   **Waffensystem:** Alle 3 Minuten spawnen 15 Pistolen an zufälligen Orten neu.
*   **Wirtschaftssystem:** Verdiene Geld durch das Eliminieren von Traitoren und kaufe Ausrüstung im Shop.
*   **Statistiken:** Die Anzahl deiner Siege wird direkt über deinem Kopf für andere sichtbar angezeigt.

## 🎮 Spielregeln

1.  **Innocents:** Überlebe die NPCs und finde heraus, wer der Traitor ist. Du gewinnst, wenn alle Traitor tot sind oder alle NPCs besiegt wurden.
2.  **Traitor:** Eliminiere alle Innocents, ohne entlarvt zu werden. Nutze die NPCs als Ablenkung!
3.  **Respawn:** Innocents respawnen sofort, verlieren aber ihre Waffen.

## 🛠 Installation

1. Lade den Ordner `find-traitor-pro` in dein GMod `gamemodes/` Verzeichnis.
2. Stelle sicher, dass die benötigten Addons (Skins) abonniert sind.
3. Setze in deiner Server-Config oder per Konsole: `gamemode find-traitor-pro`.

## ⌨️ Commands


| Command | Beschreibung | Berechtigung |
| :--- | :--- | :--- |
| `!shop` | Öffnet das Kaufmenü (Shotgun: 100$) | Alle |
| `!start` | Startet die Runde sofort manuell | Admin |

## ⚙️ Konfiguration

Die wichtigsten Einstellungen (Preise, Skin-Modelle, Timer) findest du in der Datei:
`gamemodes/find-traitor-pro/gamemode/modules/sh_config.lua`

---
*Erstellt für die GMod Community. Lizenz: MIT.*
