# Left Behind - Stubbhult (Persistent Survival Scenario)

This repository contains the **Left Behind - Stubbhult** mission for **Arma 3**. It is a multiplayer-first, persistent-leaning survival scenario built around faction conflict, mutant threats, scavenging, and player progression systems.

## Scenario Overview
Left Behind on Stubbhult combines several systems into a single sandbox:
- Dynamic human faction spawning and roaming AI encounters.
- Multiple mutant/zombie spawners and ambient hostile activity.
- Loot spawning for world scavenging and containers.
- Trader-driven economy with buy/sell actions, tasks, and rewards.
- Survival mechanics (hydration, nutrition, sanity, radiation, temperature).
- Ritual powers and faction-themed abilities.
- Base setup support using ACE Fortify plus anti-cleanup flag protection.

## Core Systems Included
- **AI Spawners**: faction patrols, hunting groups, wandering groups, and encounter logic.
- **Mutants**: numerous creature spawners (e.g., Wendigo, Goliath, Vampire, Snatcher, Tank variants).
- **Economy**: trader menus, item purchasing/selling, ammo interactions, and trader-linked tasks.
- **Ambient Survival**: weather pressure, random encounters, food/water interactions, sanitation and sanity loops.
- **Ritual Framework**: Wanderer, Greek, and Pig ritual power sets.
- **Money System**: player-variable based currency flow initialized on mission start.

## Gameplay Notes
- New players are configured through spawn/respawn scripts and faction gear checks.
- Traders provide gear access and progression routes through missions and item conversion.
- Use **ACE Self Interaction → Scenario Actions** to place a protection flag for base persistence radius behavior.
- Review the in-game **Briefing/Diary** entries for survival and base-building instructions.

## Repository Layout (high level)
- `AISpawners/` - faction and mutant spawn frameworks.
- `Ambient/` - environmental/survival mechanics and random world behavior.
- `Economy System/` - traders, economy actions, and mission/task hooks.
- `LootSystem/` - loot crate/ground loot population logic.
- `ritualPowers/` - ritual progression and ability scripts.
- Root init files (`init.sqf`, `initServer.sqf`, `initPlayerLocal.sqf`) wire systems together.

---
If you are adapting this scenario for a dedicated server, keep your mission PBO and server modpack in sync after every script or addon dependency change.
