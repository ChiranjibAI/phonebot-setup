# 📱 PhoneBot Setup — OpenClaw on Android (Termux + Shizuku)

> **Turn any Android phone into an AI-powered phone controller in 5 minutes!**

[![Run on Termux](https://img.shields.io/badge/Termux-Ready-000?logo=android)](https://f-droid.org/en/packages/com.termux/)
[![Shizuku](https://img.shields.io/badge/Shizuku-Required-FF5722)](https://github.com/RikkaApps/Shizuku)
[![Claw Use](https://img.shields.io/badge/Claw_Use-Optional-4CAF50)](https://github.com/claw-use/claw-use-android)

---

## ⚡ Quick Setup — 3 Simple Steps

### Step 1️⃣ → Install Apps (2 minutes)

**Termux** (AI environment):
📥 [Download from F-Droid](https://f-droid.org/en/packages/com.termux/) ← **Get it here, NOT from Play Store!**

**Shizuku** (Phone permissions):
📥 [Download from GitHub](https://github.com/RikkaApps/Shizuku/releases) ← **Latest release APK**
📥 [Or from Play Store](https://play.google.com/store/apps/details?id=moe.shizuku.privileged.api)

---

### Step 2️⃣ → Run This Command in Termux (3 minutes)

Open Termux and paste:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ChiranjibAI/phonebot-setup/main/setup.sh)"
```

---

### Step 3️⃣ → Start Shizuku (30 seconds)

```
1. Open Shizuku app
2. Tap "Start via ADB"
3. Done! ✅
```

---

## 🎉 That's It! Now Test It:

```bash
# Check battery
bash ~/phone_control.sh battery

# See what's on screen
bash ~/phone_control.sh ui-dump

# Open an app
bash ~/phone_control.sh open-app com.android.settings
```

---

## 📋 Complete Step-by-Step Guide (For Beginners)

---

### 📲 PHASE 1: Installing Apps

#### Step 1.1: Install Termux

```
1. Open your phone's browser
2. Go to: https://f-droid.org/en/packages/com.termux/
3. Tap "Download"
4. When APK downloads, tap the notification or open Files → Downloads
5. Tap "Install"
6. Grant any permissions asked
7. Termux icon appears on home screen ✅
```

> ⚠️ **IMPORTANT:** Download Termux from F-Droid ONLY! The Play Store version is outdated and won't work.

---

#### Step 1.2: Install Shizuku

**Option A: Play Store (Easiest)**

```
1. Open Play Store on your phone
2. Search for "Shizuku"
3. Find the app by RikkaApps
4. Tap "Install"
5. Done! ✅
```

**Option B: GitHub (If Play Store doesn't work)**

```
1. Open this link in your browser:
   https://github.com/RikkaApps/Shizuku/releases

2. Scroll down to "Releases"

3. Find the latest version (like v13.x.x)

4. Tap "shizuku-xxx.apk" to download

5. When download completes, tap the notification

6. Tap "Install"

7. If security warning appears, tap "Install anyway"
8. Done! ✅
```

---

#### Step 1.3: Enable Developer Options (Required for Shizuku!)

```
1. Open phone Settings

2. Find and tap "About Phone"
   (On some phones: Settings → System → About Phone)

3. Find "Build Number"

4. Tap "Build Number" 7 TIMES rapidly
   (You'll see a message: "You are now a developer!")

5. Go back to Settings main screen

6. Tap "Developer Options" or "Developer Mode"
   (Sometimes under System → Developer Options)
```

---

#### Step 1.4: Enable USB/Wireless Debugging

```
1. In Developer Options (from Step 1.3)

2. Find "USB Debugging" → Turn it ON

3. Find "Wireless Debugging" or "Wireless ADB" → Turn it ON

4. Confirm any warnings with "OK"

5. Done! ✅
```

---

### 📦 PHASE 2: Termux Setup (Automatic Script)

#### Step 2.1: Open Termux

```
1. Tap the Termux icon on your home screen

2. First launch takes 1-2 minutes (initial setup)

3. You'll see a command prompt like:
   u0_a40@localhost:~$
```

#### Step 2.2: Run the Setup Script

```
1. Copy this entire command:
   
   bash -c "$(curl -fsSL https://raw.githubusercontent.com/ChiranjibAI/phonebot-setup/main/setup.sh)"

2. Long-press in Termux → Tap "Paste"
   (Or use Ctrl+V if your keyboard supports it)

3. Press Enter

4. Watch the script work:
   - Updates packages (2-3 minutes)
   - Installs OpenClaw
   - Creates phone_control.sh
   - Sets up workspace files

5. Wait for "🎉 SETUP COMPLETE!" message
```

#### Step 2.3: After Script Finishes

```
Screen shows "SETUP COMPLETE" = Success! ✅

If you see an ERROR:
- Is your internet working? (WiFi/Mobile data on?)
- Try running the command again
```

---

### 🔐 PHASE 3: Shizuku Setup (Starting Shizuku)

#### Step 3.1: First-Time Shizuku Setup

```
1. Open Shizuku app (from home screen or app drawer)

2. If welcome screen appears, tap "Next" through the screens

3. Grant any permissions if asked (Allow)

4. You'll see the main screen with "Start via ADB" option
```

#### Step 3.2: Start Shizuku — 3 Options

**Option A: With a PC (Easiest if you have a computer)**

```
PC Requirements:
- Windows/Mac/Linux computer
- ADB installed on the PC

How to Install ADB:
- Windows: Download from https://developer.android.com/studio/releases/platform-tools
           Extract the zip, find adb.exe
- Linux: Run: sudo apt install adb
- Mac: Run: brew install android-platform-tools

How to Pair Shizuku:
1. On Phone: Settings → Developer Options → Wireless Debug → ON
2. On Phone: Note the IP address and PORT
   (Example: 192.168.1.100:5555)
3. On PC: Open Terminal (Mac/Linux) or Command Prompt (Windows)
4. Type: adb pair 192.168.1.100:5555 (use YOUR IP)
5. Enter the pairing code shown on your phone
6. You should see "Paired successfully"
7. On Phone: In Shizuku app, tap "Start via ADB"
8. Done! Shizuku is now active ✅
```

**Option B: Without a PC — Using Termux (Advanced)**

```
1. Open Termux

2. Run these commands one by one:

   pkg install -y termux-api

   am start -n moe.shizuku.privileged.api/.MainActivity

3. Shizuku app will open

4. Choose "Start via Termux" or "Start via ADB"

5. If the option is available, tap it

6. Done! ✅
```

**Option C: Wireless ADB — Phone to Phone (No PC needed)**

```
1. Phone: Settings → Developer Options → Wireless Debug → ON

2. Note the IP address and PORT (192.168.x.x:5555)

3. Open Termux on the SAME phone

4. Run these commands:

   pkg install -y adb

   adb pair 192.168.1.100:5555 (use YOUR IP)

5. Enter the pairing code shown on screen

6. Success! ✅

7. In Shizuku app, tap "Start via ADB"
8. Done! ✅
```

---

### ⚙️ PHASE 4: OpenClaw Setup (Connecting the AI)

#### Step 4.1: Initial OpenClaw Configuration

```
1. Open Termux (if closed)

2. Run this command:

   openclaw setup

3. Follow the on-screen instructions:
   - May ask for API key (or skip if using local model)
   - Choose your AI model
   - Complete configuration

4. Done! ✅
```

#### Step 4.2: Start the Gateway

```
1. In Termux, run:

   openclaw gateway start

2. You should see "Gateway started" or similar success message

3. The AI is now active! 🎉
```

#### Step 4.3: Test — Is Phone Control Working?

```
Run these commands in Termux to verify everything works:

1. Battery check:
   bash ~/phone_control.sh battery
   (You should see battery percentage)

2. Screen dump:
   bash ~/phone_control.sh ui-dump
   (You should see screen elements listed)

3. WiFi toggle:
   bash ~/phone_control.sh wifi off
   bash ~/phone_control.sh wifi on

If all works: CONGRATULATIONS! 🎉🎉🎉
```

---

## 🔧 Claw Use App — What It Is and Why You Need It

**Claw Use** = Android Accessibility Service for screen reading and tap/click actions. It lets OpenClaw see what's on screen and interact with it.

### ⭐ Latest Version: v1.8.0 — 37 Endpoints!

### ⬇️ Download Claw Use

| Method | Link | Steps |
|--------|------|-------|
| **Direct APK (Recommended)** | [claw-use-android-v1.8.0.apk](https://github.com/claw-use/claw-use-android/releases/download/v1.8.0/claw-use-android-v1.8.0.apk) | Download → Install → Enable |
| **All Versions** | [Releases Page](https://github.com/claw-use/claw-use-android/releases) | Version history |

### 📋 Claw Use Install Steps

```
Step 1: Download the APK
├── Open this link in your browser:
│   https://github.com/claw-use/claw-use-android/releases/download/v1.8.0/claw-use-android-v1.8.0.apk
├── Tap "Download"
└── Wait for download (~4.2MB)

Step 2: Install the APK
├── When download completes, tap the notification
├── Or open Files app → Downloads
├── Tap "claw-use-android-v1.8.0.apk"
├── Tap "Install"
├── If security warning appears, tap "Install anyway"
└── Wait for installation to complete

Step 3: Allow Unknown Apps (If Required)
├── Go to Settings → Apps → Claw Use
├── Tap "Install unknown apps" or "Unknown apps"
├── Select your Browser or Termux
└── Toggle "Allow" ON

Step 4: Enable Accessibility Service (REQUIRED!)
├── Open phone Settings
├── Search for: "Accessibility" or "Accessibility services"
├── Tap "Accessibility"
├── Find "Claw Use" in the apps list
├── Tap on Claw Use
├── Toggle "Use Claw Use" or "ON" switch to ON
├── Confirm with "Allow" if asked
└── Done! ✅
```

### 🎯 Claw Use Features (37 Endpoints!)

| Category | Endpoints |
|----------|-----------|
| **Perception** | /screen, /screenshot, /notifications, /screen/state, /info, /status |
| **Action** | /tap, /click, /longpress, /swipe, /scroll, /type, /global, /launch, /intent |
| **Audio** | /tts, /tts/voices, /audio/record |
| **Device I/O** | /clipboard, /camera, /volume, /battery, /wifi, /location, /vibrate, /contacts, /sms, /file |
| **Security** | /screen/wake, /screen/lock, /screen/unlock, /config, /ping |

### 📱 CLI Commands (Use in Termux after installing)

```bash
# After installing Claw Use, these commands become available:
cua clipboard      # Read/write clipboard
cua camera         # Capture photo
cua volume         # Control volume
cua battery       # Battery information
cua wifi          # WiFi information
cua location      # GPS location
cua vibrate       # Vibration patterns
cua contacts      # Phone contacts CRUD
cua sms           # Read/send SMS
cua file          # File upload/download/list
```

### ⚡ v1.8.0 Highlights

| Feature | Improvement |
|---------|-------------|
| **Speed** | ~50x faster screen parsing (400+ nodes in ~50ms) |
| **New Endpoint** | /screen/fast — lightweight screen state |
| **Verification** | /click, /tap, /swipe with verify=true returns post-action state |
| **Text Matching** | Exact match first, then substring fallback |

### ❓ Claw Use vs Shizuku — Why Both?

| | **Shizuku** | **Claw Use** |
|--|-------------|--------------|
| **Purpose** | Root-level shell commands | Screen reading + accessibility actions |
| **Method** | ADB-based | Android Accessibility Service |
| **Use Case** | tap, swipe, shell, battery, wifi | /screen, /click, /type, /notifications |
| **Setup** | ADB pairing (one-time) | Accessibility toggle (one-time) |
| **Together?** | ✅ Best with both! | OpenClaw uses both for full control |

**Recommendation:** Install both — OpenClaw automatically picks the right method for each task.

---

## 🆘 Troubleshooting — Common Problems and Solutions

### ❌ "rish not found" Error

```
Problem: Shizuku is not running
Solution:
1. Open Shizuku app
2. Tap "Start via ADB"
3. Wait 30 seconds
4. Try your command in Termux again
```

### ❌ "permission denied" Error

```
Problem: Shizuku permissions have expired
Solution:
1. Open Shizuku app
2. Tap "Stop" (if running)
3. Tap "Start via ADB" again
4. Try your command in Termux again
```

### ❌ APK Installation Fails

```
Problem: Can't install Claw Use or other APKs
Solution:
1. Go to Settings → Apps → Termux
2. Tap "Install unknown apps" or "Unknown apps"
3. Turn ON "Allow from this source" for your browser
4. Try downloading and installing again
```

### ❌ "command not found" Error

```
Problem: OpenClaw didn't install properly
Solution:
1. Run: pkg update -y
2. Run: pkg install -y nodejs npm
3. Run: npm install -g openclaw
4. Run: openclaw setup
```

### ❌ Internet/Download Errors

```
Problem: Script download fails
Solution:
1. Is WiFi or mobile data connected?
2. Try opening this link in your browser to verify:
   https://raw.githubusercontent.com/ChiranjibAI/phonebot-setup/main/setup.sh
3. If the link works, try the command again
```

---

## 📱 All Download Links — One Place

| App | Download Link | Size | Notes |
|-----|---------------|------|-------|
| **Termux** | [F-Droid](https://f-droid.org/en/packages/com.termux/) | ~200KB | **REQUIRED** - NOT from Play Store! |
| **Shizuku (GitHub)** | [Releases Page](https://github.com/RikkaApps/Shizuku/releases) | ~5MB | Latest version here |
| **Shizuku (Play Store)** | [Play Store](https://play.google.com/store/apps/details?id=moe.shizuku.privileged.api) | ~5MB | Quick install |
| **Claw Use (Direct APK)** | [v1.8.0 APK](https://github.com/claw-use/claw-use-android/releases/download/v1.8.0/claw-use-android-v1.8.0.apk) | ~4.2MB | Latest stable |
| **Claw Use (All Versions)** | [Releases Page](https://github.com/claw-use/claw-use-android/releases) | ~4MB each | Version history |
| **ADB Platform Tools** | [Google Official](https://developer.android.com/studio/releases/platform-tools) | ~10MB | For PC users |

---

## 🏗️ System Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│   📱 USER (Telegram / WhatsApp / Signal / Discord)         │
│         │                                                   │
│         ↓                                                   │
│   🤖 OpenClaw Gateway (AI Brain - runs in Termux)          │
│         │                                                   │
│         ↓                                                   │
│   📝 phone_control.sh (Command Script)                      │
│         │                                                   │
│         ↓                                                   │
│   🔐 rish (Shizuku CLI) OR Claw Use API                   │
│         │                                                   │
│         ↓                                                   │
│   📲 Android System (Full Phone Control!)                  │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Daily use does NOT require a PC!**
- PC/ADB is only needed for initial Shizuku pairing (once)
- Everything else runs from Termux

---

## 📂 phone_control.sh — All Available Commands

```bash
# ══════════════════════════════════════════════════════
# BASIC SCREEN CONTROLS
# ══════════════════════════════════════════════════════

# Tap at coordinates
bash ~/phone_control.sh tap 500 800

# Swipe/scroll on screen  
bash ~/phone_control.sh swipe 500 1500 500 500

# Type text
bash ~/phone_control.sh text "Hello World"

# Press a key
bash ~/phone_control.sh key 4        # Back button
bash ~/phone_control.sh key 3        # Home button
bash ~/phone_control.sh key 66       # Enter button

# ══════════════════════════════════════════════════════
# APPS & URLs
# ══════════════════════════════════════════════════════

# Open app (by package name)
bash ~/phone_control.sh open-app com.android.settings
bash ~/phone_control.sh open-app com.google.android.youtube
bash ~/phone_control.sh open-app com.whatsapp

# Open website
bash ~/phone_control.sh open-url "https://google.com"
bash ~/phone_control.sh open-url "https://youtube.com"

# Search on YouTube
bash ~/phone_control.sh youtube-search "coding tutorials"

# ══════════════════════════════════════════════════════
# SYSTEM INFO & CONTROL
# ══════════════════════════════════════════════════════

# Battery status
bash ~/phone_control.sh battery

# WiFi on/off
bash ~/phone_control.sh wifi on
bash ~/phone_control.sh wifi off

# Take screenshot
bash ~/phone_control.sh screenshot

# Volume control
bash ~/phone_control.sh volume-up
bash ~/phone_control.sh volume-down

# Navigation
bash ~/phone_control.sh home        # Go to home screen
bash ~/phone_control.sh back        # Press back button
bash ~/phone_control.sh recent      # Open recent apps

# Wake screen
bash ~/phone_control.sh screenon

# ══════════════════════════════════════════════════════
# ADVANCED
# ══════════════════════════════════════════════════════

# See all screen elements (what's clickable/tappable)
bash ~/phone_control.sh ui-dump

# Run any shell command
bash ~/phone_control.sh shell "ls -la /sdcard"
bash ~/phone_control.sh shell "pm list packages"
bash ~/phone_control.sh shell "getprop ro.product.model"
```

---

## 🎯 Common Use Cases

### 1. Open WhatsApp and Send a Message
```bash
bash ~/phone_control.sh open-app com.whatsapp
# WhatsApp opens, then AI can tap/type to send message
```

### 2. Open Phone Settings
```bash
bash ~/phone_control.sh open-app com.android.settings
```

### 3. Search and Play YouTube Video
```bash
bash ~/phone_control.sh youtube-search "relaxing music"
```

### 4. Take a Screenshot
```bash
bash ~/phone_control.sh screenshot
# Saved to /sdcard/screenshot.png
```

### 5. Check Phone Model/Info
```bash
bash ~/phone_control.sh shell "getprop ro.product.model"
bash ~/phone_control.sh shell "getprop ro.android.version"
```

---

## 🔧 Advanced Setup — Telegram Bot

Connect OpenClaw to Telegram for voice/text control:

```bash
# 1. Create a new bot on Telegram
#    - Open Telegram → Search for @BotFather
#    - Send /newbot
#    - Follow instructions
#    - Copy the bot token

# 2. Configure in Termux:
openclaw configure --section telegram

# 3. Paste your bot token when asked

# 4. Now you can chat with your AI bot on Telegram! 🎉
```

---

## 📊 System Requirements

| Requirement | Minimum | Recommended |
|-------------|---------|-------------|
| Android Version | 7.0 (Nougat) | 10+ |
| RAM | 2GB | 4GB+ |
| Storage | 500MB free | 2GB+ free |
| Internet | WiFi/Mobile Data | WiFi |
| Extras | - | PC for initial ADB pairing (optional) |

---

## 🌟 How the System Works

```
┌────────────────────────────────────────────────────────────┐
│                                                            │
│  💬 User sends message on Telegram:                        │
│     "Open WhatsApp"                                        │
│                                                            │
│  🤖 OpenClaw (AI) understands the intent                  │
│                                                            │
│  📱 phone_control.sh executes:                            │
│     open-app com.whatsapp                                 │
│                                                            │
│  🔐 Shizuku/Claw Use provides permissions                │
│                                                            │
│  📲 Android opens WhatsApp                                │
│                                                            │
│  ✅ User gets confirmation on Telegram                    │
│                                                            │
└────────────────────────────────────────────────────────────┘
```

---

## 📜 License

MIT License — Free to use, modify, and commercial use allowed!

---

## 🤝 Contributing

Found a bug? Have a feature request?
- **GitHub Issues:** https://github.com/ChiranjibAI/phonebot-setup/issues

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
| **ADB Platform Tools** | https://developer.android.com/studio/releases/platform-tools |

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

**Questions? Issues? → Open a GitHub Issue!**
