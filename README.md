# 📱 PhoneBot Setup — OpenClaw on Android (Termux + Shizuku)

> **Ek command se koi bhi Android phone ko AI-powered phone controller banao!**

[![Run on Termux](https://img.shields.io/badge/Termux-Ready-000?logo=android)](https://f-droid.org/en/packages/com.termux/)
[![Shizuku](https://img.shields.io/badge/Shizuku-Required-FF5722)](https://play.google.com/store/apps/details?id=moe.shizuku.privileged.api)

---

## ⚡ One-Command Setup (Bas 2 minute)

### Step 1: Pehle ye apps install karo (Manual)

| App | Kahan se | Kyu zaroori? |
|-----|----------|-------------|
| **Termux** | [F-Droid](https://f-droid.org/en/packages/com.termux/) (NOT Play Store) | OpenClaw yahan chalega |
| **Shizuku** | [Play Store](https://play.google.com/store/apps/details?id=moe.shizuku.privileged.api) | Phone control ke liye permissions |
| **Shizuku (F-Droid backup)** | [GitHub](https://github.com/Shizuku/wrapper-box/releases) | Agar Play Store na mile toh |

> ⚠️ **Important:** Termux F-Droid se install karo, Play Store wala nahi. Play Store version outdated hai!

### Step 2: Termux kholo aur yeh ek command do

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ChiranjibAI/phonebot-setup/main/setup.sh)"
```

### Step 3: Shizuku start karo (Manual)

```
1. Shizuku app kholo
2. "Start via ADB" pe tap karo
3. Agar PC hai toh: adb pair <IP:PORT>
   Ya "Start via wireless ADB" use karo (Termux se: am start -n moe.shizuku.privileged.api/.MainActivity)
```

---

## 📋 Complete Setup Flow

```
┌─────────────────────────────────────────────────────────────┐
│  1. Apps Install karo (2-3 min)                            │
│     ├── Termux (F-Droid)                                    │
│     └── Shizuku (Play Store)                               │
├─────────────────────────────────────────────────────────────┤
│  2. Termux mein yeh command do (5 min)                      │
│     └── bash -c "$(curl ... )"                            │
│         ├── Packages update                                 │
│         ├── OpenClaw install                               │
│         ├── phone_control.sh create                        │
│         └── Workspace setup                                │
├─────────────────────────────────────────────────────────────┤
│  3. Shizuku start karo (1 min)                             │
│     ├── Shizuku app → Start via ADB                        │
│     └── Wireless ya PC se pair karo                        │
├─────────────────────────────────────────────────────────────┤
│  4. OpenClaw configure karo aur enjoy!                     │
│     └── openclaw setup                                     │
│     └── openclaw gateway start                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 🔧 What This Script Does (Automatic)

- ✅ Termux packages update
- ✅ nodejs, git, curl, wget, openssh, termux-api install
- ✅ OpenClaw npm install
- ✅ `phone_control.sh` script create (phone control ke liye)
- ✅ Workspace files setup
- ✅ Claw Use APK install (try)

---

## 📱 phone_control.sh — Available Commands

```bash
# Screen Control
bash ~/phone_control.sh tap 500 800        # Tap karna
bash ~/phone_control.sh swipe 500 1500 500 500  # Scroll/swipe
bash ~/phone_control.sh text "Hello"      # Text type karo
bash ~/phone_control.sh key 4             # Key press (4=back, 3=home)

# Apps & URLs
bash ~/phone_control.sh open-app com.android.settings  # App kholo
bash ~/phone_control.sh open-url "https://google.com"  # Website kholo

# System Info
bash ~/phone_control.sh battery           # Battery check
bash ~/phone_control.sh wifi on           # WiFi on
bash ~/phone_control.sh wifi off          # WiFi off
bash ~/phone_control.sh screenshot        # Screenshot lo

# Advanced
bash ~/phone_control.sh ui-dump           # Screen elements dekho
bash ~/phone_control.sh shell "ls -la"    # Shell command run karo
bash ~/phone_control.sh home              # Home button
bash ~/phone_control.sh back               # Back button
```

---

## 🔑 Shizuku Setup — Detailed Guide

### Option A: PC se ADB Pair (Sabse Aasaan)

```
1. PC pe ADB tools install karo
   - Windows: https://developer.android.com/studio/releases/platform-tools
   - Linux: sudo apt install adb
   - Mac: brew install adb

2. Phone → Settings → About Phone → Build Number pe 7 baar tap karo (Developer Mode on)

3. Phone → Settings → Developer Options → Wireless Debug ON karo

4. PC pe yeh command do:
   adb pair <IP:PORT>

5. Shizuku app kholo → "Start via ADB" → Pairing code do
```

### Option B: Termux se Shizuku Start (PC-free)

```bash
# Termux mein yeh karo:
pkg install -y termux-api

# Shizuku app kholo aur "Start via Termux" choose karo
# Ya directly yeh command do:
am start -n moe.shizuku.privileged.api/.MainActivity
```

### Option C: Wireless ADB ( bina wire ke)

```
1. Phone → Settings → Developer Options → Wireless Debug ON
2. IP address aur PORT note karo (192.168.x.x:5555)
3. PC ya Phone se connect karo:
   adb connect <IP:PORT>
4. Shizuku → Start via ADB
```

---

## 🚀 After Setup — Getting Started

```bash
# 1. Verify Shizuku (OK aana chahiye)
rish -c 'echo Shizuku OK'

# 2. OpenClaw setup (instructions follow karo)
openclaw setup

# 3. Gateway start karo
openclaw gateway start

# 4. Test karo
bash ~/phone_control.sh battery

# 5. UI elements dekho (kya kya screen pe hai)
bash ~/phone_control.sh ui-dump
```

---

## 🆘 Troubleshooting

| Problem | Solution |
|---------|----------|
| `rish not found` | Shizuku app kholo → Start via ADB again |
| `permission denied` | Shizuku ki pairing expires ho sakti hai → re-pair karo |
| Termux update fail | `pkg update` manually run karo |
| OpenClaw install fail | `npm install -g openclaw` manually try karo |
| APK install fail | Manual: Settings → Accessibility → Claw Use → ON |

---

## 📦 All Download Links (One Place)

| App | Download Link | Notes |
|-----|---------------|-------|
| **Termux** | [F-Droid](https://f-droid.org/en/packages/com.termux/) | Play Store MATLAB! |
| **Shizuku** | [Play Store](https://play.google.com/store/apps/details?id=moe.shizuku.privileged.api) | Main app |
| **Shizuku Alt** | [GitHub Releases](https://github.com/Shizuku/wrapper-box/releases) | Backup download |
| **OpenClaw** | [npm](https://www.npmjs.com/package/openclaw) | Auto-install hoga |
| **ADB Platform Tools** | [Google](https://developer.android.com/studio/releases/platform-tools) | PC ke liye |
| **Claw Use (Optional)** | [GitHub](https://github.com/claw-use/claw-use-android/releases) | Accessibility features |

---

## 🏗️ Architecture — Kaise Kaam Karta Hai

```
┌──────────────────────────────────────────────────────────────┐
│                                                              │
│   Telegram / WhatsApp / Signal                              │
│         ↓                                                    │
│   OpenClaw Gateway (AI Brain)                                │
│         ↓                                                    │
│   phone_control.sh (Command Runner)                          │
│         ↓                                                    │
│   rish (Shizuku CLI)                                         │
│         ↓                                                    │
│   Android System (Root-level Control)                        │
│                                                              │
└──────────────────────────────────────────────────────────────┘
```

**No PC needed for daily use!** 
- Initial setup mein PC/ADB for Shizuku pairing
- Baaki sab Termux se hi hoga

---

## 📂 Repo Structure

```
phonebot-setup/
├── setup.sh       # Main setup script (one-liner runnable)
└── README.md      # Yeh documentation
```

---

## 🌟 Features

- 📱 **Full Phone Control** — Tap, swipe, type, open apps, screenshots
- 🤖 **AI-Powered** — OpenClaw brain handles natural language
- 💬 **Multi-Platform** — Telegram, WhatsApp, Signal, Discord
- 🔒 **Secure** — Shizuku gives precise permissions only
- ⚡ **Fast** — Local processing, no cloud dependency for control
- 🌍 **Open Source** — MIT License

---

## 📜 License

MIT License — koi bhi use kar sakta hai, modify kar sakta hai!

---

## 🤝 Contributing

Issues aur PRs welcome hain!
[GitHub Issues](https://github.com/ChiranjibAI/phonebot-setup/issues)

---

## 🔗 Quick Links

- [OpenClaw Docs](https://docs.openclaw.ai)
- [Shizuku Official](https://shizuku.rikka.app)
- [Termux Official](https://termux.com)
- [OpenClaw GitHub](https://github.com/openclaw/openclaw)

---

**Made with ❤️ for Android power users**
