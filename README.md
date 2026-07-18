<div align="center">

# 📋 SnapPaste Pro

### Mac-style screenshot paste for Windows terminals

**Press `Ctrl + V` to paste a screenshot straight into your terminal — exactly like macOS.**
Built for **terminal AI coding assistants**: hand a screenshot to your AI in a single keystroke.

[![npm version](https://img.shields.io/npm/v/snappaste-pro?color=cb3837&logo=npm)](https://www.npmjs.com/package/snappaste-pro)
[![npm downloads](https://img.shields.io/npm/dt/snappaste-pro?color=cb3837&logo=npm)](https://www.npmjs.com/package/snappaste-pro)
[![GitHub stars](https://img.shields.io/github/stars/saqibbinshabbir007/snappaste-pro?style=flat&logo=github)](https://github.com/saqibbinshabbir007/snappaste-pro/stargazers)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
![Platform](https://img.shields.io/badge/platform-Windows%2010%20%7C%2011-0078D6?logo=windows)
![No Admin](https://img.shields.io/badge/install-no%20admin-success)

[**Download**](https://github.com/saqibbinshabbir007/snappaste-pro/releases/latest) ·
[**npm**](https://www.npmjs.com/package/snappaste-pro) ·
[**Report a bug**](https://github.com/saqibbinshabbir007/snappaste-pro/issues)

</div>

---

## 🎬 Demo

<p align="center">
  <img src="docs/demo.gif" alt="SnapPaste Pro demo — paste a screenshot into the terminal and the AI reads it" width="100%">
</p>

> A screenshot pasted straight into the terminal with **`Ctrl + V`** — and the AI reads it instantly. That's the whole point. 🎯

---

## 😩 The old way vs ✨ SnapPaste Pro

Every Windows developer knows this pain. Here's what changes:

| 😩 Before (the painful way) | ✨ With SnapPaste Pro |
|---|---|
| 1. Take a screenshot | 1. Take a screenshot |
| 2. Open Snipping Tool / Paint and **save the file** | 2. Press **`Ctrl + V`** |
| 3. **Hunt for the folder** you saved it in | ✅ **Done.** |
| 4. **Drag-and-drop** it, or **type the full path** by hand | |
| 5. Finally hand it to your terminal / AI | |

**5 fiddly steps → 1 keystroke.** No saving, no folder hunting, no drag-and-drop, no typing paths.

---

## ⚡ Quick Start

**For everyone — installer** (no Node.js, no admin):
1. [**Download `SnapPaste-Pro-Setup.exe`**](https://github.com/saqibbinshabbir007/snappaste-pro/releases/latest) → run it → **Next → Next → Finish**
2. Take a screenshot (`Win + Shift + S`) and press `Ctrl + V` in your terminal 🎉

**For developers — npm:**
```bash
npx snappaste-pro install
```

---

## ❓ What it does

On macOS you can paste a screenshot straight into a terminal. On Windows you can't — the
clipboard holds an **image**, but terminals only paste **text**. So `Ctrl + V` does nothing.

**SnapPaste Pro fixes that.** When you press `Ctrl + V` in a terminal:

- 🖼️ **Image on the clipboard** → it's saved as a PNG and its **file path** is pasted automatically.
- 📝 **Text on the clipboard** → normal paste, nothing changes.

**Why it's different:** instead of pasting an image (which terminals can't handle), it pastes a
ready-to-use **file path**. No other mainstream Windows tool does this for terminal AI workflows.

---

## 🤖 Works with any terminal AI

Because SnapPaste Pro drops the screenshot's **file path** into your terminal, any AI assistant
that can read an image path can instantly "see" your screenshot. It's tool-agnostic and works
with every major terminal-based AI coding assistant, including:

| AI assistant | AI assistant |
|---|---|
| 🟣 **Claude Code** (Anthropic) | 🔵 **Gemini CLI** (Google) |
| 🟢 **OpenAI Codex CLI** | 🐙 **GitHub Copilot CLI** |
| 🛠️ **Aider** | 🟠 **Amazon Q Developer CLI** |
| ⬛ **Cursor CLI** (`cursor-agent`) | 🦆 **Goose** (Block) |
| 🧩 **opencode** | 🐲 **Qwen Code** |

…and **any** other terminal/CLI AI that accepts an image file path. One keystroke, and your
AI can see what you see. 👀

---

## ✨ Features

- 🖼️ **Image → path, instantly** — screenshots become a ready-to-use file path.
- 🪶 **Lightweight & clean** — no Python, no extra runtimes; AutoHotkey is bundled.
- 🔒 **No admin required** — installs per-user.
- 🚀 **Auto-start** — runs quietly in the background on login.
- 🎯 **Smart** — only triggers on images; text paste is untouched and just as fast.
- 🧰 **Extra commands** — `pi` (PowerShell) and `pasteimg` (CMD).
- 🌐 **Private & offline** — never sends any data anywhere.

---

## 🚀 Usage

1. Take a screenshot: **`Win + Shift + S`** (select a region).
2. In your terminal, press **`Ctrl + V`**.
3. The image is saved to `Pictures\SnapPaste Pro\` and its path is pasted.

**Extra commands**

| Shell | Command |
|---|---|
| PowerShell | `pi` then `Ctrl + V` |
| Command Prompt | `pasteimg` then `Ctrl + V` |

**Supported terminals:** Windows Terminal, CMD, PowerShell, PowerShell 7 (pwsh), Claude Code, conhost.

---

## 🛠️ How it works

A small bundled [AutoHotkey](https://www.autohotkey.com/) script watches for `Ctrl + V`
in terminal windows. If the clipboard holds an image, it saves it as a PNG, replaces the
clipboard with the file path, and pastes that. If the clipboard holds text, it just pastes
normally. Everything runs locally on your machine.

---

## 📦 Install (details)

### Installer
Download **`SnapPaste-Pro-Setup.exe`** from the [Releases](https://github.com/saqibbinshabbir007/snappaste-pro/releases/latest) page and run it. No admin needed.

> ### ⚠️ "Windows protected your PC" — this is normal, please read
>
> The first time you run the installer, Windows SmartScreen may show a blue
> **"Windows protected your PC"** screen with **"Unknown publisher"**.
>
> **This does _not_ mean the app is unsafe.** It only appears because the app is
> not yet code-signed (a paid certificate we haven't purchased yet). To continue:
>
> 1. Click **More info**
> 2. Click **Run anyway**
>
> That's it — it won't ask again. ✅
>
> **Why you can trust it:** the entire source code is public in this repo, so anyone
> can read exactly what it does. It works fully offline — it never sends any data
> anywhere, doesn't touch your files, and only reacts to `Ctrl + V` inside terminals.

### npm (developers)
```bash
npx snappaste-pro install      # set up and start
npx snappaste-pro status       # show status
npx snappaste-pro start        # start it now
npx snappaste-pro uninstall    # remove completely
```
Requires [Node.js](https://nodejs.org). See it on npm: **https://www.npmjs.com/package/snappaste-pro**

---

## 🔄 Updating

Already installed an older version? Getting the latest is easy — there's nothing to uninstall first.

**npm:**
```bash
npx snappaste-pro@latest install
```
> Tip: include **`@latest`** so npx doesn't reuse a cached older version.

**Installer:** download the newest **`SnapPaste-Pro-Setup.exe`** from the
[Releases](https://github.com/saqibbinshabbir007/snappaste-pro/releases/latest) page and run it —
it upgrades your existing install in place.

---

## 🙋 FAQ

**Is it safe?**
Yes. It's open-source, runs fully offline, sends no data anywhere, doesn't touch your personal
files, and only reacts to `Ctrl + V` inside terminal windows.

**Why does Windows show a SmartScreen warning?**
The installer isn't code-signed yet (signing is a paid certificate). It does **not** mean the
app is harmful — click **More info → Run anyway**.

**Where are my screenshots saved?**
In `…\Pictures\SnapPaste Pro\`, named `screenshot_<timestamp>.png`.

**Does it slow down normal copy/paste?**
No. It only acts when the clipboard contains an image; text paste is unchanged.

---

## 🗺️ Roadmap

- [ ] **Code-signed installer** — remove the SmartScreen warning entirely.
- [ ] **Choose your format** — PNG or JPG, and a configurable save folder.
- [ ] **System-tray settings** — pause/resume, change hotkey, open save folder.
- [ ] **Multi-monitor & high-DPI** polish.
- [ ] **Standalone build** with no bundled runtime.

Have an idea? [Open an issue](https://github.com/saqibbinshabbir007/snappaste-pro/issues) — feedback is welcome!

---

## 🤝 Contributing

Contributions, ideas, and bug reports are all welcome:

- 🐛 Found a bug or have a feature request? [Open an issue](https://github.com/saqibbinshabbir007/snappaste-pro/issues).
- 🔧 Want to improve it? Fork the repo and send a pull request.
- ⭐ Like it? A star helps more developers discover it.

---

## 🗑️ Uninstall

**Settings → Apps → SnapPaste Pro → Uninstall** (or `npx snappaste-pro uninstall`).
It cleanly removes the app, the startup entry, the PATH entry, and the PowerShell profile addition.

---

## 🧱 Build from source

Requirements: [Inno Setup 6](https://jrsoftware.org/isdl.php) and the
[AutoHotkey v2](https://www.autohotkey.com/) runtime (`AutoHotkey64.exe`) placed in `src/`.

```powershell
ISCC.exe SnapPastePro.iss
# Output: Output\SnapPaste-Pro-Setup.exe
```

---

## 📄 License

[MIT](LICENSE) © Saqib Bin Shabbir

> Bundles the [AutoHotkey](https://www.autohotkey.com/) runtime, which is licensed under the GNU GPLv2.

---

<div align="center">

### Built by **Saqib Bin Shabbir**
Full Stack Developer &amp; Agentic AI Specialist

[GitHub](https://github.com/saqibbinshabbir007) ·
[npm](https://www.npmjs.com/package/snappaste-pro) ·
[Issues](https://github.com/saqibbinshabbir007/snappaste-pro/issues)

**If SnapPaste Pro saved you time, please give it a ⭐ — it really helps!**

</div>
