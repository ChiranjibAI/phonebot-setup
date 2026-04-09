# 📱 PhoneBot Setup — OpenClaw on Android (Termux + Shizuku)

> One-command setup to turn any Android phone into an AI-powered phone controller using OpenClaw + Termux + Shizuku.

---

## ⚡ Quick Setup (2 commands)

```bash
# Step 1: Shizuku setup (MANUAL - required)
# → Play Store se "Shizuku" install karo
# → Shizuku app kholo → "Start via ADB" tap karo
# → PC pe: adb pair <IP:PORT>

# Step 2: Ye ek command se sab ho jayega:
bash -c "$(curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/phonebot-setup/main/setup.sh)"
```

Ya directly Termux mein yeh run karo:
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/phonebot-setup/main/setup.sh)"
```

---

## 🔧 Requirements

| Requirement | Type | Notes |
|-------------|------|-------|
| **Termux** | Mandatory | [F-Droid](https://f-droid.org/) se install karo (Play Store version nahi) |
| **Shizuku** | Mandatory | Play Store se install + ADB pairing |
| **ADB** | For Shizuku | PC pe install hona chahiye |
| **OpenClaw** | Auto-installed | Script kar dega |

---

## 📋 Manual Steps (Cannot be automated)

### 1. Shizuku Setup

```
1. Play Store → "Shizuku" install karo
2. Shizuku app kholo
3. "Start via ADB" pe tap karo
4. PC pe terminal kholo aur yeh commands do:
   
   adb pair <IP:PORT>
   # PORT usually 5555 ya jo screen pe dikhe
   
   adb shell
   # Verify: rish -c 'echo OK'
   # Agar "OK" aaya toh Shizuku ready hai!
```

### 2. Claw Use App (Optional)

Accessibility features ke liye:
- APK automatically install hoga (script try karega)
- Agar fail ho toh: `Settings → Accessibility → Claw Use → ON`

---

## ✅ What the Script Does (Automatic)

- [x] Termux packages update
- [x] nodejs, git, curl, wget, openssh, termux-api install
- [x] OpenClaw npm install
- [x] phone_control.sh create (Shizuku-based phone control script)
- [x] Workspace files setup (IDENTITY.md, SOUL.md, AGENTS.md, TOOLS.md)
- [x] Claw Use APK install (try)

---

## 🚀 After Setup

```bash
# 1. Verify Shizuku
rish -c 'echo Shizuku OK'

# 2. OpenClaw setup
openclaw setup

# 3. Gateway start
openclaw gateway start

# 4. Test phone control
bash ~/phone_control.sh battery
bash ~/phone_control.sh ui-dump
```

---

## 📱 phone_control.sh Commands

| Command | Description |
|---------|-------------|
| `bash ~/phone_control.sh battery` | Battery status |
| `bash ~/phone_control.sh wifi on/off` | WiFi toggle |
| `bash ~/phone_control.sh open-app com.android.settings` | Open app |
| `bash ~/phone_control.sh open-url "https://google.com"` | Open URL |
| `bash ~/phone_control.sh tap 500 800` | Tap coordinates |
| `bash ~/phone_control.sh swipe 500 1500 500 500` | Swipe |
| `bash ~/phone_control.sh text "Hello"` | Type text |
| `bash ~/phone_control.sh key 4` | Send keyevent (4=back, 3=home, 66=enter) |
| `bash ~/phone_control.sh home` | Go home |
| `bash ~/phone_control.sh back` | Press back |
| `bash ~/phone_control.sh screenshot` | Screenshot |
| `bash ~/phone_control.sh ui-dump` | Read screen UI elements |
| `bash ~/phone_control.sh shell "command"` | Run shell command |

---

## 🔒 How It Works

```
User → Telegram/WhatsApp → OpenClaw Gateway → phone_control.sh → Shizuku (rish) → Android System
```

- **Shizuku** = Root-level permissions bina root ke (ADB-based)
- **rish** = Shizuku ka command-line tool
- **phone_control.sh** = Wrapper jo rish/adb/su use karke phone control kare

---

## 🆘 Troubleshooting

| Problem | Solution |
|---------|----------|
| `rish not found` | Shizuku app kholo → "Start via ADB" again |
| `permission denied` | Shizuku ki permissions re-grant karo |
| APK install failed | Manual: Settings → Accessibility → Claw Use → ON |
| phone_control.sh fail | Pehle `rish -c 'echo OK'` verify karo |

---

## 📂 Files

```
setup.sh              # Main setup script
README.md             # This file
phone_control.sh      # Auto-created by setup (not in repo)
```

---

## 🌐 Connect

Built with [OpenClaw](https://github.com/openclaw/openclaw) + [Shizuku](https://shizuku.rikka.app/)

Questions? Issues? → Open a GitHub Issue!
