#!/data/data/com.termux/files/usr/bin/bash
#===============================================================
# PhoneBot Setup — OpenClaw + Phone Control (Termux + Shizuku)
# Run: bash ~/phonebot-setup.sh
# GitHub: https://github.com/ChiranjibAI/phonebot-setup
#===============================================================

set -e

# Colors
BOLD='\033[1m'; GREEN='\033[0;32m'; RED='\033[0;31m'; YELLOW='\033[0;33m'; BLUE='\033[0;34m'; NC='\033[0m'
p() { echo -e "${1}${2}${NC}"; }

# ════════════════════════════════════════════════════════════════
# ⚠️  MANUAL STEPS (YOU MUST DO THESE FIRST)
# ════════════════════════════════════════════════════════════════
p "$BOLD$BLUE" ""
p "$BOLD$BLUE" "╔═══════════════════════════════════════════════════════╗"
p "$BOLD$BLUE" "║  ⚠️  MANUAL SETUP REQUIRED (Do these first!)          ║"
p "$BOLD$BLUE" "╚═══════════════════════════════════════════════════════╝"
p "$BOLD$YELLOW" ""
p "$BOLD$YELLOW" "1. SHIZUKU (Required for phone control):"
p "$YELLOW" "   • Download: https://github.com/RikkaApps/Shizuku/releases"
p "$YELLOW" "   • Or: Play Store - search 'Shizuku' by RikkaApps"
p "$YELLOW" "   • Open Shizuku app → tap 'Start via ADB'"
p "$YELLOW" "   • If PC available: adb pair <IP:PORT>"
p "$YELLOW" "   • Verify: rish -c 'echo OK'     (OK = success)"
p "$YELLOW" ""
p "$BOLD$YELLOW" "2. CLAW USE (Optional - for accessibility features):"
p "$YELLOW" "   • Download: https://github.com/claw-use/claw-use-android/releases"
p "$YELLOW" "   • Install APK, then: Settings → Accessibility → Claw Use → ON"
p "$YELLOW" ""
p "$BOLD$RED" "⚠️  WITHOUT SHIZUKU, phone control will NOT work!"
p "" ""

# ════════════════════════════════════════════════════════════════
# AUTOMATIC STEPS
# ════════════════════════════════════════════════════════════════
p "$BOLD$GREEN" "╔═══════════════════════════════════════════════════════╗"
p "$BOLD$GREEN" "║  ✅ AUTOMATIC SETUP (This script does everything)    ║"
p "$BOLD$GREEN" "╚═══════════════════════════════════════════════════════╝"

# Step 1: Detect Termux
p "$BOLD" "[1/8] Checking Termux..." 
[ -d "/data/data/com.termux/files" ] || { p "$RED" "❌ Not running in Termux. Please use Termux!"; exit 1; }
p "$GREEN" "   ✅ Termux detected"

# Step 2: Update packages
p "$BOLD" "[2/8] Updating packages..." 
pkg update -y >/dev/null 2>&1 && p "$GREEN" "   ✅ Packages updated" || p "$RED" "   ❌ Update failed"

# Step 3: Install dependencies
p "$BOLD" "[3/8] Installing nodejs, git, curl, wget, openssh, termux-api..." 
pkg install -y nodejs git curl wget openssh termux-api >/dev/null 2>&1 && p "$GREEN" "   ✅ Dependencies installed" || p "$RED" "   ❌ Install failed"

# Step 4: Install OpenClaw
p "$BOLD" "[4/8] Installing OpenClaw..." 
npm install -g openclaw >/dev/null 2>&1 && p "$GREEN" "   ✅ OpenClaw installed ($(openclaw --version 2>/dev/null || echo 'v?'))" || p "$RED" "   ❌ OpenClaw install failed"

# Step 5: Verify Shizuku
p "$BOLD" "[5/8] Checking Shizuku..." 
if command -v rish >/dev/null 2>&1 && rish -c "echo OK" >/dev/null 2>&1; then
    p "$GREEN" "   ✅ Shizuku is ACTIVE (phone control ready!)"
else
    p "$RED" "   ❌ Shizuku not found. See MANUAL STEPS above!"
fi

# Step 6: Create phone_control.sh
p "$BOLD" "[6/8] Creating phone_control.sh..." 
cat > "$HOME/phone_control.sh" << 'PHONEEOF'
#!/data/data/com.termux/files/usr/bin/bash
CMD="$1"; shift
run_cmd() {
    if command -v rish &>/dev/null; then rish -c "$@"
    elif command -v adb &>/dev/null && adb get-state 1>/dev/null 2>&1; then adb shell "$@"
    elif command -v su &>/dev/null; then su -c "$@"
    else echo "❌ Start Shizuku first: rish -c 'echo OK'"; exit 1; fi
}
case "$CMD" in
  screenshot) run_cmd "screencap -p '${1:-/sdcard/screenshot.png}'" ;;
  open-app) run_cmd "monkey -p $1 -c android.intent.category.LAUNCHER 1" 2>/dev/null ;;
  youtube-search) QUERY=$(echo "$*" | sed 's/ /+/g'); run_cmd "am start -a android.intent.action.VIEW -d 'https://www.youtube.com/results?search_query=$QUERY'" ;;
  open-url) run_cmd "am start -a android.intent.action.VIEW -d '$1'" ;;
  wifi) [ "$1" = "on" ] && run_cmd "svc wifi enable" || run_cmd "svc wifi disable" ;;
  battery) run_cmd "dumpsys battery" | grep "level" ;;
  tap) run_cmd "input tap $1 $2" ;;
  swipe) run_cmd "input swipe $1 $2 $3 $4 ${5:-500}" ;;
  text) run_cmd "input text '$*'" ;;
  key) run_cmd "input keyevent $1" ;;
  home) run_cmd "input keyevent 3" ;;
  back) run_cmd "input keyevent 4" ;;
  recent) run_cmd "input keyevent 187" ;;
  power) run_cmd "input keyevent 26" ;;
  volume-up) run_cmd "input keyevent 24" ;;
  volume-down) run_cmd "input keyevent 25" ;;
  screenon) run_cmd "input keyevent 224" ;;
  ui-dump)
    run_cmd "uiautomator dump /sdcard/window_dump.xml" 2>/dev/null
    node -e "const fs=require('fs');const xml=fs.readFileSync('/sdcard/window_dump.xml','utf8');const r=/(?:text|content-desc)=\\\"([^\\\"]+)\\\"[^>]*bounds=\\\"(\\\[[0-9]+,[0-9]+\\\\]\\\[[0-9]+,[0-9]+\\\])\\\"/g;let m;while((m=r.exec(xml))!==null)if(m[1].trim())console.log(m[2],m[1])" 2>/dev/null || echo "UI dump failed"
    ;;
  shell) run_cmd "$*" ;;
  *) echo "Usage: phone_control.sh [screenshot|open-app|open-url|tap|swipe|text|key|home|back|recent|power|volume|battery|ui-dump|shell]"
esac
PHONEEOF
chmod +x "$HOME/phone_control.sh"
p "$GREEN" "   ✅ phone_control.sh created"

# Step 7: Try installing Claw Use APK
p "$BOLD" "[7/8] Claw Use APK..." 
CLAW_APK="/sdcard/claw-use-android.apk"
if [ -f "$CLAW_APK" ]; then
    p "$YELLOW" "   ⚠️  APK exists, attempting install..."
    (pm install -r "$CLAW_APK" >/dev/null 2>&1 && p "$GREEN" "   ✅ Claw Use installed!" || p "$RED"   "   ❌ APK install failed (manual: Settings→Accessibility→Claw Use→ON)")
else
    p "$YELLOW"   "   ⚠️  APK not found. Download from: https://github.com/claw-use/claw-use-android/releases"
fi

# Step 8: Setup workspace
p "$BOLD" "[8/8] Setting up workspace..." 
mkdir -p "$HOME/.openclaw/workspace/memory"
cat > "$HOME/.openclaw/workspace/IDENTITY.md" << 'EOF'
# IDENTITY.md
- **Name:** PhoneBot
- **Role:** Autonomous AI Agent on Android via Termux + Shizuku + OpenClaw
- **Capabilities:** Full phone UI control, shell commands, app management, web search, messaging
EOF
cat > "$HOME/.openclaw/workspace/SOUL.md" << 'EOF'
# SOUL.md
Be genuinely helpful, not performatively helpful. Have opinions. Be resourceful before asking.
EOF
cat > "$HOME/.openclaw/workspace/AGENTS.md" << 'EOF'
# AGENTS.md
Execute terminal commands directly. Chain tool calls until goal is 100% achieved. NEVER stop after one tool call.
EOF
cat > "$HOME/.openclaw/workspace/TOOLS.md" << 'EOF'
# TOOLS.md
Use ~/phone_control.sh for all phone control: tap, swipe, text, key, open-app, screenshot, ui-dump, shell, battery, wifi
EOF
cat > "$HOME/.openclaw/workspace/HEARTBEAT.md" << 'EOF'
# HEARTBEAT.md
# Empty — no periodic checks configured
EOF
p "$GREEN" "   ✅ Workspace ready"

# ════════════════════════════════════════════════════════════════
# FINISH
# ════════════════════════════════════════════════════════════════
p "$BOLD$GREEN" ""
p "$BOLD$GREEN" "╔═══════════════════════════════════════════════════════╗"
p "$BOLD$GREEN" "║  🎉 SETUP COMPLETE!                                 ║"
p "$BOLD$GREEN" "╚═══════════════════════════════════════════════════════╝"
p "" ""
p "$BOLD" "NEXT STEPS:"
p "$GREEN"   "1. Verify Shizuku: rish -c 'echo Shizuku OK'"
p "$GREEN"   "2. Setup OpenClaw: openclaw setup"
p "$GREEN"   "3. Start Gateway: openclaw gateway start"
p "$GREEN"   "4. Test phone control: bash ~/phone_control.sh battery"
p "" ""
p "$BOLD$YELLOW" "DOCUMENTATION:"
p "$YELLOW"   "• Full Guide: https://github.com/ChiranjibAI/phonebot-setup"
p "$YELLOW"   "• Claw Use: https://github.com/claw-use/claw-use-android"
p "$YELLOW"   "• Shizuku: https://github.com/RikkaApps/Shizuku"
p "" ""
