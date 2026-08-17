# SPEARHEADS · Ultimate Gym Game Macro

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/zalken)
[![Discord](https://img.shields.io/badge/Discord-join-5865F2?style=flat-square&logo=discord&logoColor=white)](https://discord.gg/yb3cH2HJmn)
[![AutoHotkey v2](https://img.shields.io/badge/AutoHotkey-v2-334455?style=flat-square)](https://www.autohotkey.com/)
[![Release](https://img.shields.io/github/v/release/defZalken/UGG_Macro?style=flat-square&color=34764C)](https://github.com/defZalken/UGG_Macro/releases)

**AutoHotkey v2 macro for the Roblox game Ultimate Gym Game.** Screen-reading
lifting automation with stamina-driven reps, auto-eating, shaker building and
Discord reporting.

One file. No dependencies. Nothing to install but AutoHotkey.

---

## What it does

- **Lifts indefinitely.** Enters the machine, selects the exercise, reps, leaves,
  repeats while reading stamina off the screen and pacing itself against it.
- **Eats.** Buys chicken at the vendor and eats it, stopping on a count or on
  reaching a bulking phase.
- **Builds shakers.** Creatine, whey and pre-workout with the same
  in-game limitations.
- **Reports.** Discord webhook for session start, progress, personal bests,
  phase changes and failures.
- **Watches itself.** Checks GitHub for a newer release and tells you. Never
  self-updates.

Everything is driven by a custom drawn interface. There is no console, no config file
editing and no popups. Only a transcript file for debugging.
Stats save across instances.

---

## Requirements

- Windows 10 or 11
- [AutoHotkey v2](https://www.autohotkey.com/) (v2.0 or later)
- Roblox, running **windowed or fullscreen**.

---

## Getting started

1. Download the latest release.
2. Run the `.ahk` file (or the compiled `.exe`).
3. Click into Roblox so the game has focus.
4. Walk over to the machine you wanna train at.
5. Select the exercise on the macro's **Lifting** tab.
6. Press either lift key.

The panel opens at the top-right of the game window. Drag it by the top bar.

### Default keys

| Key  | Does                    |
| ---- | ----------------------- |
| `F8` | lift -- **Strength**    |
| `F7` | lift -- **Hypertrophy** |
| `F6` | eat                     |
| `F5` | shaker                  |
| `F9` | quit                    |

All five are reassignable in `Settings` **->** `General` **->** `Keybinds`.
Press the same key again to stop.
Press the *other* lift key mid-run to queue a switch after your current set.

---

## Things worth knowing

**Roblox must be the focused window.** The macro cannot run in the background
or while you are in another program. This is the game's behavior,
not a limitation of the macro.

**The macro never moves your mouse.** Reps are clicks wherever the cursor
already sits. Put in somewhere that isn't in the way and leave it there.

**The panel cannot take focus.** Clicking it will not interrupt a running
session. Intentional, as a stray click on a normal window would take focus
away from Roblox and break whatever was running.

**Don't cover the HUD with the panel.** The macro reads the composited desktop,
so anything sitting over the stamina bar reads its own pixels and returns nonsense.
The macro automatically watches for this and will outline the blocked region with a red
outline and warn you on the top bar. After 3 sets, if the reader is still blocked it will ping you
on Discord if the Webhook is set up.
The default position is chosen to avoid it.

---

## Troubleshooting

| Symptom                                         | Try                                                                                                                                                                      |
| ----------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Nothing happens when you press a key            | Click into the game first. ROBLOX must be focused                                                                                                                        |
| `ROBLOX NOT FOUND` in the top bar               | The game is not running; it rechecks every 8 seconds                                                                                                                     |
| It refuses to start, mentioning the stamina row | Stand still with a full stamina bar and try again                                                                                                                        |
| A reader is reported blocked                    | Move the panel off the game's HUD                                                                                                                                        |
| Reps seem to be missed                          | Check the cursor is over the game window                                                                                                                                 |
| Navigation is not turning on                    | Check if navigation is enabled in ROBLOX.<br>If it is, the macro uses `\` by default,<br>if you use a different one, you can<br>change it in `Settings` **->** `General` |

`Ctrl+Shift+D` produces a self-test dump with all the important information:
client size, every region it reads and what each reader currently sees.
If something is wrong, that output is the fastest way to find out why. Report it to `def.zalken`.

---

## Documentation

[**ARCHITECTURE.md**](documentation/ARCHITECTURE.md) explains how it works and why: the
coordinate model, the screen readers, how it recognises digits, and a section of
field notes on the bugs that shaped the design. It is written to be readable
without knowing the codebase.

---

## Credits

Built by **def.zalken** for **SPEARHEADS**.

Every macro is permitted in Ultimate Gym Game.
This one is offered as-is as a community macro; use it at your own discretion.
