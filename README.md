# 🕵️ Find Traitor Pro - GMod Gamemode!

Ein intensiver Action-Gamemode für Garry's Mod, bei dem Vertrauen Luxus ist. Überlebe als Innocent gegen NPCs und entlarve die Verräter in deinen eigenen Reihen.

## 🌟 Kern-Features!

*   **Automatisches Rollensystem:** Teilt Spieler in **Innocents** und **Traitors** ein (skaliert dynamisch: 1 Traitor bei 4 Spielern, 2 bei 10, 3 bei 20).
*   **Spawn-Sicherheitszone:** Ein 10-Meter-Radius um den Spawn schützt Spieler und NPCs vor jeglichem PVP-Schaden.
*   **Dynamischer Spielstart:** Die Runde beginnt automatisch, sobald sich mindestens 4 Spieler außerhalb der Schutzzone befinden.
*   **NPC-Invasion:** Bei Spielbeginn spawnen 15 feindliche NPCs (Skin: 1720614156), die gezielt Jagd auf die Innocents machen.
*   **Waffen-Rotation:** Alle 15 Minuten spawnen 15 Pistolen an zufälligen Orten auf der Map neu.
*   **Wirtschaftssystem:** Verdiene **50$** für das Eliminieren eines Traitors. Nutze `!shop`, um eine Shotgun oder Spezial-Items zu kaufen.
*   **Persistent Stats:** Die Anzahl deiner Rundensiege wird dauerhaft gespeichert und über deinem Kopf angezeigt.

## 🎮 Spielregeln.


| Rolle | Ziel |
| :--- | :--- |
| **Innocent** | Überlebe und eliminiere den Traitor oder alle NPCs. |
| **Traitor** | Eliminiere alle Innocents. Nutze die NPCs als Ablenkung! |

*   **Siegbedingung:** Innocents gewinnen, wenn der Traitor stirbt oder alle 15 NPCs eliminiert wurden.
*   **Respawn:** Gekillte Innocents respawnen sofort, verlieren aber ihre aktuelle Bewaffnung.

## 🛠️ Installation & Commands

1. Kopiere den Ordner `find-traitor-pro` in dein `garrysmod/gamemodes/` Verzeichnis.
2. Starte deinen Server mit dem Parameter `-gamemode find-traitor-pro`.

### Chat-Befehle
*   `!shop` – Öffnet den Ausrüstungsshop (Shotgun: 100$).
*   `!start` – (Admin only) Erzwingt einen sofortigen Rundenstart.

## ⚙️ Konfiguration
Alle wichtigen Werte wie Skin-Pfade, Preise und Radien findest du in:
`gamemodes/find-traitor-pro/gamemode/modules/sh_config.lua`

---
**Lizenz:** MIT  
**Entwickelt für:** Garry's Mod Community
