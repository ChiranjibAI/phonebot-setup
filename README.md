# 📱 PhoneBot Setup — OpenClaw on Android (Termux + Shizuku)

> **Koi bhi Android phone ko 5 minute mein AI-powered phone controller banao!**

---

## ⚡ Quick Setup — 3 Simple Steps

### Step 1️⃣ → Apps Install Karo (2 minute)

**Termux** (AI environment ke liye):
📥 [F-Droid se Download Karo](https://f-droid.org/en/packages/com.termux/) ← **Yahan se, NOT Play Store!**

**Shizuku** (Phone permissions ke liye):
📥 [GitHub se Download Karo](https://github.com/RikkaApps/Shizuku/releases) ← **Latest release APK**
📥 [Ya Play Store se](https://play.google.com/store/apps/details?id=moe.shizuku.privileged.api)

---

### Step 2️⃣ → Ye Command Do Termux Mein (3 minute)

Termux kholo aur yeh paste karo:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ChiranjibAI/phonebot-setup/main/setup.sh)"
```

---

### Step 3️⃣ → Shizuku Start Karo (30 second)

1. **Shizuku app kholo**
2. **"Start via ADB"** pe tap karo
3. **Done!** ✅

---

## 🎉 That's It! Ab Use Karo:

```bash
# Battery check
bash ~/phone_control.sh battery

# Screen pe kya hai dekho
bash ~/phone_control.sh ui-dump

# App kholo
bash ~/phone_control.sh open-app com.android.settings
```

---

## 📋 Complete Step-by-Step Guide (Har Chhotu Chhotu Step Ke Saath)

### Complete Guide for Beginners — HAR EK STEP SAMJHAAYA HUA

---

### 📲 PHASE 1: Apps Install Karna

#### Step 1.1: Termux Install Karo

```
1. Phone pe Browser kholo
2. Ye link kholo: https://f-droid.org/en/packages/com.termux/
3. "Download" pe tap karo (APK download hoga)
4. Download complete hone ke baad notification se ya Files app se APK kholo
5. "Install" pe tap karo
6. Permission maango toh "Allow" karo
7. Termux icon home screen pe aa jayega ✅
```

> ⚠️ **IMPORTANT:** Play Store se Termux MAT install karo! Woh versionpurana hai aur kaam nahi karega.

---

#### Step 1.2: Shizuku Install Karo

**Tarike 1: Play Store se (Sabse Aasaan)**

```
1. Phone pe Play Store kholo
2. Search mein "Shizuku" likho
3. "Shizuku" app dhundho (Maker: RikkaApps)
4. "Install" pe tap karo
5. Ho gaya! ✅
```

**Tarike 2: GitHub se (Agar Play Store naa kaam kare)**

```
1. Phone pe ye link kholo: https://github.com/RikkaApps/Shizuku/releases
2. "Releases" pe scroll karo
3. Latest version dhundho (jaise v1.x.x)
4. "shizuku-xxx.apk" pe tap karo (download hoga)
5. Download complete hone ke baad APK kholo
6. "Install" pe tap karo
7. Security warning aaye toh "Install anyway" karo
8. Ho gaya! ✅
```

---

#### Step 1.3: Developer Options On Karo (Shizuku ke liye zaroori!)

```
1. Phone ke Settings kholo
2. "About Phone" dhundho aur kholo (saari phones pe same nahi hota, dhundho)
3. "Build Number" dhundho
4. "Build Number" pe 7 BAAR tap karo (rapidly)
5. Message aayega: "You are now a developer!" ya "Developer mode enabled"
6. Ab Settings mein "Developer Options" ya "Developer Mode" aa jayega ✅
```

---

#### Step 1.4: USB Debugging / Wireless Debugging On Karo

```
1. Settings → Developer Options (jo upar banaya) kholo
2. "USB Debugging" dhundho → ON karo
3. "Wireless Debugging" dhundho → ON karo (ya "Wireless ADB" — phone se phone)
4. Confirmation aaye toh "OK" karo
5. Ho gaya! ✅
```

---

### 📦 PHASE 2: Termux Setup (Automatic Script)

#### Step 2.1: Termux Kholo

```
1. Termux app kholo (home screen pe jo icon install kiya tha)
2. Pehli baar kholne mein 1-2 minute lag sakte hain (setup ho raha hai)
3. Command prompt aayega: u0_a40@localhost:~$
```

#### Step 2.2: Setup Script Run Karo

```
1. Ye pura text copy karo:
   
   bash -c "$(curl -fsSL https://raw.githubusercontent.com/ChiranjibAI/phonebot-setup/main/setup.sh)"

2. Termux mein paste karo (long press → paste ya Ctrl+V)

3. Enter dabao

4. Ab dekho — script kaam kar raha hai!
   - Package update hoga (2-3 minute)
   - OpenClaw install hoga
   - phone_control.sh banega
   - Saari setup ho jayegi

5. "🎉 SETUP COMPLETE!" message aane tak wait karo
```

#### Step 2.3: Script Complete Hone Ke Baad

```
Screen pe "SETUP COMPLETE" aaya = Success! ✅

Agar koi ERROR aaye toh:
- Internet connected hai na? (WiFi/Mobile data on karo)
- Phir se command run karo
```

---

### 🔐 PHASE 3: Shizuku Setup (Shizuku Ko Chalana)

#### Step 3.1: Shizuku Ko Pahli Baar Chalana

```
1. Shizuku app kholo (home screen pe)
2. Welcome screen aaye toh "Next" dabaate raho
3. Permissions maange toh "Allow" karo
4. Main screen pe aayega jahan "Start via ADB" likha hoga
```

#### Step 3.2: Shizuku Start Karo — 3 Tarike

**Tareeka A: PC Se (Sabse Aasaan agar PC hai)**

```
PC Requirements:
- Windows/Mac/Linux computer
- ADB install hona chahiye

ADB Install Kaise Kare:
- Windows: https://developer.android.com/studio/releases/platform-tools se zip download karo, extract karo, adb.exe run karo
- Linux: Terminal mein: sudo apt install adb
- Mac: Terminal mein: brew install android-platform-tools

Shizuku Pair Kaise Kare:
1. Phone: Settings → Developer Options → Wireless Debug → ON
2. Phone pe IP address aur PORT note karo (kuch aisa: 192.168.1.100:5555)
3. PC: Terminal/Command Prompt kholo
4. Type karo: adb pair 192.168.1.100:5555 (apna IP dalo)
5. Phone pe pairing code aayega, wo PC pe type karo
6. "Paired successfully" message aayega ✅
7. Phone pe Shizuku app mein "Start via ADB" pe tap karo
8. Ho gaya! Shizuku active hai ✅
```

**Tareeka B: Bina PC Ke — Termux Se (Advanced)**

```
1. Termux kholo
2. Ye commands ek ek karo:

   pkg install -y termux-api

   am start -n moe.shizuku.privileged.api/.MainActivity

3. Shizuku app khulega
4. "Start via Termux" ya "Start via ADB" choose karo
5. Agar "Start via Termux" option hai toh uspe tap karo
6. Done! ✅
```

**Tareeka C: Wireless ADB — Phone Se Phone (Bina PC Ke)**

```
1. Phone: Settings → Developer Options → Wireless Debug → ON
2. IP address aur PORT note karo (192.168.x.x:5555)
3. Same phone pe Termux kholo
4. Ye commands do:

   pkg install -y adb

   adb pair <IP:PORT>
   # Example: adb pair 192.168.1.100:5555

5. Pairing code enter karo jo phone pe aayega
6. Success! ✅
7. Shizuku app → "Start via ADB" → Done! ✅
```

---

### ⚙️ PHASE 4: OpenClaw Setup (AI Ko Connect Karna)

#### Step 4.1: OpenClaw Initial Setup

```
1. Termux kholo (ya agar band hai toh phir se kholo)
2. Ye command do:

   openclaw setup

3. Instructions follow karo:
   - API key maange toh dalo (ya skip karo agar locally chalana hai)
   - Model choose karo
   - Configuration complete

4. Ho gaya! ✅
```

#### Step 4.2: Gateway Start Karo

```
1. Termux mein yeh command do:

   openclaw gateway start

2. "Gateway started" ya success message aayega
3. Ab AI active hai! 🎉
```

#### Step 4.3: Test Karo — Phone Control Kaam Kar Raha Hai?

```
Termux mein yeh commands try karo:

1. Battery check:
   bash ~/phone_control.sh battery
   (Battery % dikhna chahiye)

2. Screen dump:
   bash ~/phone_control.sh ui-dump
   (Screen pe jo elements hain wo dikhe)

3. WiFi toggle:
   bash ~/phone_control.sh wifi off
   bash ~/phone_control.sh wifi on

Agar sab kuch chal raha hai toh MUBARAK! 🎉🎉🎉
```

---

## 🔧 Claw Use App — Kya Hai Aur Kyu Zaroori Hai?

**Claw Use** = Android Accessibility Service based phone control. Ye OpenClaw ko screen elements dekhne aur tap/klik karne ki permission deta hai.

### ⭐ Latest Version: v1.8.0 — 37 Endpoints!

### ⬇️ Download Claw Use

| Method | Link | Steps |
|--------|------|-------|
| **Direct APK (Recommended)** | [claw-use-android-v1.8.0.apk](https://github.com/claw-use/claw-use-android/releases/download/v1.8.0/claw-use-android-v1.8.0.apk) | Download → Install → Enable |
| **All Versions** | [Releases Page](https://github.com/claw-use/claw-use-android/releases) | Historical versions |

### 📋 Claw Use Install Steps — Complete Guide

```
Step 1: APK Download Karo
├── Phone pe browser kholo
├── Ye link paste karo:
│   https://github.com/claw-use/claw-use-android/releases/download/v1.8.0/claw-use-android-v1.8.0.apk
├── "Download" pe tap karo
└── Wait for download complete (~4.2MB)

Step 2: APK Install Karo
├── Download complete hone ke baad notification tap karo
├── Ya Files app → Downloads mein jao
├── "claw-use-android-v1.8.0.apk" pe tap karo
├── "Install" pe tap karo
├── Security warning aaye toh "Install anyway" karo
└── Installation complete hone tak wait karo

Step 3: Unknown Apps Permission Do (Agar zaroorat ho)
├── Settings → Apps → Claw Use kholo
├── "Install unknown apps" ya "Unknown apps" pe tap karo
├── Termux ya Browser choose karo
└── "Allow" ON karo

Step 4: Accessibility Service Enable Karo (ZAROORI!)
├── Settings kholo
├── Search: "Accessibility" ya "Accessibility services"
├── "Accessibility" pe tap karo
├── Claw Use dhundho (apps list mein)
├── Claw Use pe tap karo
├── "Use Claw Use" ya "ON" toggle karo
└── Confirmation maango toh "Allow" karo ✅
```

### 🎯 Claw Use Features (37 Endpoints!)

| Category | Endpoints |
|----------|-----------|
| **Perception** | /screen, /screenshot, /notifications, /screen/state, /info, /status |
| **Action** | /tap, /click, /longpress, /swipe, /scroll, /type, /global, /launch, /intent |
| **Audio** | /tts, /tts/voices, /audio/record |
| **Device I/O** | /clipboard, /camera, /volume, /battery, /wifi, /location, /vibrate, /contacts, /sms, /file |
| **Security** | /screen/wake, /screen/lock, /screen/unlock, /config, /ping |

### 📱 CLI Commands (Termux mein use karo)

```bash
# Install ke baad ye commands available hain:
cua clipboard      # Clipboard read/write
cua camera         # Photo capture  
cua volume         # Volume control
cua battery       # Battery info
cua wifi          # WiFi info
cua location      # GPS location
cua vibrate       # Vibration patterns
cua contacts      # Phone contacts CRUD
cua sms           # SMS read/send
cua file          # File upload/download/list
```

### ⚡ v1.8.0 Highlights

| Feature | Improvement |
|---------|-------------|
| **Speed** | ~50x faster screen parsing (400+ nodes in ~50ms) |
| **New Endpoint** | /screen/fast — lightweight screen state |
| **Verification** | /click, /tap, /swipe with verify=true returns post-action state |
| **Text Matching** | Exact match first, then substring fallback |

### ❓ Claw Use vs Shizuku — Kyu Do Alag Apps?

| | **Shizuku** | **Claw Use** |
|--|-------------|--------------|
| **Purpose** | Root-level shell commands | Screen reading + accessibility actions |
| **Method** | ADB-based | Android Accessibility Service |
| **Use Case** | tap, swipe, shell, battery, wifi | /screen, /click, /type, /notifications |
| **Setup** | ADB pairing (one-time) | Accessibility toggle (one-time) |
| **Together?** | ✅ Best with both! | OpenClaw uses both for full control |

**Recommendation:** Dono install karo — OpenClaw automatically appropriate method use karega.

---

## 🆘 Problem Solving — Common Errors Aur Solutions

### ❌ "rish not found" Error

```
Problem: Shizuku start nahi hai
Solution:
1. Shizuku app kholo
2. "Start via ADB" pe tap karo
3. 30 second wait karo
4. Termux mein phir se try karo
```

### ❌ "permission denied" Error

```
Problem: Shizuku ki permissions expires ho gayi hain
Solution:
1. Shizuku app kholo
2. "Stop" karo (agar running hai)
3. Phir se "Start via ADB" karo
4. Termux mein phir se command try karo
```

### ❌ APK install fail Ho Raha Hai

```
Problem: Claw Use ya koi APK install nahi ho raha
Solution:
1. Settings → Apps → Termux → Permissions → "Install unknown apps" ON
2. Ya directly Play Store/Website se manually install karo
3. Settings → Accessibility → Claw Use → ON (after install)
```

### ❌ "command not found" Error

```
Problem: OpenClaw install nahi hua
Solution:
1. pkg update -y
2. pkg install -y nodejs npm
3. npm install -g openclaw
4. openclaw setup
```

### ❌ Internet Related Errors

```
Problem: Script download fail ho raha hai
Solution:
1. WiFi connected hai na? Mobile data on karo
2. URL check karo: https://raw.githubusercontent.com/...
3. Browser mein yeh link khol ke dekho ki content dikh raha hai ya nahi
```

---

## 📱 All Download Links — Ek Jagah

| App | Download Link | Size | Notes |
|-----|---------------|------|-------|
| **Termux** | [F-Droid](https://f-droid.org/en/packages/com.termux/) | ~200KB | **ZAROORI** - Play Store MAT use karo |
| **Shizuku (GitHub)** | [Releases Page](https://github.com/RikkaApps/Shizuku/releases) | ~5MB | Latest version yahan se |
| **Shizuku (Play Store)** | [Play Store](https://play.google.com/store/apps/details?id=moe.shizuku.privileged.api) | ~5MB | Quick install |
| **ADB Platform Tools** | [Google Official](https://developer.android.com/studio/releases/platform-tools) | ~10MB | PC ke liye |
| **Claw Use** | [Direct APK v1.8.0](https://github.com/claw-use/claw-use-android/releases/download/v1.8.0/claw-use-android-v1.8.0.apk) | ~4.2MB | Accessibility + 37 endpoints |
| **Claw Use (All Releases)** | [Releases Page](https://github.com/claw-use/claw-use-android/releases) | ~4MB each | Version history |

---

## 🏗️ System Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│   📱 USER (Telegram/WhatsApp/Signal)                       │
│         │                                                   │
│         ↓                                                   │
│   🤖 OpenClaw Gateway (AI Brain - Termux mein)              │
│         │                                                   │
│         ↓                                                   │
│   📝 phone_control.sh (Command Script)                      │
│         │                                                   │
│         ↓                                                   │
│   🔐 rish (Shizuku CLI)                                    │
│         │                                                   │
│         ↓                                                   │
│   📲 Android System (Root Access without Root!)           │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Daily use ke liye PC ZAROORI NAHI HAI!**
- Initial pairing ke time PC/ADB ek baar use hota hai
- Baaki sab Termux se hi hota hai

---

## 📂 phone_control.sh — Saare Commands

```bash
# ══════════════════════════════════════════════════════
# BASIC COMMANDS
# ══════════════════════════════════════════════════════

# Screen par tap karo
bash ~/phone_control.sh tap 500 800

# Screen ko swipe/scroll karo  
bash ~/phone_control.sh swipe 500 1500 500 500

# Text type karo
bash ~/phone_control.sh text "Hello World"

# Key press karo
bash ~/phone_control.sh key 4        # Back button
bash ~/phone_control.sh key 3        # Home button
bash ~/phone_control.sh key 66       # Enter button

# ══════════════════════════════════════════════════════
# APPS & URLs
# ══════════════════════════════════════════════════════

# App kholo (package name se)
bash ~/phone_control.sh open-app com.android.settings
bash ~/phone_control.sh open-app com.google.android.youtube
bash ~/phone_control.sh open-app com.whatsapp

# Website kholo
bash ~/phone_control.sh open-url "https://google.com"
bash ~/phone_control.sh open-url "https://youtube.com"

# YouTube pe search karo
bash ~/phone_control.sh youtube-search "coding tutorials"

# ══════════════════════════════════════════════════════
# SYSTEM INFO & CONTROL
# ══════════════════════════════════════════════════════

# Battery status
bash ~/phone_control.sh battery

# WiFi on/off
bash ~/phone_control.sh wifi on
bash ~/phone_control.sh wifi off

# Screenshot lo
bash ~/phone_control.sh screenshot

# Volume control
bash ~/phone_control.sh volume-up
bash ~/phone_control.sh volume-down

# Navigation
bash ~/phone_control.sh home        # Home screen
bash ~/phone_control.sh back        # Back button
bash ~/phone_control.sh recent      # Recent apps

# Screen on (wake up)
bash ~/phone_control.sh screenon

# ══════════════════════════════════════════════════════
# ADVANCED
# ══════════════════════════════════════════════════════

# Screen elements dekho (kya kya clickable hai)
bash ~/phone_control.sh ui-dump

# Direct shell command run karo
bash ~/phone_control.sh shell "ls -la /sdcard"
bash ~/phone_control.sh shell "pm list packages"
bash ~/phone_control.sh shell "getprop ro.product.model"
```

---

## 🎯 Common Use Cases

### 1. WhatsApp Message Bhejna
```bash
bash ~/phone_control.sh open-app com.whatsapp
# WhatsApp khulega, ab AI tap/text se kaam hoga
```

### 2. Settings Mein Janna
```bash
bash ~/phone_control.sh open-app com.android.settings
```

### 3. YouTube Pe Video Dekhna
```bash
bash ~/phone_control.sh youtube-search "relaxing music"
```

### 4. Screenshot Lena
```bash
bash ~/phone_control.sh screenshot
# Screenshot /sdcard/screenshot.png mein save hoga
```

### 5. Phone Model Pata Karna
```bash
bash ~/phone_control.sh shell "getprop ro.product.model"
```

---

## 🔧 Advanced Setup Options

### Telegram Bot Setup (AI se baat karne ke liye)

```bash
# 1. Telegram pe jaao → @BotFather se naya bot banao
# 2. Bot token milegi
# 3. Termux mein:
openclaw configure --section telegram
# 4. Token paste karo
# 5. Ab Telegram se bot se baat kar sakte ho!
```

### Cron Jobs (Automated Tasks)

```bash
# Har din subah 9 baje battery check
openclaw cron add "battery-check" --every "0 9 * * *" --command "bash ~/phone_control.sh battery"
```

---

## 📊 Requirements Summary

| Requirement | Minimum | Recommended |
|-------------|---------|-------------|
| Android Version | 7.0 (Nougat) | 10+ |
| RAM | 2GB | 4GB+ |
| Storage | 500MB free | 2GB+ free |
| Internet | WiFi/Mobile Data | WiFi |
| Extra | - | PC for initial ADB pairing (optional) |

---

## 🌟 Ye Setup Kaise Kaam Aata Hai

```
┌────────────────────────────────────────────────────────────┐
│                                                            │
│  💬 User Telegram pe message bhejta hai:                  │
│     "WhatsApp kholo"                                       │
│                                                            │
│  🤖 OpenClaw (AI) samajhta hai intent                     │
│                                                            │
│  📱 phone_control.sh execute karta hai:                   │
│     open-app com.whatsapp                                 │
│                                                            │
│  🔐 Shizuku permissions deta hai                          │
│                                                            │
│  📲 Android WhatsApp khol deta hai                        │
│                                                            │
│  ✅ User ko result milta hai Telegram pe                  │
│                                                            │
└────────────────────────────────────────────────────────────┘
```

---

## 📜 License

MIT License — Koi bhi use kar sakta hai, modify kar sakta hai, commercial use bhi allowed hai!

---

## 🤝 Contributing

Issues milao, PRs bhejo, documentation improve karo!
- **GitHub Issues:** https://github.com/ChiranjibAI/phonebot-setup/issues
- **Feature Requests:** Yahan se karo

---

## 🔗 Official Links

| Resource | Link |
|----------|------|
| **Shizuku Official** | https://github.com/RikkaApps/Shizuku |
| **Shizuku Docs** | https://shizuku.rikka.app |
| **Termux Official** | https://termux.com |
| **F-Droid** | https://f-droid.org |
| **OpenClaw Docs** | https://docs.openclaw.ai |
| **OpenClaw GitHub** | https://github.com/openclaw/openclaw |
| **Claw Use GitHub** | https://github.com/claw-use/claw-use-android |

---

## ❤️ Credits

- **Shizuku** by [RikkaApps](https://github.com/RikkaApps) — Phone permissions without root
- **Termux** by [TermuxDevs](https://github.com/termux) — Linux environment on Android
- **OpenClaw** by [OpenClaw Team](https://github.com/openclaw) — AI Agent framework
- **Claw Use** by [claw-use](https://github.com/claw-use) — Accessibility automation

---

## 📌 Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | 2024 | Initial release |
| 1.1 | 2026 | Complete guide rewrite, all links updated |

---

**Made with ❤️ for Android Power Users**

**Questions? Issues? → GitHub Issues kholo!**
