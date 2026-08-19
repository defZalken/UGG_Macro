#Requires AutoHotkey v2.0
#SingleInstance Force

;  SPEARHEADS  ·  Ultimate Gym Game Macro  ·  v3.1.2
;  Ground-up rebuild.  Author: def.zalken

try DllCall("SetProcessDpiAwarenessContext", "Ptr", -4)   ; PER_MONITOR_AWARE_V2
catch {
    try DllCall("Shcore\SetProcessDpiAwareness", "Int", 2)
    catch
        try DllCall("User32\SetProcessDPIAware")
}

SetWorkingDir A_ScriptDir
ListLines False
KeyHistory 0
ProcessSetPriority "High"
CoordMode "Mouse", "Screen"
Persistent

class BUILD {
    static VERSION  := "3.1.2"
    static PHASE    := "core"
    static CREW     := "SPEARHEADS"
    static AUTHOR   := "def.zalken"
}

class CFG {

    static ROBLOX_EXES := ["RobloxPlayerBeta.exe", "Windows10Universal.exe"]

    static KEY_LIFT_STR   := "F8"
    static KEY_LIFT_HYP   := "F7"
    static KEY_EAT        := "F6"
    static KEY_SHAKER     := "F5"
    static KEY_QUIT       := "F9"
    static KEY_STEP       := "F10"
    static KEY_PROMPT     := "e"

    static KEY_NAV        := "{vkDC}"
    static KEY_NAV_NAME   := "\"
    static KEY_DOWN       := "{Down}"
    static KEY_ENTER      := "{Enter}"
    static KEY_EXIT_LIFT  := "{Space}"
    static KEY_LEFT       := "{Left}"
    static KEY_RIGHT      := "{Right}"
    static KEY_UP         := "{Up}"

    static NAV_SETTLE_MS  := 120

    static NAV_STEP_MS    := 60

    static NAV_COMMIT_MS  := 160
    static AW_MENU_MS     := 220

    static GAME_MODE      => Engine.mode

    static TICK_MS        := 15
    static NAV_GAP_MS     := 10
    static TAP_MS         := 30
    static TRASH_HOLD_MS  := 1000

    static PROMPT_MS      := 200

    static PROMPT_WAIT_MS := 900
    static LIFT_ENTER_MS  := 470
    static LIFT_WAIT_MS   := 2200
    static CYCLE_OUT_MS   := 570
    static STAM_FULL_MS   := 6000

    static EXIT_SETTLE_MS     := 350

    static ABS_SETTLE_MS      := 2200

    static ABS_SETTLE_SINGLE  := 850

    static ENTRY_SETTLE_MS    := 300

    static STAM_FULL_PCT    := 0.97
    static STAM_SINGLE_GATE := 0.40
    static STAM_MARGIN      := 1.10

    static BADGE_TOL      := 30
    static BADGE_MIN_PCT  := 0.06

    static CALIB_B_MIN      := 12

    static CALIB_B_MAX      := 320
    static CALIB_MAX_SCALE  := 2.6

    static CALIB_SAT_MIN    := 45

    static CALIB_SAT_PCT    := 0.55

    static STAM_SEARCH_PX   := 5

    static STAM_LOCK_MIN    := 0.60
    static STAM_LABEL_MAX   := 40

    static STAM_INSET       := 6

    static PX_LABEL_MIN := 170
    static PX_EMPTY_MAX := 70

    static STAM_DRIVEN    := true
    static REP_GAP_MS     := 60
    static REP_RUNAWAY    := 24

    static EAT_TARGET     := 10
    static EAT_STOP_PHASE := ""

    static EAT_STOP_MODE  := "count"
    static EAT_BUY_MS     := 700

    static EAT_CLICK_MS   := 550

    static EAT_FREE_MS    := 550
    static EAT_INSTANT    := false
    static EAT_SLOTS      := 9

    static EAT_SLOT_KEYS  := ["2","3","4","5","6","7","8","9","0"]
    static EAT_EQUIP_MS   := 160

    static EAT_SLOT_ADV   := true

    static EAT_START_AT   := 3

    static EAT_SLOT_MARGIN := 2

    static EAT_FREE_GUARD_MS := 320

    static EAT_SWEEP_MAX  := 3

    static SHK_STEP_MS    := 110
    static SHK_MENU_MS    := 280
    static SHK_CREATINE   := 0
    static SHK_WHEY       := 0
    static SHK_PREWORK    := 0
    static SHK_SLOTS      := 7
    static SHK_EQUIP_MS   := 300
    static SHK_LIFT_AFTER := false

    static IRONMAN := false

    static KOFI_URL    := "https://ko-fi.com/zalken"
    static DISCORD_URL := "https://discord.gg/yb3cH2HJmn"

    static LIFT_SPEED_PASS := false

    static REPO         := "defZalken/UGG_Macro"
    static RELEASES_API := "https://api.github.com/repos/defZalken/UGG_Macro/releases/latest"
    static RELEASES_URL := "https://github.com/defZalken/UGG_Macro/releases"
    static HTTP_TIMEOUT := 6000

    static WEBHOOK_URL   := ""
    static WEBHOOK_NAME  := "SPEARHEADS"
    static WEBHOOK_EVERY := 25
    static DISCORD_ID    := ""
    static PING_PHASE    := true
    static PING_FAIL     := true

    static EMBED_FIELD_MAX := 1024
    static EMBED_DESC_MAX  := 4096

    static STATS_PATH := A_AppData "\UGGMacro\stats.ini"

    static HMAC_KEY := "SPEARHEADS-UGG-v3-stats"

    static GLYPH_W        := 8
    static GLYPH_H        := 12

    static GLYPH_MAXDIST_PCT := 0.20

    static GLYPH_MARGIN_PCT  := 0.05
    static GLYPH_MINW     := 2
    static GLYPH_SPLITW   := 13
    static GLYPH_MAXSPLIT := 3

    static GLYPH_MAXDIGITS := 4
    static GLYPH_WORDGAP   := 4

    static TPL_PATH       := A_AppData "\UGGMacro\templates.ini"

    static DATA_DIR       := A_AppData "\UGGMacro"
    static LOG_PATH       := A_AppData "\UGGMacro\transcript.txt"
    static SELFTEST_PATH  := A_AppData "\UGGMacro\selftest.txt"
    static CAPTURE_DIR    := A_AppData "\UGGMacro\captures"
    static EXPORT_PATH    := A_AppData "\UGGMacro\templates_export.txt"
    static CFG_PATH       := A_AppData "\UGGMacro\settings.ini"

    static CFG_VERSION    := 2

    static NOREAD_MENU_MS    := 700
    static NOREAD_LIFT_MS    := 1200

    static NOREAD_REGEN_MS   := 7750

    static NOREAD_SET_REPS   := Map("Hypertrophy", 7, "Strength", 4)

    static NOREAD_RESYNC_SETS := 12

    static NOREAD_REP_MS      := 2600
    static NOREAD_REP_FAST_MS := 1750

    static GATE_TIMEOUT_MS   := 15000
    static PROMPT_RETRIES    := 3

    static SOFT_RETRIES      := 1

    static MENU_CONFIRMS     := 2

    static START_SETTLE_MS   := 400
    static AW_RETRIES        := 3
    static AW_CONFIRM_MS     := 300

    static REP_READ_MS       := 240

    static REP_RETRIES       := 20
    static REP_RETRY_FAST_MS := 300
    static REP_MIN_DELTA     := 0.05
    static DISCONNECT_EVERY  := 40

    static CLIENT_CHECK_MS   := 8000

    static READER_DEGRADE_AFTER := 3
}

class Keys {
    static ORDER := ["lift.str", "lift.hyp", "eat", "shaker", "quit"]
    static bound := []

    static Label(id) =>
        (id = "lift.str") ? "LIFT - STRENGTH"
      : (id = "lift.hyp") ? "LIFT - HYPERTROPHY"
      : (id = "eat")      ? "EAT"
      : (id = "shaker")   ? "SHAKER" : "QUIT"

    static Show(id) => StrUpper(this.Get(id))

    static Get(id) =>
        (id = "lift.str") ? CFG.KEY_LIFT_STR
      : (id = "lift.hyp") ? CFG.KEY_LIFT_HYP
      : (id = "eat")      ? CFG.KEY_EAT
      : (id = "shaker")   ? CFG.KEY_SHAKER : CFG.KEY_QUIT

    static Set(id, key) {
        switch id {
            case "lift.str": CFG.KEY_LIFT_STR := key
            case "lift.hyp": CFG.KEY_LIFT_HYP := key
            case "eat":      CFG.KEY_EAT := key
            case "shaker":   CFG.KEY_SHAKER := key
            case "quit":     CFG.KEY_QUIT := key
        }
        this.Apply()
        TestCfg.Save()
    }

    static Clash(id, key) {
        for , other in this.ORDER {
            if (other != id && this.Get(other) = key)
                return this.Label(other)
        }
        return ""
    }

    static Action(id) {
        switch id {
            case "lift.str":
                Engine.Request("Strength")
            case "lift.hyp":
                Engine.Request("Hypertrophy")
            case "eat":
                if Eat.running
                    Eat.Stop()
                else
                    Eat.Start()
            case "shaker":
                if Shaker.running
                    Shaker.Stop()
                else
                    Shaker.Start()
            case "quit":
                Overlay.Close()
                UI.Close()
                Cap.Release()
                ExitApp()
        }
    }

    static Apply() {
        for , h in this.bound {
            try Hotkey(h, "Off")
        }
        this.bound := []
        for , id in this.ORDER {
            k := this.Get(id)
            if (k = "")
                continue
            try {
                Hotkey(k, this.Handler(id), "On")
                this.bound.Push(k)
            }
        }
    }

    static Handler(id) => (*) => Keys.Action(id)
}

class Rd {
    static ORDER := ["stamina", "menu", "lift", "weight", "phase", "disconnect"]
    static FLAGS := Map("stamina", true, "menu", true, "lift", true,
                        "weight", true, "phase", true, "disconnect", true)

    static DEGRADED := Map()

    static On(k) => !this.DEGRADED.Has(k) && (this.FLAGS.Has(k) ? this.FLAGS[k] : true)
    static IsDegraded(k) => this.DEGRADED.Has(k)

    static Degrade(k, why) {
        if (this.DEGRADED.Has(k) || !this.FLAGS[k])
            return
        this.DEGRADED[k] := why
        Log.Add("READER DEGRADED: " k " -- " why)
        UI.dirty := true
        Hook.Post("fail", "Reader fell back to timings",
                  "**" this.Label(k) "** " why ". The macro is still running, on "
                . "fixed timings for that reader. " this.Cost(k) ".",
                  "", false)
    }

    static Restore(k) {
        if this.DEGRADED.Has(k)
            this.DEGRADED.Delete(k), Log.Add("reader restored: " k), UI.dirty := true
    }

    static RestoreAll() {
        this.DEGRADED := Map()
        UI.dirty := true
    }

    static DegradedCount() => this.DEGRADED.Count
    static Set(k, v) {
        this.FLAGS[k] := v
        TestCfg.Save()
        UI.dirty := true
    }
    static Toggle(k) => this.Set(k, !this.On(k))

    static Label(k) =>
        (k = "stamina")    ? "STAMINA BAR"
      : (k = "menu")       ? "EXERCISE MENU"
      : (k = "lift")       ? "LIFTING BADGE"
      : (k = "weight")     ? "WEIGHT PANEL"
      : (k = "phase")      ? "PHASE BADGE" : "DISCONNECT DIALOG"

    static Cost(k) =>
        (k = "stamina")    ? "off: fixed rest between sets, no rep verification"
      : (k = "menu")       ? "off: fixed wait after E, no trash recovery"
      : (k = "lift")       ? "off: fixed wait after Enter, no auto-weight check"
      : (k = "weight")     ? "off: no personal bests"
      : (k = "phase")      ? "off: no phase in stats, no phase eat target"
      :                      "off: a dropped connection goes unnoticed"

    static AnyOff() {
        for , k in this.ORDER
            if !this.On(k)
                return true
        return false
    }

    static State(k) =>
        this.DEGRADED.Has(k) ? "AUTO" : (this.FLAGS[k] ? "ON" : "OFF")
    static OffCount() {
        n := 0
        for , k in this.ORDER
            n += this.On(k) ? 0 : 1
        return n
    }
}

class MODES {
    static ALL := ["Hypertrophy", "Strength"]
    static NOMINAL := Map("Hypertrophy", 6, "Strength", 1)
    static Gate(mode) => (mode = "Strength") ? CFG.STAM_SINGLE_GATE : CFG.STAM_FULL_PCT

    static IsSingle(mode) => (mode = "Strength")
}

class Geom {
    static hwnd := 0
    static cx := 0, cy := 0, cw := 0, ch := 0
    static ok := false
    static lastErr := ""

    static dpiOk := true
    static dpiWhy := ""

    static CheckDpi() {

        real := DllCall("GetSystemMetrics", "Int", 0, "Int")
        virt := A_ScreenWidth
        this.dpiOk := (Abs(real - virt) <= 2)
        this.dpiWhy := this.dpiOk ? ""
            : Format("display is virtualised ({1} vs {2}) -- readers will be offset",
                     virt, real)
        return this.dpiOk
    }

    static Refresh() {
        this.hwnd := 0
        for exe in CFG.ROBLOX_EXES {
            if (h := WinExist("ahk_exe " exe)) {
                this.hwnd := h
                break
            }
        }
        if !this.hwnd
            return this._Fail("Roblox window not found")

        rc := Buffer(16, 0)
        if !DllCall("GetClientRect", "Ptr", this.hwnd, "Ptr", rc)
            return this._Fail("GetClientRect failed")
        w := NumGet(rc, 8, "Int"), h := NumGet(rc, 12, "Int")
        if (w < 320 || h < 240)
            return this._Fail("client too small: " w "x" h)

        pt := Buffer(8, 0)
        NumPut("Int", 0, pt, 0)
        NumPut("Int", 0, pt, 4)
        if !DllCall("ClientToScreen", "Ptr", this.hwnd, "Ptr", pt)
            return this._Fail("ClientToScreen failed")

        changed := (this.cw != w || this.ch != h)
        this.cx := NumGet(pt, 0, "Int"), this.cy := NumGet(pt, 4, "Int")
        this.cw := w, this.ch := h
        this.ok := true, this.lastErr := ""
        if changed {
            Read.InvalidateLock()
            Calib.Reset()
        }
        return true
    }

    static _Fail(msg) {
        this.ok := false, this.lastErr := msg
        return false
    }

    static Active() => this.hwnd && WinActive("ahk_id " this.hwnd)

    static BL(L, B, w, h) =>
        { x: this.cx + L, y: this.cy + this.ch - B - h, w: w, h: h }

    static BR(R, B, w, h) =>
        { x: this.cx + this.cw - R, y: this.cy + this.ch - B - h, w: w, h: h }

    static C(dx, dy, w, h) =>
        { x: Round(this.cx + this.cw / 2 + dx), y: Round(this.cy + this.ch / 2 + dy),
          w: w, h: h }

    static CB(dx, B, w, h) =>
        { x: Round(this.cx + this.cw / 2 + dx), y: this.cy + this.ch - B - h,
          w: w, h: h }

    static StaminaSeedB() => Calib.ok ? Calib.rowB : Round(0.0202 * this.ch + 12)

    static StaminaRowMin() => Calib.ok ? Calib.barBot + 2 : 0
    static StaminaRowMax() => Calib.ok ? Calib.barTop - 2 : 0

    static Desc() => this.ok
        ? Format("client {1}x{2} at ({3},{4})", this.cw, this.ch, this.cx, this.cy)
        : "no client (" this.lastErr ")"
}

class Rgn {

    static Stamina(B := 0) {
        if Calib.ok {

            pad := Max(3, Calib.S(CFG.STAM_INSET))
            return Geom.BL(Calib.barL + pad, B ? B : Read.staminaB,
                           Calib.barW - pad * 2, 1)
        }
        return Geom.BL(21, B ? B : Read.staminaB, 268, 1)
    }

    static AutoWeight() =>
        Geom.BL(Calib.L(310), Calib.S(4), Calib.S(109), Calib.S(36))

    static Phase() => Geom.BL(120, 214, 60, 16)

    static MenuX() {
        pad := Max(4, Calib.S(4))
        return Geom.C(Calib.S(263) - pad, Calib.S(-112.5) - pad,
                      Calib.S(11) + pad * 2, Calib.S(12) + pad * 2)
    }

    static MenuPanel() =>
        Geom.C(Calib.S(-302), Calib.S(-141.5), Calib.S(604), Calib.S(341))

    static Reconnect() =>
        Geom.C(Calib.S(30), Calib.S(79), Calib.S(125), Calib.S(16))

    static DialogBg() =>
        Geom.C(Calib.S(-190), Calib.S(25), Calib.S(380), Calib.S(30))
    static LeaveButton() =>
        Geom.C(Calib.S(-175), Calib.S(72), Calib.S(160), Calib.S(30))

    static WeightText() => Geom.BR(300, 425, 199, 49)
    static ShakerRow()  => Geom.CB(-236, 72, 472, 72)
    static ShakerSlot(i) => { x: Round(Geom.cx + Geom.cw / 2 - 236 + 64 * i - 20),
                              y: Geom.cy + Geom.ch - 72 - 72 + 36, w: 1, h: 1 }

    static All() => Map(
        "stamina.row",  this.Stamina(),
        "autoweight",   this.AutoWeight(),
        "phase",        this.Phase(),
        "menu.closeX",  this.MenuX(),
        "menu.panel",   this.MenuPanel(),
        "reconnect",    this.Reconnect(),
        "dialog.bg",    this.DialogBg(),
        "leave.button", this.LeaveButton(),
        "weight.text",  this.WeightText(),
        "shaker.row",   this.ShakerRow())
}

class Calib {
    static BASE_W := 274
    static scale  := 1.0
    static ok     := false
    static why    := "not calibrated"
    static barL := 0, barW := 0, barTop := 0, barBot := 0
    static bands := []
    static rowB := 0

    static Reset() {
        this.ok := false, this.scale := 1.0, this.why := "not calibrated"
        this.barL := 0, this.barW := 0, this.barTop := 0, this.barBot := 0
        this.rowB := 0, this.bands := []
    }

    static IsGreen(v) {
        r := Cap.R(v), g := Cap.G(v), b := Cap.B(v)
        return (g >= 80) && (g >= r + 28) && (g >= b + 28)
    }

    static IsFill(v) {
        r := Cap.R(v), g := Cap.G(v), b := Cap.B(v)
        mx := Max(r, Max(g, b)), mn := Min(r, Min(g, b))
        return (mx >= 90) && (mx - mn >= CFG.CALIB_SAT_MIN)
    }

    static IsLabel(v) => Min(Cap.R(v), Min(Cap.G(v), Cap.B(v))) > CFG.PX_LABEL_MIN

    static IsDark(v) => Max(Cap.R(v), Max(Cap.G(v), Cap.B(v))) < CFG.PX_EMPTY_MAX

    static Run() {
        this.Reset()
        if !Geom.Refresh() {
            this.why := "no Roblox client"
            return false
        }
        W := Min(Geom.cw, Round(this.BASE_W * CFG.CALIB_MAX_SCALE) + 220)
        H := Min(Geom.ch - 1, CFG.CALIB_B_MAX)
        if (W < 60 || H < 20) {
            this.why := "client is too small to hold the HUD"
            return false
        }
        reg := Geom.BL(0, 0, W, H)
        if !(frame := Cap.Grab(reg)) {
            this.why := "capture failed: " Cap.lastErr
            return false
        }

        BofY(y) => H - 1 - y

        greens := [], fills := [], spans := []
        loop H {
            y := A_Index - 1
            gn := 0, fl := 0, run := 0, best := 0
            loop W {
                v := Cap.Px(frame, y * W + A_Index - 1)
                if this.IsGreen(v)
                    gn++
                if this.IsFill(v)
                    fl++

                if !this.IsDark(v) {
                    run++
                    best := Max(best, run)
                } else
                    run := 0
            }
            greens.Push(gn), fills.Push(fl), spans.Push(best)
        }

        seedY := -1, bestN := 0, useGreen := true
        loop H {
            y := A_Index - 1
            if (BofY(y) < CFG.CALIB_B_MIN)
                continue
            if (greens[y + 1] > bestN)
                bestN := greens[y + 1], seedY := y
        }
        if (bestN < this.BASE_W * 0.35) {

            useGreen := false, bestN := 0, seedY := -1
            loop H {
                y := A_Index - 1
                if (BofY(y) < CFG.CALIB_B_MIN)
                    continue
                if (fills[y + 1] > bestN)
                    bestN := fills[y + 1], seedY := y
            }
        }
        if (seedY < 0 || bestN < this.BASE_W * 0.35) {

            this.Candidates(frame, W, H)
            this.why := "no stamina bar found -- stand in the gym with a full bar"
            return false
        }

        anchor := -1
        loop W {
            i := A_Index - 1
            v := Cap.Px(frame, seedY * W + i)
            if (useGreen ? this.IsGreen(v) : this.IsFill(v)) {
                anchor := i
                break
            }
        }
        x1 := anchor, x2 := anchor
        while (x1 > 0 && !this.IsDark(Cap.Px(frame, seedY * W + x1 - 1)))
            x1--
        while (x2 < W - 1 && !this.IsDark(Cap.Px(frame, seedY * W + x2 + 1)))
            x2++

        need := Max(4, Round((x2 - x1 + 1) * 0.8))
        yTop := seedY, yBot := seedY
        while (yTop > 0 && spans[yTop] >= need)
            yTop--
        while (yBot < H - 1 && spans[yBot + 2] >= need
               && BofY(yBot + 1) >= CFG.CALIB_B_MIN)
            yBot++

        bestScore := -99999, bestY := seedY, bestX1 := x1, bestX2 := x2
        this.bands := []
        y := yTop
        while (y <= yBot) {

            a1 := -1
            loop W {
                i := A_Index - 1
                if (useGreen ? this.IsGreen(Cap.Px(frame, y * W + i))
                             : this.IsFill(Cap.Px(frame, y * W + i))) {
                    a1 := i
                    break
                }
            }
            if (a1 >= 0) {
                r1 := a1, r2 := a1
                while (r1 > 0 && !this.IsDark(Cap.Px(frame, y * W + r1 - 1)))
                    r1--
                while (r2 < W - 1 && !this.IsDark(Cap.Px(frame, y * W + r2 + 1)))
                    r2++
                fill := 0, lab := 0
                i := r1
                while (i <= r2) {
                    v := Cap.Px(frame, y * W + i)
                    if this.IsLabel(v)
                        lab++
                    else if this.IsFill(v)
                        fill++
                    i++
                }

                mid := (yTop + yBot) / 2
                score := (r2 - r1 + 1) * 2 + fill - lab * 3 - Abs(y - mid)
                this.bands.Push({ bot: BofY(y), top: BofY(y), len: r2 - r1 + 1,
                                  start: r1, bestB: BofY(y), rows: 1,
                                  fill: fill, label: lab, score: score })
                if (score > bestScore)
                    bestScore := score, bestY := y, bestX1 := r1, bestX2 := r2
            }
            y++
        }

        this.barL := bestX1, this.barW := bestX2 - bestX1 + 1
        this.barBot := BofY(yBot), this.barTop := BofY(yTop)
        this.rowB := BofY(bestY)
        this.scale := Round(this.barW / this.BASE_W, 3)
        if (this.scale < 0.6 || this.scale > CFG.CALIB_MAX_SCALE) {
            this.Candidates(frame, W, H)
            this.why := "measured " this.barW "px, which implies " this.scale "x"
            return false
        }

        this.bands := []
        this.ok := true, this.why := ""
        Log.Add(Format("calibrated: {1} seed row B={2}, span B {3}..{4}, "
                     . "picked B={5} {6}px at L={7} -> {8}x",
                       useGreen ? "green" : "fill", BofY(seedY), this.barBot,
                       this.barTop, this.rowB, this.barW, this.barL, this.scale))
        return true
    }

    static Candidates(frame, W, H) {
        BofY(y) => H - 1 - y
        out := [], cur := 0, minLen := Round(this.BASE_W * 0.55)
        y := 0
        while (y < H) {
            if (BofY(y) < CFG.CALIB_B_MIN) {
                y++
                continue
            }

            best := 0, bestStart := 0, run := 0, start := 0
            loop W {
                i := A_Index - 1
                if !this.IsDark(Cap.Px(frame, y * W + i)) {
                    if !run
                        start := i
                    run++
                    if (run > best)
                        best := run, bestStart := start
                } else
                    run := 0
            }
            if (best >= minLen) {
                if (cur && Abs(best - cur.len) <= cur.len * 0.08) {
                    cur.bot := BofY(y), cur.rows++
                    if (best > cur.len)
                        cur.len := best, cur.start := bestStart, cur.bestB := BofY(y)
                } else {
                    if (cur && cur.rows >= 4)
                        out.Push(cur)
                    cur := { bot: BofY(y), top: BofY(y), len: best, start: bestStart,
                             bestB: BofY(y), rows: 1 }
                }
            } else if (cur && cur.rows >= 4)
                out.Push(cur), cur := 0
            else
                cur := 0
            y++
        }
        if (cur && cur.rows >= 4)
            out.Push(cur)

        this.bands := []
        for , bd in out {
            if (this.bands.Length < 8)
                this.bands.Push(bd)
        }
        return this.bands.Length
    }

    static RunClear() {
        wasUI := (IsSet(UI) && UI.ready && UI.visible)
        wasOv := (IsSet(Overlay) && Overlay.shown)
        if wasOv
            Overlay.Hide()
        if wasUI
            UI.Hide()
        if (wasUI || wasOv)
            Sleep 60
        r := this.Run()
        if wasUI
            UI.Show()
        return r
    }

    static Use(i) {
        if (i < 1 || i > this.bands.Length)
            return false
        bd := this.bands[i]
        this.barL := bd.start, this.barW := bd.len
        this.barBot := bd.bot, this.barTop := bd.top
        this.rowB := bd.bestB
        this.scale := Round(bd.len / this.BASE_W, 3)
        this.ok := (this.scale >= 0.6 && this.scale <= CFG.CALIB_MAX_SCALE)
        this.why := this.ok ? "" : "that band implies a scale of " this.scale "x"
        if this.ok
            Log.Add("band " i " chosen by hand: " bd.len "px at L=" bd.start
                  . ", row B=" bd.bestB)
        return this.ok
    }

    static S(px) => this.ok ? Round(px * this.barW / this.BASE_W)
                            : Round(px * this.scale)

    static L(px) => this.S(px)
    static Desc() => this.ok
        ? Format("{1}x  (bar {2}px at L{3})", this.scale, this.barW, this.barL)
        : "uncalibrated -- " this.why
}

class Cap {
    static hdcScreen := 0
    static hdcMem    := 0
    static cache     := Map()
    static lastErr   := ""

    static Init() {
        if !this.hdcScreen
            this.hdcScreen := DllCall("GetDC", "Ptr", 0, "Ptr")
        if !this.hdcMem
            this.hdcMem := DllCall("gdi32\CreateCompatibleDC", "Ptr", this.hdcScreen, "Ptr")
        return this.hdcScreen && this.hdcMem
    }

    static _Slot(w, h) {
        key := w "x" h
        if this.cache.Has(key)
            return this.cache[key]

        hbm := DllCall("gdi32\CreateCompatibleBitmap", "Ptr", this.hdcScreen,
                       "Int", w, "Int", h, "Ptr")
        if !hbm
            return 0

        bi := Buffer(40, 0)
        NumPut("UInt",   40,      bi,  0)
        NumPut("Int",    w,       bi,  4)
        NumPut("Int",   -h,       bi,  8)
        NumPut("UShort", 1,       bi, 12)
        NumPut("UShort", 32,      bi, 14)
        NumPut("UInt",   0,       bi, 16)
        NumPut("UInt",   w*h*4,   bi, 20)

        slot := { hbm: hbm, pix: Buffer(w * h * 4, 0), bi: bi, w: w, h: h }
        this.cache[key] := slot
        return slot
    }

    static Grab(r) {
        if !this.Init()
            return this._Fail("no device context")
        if (r.w < 1 || r.h < 1)
            return this._Fail("degenerate region")
        if !(slot := this._Slot(r.w, r.h))
            return this._Fail("bitmap allocation failed")

        old := DllCall("gdi32\SelectObject", "Ptr", this.hdcMem, "Ptr", slot.hbm, "Ptr")
        blt := DllCall("gdi32\BitBlt", "Ptr", this.hdcMem, "Int", 0, "Int", 0,
                       "Int", r.w, "Int", r.h, "Ptr", this.hdcScreen,
                       "Int", r.x, "Int", r.y, "UInt", 0x00CC0020)

        DllCall("gdi32\SelectObject", "Ptr", this.hdcMem, "Ptr", old, "Ptr")
        if !blt
            return this._Fail("BitBlt failed")

        got := DllCall("gdi32\GetDIBits", "Ptr", this.hdcMem, "Ptr", slot.hbm,
                       "UInt", 0, "UInt", r.h, "Ptr", slot.pix, "Ptr", slot.bi,
                       "UInt", 0)
        if (got != r.h)
            return this._Fail("GetDIBits returned " got " of " r.h " rows")

        this.lastErr := ""
        return slot
    }

    static _Fail(msg) {
        this.lastErr := msg
        return 0
    }

    static Px(slot, i) => NumGet(slot.pix, i * 4, "UInt") & 0xFFFFFF
    static R(v) => (v >> 16) & 0xFF
    static G(v) => (v >>  8) & 0xFF
    static B(v) =>  v        & 0xFF

    static SaveBmp(region, path, mask := 0) {
        if !(slot := this.Grab(region))
            return false
        w := region.w, h := region.h, dataSize := w * h * 4
        buf := Buffer(54 + dataSize, 0)
        NumPut("UShort", 0x4D42, buf, 0)
        NumPut("UInt", 54 + dataSize, buf, 2)
        NumPut("UInt", 54, buf, 10)
        NumPut("UInt", 40, buf, 14)
        NumPut("Int", w, buf, 18)
        NumPut("Int", -h, buf, 22)
        NumPut("UShort", 1, buf, 26)
        NumPut("UShort", 32, buf, 28)
        NumPut("UInt", 0, buf, 30)
        NumPut("UInt", dataSize, buf, 34)
        if mask {
            loop w * h
                NumPut("UInt", mask[A_Index] ? 0xFFFFFF : 0x000000,
                       buf, 54 + (A_Index - 1) * 4)
        } else {
            DllCall("RtlMoveMemory", "Ptr", buf.Ptr + 54, "Ptr", slot.pix.Ptr,
                    "UPtr", dataSize)
        }
        try {
            f := FileOpen(path, "w")
            f.RawWrite(buf, 54 + dataSize)
            f.Close()
        } catch
            return false
        return true
    }

    static Release() {
        for , slot in this.cache
            DllCall("gdi32\DeleteObject", "Ptr", slot.hbm)
        this.cache := Map()
        if this.hdcMem
            DllCall("gdi32\DeleteDC", "Ptr", this.hdcMem), this.hdcMem := 0
        if this.hdcScreen
            DllCall("ReleaseDC", "Ptr", 0, "Ptr", this.hdcScreen), this.hdcScreen := 0
    }
}

class Read {
    static staminaB   := 0
    static lockedAt   := ""
    static lastLabel  := 0

    static InvalidateLock() {
        this.staminaB := 0
        this.lockedAt := "client size changed"
    }

    static Stamina(B := 0) {
        if !Geom.ok
            return { ok: false, why: "no client", pct: 0.0 }
        row := B ? Rgn.Stamina(B) : Rgn.Stamina()
        if (!B && !this.staminaB)
            return { ok: false, why: "stamina row not locked", pct: 0.0 }
        if !(frame := Cap.Grab(row))
            return { ok: false, why: "capture: " Cap.lastErr, pct: 0.0 }

        filled := 0, empty := 0, label := 0
        loop row.w {
            v := Cap.Px(frame, A_Index - 1)
            r := Cap.R(v), g := Cap.G(v), b := Cap.B(v)
            mn := Min(r, Min(g, b)), mx := Max(r, Max(g, b))
            if (mn > CFG.PX_LABEL_MIN)
                label++
            else if (mx < CFG.PX_EMPTY_MAX)
                empty++
            else
                filled++
        }
        den := filled + empty
        if (den < row.w * 0.5)
            return { ok: false, why: "row is mostly label (" label "px) -- wrong row?",
                     pct: 0.0, filled: filled, empty: empty, label: label }

        this.lastLabel := label
        return { ok: true, pct: filled / den, filled: filled, empty: empty,
                 label: label, B: row.h ? (B ? B : this.staminaB) : 0 }
    }

    static LockStaminaRow() {
        if !Geom.ok
            return false
        seed := Geom.StaminaSeedB()
        best := 0, bestD := 9999, n := 0

        lo := seed - CFG.STAM_SEARCH_PX, hi := seed + CFG.STAM_SEARCH_PX
        if Calib.ok
            lo := Max(lo, Geom.StaminaRowMin()), hi := Min(hi, Geom.StaminaRowMax())
        B := lo
        while (B <= hi) {
            st := this.Stamina(B)
            if (st.ok && st.filled >= 268 * CFG.STAM_LOCK_MIN) {
                n++
                if (Abs(B - seed) < bestD)
                    bestD := Abs(B - seed), best := B
            }
            B++
        }
        if !n {
            this.staminaB := seed
            this.lockedAt := "FALLBACK to seed B=" seed " -- no filled row found"
            return false
        }

        this.staminaB := best
        st := this.Stamina()
        this.lockedAt := Format("locked B={1} (seed {2}, {3} candidate rows, reads {4}%)",
                                best, seed, n, st.ok ? Round(st.pct * 100) : "??")

        if (!st.ok || st.pct < CFG.STAM_FULL_PCT) {
            this.lockedAt .= " -- REJECTED, expected >= " Round(CFG.STAM_FULL_PCT * 100) "%"
            return false
        }
        return true
    }

    static AutoWeight() {
        if !Geom.ok
            return { ok: false, why: "no client", lifting: false, on: false }
        r := Rgn.AutoWeight()
        if !(frame := Cap.Grab(r))
            return { ok: false, why: "capture: " Cap.lastErr, lifting: false, on: false }

        offN := 0, onN := 0, total := r.w * r.h
        loop total {
            v := Cap.Px(frame, A_Index - 1)
            if this._Near(v, 0x8A3E3E, CFG.BADGE_TOL)
                offN++
            else if this._Near(v, 0x34764C, CFG.BADGE_TOL)
                onN++
        }
        if (offN + onN < total * CFG.BADGE_MIN_PCT)
            return { ok: true, lifting: false, on: false, offN: offN, onN: onN,
                     pct: Round(100 * (offN + onN) / total) }
        return { ok: true, lifting: true, on: (onN > offN), offN: offN, onN: onN,
                 pct: Round(100 * (offN + onN) / total) }
    }

    static InLifting() => this.AutoWeight().lifting

    static PHASE_BG := Map("Bulking", 0x2D1C08, "Maintaining", 0x0F260F,
                           "Cutting", 0x0F1C30, "Deficit",     0x122034)

    static Phase() {
        if !Geom.ok
            return { ok: false, why: "no client", phase: "" }
        r := Rgn.Phase()
        if !(frame := Cap.Grab(r))
            return { ok: false, why: "capture: " Cap.lastErr, phase: "" }

        votes := Map(), classified := 0
        for name in this.PHASE_BG
            votes[name] := 0

        loop r.w * r.h {
            v := Cap.Px(frame, A_Index - 1)
            bestName := "", bestD := 999999
            for name, ref in this.PHASE_BG {
                d := this._Dist2(v, ref)
                if (d < bestD)
                    bestD := d, bestName := name
            }
            if (bestD <= 64) {
                votes[bestName]++
                classified++
            }
        }
        if (classified < r.w * r.h * 0.30)
            return { ok: false, why: "badge not recognised (" classified " px matched)",
                     phase: "", votes: votes }

        win := "", winN := 0
        for name, n in votes {
            if (n > winN)
                winN := n, win := name
        }
        if (winN < classified * 0.55)
            return { ok: false, why: "no dominant phase colour", phase: "", votes: votes }
        return { ok: true, phase: win, votes: votes, confidence: winN / classified }
    }

    static PHASE_ORD := Map("Deficit", -2, "Cutting", -1, "Maintaining", 0)

    static PhaseOrdinal() {
        ph := this.Phase()
        if !ph.ok
            return { ok: false, why: ph.why, ord: 0, label: "" }
        if (ph.phase != "Bulking")
            return { ok: true, ord: this.PHASE_ORD[ph.phase], label: ph.phase }
        n := Digits.PhaseNumber()
        if !n.ok
            return { ok: false, why: n.why, ord: 0, label: "Bulking Phase ?" }
        return { ok: true, ord: n.n, label: "Bulking Phase " n.n }
    }

    static TargetOrdinal(spec) {
        spec := Trim(spec)
        if (spec = "")
            return { ok: false, why: "no target set" }
        if RegExMatch(spec, "^-?\d+$")
            return { ok: true, ord: Integer(spec), label: "Bulking Phase " spec }
        for name, ord in this.PHASE_ORD {
            if (StrLower(name) = StrLower(spec))
                return { ok: true, ord: ord, label: name }
        }
        return { ok: false, why: "unknown phase '" spec "' -- use a number, or "
                 . "Maintaining / Cutting / Deficit" }
    }

    static IsCloseX(v) {
        r := Cap.R(v), g := Cap.G(v), b := Cap.B(v)
        return (r >= 200) && (g >= 70) && (g <= 150) && (b >= 70) && (b <= 150)
               && (Abs(g - b) <= 14)
    }

    static MenuOpen() {
        if !Geom.ok
            return { ok: false, why: "no client", open: false }
        r := Rgn.MenuX()
        if !(frame := Cap.Grab(r))
            return { ok: false, why: "capture: " Cap.lastErr, open: false }
        n := 0
        loop r.w * r.h {
            if this.IsCloseX(Cap.Px(frame, A_Index - 1))
                n++
        }
        return { ok: true, open: (n >= 12), hits: n }
    }

    static DLG_BG := 0x393B3D

    static Disconnected() {
        if !Geom.ok
            return false

        r := Rgn.Reconnect()
        if !(frame := Cap.Grab(r))
            return false
        bright := 0
        loop r.w * r.h {
            v := Cap.Px(frame, A_Index - 1)
            if (Min(Cap.R(v), Min(Cap.G(v), Cap.B(v))) > 200)
                bright++
        }
        if (bright < r.w * r.h * 0.60)
            return false

        for , reg in [Rgn.DialogBg(), Rgn.LeaveButton()] {
            if !(frame := Cap.Grab(reg))
                return false
            match := 0
            loop reg.w * reg.h {
                if this._Near(Cap.Px(frame, A_Index - 1), this.DLG_BG, 14)
                    match++
            }
            if (match < reg.w * reg.h * 0.70)
                return false
        }
        return true
    }

    static _Dist2(v, ref) {
        dr := Cap.R(v) - ((ref >> 16) & 0xFF)
        dg := Cap.G(v) - ((ref >>  8) & 0xFF)
        db := Cap.B(v) -  (ref        & 0xFF)
        return dr*dr + dg*dg + db*db
    }
    static _Near(v, ref, tol) => this._Dist2(v, ref) <= tol * tol
}

class Digits {
    static tpl := Map()

    static DEFAULTS := Map(
            "phase.0", "0E3F7373E1E1E3E3E3E7FF7E",
            "phase.1", "3FFF1E1E1E1E1E1C3C3C3C3C",
            "phase.2", "1E3F770303070F0E1C3870FF",
            "phase.3", "3F3F07070E0E1F070307EFFE",
            "phase.4", "060C0C0C183036667FFF0E0C",
            "phase.5", "1F1F3030303E7F070303EFFE",
            "phase.6", "0F1F3970E0FEFFE7E3E3FF7E",
            "phase.7", "7F7FE7E6060C1C1C18183030",
            "phase.8", "1E1F3B33333F3F63E3E3677E",
            "phase.9", "1C7FF7E3E3F77F3F070F8EFC",
            "weight.0", "07C03F83FF0FFE7FF9F3F7C7FE1FF87FE1FF87FE1F7C7DF3F7FF8FFE3FF03F8",
            "weight.1", "FFFFFFFFFFFFFFFFFC1FF07FC1FF07FC1FF07FC1FF07FC1FF07FC1FF07FC1FF",
            "weight.2", "0FC07FC7FFBFFEFFFCE3F007C03F01F80FE07F01F80FC0FE07FFDFFF7FFDFFF",
            "weight.3", "7FF9FFE7FF9FFE7FF807C07E01FC07F81FF07FC1FF007CC1F7FFDFFFFFF9FFC",
            "weight.4", "01E00F803C01F007C03E01F007C03EF8FBE7CF9FFFFFFFFFFFFFFFFF00F803E",
            "weight.5", "1FF87FE1FF8FFE3FF8F803FC0FFE3FF8FFF3FFC01F007CC1F3FFCFFF7FF8FFC",
            "weight.6", "03F01FF1FFCFFE3FF8F807DE3FFCFFFBFFFFFFFF9FFC7DF1F3FFCFFF1FF83FC",
            "weight.7", "FFFFFFFFFFFFFFFFFFE1FF8FC07E01F807E03F00FC07F01F807E03F80FC03F0",
            "weight.8", "0FC07FC3FF9FFE7FFDF1F7CFDFFE3FF8FFE7FFDF3FF87FE1F7FFDFFF7FF87FC",
            "weight.9", "0FC07F83FF1FFE7FFBF1FFC7FFFF7FFCFFF3FFC7FF007C03F3FF8FFE3FF1FF0")
    static lastErr := ""

    static Hex(bits) {
        out := ""
        i := 1
        while (i <= StrLen(bits)) {
            v := 0
            loop 4
                v := v * 2 + (SubStr(bits, i++, 1) = "1" ? 1 : 0)
            out .= Format("{:X}", v)
        }
        return out
    }

    static Bits(hex) {
        out := ""
        loop parse hex {
            v := Integer("0x" A_LoopField)
            loop 4
                out .= (v & (8 >> (A_Index - 1))) ? "1" : "0"
        }
        return out
    }

    static Load() {
        this.tpl := Map()
        for key, hex in this.DEFAULTS
            this.tpl[key] := this.Bits(hex)
        try {
            if !FileExist(CFG.TPL_PATH)
                return this.tpl.Count
            for ns in ["phase", "weight"] {

                if (IniRead(CFG.TPL_PATH, "meta", "grid_" ns, "") != this.Grid(ns))
                    continue
                loop 10 {
                    d := A_Index - 1
                    v := IniRead(CFG.TPL_PATH, ns, d, "")
                    if (v != "")
                        this.tpl[ns "." d] := this.Bits(v)
                }
            }
        }
        return this.tpl.Count
    }

    static Save() {
        try {
            DirCreate A_AppData "\UGGMacro"
            for key, bits in this.tpl {
                parts := StrSplit(key, ".")
                IniWrite this.Hex(bits), CFG.TPL_PATH, parts[1], parts[2]
            }
            IniWrite Geom.cw "x" Geom.ch, CFG.TPL_PATH, "meta", "taught_at"
            IniWrite this.Grid("phase"),  CFG.TPL_PATH, "meta", "grid_phase"
            IniWrite this.Grid("weight"), CFG.TPL_PATH, "meta", "grid_weight"
            IniWrite BUILD.VERSION, CFG.TPL_PATH, "meta", "version"
        }
    }

    static Have(ns) {
        n := 0
        loop 10
            n += this.tpl.Has(ns "." (A_Index - 1)) ? 1 : 0
        return n
    }

    static _D2(v, ref) {
        dr := Cap.R(v) - ((ref >> 16) & 0xFF)
        dg := Cap.G(v) - ((ref >> 8) & 0xFF)
        db := Cap.B(v) - (ref & 0xFF)
        return dr*dr + dg*dg + db*db
    }

    static Mask(region, ink, bg) {
        if !(slot := Cap.Grab(region))
            return 0
        m := [], n := region.w * region.h
        loop n {
            v := Cap.Px(slot, A_Index - 1)
            m.Push(this._D2(v, ink) < this._D2(v, bg) ? 1 : 0)
        }
        return m
    }

    static Runs(m, w, h) {
        cols := []
        x := 0
        while (x < w) {
            hit := 0, y := 0
            while (y < h) {
                if m[y * w + x + 1] {
                    hit := 1
                    break
                }
                y++
            }
            cols.Push(hit)
            x++
        }
        out := [], start := -1
        loop w {
            i := A_Index - 1
            if (cols[i + 1] && start < 0)
                start := i
            else if (!cols[i + 1] && start >= 0) {
                if (i - start >= CFG.GLYPH_MINW)
                    out.Push({ x1: start, x2: i - 1 })
                start := -1
            }
        }
        if (start >= 0 && w - start >= CFG.GLYPH_MINW)
            out.Push({ x1: start, x2: w - 1 })
        return out
    }

    static Norm(m, w, h, x1, x2) {
        y1 := -1, y2 := -1
        y := 0
        while (y < h) {
            x := x1
            while (x <= x2) {
                if m[y * w + x + 1] {
                    if (y1 < 0)
                        y1 := y
                    y2 := y
                    break
                }
                x++
            }
            y++
        }
        if (y1 < 0)
            return ""
        bw := x2 - x1 + 1, bh := y2 - y1 + 1, out := ""
        loop this.gh {
            gy := A_Index - 1
            sy := y1 + Floor(gy * bh / this.gh)
            loop this.gw {
                gx := A_Index - 1
                sx := x1 + Floor(gx * bw / this.gw)
                out .= m[sy * w + sx + 1] ? "1" : "0"
            }
        }
        return out
    }

    static Capacity(r) => Max(1, Ceil((r.x2 - r.x1 + 1) / this.splitW))

    static PickRuns(runs, need, dir) {
        out := [], capacity := 0
        if (dir = "trailing") {
            i := runs.Length
            while (i >= 1 && capacity < need) {
                out.InsertAt(1, runs[i])
                capacity += this.Capacity(runs[i])
                i--
            }
        } else {
            i := 1
            while (i <= runs.Length && capacity < need) {
                out.Push(runs[i])
                capacity += this.Capacity(runs[i])
                i++
            }
        }
        return out
    }

    static NumberRuns(m, w, h, runs, spec) {
        out := []
        trailing := (spec.dir = "trailing")
        i := trailing ? runs.Length : 1
        while (i >= 1 && i <= runs.Length && out.Length < spec.maxDigits) {
            r := runs[i]
            if out.Length {
                gap := trailing ? (out[1].x1 - r.x2 - 1) : (r.x1 - out[out.Length].x2 - 1)
                if (gap > Max(CFG.GLYPH_WORDGAP, Calib.S(CFG.GLYPH_WORDGAP)))
                    break
            }
            guess := this.ReadSpan(m, w, h, r.x1, r.x2, this.maxSplit)
            if (guess.score > this.maxDist)
                break
            if trailing
                out.InsertAt(1, r)
            else
                out.Push(r)
            i += trailing ? -1 : 1
        }
        return out
    }

    static Dist(a, b) {
        d := 0
        loop StrLen(a)
            d += (SubStr(a, A_Index, 1) != SubStr(b, A_Index, 1)) ? 1 : 0
        return d
    }

    static Best(bits, ns) {
        bd := 99999, bv := -1, second := 99999
        loop 10 {
            d := A_Index - 1
            if !this.tpl.Has(ns "." d)
                continue
            t := this.tpl[ns "." d]
            if (StrLen(t) != StrLen(bits))
                continue
            dist := this.Dist(bits, t)
            if (dist < bd)
                second := bd, bd := dist, bv := d
            else if (dist < second)
                second := dist
        }
        return { digit: bv, dist: bd, margin: (second = 99999) ? 9999 : second - bd }
    }

    static ReadSpan(m, w, h, x1, x2, depth) {
        best := { text: "?", score: 999 }
        bits := this.Norm(m, w, h, x1, x2)
        if (bits != "") {
            one := this.Best(bits, this.curNs)
            if (one.digit >= 0 && one.margin >= this.minMargin)
                best := { text: one.digit "", score: one.dist }
        }
        if (depth <= 1 || (x2 - x1 + 1) < this.splitW)
            return best

        cut := x1 + 2
        while (cut <= x2 - 2) {
            lb := this.Norm(m, w, h, x1, cut)
            if (lb != "") {
                l := this.Best(lb, this.curNs)
                if (l.digit >= 0 && l.margin >= this.minMargin) {
                    r := this.ReadSpan(m, w, h, cut + 1, x2, depth - 1)
                    if (r.score < 900) {
                        rn := StrLen(r.text)
                        sc := (l.dist + r.score * rn) / (1 + rn)
                        if (sc < best.score)
                            best := { text: l.digit "" r.text, score: sc }
                    }
                }
            }
            cut++
        }
        return best
    }

    static ReadRun(m, w, h, run) {
        r := this.ReadSpan(m, w, h, run.x1, run.x2, this.maxSplit)
        return { text: r.text, score: r.score, n: StrLen(r.text) }
    }

    static NS := Map(
        "phase",  { dir: "trailing", splitW: 13,  maxSplit: 3, maxDigits: 4,
                    gw: 8,  gh: 12 },
        "weight", { dir: "leading",  splitW: 999, maxSplit: 1, maxDigits: 5,
                    gw: 14, gh: 18 })

    static curNs   := "phase"
    static splitW   := 13
    static maxSplit := 3
    static gw       := 8
    static gh       := 12
    static maxDist  := 19
    static minMargin := 5

    static UseNs(ns) {
        spec := this.NS.Has(ns) ? this.NS[ns] : this.NS["phase"]
        this.curNs := ns
        this.splitW := spec.splitW
        this.maxSplit := spec.maxSplit
        this.gw := spec.gw, this.gh := spec.gh
        bits := spec.gw * spec.gh

        this.maxDist := Round(bits * CFG.GLYPH_MAXDIST_PCT)
        this.minMargin := Round(bits * CFG.GLYPH_MARGIN_PCT)
        return spec
    }

    static Grid(ns) => this.NS.Has(ns)
        ? this.NS[ns].gw "x" this.NS[ns].gh : "8x12"

    static ReadRegion(ns, region, ink, bg, isolate := true) {
        spec := this.UseNs(ns)
        if (this.Have(ns) < 10) {
            this.lastErr := ns " templates incomplete (" this.Have(ns) "/10)"
            return { ok: false, why: this.lastErr, text: "" }
        }
        m := this.Mask(region, ink, bg)
        if !m {
            this.lastErr := "capture: " Cap.lastErr
            return { ok: false, why: this.lastErr, text: "" }
        }
        allRuns := this.Runs(m, region.w, region.h)
        if !allRuns.Length
            return { ok: false, why: "no ink found in region", text: "" }
        runs := isolate ? this.NumberRuns(m, region.w, region.h, allRuns, spec) : allRuns
        if !runs.Length
            return { ok: false, why: "found " allRuns.Length " run(s) but none read as a digit",
                     text: "", allRuns: allRuns.Length }

        text := "", worst := 0
        for run in runs {
            r := this.ReadRun(m, region.w, region.h, run)
            text .= r.text
            worst := Max(worst, r.score)
        }
        if (worst > this.maxDist)
            return { ok: false, why: "best match was " Round(worst) " bits off (limit "
                     . this.maxDist " for a " this.gw "x" this.gh " glyph)",
                     text: text, dist: worst,
                     runs: runs.Length, allRuns: allRuns.Length }
        return { ok: true, text: text, dist: worst, runs: runs.Length,
                 allRuns: allRuns.Length }
    }

    static Inspect(region, ink, bg) {
        m := this.Mask(region, ink, bg)
        if !m
            return { ok: false, why: "capture: " Cap.lastErr }
        rr := this.Runs(m, region.w, region.h)
        inkN := 0
        for v in m
            inkN += v
        detail := ""
        for r in rr
            detail .= (detail ? "  " : "") (r.x2 - r.x1 + 1) "px@" r.x1
        return { ok: true, mask: m, runs: rr, detail: detail,
                 inkPct: Round(100 * inkN / (region.w * region.h)) }
    }

    static Dump(tag, region, ink, bg) {
        dir := CFG.CAPTURE_DIR
        try DirCreate dir
        base := dir "\\" tag "_" Geom.cw "x" Geom.ch
        ins := this.Inspect(region, ink, bg)
        Cap.SaveBmp(region, base "_raw.bmp")
        if ins.ok
            Cap.SaveBmp(region, base "_mask.bmp", ins.mask)
        line := Format("DUMP {1}  region {2},{3} {4}x{5}  ink {6}%  {7} run(s): {8}",
                       tag, region.x, region.y, region.w, region.h,
                       ins.ok ? ins.inkPct : "?", ins.ok ? ins.runs.Length : "?",
                       ins.ok ? ins.detail : ins.why)
        Log.Add(line)
        return line
    }

    static Teach(ns, region, ink, bg, label) {
        m := this.Mask(region, ink, bg)
        if !m
            return { ok: false, why: "capture: " Cap.lastErr }
        w := region.w, h := region.h
        runs := this.Runs(m, w, h)
        chars := StrSplit(label)
        if !runs.Length
            return { ok: false, why: "no ink found -- is the badge on screen?" }

        spec := this.UseNs(ns)
        picked := this.PickRuns(runs, chars.Length, spec.dir)
        learned := [], ci := 1
        for run in picked {
            if (ci > chars.Length)
                break
            remaining := chars.Length - ci + 1
            width := run.x2 - run.x1 + 1

            if (width >= CFG.GLYPH_SPLITW && remaining >= 2 && picked.Length < chars.Length) {
                lead := ns "." chars[ci]
                cut := -1
                if this.tpl.Has(lead) {
                    bd := 999, c := run.x1 + 2
                    while (c <= run.x2 - 2) {
                        lb := this.Norm(m, w, h, run.x1, c)
                        if (lb != "") {
                            d := this.Dist(lb, this.tpl[lead])
                            if (d < bd)
                                bd := d, cut := c
                        }
                        c++
                    }
                }
                if (cut < 0)
                    cut := run.x1 + Floor(width / 2) - 1
                lb := this.Norm(m, w, h, run.x1, cut)
                rb := this.Norm(m, w, h, cut + 1, run.x2)
                if (lb != "")
                    this.tpl[ns "." chars[ci]] := lb, learned.Push(chars[ci] " (merged L)")
                ci++
                if (rb != "" && ci <= chars.Length)
                    this.tpl[ns "." chars[ci]] := rb, learned.Push(chars[ci] " (merged R)")
                ci++
                continue
            }
            bits := this.Norm(m, w, h, run.x1, run.x2)
            if (bits != "")
                this.tpl[ns "." chars[ci]] := bits, learned.Push(chars[ci])
            ci++
        }
        this.Save()
        detail := ""
        for r in picked
            detail .= (detail ? " " : "") (r.x2 - r.x1 + 1) "px@" r.x1
        return { ok: true, learned: learned, runs: runs.Length, used: picked.Length,
                 chars: chars.Length, have: this.Have(ns), detail: detail }
    }

    static PhaseRegion() =>
        Geom.BL(Calib.L(100), Calib.S(204), Calib.S(280), Calib.S(33))
    static WeightRegion() =>
        Geom.BR(Calib.S(300), Calib.S(425), Calib.S(199), Calib.S(49))

    static PhaseNumber() {
        ph := Read.Phase()
        if (!ph.ok || ph.phase != "Bulking")
            return { ok: false, why: "phase is " (ph.ok ? ph.phase : "unreadable")
                     . " -- only Bulking is numbered", n: 0 }
        r := this.ReadRegion("phase", this.PhaseRegion(), 0xFFA01E, 0x2D1C08)
        if !r.ok
            return { ok: false, why: r.why, n: 0, runs: r.HasOwnProp("runs") ? r.runs : 0,
                     allRuns: r.HasOwnProp("allRuns") ? r.allRuns : 0 }

        if !RegExMatch(r.text, "(\d+)$", &mm)
            return { ok: false, why: "no trailing digits in '" r.text "'", n: 0,
                     runs: r.runs, allRuns: r.allRuns }
        return { ok: true, n: Integer(mm[1]), text: r.text, dist: r.dist,
                 runs: r.runs, allRuns: r.allRuns }
    }

    static Weight() {
        r := this.ReadRegion("weight", this.WeightRegion(), 0xFFFFFF, 0x111113)
        return r.ok ? { ok: true, kg: Integer(RegExReplace(r.text, "\D")), text: r.text,
                        dist: r.dist, runs: r.runs, allRuns: r.allRuns }
                    : { ok: false, why: r.why, kg: 0,
                        runs: r.HasOwnProp("runs") ? r.runs : 0,
                        allRuns: r.HasOwnProp("allRuns") ? r.allRuns : 0 }
    }
}

class Inp {
    static blocked := 0

    static Ready() {
        if !Geom.ok
            return false
        if !Geom.Active() {
            this.blocked++
            return false
        }
        return true
    }

    static _Gate(desc) {
        if !this.Ready()
            return 0
        switch Mode.Allow() {
            case "wait":
                Mode.pending := desc
                return 0
            case "log":
                Log.Add("DRY  " desc)
                return 2
            default:
                Log.Add("SEND " desc)
                return 1
        }
    }

    static Key(k) {
        if !(g := this._Gate("key " k))
            return false
        if (g = 1)
            SendInput k
        return true
    }

    static Tap(k) {
        if !(g := this._Gate("tap " k))
            return false
        if (g = 1) {
            SendInput "{" k " down}"
            Sleep CFG.TAP_MS
            SendInput "{" k " up}"
        }
        return true
    }

    static HoldStart(k) {
        if !(g := this._Gate("hold " k " down"))
            return false
        if (g = 1)
            SendInput "{" k " down}"
        return true
    }

    static HoldEnd(k) {
        if !(g := this._Gate("hold " k " up"))
            return false
        if (g = 1)
            SendInput "{" k " up}"
        return true
    }

    static Click() {
        if !(g := this._Gate("click"))
            return false
        if (g = 1) {
            SendInput "{LButton down}"
            Sleep CFG.TAP_MS
            SendInput "{LButton up}"
        }
        return true
    }
}

class Cat {
    static MACHINES := []
    static FLAT     := []

    static __New() {

        this.MACHINES := [
            this._M("Abs Crunch", false, ["Abs Crunch"]),
            this._M("Adjustable Seat", true,
                ["Shoulder Press", "Lateral Raise", "Incline Bench Press",
                 "Bicep Curls", "Skull Crushers", "Hip Thrusts"]),
            this._M("Barbell Platform", true,
                ["Deadlift", "Clean & Press", "Romanian Deadlift"]),
            this._M("Bench", true, ["Bench Press"]),
            this._M("Cable Extensions", true,
                ["Tricep Pulldown", "Lat Pulldown", "Cable Row"]),
            this._M("Curl Bench", true, ["Preacher Curls", "Forearm Curls"]),
            this._M("Hack Squat", true, ["Reverse Squat", "Calves Press"]),
            this._M("Leg Extension", true, ["Leg Extension", "Ham Curls"]),
            this._M("Pec Fly", true, ["Pec Fly", "Reverse Delt Fly"]),
            this._M("Pull / Dip Bar", true,
                ["Pullup", "Tricep Dips", "Muscle Up", "L Sit Raises"]),
            this._M("Squat Rack", true,
                ["Squat", "Overhead Press", "Barbell Row", "Shrug"]),
            this._M("Yoga Mat", true,
                ["Push Up", "Pike Pushup", "Handstand Push",
                 "L-Sit to Handstand Push", "Pike to Handstand to Pike Hold",
                 "One Arm Pushup", "Tuck Push",
                 "L-Sit to Tuck to Planche to L-Sit", "Straddle Push",
                 "Planche to Handstand Push",
                 "Tuck to Handstand to Planche to Tuck", "One Arm Planche Push",
                 "Maltese Elevation"])
        ]
        for mi, m in this.MACHINES {
            for ei, name in m.exercises
                this.FLAT.Push({ machine: m.name, mIdx: mi, name: name, row: ei,
                                 hasMenu: m.hasMenu })
        }
    }

    static _M(name, hasMenu, exercises) =>
        { name: name, hasMenu: hasMenu, exercises: exercises }

    static MenuRows() {
        n := 0
        for m in this.MACHINES
            n += m.hasMenu ? m.exercises.Length : 0
        return n
    }

    static Search(q) {
        q := StrLower(Trim(q)), out := []
        if (q = "")
            return out
        for e in this.FLAT {
            if InStr(StrLower(e.name), q) || InStr(StrLower(e.machine), q)
                out.Push(e)
        }
        return out
    }

    static Find(name) {
        for e in this.FLAT {
            if (StrLower(e.name) = StrLower(name))
                return e
        }
        return 0
    }
}

class Engine {
    static state    := "IDLE"
    static prev     := ""
    static tState   := 0
    static deadline := 0
    static status   := "Idle"
    static failWhy  := ""
    static inTick   := false

    static mode     := "Strength"
    static target   := 0
    static running  := false

    static reps        := 0
    static stamBefore  := 0.0
    static repCost     := 0.0
    static navSent     := 0

    static navOn       := false
    static menuSeen    := 0
    static recommit    := 0
    static setsHere    := 0
    static setCounted  := false
    static menuFails   := 0
    static liftFails   := 0
    static lastShown   := ""
    static lastFail    := ""
    static repTries    := 0
    static retries     := 0
    static tExit       := 0
    static dcTick      := 0

    static awSeq          := []
    static awIdx          := 0
    static awTries        := 0
    static awWarn         := ""
    static lastGameMode   := ""
    static autoWeightDone := false

    static pending := ""

    static Request(mode) {
        if !this.running {
            this.mode := mode
            Engine.lastGameMode := ""
            TestCfg.Save()
            this.Start()
            return
        }
        if (this.mode = mode) {
            this.Stop()
            return
        }
        this.pending := mode
        this.status := "Switching to " mode " after this set"
        UI.dirty := true
    }

    static Start(exerciseName := "") {
        if this.running
            return
        if !Geom.Refresh() {
            this.Fail("no Roblox client: " Geom.lastErr)
            return
        }
        if !Geom.Active() {
            this.Fail("Roblox is not focused -- click into the game first")
            return
        }
        if (exerciseName != "") {
            if !(e := Cat.Find(exerciseName)) {
                this.Fail("unknown exercise: " exerciseName)
                return
            }
            this.target := e
        }
        if !this.target {
            this.Fail("no exercise selected")
            return
        }

        needsHud := Rd.On("stamina") || Rd.On("menu") || Rd.On("lift")
                 || Rd.On("weight") || Rd.On("phase") || Rd.On("disconnect")
        if (needsHud && !Calib.ok) {
            if !Calib.RunClear() {
                this.Fail("could not measure the HUD -- " Calib.why)
                return
            }
        }
        if (Rd.On("stamina") && !Read.LockStaminaRow()) {
            this.Fail("stamina row lock failed -- " Read.lockedAt
                      . ". Stand still with a full bar and try again.")
            return
        }

        this.failWhy := ""
        Stats.BeginSession(this.mode, this.target.name)
        this.running := true
        this.pending := ""
        this.recommit := 0
        this.menuFails := 0, this.liftFails := 0, this.setsHere := 0
        this.setCounted := false
        Rd.RestoreAll()
        this.reps := 0, this.repCost := 0.0, this.retries := 0, this.navSent := 0
        this.repTries := 0, this.tExit := 0, this.stuckExit := 0
        this.navOn := false
        this.awTries := 0, this.awWarn := "", this.autoWeightDone := false

        this.lastGameMode := ""

        this.menuSeen := 0
        this.Go("BEGIN")
        SetTimer(ObjBindMethod(Engine, "Tick"), CFG.TICK_MS)
    }

    static Stop(why := "stopped by user") {
        if !this.running
            return
        SetTimer(ObjBindMethod(Engine, "Tick"), 0)
        this.running := false
        this.state := "IDLE"
        this.status := why
        Stats.EndSession(why)
    }

    static Fail(why) {
        this.failWhy := why
        this.lastFail := FormatTime(, "HH:mm") "  " why
        this.status := "FAIL: " why
        Log.Add("FAIL -- " why)
        Hook.Failure(why)
        if this.running
            this.Stop("FAIL: " why)
        else
            this.state := "IDLE"

    }

    static Go(s) {
        this.prev := this.state
        this.state := s
        this.tState := A_TickCount
        this.deadline := 0
    }

    static Elapsed() => A_TickCount - this.tState
    static Wait(ms) => this.Elapsed() >= ms

    static Step(key, next, ms := 0) {
        if (this.deadline = 0) {

            if !Inp.Key(key)
                return
            this.deadline := A_TickCount + (ms ? ms : CFG.NAV_STEP_MS)
            return
        }
        if (A_TickCount >= this.deadline)
            this.Go(next)
    }

    static Hold(ms, next) {
        if this.Wait(ms)
            this.Go(next)
    }

    static Tick() {
        if (this.inTick || !this.running)
            return
        this.inTick := true
        try
            this._Tick()
        finally
            this.inTick := false
    }

    static _Tick() {
        if !Geom.Refresh() {
            this.Fail("lost the Roblox client")
            return
        }
        if !Geom.Active() {
            this.status := "PAUSED -- Roblox lost focus. Click into the game."
            return
        }
        Stats.Tick(this.state)

        if (Rd.On("phase") && Mod(this.dcTick, 20) = 0) {
            po := Read.PhaseOrdinal()
            if po.ok
                Stats.NotePhase(po.label, po.ord)
        }
        if (++this.dcTick >= CFG.DISCONNECT_EVERY) {
            this.dcTick := 0
            if (Rd.On("disconnect") && Read.Disconnected()) {
                this.Fail("Roblox disconnected")
                return
            }
        }

        switch this.state {
            case "BEGIN":        this.S_Begin()
            case "PROMPT":       this.S_Prompt()
            case "VERIFY":       this.S_Verify()
            case "TRASH_HOLD":   this.S_TrashHold()
            case "TRASH_DONE":   this.S_TrashDone()
            case "NAV_ON":       this.S_NavOn()
            case "NAV_ROW":      this.S_NavRow()
            case "GATE":         this.S_Gate()
            case "NAV_ENTER":    this.S_NavEnter()
            case "AWAIT_LIFT":   this.S_AwaitLift()
            case "ENTRY_SETTLE": this.S_EntrySettle()
            case "AW_DECIDE":    this.S_AwDecide()
            case "AW_HOME_OFF":  this.S_AwHomeOff()
            case "AW_HOME_ON":   this.S_AwHomeOn()
            case "AW_SEQ":       this.S_AwSeq()
            case "AW_VERIFY":    this.S_AwVerify()
            case "REHOME_OFF":   this.S_RehomeOff()
            case "REHOME_ON":    this.S_RehomeOn()
            case "NAV_OFF":      this.S_NavOff()
            case "REP":          this.S_Rep()
            case "REP_READ":     this.S_RepRead()
            case "POST_REP":     this.S_PostRep()
            case "REGEN":        this.S_Regen()
            case "EXIT_SPACE":   this.S_ExitSpace()
            case "EXIT_SETTLE":  this.S_ExitSettle()
        }
        if (this.awWarn != "")
            this.status := "WARNING: " this.awWarn

        if (this.status != this.lastShown)
            this.lastShown := this.status, UI.dirty := true
    }

    static S_Begin() {
        this.status := "Starting"
        if !this.Wait(CFG.START_SETTLE_MS)
            return
        this.menuSeen := 0
        this.Go(this.target.hasMenu ? "PROMPT" : "GATE")
    }

    static stuckExit := 0

    static S_Prompt() {

        if (Rd.On("lift") && Read.InLifting()) {
            if (++this.stuckExit <= 3) {
                Log.Add("still lifting at the clean slate -- leaving again")
                this.Go("EXIT_SPACE")
                return
            }
        } else
            this.stuckExit := 0

        if (this.target.hasMenu && Rd.On("menu")) {
            m := Read.MenuOpen()
            if (m.ok && m.open) {
                this.retries := 0, this.navSent := 0
                this.Go("NAV_ON")
                return
            }
        }
        this.menuSeen := 0
        this.status := "Entering " this.target.machine
        if !Inp.Tap(CFG.KEY_PROMPT)
            return
        this.Go("VERIFY")
    }

    static S_Verify() {
        if (this.target.hasMenu && !Rd.On("menu")) {

            if this.Wait(CFG.NOREAD_MENU_MS) {
                this.retries := 0, this.navSent := 0
                this.Go("NAV_ON")
            }
            return
        }
        if this.target.hasMenu {
            m := Read.MenuOpen()

            this.menuSeen := (m.ok && m.open) ? this.menuSeen + 1 : 0
            if (this.menuSeen >= CFG.MENU_CONFIRMS) {
                this.retries := 0, this.navSent := 0, this.menuFails := 0
                this.Go("NAV_ON")
                return
            }
        }
        if (!this.target.hasMenu && !Rd.On("lift")) {
            if this.Wait(CFG.NOREAD_LIFT_MS)
                this.Go("ENTRY_SETTLE")
            return
        }

        if (Rd.On("lift") && Read.InLifting()) {
            this.retries := 0, this.menuSeen := 0, this.stuckExit := 0
            this.liftFails := 0
            this.Go("ENTRY_SETTLE")
            return
        }
        if this.Wait(CFG.PROMPT_WAIT_MS) {
            if (++this.retries > CFG.PROMPT_RETRIES) {

                if (this.target.hasMenu && Rd.On("menu")
                    && ++this.menuFails >= CFG.READER_DEGRADE_AFTER) {
                    Rd.Degrade("menu", "could not see the exercise menu for "
                             . this.menuFails " cycles")
                    this.retries := 0, this.menuFails := 0
                    this.Go("PROMPT")
                    return
                }
                this.Fail("the exercise menu never appeared after " CFG.PROMPT_RETRIES
                          . " attempts. Trash may be blocking the prompt, or the "
                          . "game is lagging badly -- raise PROMPT_WAIT_MS in §01.")
                return
            }

            this.Go((this.retries <= CFG.SOFT_RETRIES) ? "PROMPT" : "TRASH_HOLD")
        }
    }

    static S_TrashHold() {

        if (Rd.On("lift") && Read.InLifting()) {
            Log.Add("lifting after all -- skipping the trash clear")
            this.retries := 0
            this.Go("ENTRY_SETTLE")
            return
        }
        if (this.deadline = 0) {
            this.status := "Clearing trash"
            Inp.HoldStart(CFG.KEY_PROMPT)
            this.deadline := A_TickCount + CFG.TRASH_HOLD_MS
            return
        }
        if (A_TickCount >= this.deadline) {
            Inp.HoldEnd(CFG.KEY_PROMPT)
            this.Go("TRASH_DONE")
        }
    }

    static S_TrashDone() => this.Hold(120, "PROMPT")

    static S_NavOn() {
        this.status := "Navigation on"
        if (this.deadline = 0 && !Inp.Key(CFG.KEY_NAV))
            return
        if (this.deadline = 0) {
            this.navOn := true
            this.deadline := A_TickCount + CFG.NAV_SETTLE_MS
            return
        }
        if (A_TickCount < this.deadline)
            return

        m := Rd.On("menu") ? Read.MenuOpen() : { ok: true, open: true }
        if (!m.ok || !m.open) {

            Log.Add("nav enabled but the menu is gone -- backing out")
            this.menuSeen := 0
            this.Go("EXIT_SPACE")
            return
        }
        this.Go("NAV_ROW")
    }

    static S_NavRow() {
        if (this.navSent >= this.target.row) {
            this.Go("GATE")
            return
        }
        if (this.deadline && A_TickCount < this.deadline)
            return
        this.status := Format("Selecting {1} ({2}/{3})", this.target.name,
                              this.navSent + 1, this.target.row)
        if !Inp.Key(CFG.KEY_DOWN)
            return
        this.navSent++
        this.deadline := A_TickCount + CFG.NAV_STEP_MS
    }

    static S_Gate() {
        if !Rd.On("stamina") {

            need := CFG.NOREAD_REGEN_MS
            cool := (this.tExit = 0) ? 0 : need
            this.status := Format("Resting {1}s (timed)", Round(need / 1000))
            if (this.Wait(CFG.NAV_COMMIT_MS)
                && (this.tExit = 0 || A_TickCount - this.tExit >= cool)) {
                this.stamBefore := 1.0
                this.Go(this.target.hasMenu ? "NAV_ENTER" : "PROMPT")
            }
            return
        }
        st := Read.Stamina()
        if !st.ok {
            this.Fail("stamina unreadable: " st.why)
            return
        }
        need    := MODES.Gate(this.mode)
        okStam  := (st.pct >= need)
        okDwell := this.Wait(CFG.NAV_COMMIT_MS)

        if (okStam && okDwell) {
            this.stamBefore := st.pct
            this.Go(this.target.hasMenu ? "NAV_ENTER" : "PROMPT")
            return
        }
        this.status := !okStam
            ? Format("Waiting -- stamina {1}% / {2}%", Round(st.pct*100), Round(need*100))
            : Format("Waiting -- nav dwell {1}ms / {2}ms", this.Elapsed(), CFG.NAV_COMMIT_MS)
        if this.Wait(CFG.GATE_TIMEOUT_MS)
            this.Fail("commit gate timed out: " this.status)
    }

    static S_NavEnter() {
        if !Inp.Key(CFG.KEY_ENTER)
            return
        this.Go("AWAIT_LIFT")
    }

    static S_AwaitLift() {
        this.status := "Entering lift"
        if !Rd.On("lift") {
            if this.Wait(CFG.NOREAD_LIFT_MS)
                this.Go("ENTRY_SETTLE")
            return
        }
        if Read.InLifting() {
            this.recommit := 0
            this.Go("ENTRY_SETTLE")
            return
        }
        if this.Wait(CFG.LIFT_WAIT_MS) {

            if (this.target.hasMenu && Rd.On("menu")) {
                m := Read.MenuOpen()
                if (m.ok && m.open && this.recommit < 2) {
                    this.recommit++
                    if (this.recommit = 1) {
                        Log.Add("menu still open -- re-sending Enter only")
                        this.Go("NAV_ENTER")
                    } else {
                        Log.Add("menu still open -- navigation may be off, "
                              . "re-toggling and re-walking the row")
                        this.navOn := false
                        this.navSent := 0
                        this.Go("NAV_ON")
                    }
                    return
                }
            }
            if (++this.retries > CFG.PROMPT_RETRIES) {
                if (Rd.On("lift") && ++this.liftFails >= CFG.READER_DEGRADE_AFTER) {
                    Rd.Degrade("lift", "could not see the lifting badge for "
                             . this.liftFails " cycles")
                    this.retries := 0, this.liftFails := 0
                    this.Go("ENTRY_SETTLE")
                    return
                }
                this.Fail("could not enter the lifting state. If the game was "
                          . "lagging, raise LIFT_WAIT_MS in §01; otherwise a Down "
                          . "or the Enter is being dropped, so raise NAV_STEP_MS.")
                return
            }

            this.recommit := 0
            this.Go("EXIT_SPACE")
        }
    }

    static S_EntrySettle() {
        this.status := this.target.name " - settling"
        if !this.Wait(CFG.ENTRY_SETTLE_MS)
            return

        if Rd.On("weight") {
            wt := Digits.Weight()
            if wt.ok
                Stats.RecordWeight(this.target.name, wt.kg)
        }
        this.Go("AW_DECIDE")
    }

    static _AwSeqFor(isOn) {
        L := CFG.KEY_LEFT, R := CFG.KEY_RIGHT, U := CFG.KEY_UP, E := CFG.KEY_ENTER
        hyp := (CFG.GAME_MODE = "Hypertrophy")
        if isOn
            return hyp ? [L, E, U, L, E] : [L, E, U, E]

        return hyp ? [L, L, E, R, E, U, L, E] : [L, L, E, R, E, U, E]
    }

    static S_AwDecide() {
        if !Rd.On("lift") {

            this.awWarn := "auto-weight unchecked -- the lifting badge reader is off"
            this.reps := 0

            this.Go("NAV_OFF")
            return
        }
        aw := Read.AutoWeight()
        modeChanged := (this.lastGameMode != CFG.GAME_MODE)
        if (aw.ok && aw.on && !modeChanged) {
            this.autoWeightDone := true
            this.Go("NAV_OFF")
            return
        }
        if !aw.ok {
            this.awWarn := "auto-weight badge unreadable: " aw.why
            this.Go("NAV_OFF")
            return
        }
        if (this.awTries >= CFG.AW_RETRIES) {
            this.awWarn := "auto-weight would not turn on after " CFG.AW_RETRIES
                         . " attempts -- check the sequences in §07"
            this.lastGameMode := CFG.GAME_MODE
            this.Go("NAV_OFF")
            return
        }
        this.awTries++
        this.awSeq := this._AwSeqFor(aw.on)
        this.awIdx := 0
        this.Go("AW_HOME_OFF")
    }

    static S_AwHomeOff() {
        this.status := "Auto-weight: re-homing"
        if !this.navOn {
            this.Go("AW_HOME_ON")
            return
        }
        if (this.deadline = 0) {
            if !Inp.Key(CFG.KEY_NAV)
                return
            this.navOn := false
            this.deadline := A_TickCount + CFG.NAV_STEP_MS
            return
        }
        if (A_TickCount >= this.deadline)
            this.Go("AW_HOME_ON")
    }

    static S_AwHomeOn() {
        if (this.deadline = 0) {
            if !Inp.Key(CFG.KEY_NAV)
                return
            this.navOn := true
            this.deadline := A_TickCount + CFG.NAV_SETTLE_MS
            return
        }
        if (A_TickCount >= this.deadline)
            this.Go("AW_SEQ")
    }

    static S_AwSeq() {
        if (this.awIdx >= this.awSeq.Length) {
            this.Go("AW_VERIFY")
            return
        }
        if (this.deadline && A_TickCount < this.deadline)
            return
        key := this.awSeq[this.awIdx + 1]
        this.status := Format("Auto-weight: {1} step {2}/{3}",
                              CFG.GAME_MODE, this.awIdx + 1, this.awSeq.Length)
        if !Inp.Key(key)
            return
        this.awIdx++
        this.deadline := A_TickCount
                       + ((key = CFG.KEY_ENTER) ? CFG.AW_MENU_MS : CFG.NAV_STEP_MS)
    }

    static S_AwVerify() {
        if !this.Wait(CFG.AW_CONFIRM_MS)
            return
        if !Rd.On("lift") {
            this.Go("REHOME_OFF")
            return
        }
        aw := Read.AutoWeight()
        if (aw.ok && aw.on) {
            this.autoWeightDone := true
            this.awWarn := ""
            this.lastGameMode := CFG.GAME_MODE
            this.Go("REHOME_OFF")
            return
        }
        this.Go("AW_DECIDE")
    }

    static S_RehomeOff() {
        this.status := "Re-homing navigation"
        if !this.navOn {
            this.Go("REHOME_ON")
            return
        }
        if (this.deadline = 0) {
            if !Inp.Key(CFG.KEY_NAV)
                return
            this.navOn := false
            this.deadline := A_TickCount + CFG.NAV_STEP_MS
            return
        }
        if (A_TickCount >= this.deadline)
            this.Go("REHOME_ON")
    }

    static S_RehomeOn() {
        if (this.deadline = 0) {
            if !Inp.Key(CFG.KEY_NAV)
                return
            this.navOn := true
            this.deadline := A_TickCount + CFG.NAV_SETTLE_MS
            return
        }
        if (A_TickCount >= this.deadline)
            this.Go("NAV_OFF")
    }

    static S_NavOff() {
        this.reps := 0, this.repTries := 0

        if !this.navOn {
            this.status := "Navigation already off"
            this.Go("REP")
            return
        }
        this.status := "Navigation off"
        if (this.deadline = 0) {
            if !Inp.Key(CFG.KEY_NAV)
                return
            this.navOn := false
            this.deadline := A_TickCount + CFG.NAV_STEP_MS
            return
        }
        if (A_TickCount >= this.deadline)
            this.Go("REP")
    }

    static S_Rep() {
        if (this.deadline && A_TickCount < this.deadline)
            return
        if Rd.On("stamina") {
            st := Read.Stamina()
            if !st.ok {
                this.Fail("stamina unreadable before rep: " st.why)
                return
            }
            this.stamBefore := st.pct
        }
        if !Inp.Click() {
            this.status := "PAUSED -- lost focus mid-set"
            return
        }
        this.Go("REP_READ")
    }

    static S_RepRead() {
        if !Rd.On("stamina") {

            if !this.Wait(CFG.LIFT_SPEED_PASS ? CFG.NOREAD_REP_FAST_MS
                                              : CFG.NOREAD_REP_MS)
                return
            this.reps++
            this.repTries := 0
            Stats.AddRep(this.target.name)
            want := CFG.NOREAD_SET_REPS.Has(this.mode)
                ? CFG.NOREAD_SET_REPS[this.mode] : 3
            this.status := Format("{1} - rep {2}/{3} (timed)", this.target.name,
                                  this.reps, want)

            this.Go("POST_REP")
            return
        }
        if !this.Wait(CFG.REP_READ_MS)
            return
        before := this.stamBefore
        st := Read.Stamina()
        after := st.ok ? st.pct : -1.0

        if (after < 0 || (before - after) < CFG.REP_MIN_DELTA) {
            if (++this.repTries > CFG.REP_RETRIES) {
                this.Fail("rep never registered after " CFG.REP_RETRIES
                          . " clicks -- is the cursor over the game window?")
                return
            }
            this.status := Format("{1} - click {2} was swallowed",
                                  this.target.name, this.repTries)
            this.deadline := A_TickCount + CFG.REP_RETRY_FAST_MS
            this.Go("REP")
            return
        }

        this.reps++
        this.repTries := 0
        Stats.AddRep(this.target.name)
        cost := before - after
        this.repCost := this.repCost ? (this.repCost * 0.7 + cost * 0.3) : cost
        this.stamBefore := after
        this.status := Format("{1} - rep {2} - {3}% (cost {4}%)", this.target.name,
                              this.reps, Round(after * 100), Round(cost * 100))

        this.Go(MODES.IsSingle(this.mode) ? "EXIT_SPACE" : "POST_REP")
    }

    static S_PostRep() {
        if !this.Wait(CFG.REP_GAP_MS)
            return
        if (this.reps >= CFG.REP_RUNAWAY) {
            this.Go("EXIT_SPACE")
            return
        }
        if (CFG.STAM_DRIVEN && Rd.On("stamina")) {
            this.Go((this.repCost > 0 && this.stamBefore >= this.repCost * CFG.STAM_MARGIN)
                    ? "REP" : "EXIT_SPACE")
            return
        }

        n := CFG.NOREAD_SET_REPS.Has(this.mode) ? CFG.NOREAD_SET_REPS[this.mode] : 3
        if (this.reps < n) {
            this.Go("REP")
            return
        }

        Stats.AddSet()
        this.setsHere++
        if (this.setsHere >= CFG.NOREAD_RESYNC_SETS) {

            this.setCounted := true
            this.setsHere := 0
            Log.Add("no-reader resync: leaving the machine after "
                  . CFG.NOREAD_RESYNC_SETS " sets")
            this.Go("EXIT_SPACE")
            return
        }
        this.Go("REGEN")
    }

    static S_Regen() {
        left := CFG.NOREAD_REGEN_MS - this.Elapsed()
        this.status := Format("{1} - set {2}/{3} done, resting {4}s",
                              this.target.name, this.setsHere + 1,
                              CFG.NOREAD_RESYNC_SETS, Round(Max(0, left) / 1000))
        if this.Wait(CFG.NOREAD_REGEN_MS) {
            this.reps := 0
            this.repTries := 0
            this.Go("REP")
        }
    }

    static S_ExitSpace() {
        if !Inp.Key(CFG.KEY_EXIT_LIFT)
            return
        if this.setCounted
            this.setCounted := false
        else
            Stats.AddSet()
        this.tExit := A_TickCount
        this.navSent := 0, this.setsHere := 0

        if (this.pending != "") {
            this.mode := this.pending, this.pending := ""
            this.lastGameMode := ""
            Stats.BeginSession(this.mode, this.target.name)
            TestCfg.Save()
            Log.Add("mode switched to " this.mode)
        }
        this.Go("EXIT_SETTLE")
    }

    static SettleMs() => this.target.hasMenu ? CFG.EXIT_SETTLE_MS
        : (MODES.IsSingle(this.mode) ? CFG.ABS_SETTLE_SINGLE : CFG.ABS_SETTLE_MS)

    static S_ExitSettle() {
        this.status := "Left - settling"

        if this.Wait(this.SettleMs())
            this.Go(this.target.hasMenu ? "PROMPT" : "GATE")
    }
}

class Stats {

    static running := false
    static activeMs := 0
    static tResume := 0
    static key := ""
    static t0 := 0, tTick := 0
    static sets := 0, reps := 0
    static liftMs := 0, waitMs := 0
    static mode := "", exercise := ""
    static perExercise := Map()
    static best    := Map()
    static startKg := Map()
    static curKg   := Map()
    static phaseLabel := "?"
    static phaseOrd := -99
    static signature := "ok"

    static LIFTING := Map("ENTRY_SETTLE",1, "AW_DECIDE",1, "AW_HOME_OFF",1,
        "AW_HOME_ON",1, "AW_SEQ",1, "AW_VERIFY",1, "REHOME_OFF",1, "REHOME_ON",1,
        "NAV_OFF",1, "REP",1, "REP_READ",1, "POST_REP",1)

    static BeginSession(mode, exercise) {

        fresh := (this.key != exercise)
        this.key := exercise
        this.tTick := A_TickCount, this.tResume := A_TickCount
        this.running := true
        this.mode := mode, this.exercise := exercise
        if fresh {
            this.t0 := A_TickCount, this.activeMs := 0
            this.sets := 0, this.reps := 0
            this.liftMs := 0, this.waitMs := 0
            this.perExercise := Map(), this.startKg := Map(), this.curKg := Map()
        }
        this.LoadLifetime()
        if !fresh
            return

        po := Read.PhaseOrdinal()
        if po.ok
            this.phaseLabel := po.label, this.phaseOrd := po.ord

        SetTimer(() => Hook.SessionStart(mode, exercise), -1)
    }

    static EndSession(why := "stopped") {
        if this.running {
            this.activeMs += A_TickCount - this.tResume
            this.running := false
        }
        this.SaveLifetime()
        Hook.SessionEnd(why)
    }

    static ElapsedMs() =>
        this.activeMs + (this.running ? A_TickCount - this.tResume : 0)

    static Tick(state) {
        now := A_TickCount
        dt := now - this.tTick
        this.tTick := now
        if !this.running
            return
        if (dt <= 0 || dt > 2000)
            return
        if this.LIFTING.Has(state)
            this.liftMs += dt
        else
            this.waitMs += dt
    }

    static AddRep(ex) {
        this.reps++
        this.perExercise[ex] := (this.perExercise.Has(ex) ? this.perExercise[ex] : 0) + 1
    }

    static blockedSince := 0
    static blockedTold := false

    static CheckReaders() {
        if Overlay.blocked.Length {
            if !this.blockedSince
                this.blockedSince := this.sets
            else if (!this.blockedTold && this.sets - this.blockedSince >= 3) {
                this.blockedTold := true
                names := ""
                for , n in Overlay.blocked
                    names .= (names ? ", " : "") n
                Hook.Post("fail", "Reader blocked",
                          "The macro window has been covering **" names "** for "
                        . (this.sets - this.blockedSince) " sets. Readings from it "
                        . "are unreliable until the panel is moved.",
                          "", CFG.PING_FAIL)
            }
        } else
            this.blockedSince := 0, this.blockedTold := false
    }

    static AddSet() {
        this.sets++
        this.CheckReaders()
        if (Hook.Ready() && CFG.WEBHOOK_EVERY > 0
            && this.sets - Hook.lastPostSets >= CFG.WEBHOOK_EVERY) {
            Hook.lastPostSets := this.sets
            Hook.Progress()
        }
    }

    static RecordWeight(ex, kg) {
        if (kg <= 0)
            return
        if !this.startKg.Has(ex)
            this.startKg[ex] := kg
        this.curKg[ex] := kg
        prev := this.best.Has(ex) ? this.best[ex] : 0
        if (kg > prev) {
            this.best[ex] := kg
            this.SaveLifetime()
            if (prev > 0)
                Hook.PersonalBest(ex, kg, this.startKg[ex])
        }
    }

    static KgGained() {
        total := 0
        for ex, cur in this.curKg
            total += cur - (this.startKg.Has(ex) ? this.startKg[ex] : cur)
        return total
    }

    static WeightLabel() {
        if !this.curKg.Has(this.exercise)
            return "-"
        cur := this.curKg[this.exercise]
        gain := cur - (this.startKg.Has(this.exercise) ? this.startKg[this.exercise] : cur)
        return cur " kg" (gain > 0 ? " (+" gain ")" : "")
    }

    static NotePhase(label, ord) {
        if (label = "" || label = this.phaseLabel)
            return
        old := this.phaseLabel
        this.phaseLabel := label, this.phaseOrd := ord
        if (old != "?")
            Hook.PhaseChange(old, label, ord)
    }

    static Minutes() => this.ElapsedMs() / 60000
    static RepsPerHour() => this.Minutes() > 0 ? Round(this.reps / this.Minutes() * 60) : 0
    static KgPerHour() => this.Minutes() > 0 ? Round(this.KgGained() / this.Minutes() * 60) : 0
    static Efficiency() {
        total := this.liftMs + this.waitMs
        return total ? Round(100 * this.liftMs / total) : 0
    }

    static Clock(ms) {
        sec := ms // 1000
        return (sec < 3600)
            ? Format("{1}m {2:02}s", sec // 60, Mod(sec, 60))
            : Format("{1}h {2:02}m", sec // 3600, Mod(sec // 60, 60))
    }

    static Fields() {
        return Hook.Fields(
            Hook.Field("Reps", this.reps " (" this.RepsPerHour() "/hr)"),
            Hook.Field("Sets", this.sets),
            Hook.Field("Elapsed", this.Clock(this.ElapsedMs())),
            Hook.Field("Phase", this.phaseLabel),
            Hook.Field("Weight", this.WeightLabel()),
            Hook.Field("Gain", this.KgPerHour() " kg/hr"),
            Hook.Field("Lifting vs waiting",
                       this.Efficiency() "% -- " this.Clock(this.liftMs) " lifting, "
                     . this.Clock(this.waitMs) " waiting", false))
    }

    static Profile() => CFG.IRONMAN ? "ironman" : "normal"
    static Section() => "stats." this.Profile()

    static SwitchProfile(on) {
        this.SaveLifetime()
        CFG.IRONMAN := on
        this.LoadLifetime()
        UI.dirty := true
    }

    static Payload() {
        out := Format("reps={1}|sets={2}|ms={3}", this.lifeReps, this.lifeSets, this.lifeMs)
        for ex, kg in this.best
            out .= "|pb:" ex "=" kg
        return out
    }

    static lifeReps := 0, lifeSets := 0, lifeMs := 0

    static LoadLifetime() {
        this.best := Map()
        this.lifeReps := 0, this.lifeSets := 0, this.lifeMs := 0
        this.signature := "ok"
        try {
            if !FileExist(CFG.STATS_PATH)
                return
            data := IniRead(CFG.STATS_PATH, this.Section(), "data", "")
            sig  := IniRead(CFG.STATS_PATH, this.Section(), "sig", "")

            if (data = "" && this.Profile() = "normal") {
                data := IniRead(CFG.STATS_PATH, "stats", "data", "")
                sig  := IniRead(CFG.STATS_PATH, "stats", "sig", "")
            }
            if (data = "")
                return
            if (sig != Crypt.Hmac(data, CFG.HMAC_KEY)) {
                this.signature := "FAILED -- stats file was modified"
                Log.Add("stats signature check FAILED")
                return
            }
            for part in StrSplit(data, "|") {
                if RegExMatch(part, "^reps=(\d+)$", &m)
                    this.lifeReps := Integer(m[1])
                else if RegExMatch(part, "^sets=(\d+)$", &m)
                    this.lifeSets := Integer(m[1])
                else if RegExMatch(part, "^ms=(\d+)$", &m)
                    this.lifeMs := Integer(m[1])
                else if RegExMatch(part, "^pb:(.+)=(\d+)$", &m)
                    this.best[m[1]] := Integer(m[2])
            }
        }
    }

    static SaveLifetime() {
        try {
            DirCreate A_AppData "\UGGMacro"
            data := this.Payload()
            IniWrite data, CFG.STATS_PATH, this.Section(), "data"
            IniWrite Crypt.Hmac(data, CFG.HMAC_KEY), CFG.STATS_PATH,
                     this.Section(), "sig"
        }
    }
}

class Crypt {
    static Sha256(bytes, len) {
        hProv := 0, hHash := 0
        DllCall("advapi32\CryptAcquireContextW", "Ptr*", &hProv, "Ptr", 0, "Ptr", 0,
                "UInt", 24, "UInt", 0xF0000000)
        DllCall("advapi32\CryptCreateHash", "Ptr", hProv, "UInt", 0x800C,
                "Ptr", 0, "UInt", 0, "Ptr*", &hHash)
        DllCall("advapi32\CryptHashData", "Ptr", hHash, "Ptr", bytes, "UInt", len, "UInt", 0)
        out := Buffer(32, 0), size := 32
        DllCall("advapi32\CryptGetHashParam", "Ptr", hHash, "UInt", 2,
                "Ptr", out, "UInt*", &size, "UInt", 0)
        DllCall("advapi32\CryptDestroyHash", "Ptr", hHash)
        DllCall("advapi32\CryptReleaseContext", "Ptr", hProv, "UInt", 0)
        return out
    }

    static ToBuf(str) {
        n := StrPut(str, "UTF-8") - 1
        b := Buffer(Max(n, 1), 0)
        StrPut(str, b, "UTF-8")
        return { buf: b, len: n }
    }

    static Hex(buf, len) {
        out := ""
        loop len
            out .= Format("{:02x}", NumGet(buf, A_Index - 1, "UChar"))
        return out
    }

    static Hmac(msg, key) {
        try {
            k := this.ToBuf(key)
            block := Buffer(64, 0)
            if (k.len > 64) {
                kh := this.Sha256(k.buf, k.len)
                DllCall("RtlMoveMemory", "Ptr", block.Ptr, "Ptr", kh.Ptr, "UPtr", 32)
            } else
                DllCall("RtlMoveMemory", "Ptr", block.Ptr, "Ptr", k.buf.Ptr, "UPtr", k.len)

            m := this.ToBuf(msg)
            inner := Buffer(64 + m.len, 0), outer := Buffer(64 + 32, 0)
            loop 64 {
                b := NumGet(block, A_Index - 1, "UChar")
                NumPut("UChar", b ^ 0x36, inner, A_Index - 1)
                NumPut("UChar", b ^ 0x5C, outer, A_Index - 1)
            }
            if m.len
                DllCall("RtlMoveMemory", "Ptr", inner.Ptr + 64, "Ptr", m.buf.Ptr, "UPtr", m.len)
            ih := this.Sha256(inner, 64 + m.len)
            DllCall("RtlMoveMemory", "Ptr", outer.Ptr + 64, "Ptr", ih.Ptr, "UPtr", 32)
            return this.Hex(this.Sha256(outer, 96), 32)
        } catch
            return ""
    }
}

class Diag {
    static Report() {
        Geom.Refresh()
        s := "SPEARHEADS UGG Macro v" BUILD.VERSION " -- self test`n"
        s .= "=======================================================`n`n"
        s .= "CLIENT`n  " Geom.Desc() "`n"
        s .= "  focused: " (Geom.Active() ? "yes" : "NO -- nothing will work") "`n"
        s .= "  seed stamina row B: " Geom.StaminaSeedB() "`n"
        s .= "  row lock: " (Read.lockedAt ? Read.lockedAt : "not locked yet") "`n"
        s .= "  hud scale: " Calib.Desc() "`n"
        Geom.CheckDpi()
        s .= "  dpi: " (Geom.dpiOk ? "aware (physical pixels)" : Geom.dpiWhy) "`n`n"

        s .= "REGIONS (screen coords)`n"
        for name, r in Rgn.All()
            s .= Format("  {1}`t{2},{3}  {4}x{5}`n", name, r.x, r.y, r.w, r.h)
        s .= "`n"

        s .= "READERS`n"
        st := Rd.On("stamina") ? Read.Stamina() : { ok: false, why: "reader is off" }
        s .= st.ok
            ? Format("  stamina`t{1}%  (filled {2}, empty {3}, label {4})`n",
                     Round(st.pct * 100), st.filled, st.empty, st.label)
            : "  stamina`tUNREADABLE -- " st.why "`n"

        aw := Rd.On("lift") ? Read.AutoWeight() : { ok: false, why: "reader is off" }
        s .= aw.ok
            ? Format("  autoweight`tlifting={1}  on={2}  (off {3}px / on {4}px, "
                   . "{5}% of badge, need {6}%)`n",
                     aw.lifting, aw.on, aw.offN, aw.onN,
                     aw.HasOwnProp("pct") ? aw.pct : 0,
                     Round(CFG.BADGE_MIN_PCT * 100))
            : "  autoweight`tUNREADABLE -- " aw.why "`n"

        ph := Read.Phase()
        s .= ph.ok
            ? Format("  phase`t{1}  (confidence {2}%)`n", ph.phase, Round(ph.confidence * 100))
            : "  phase`tUNREADABLE -- " ph.why "`n"

        mo := Rd.On("menu") ? Read.MenuOpen() : { ok: false, why: "reader is off" }
        s .= mo.ok
            ? Format("  menu`topen={1}  ({2} close-X px)`n", mo.open, mo.hits)
            : "  menu`tUNREADABLE -- " mo.why "`n"

        s .= "  disconnect`t" (!Rd.On("disconnect") ? "reader is off"
                              : (Read.Disconnected() ? "DIALOG PRESENT" : "no")) "`n`n"

        s .= "CATALOG`n"
        s .= "  machines: " Cat.MACHINES.Length "`n"
        s .= "  menu rows: " Cat.MenuRows() "`n"
        s .= "  selectable exercises: " Cat.FLAT.Length "`n`n"

        s .= "ENGINE`n"
        s .= "  state: " Engine.state "   status: " Engine.status "`n"
        s .= "  mode: " Engine.mode "`n"
        s .= "  refused sends (no focus): " Inp.blocked "`n"
        s .= "  eat: click " CFG.EAT_CLICK_MS "ms | free " CFG.EAT_FREE_MS
           . "ms | equip " CFG.EAT_EQUIP_MS "ms | guard " CFG.EAT_FREE_GUARD_MS "ms`n"
        s .= "  nav step " CFG.NAV_STEP_MS "ms | entry settle " CFG.ENTRY_SETTLE_MS
           . "ms | rep read " CFG.REP_READ_MS "ms | exit settle " CFG.EXIT_SETTLE_MS "ms`n"
        s .= "  game mode: " CFG.GAME_MODE " (applied: "
           . (Engine.lastGameMode ? Engine.lastGameMode : "not yet") ")`n"
        s .= "  nav tracked as: " (Engine.navOn ? "ON" : "off") "`n"
        s .= "  auto-weight confirmed: " (Engine.autoWeightDone ? "yes" : "no")
           . (Engine.awWarn ? "  [" Engine.awWarn "]" : "") "`n"
        return s
    }

    static Show() {
        try DirCreate CFG.DATA_DIR
        try FileDelete CFG.SELFTEST_PATH
        r := this.Report()
        try FileAppend r, CFG.SELFTEST_PATH
        MsgBox r, "SPEARHEADS -- self test", "Iconi"
    }

    static Toast(msg, ms := 2600) {
        ToolTip msg
        SetTimer((*) => ToolTip(), -ms)
    }

    static hud := false
    static ToggleHud() {
        this.hud := !this.hud
        SetTimer(ObjBindMethod(Diag, "_HudTick"), this.hud ? 120 : 0)
        if !this.hud
            ToolTip
    }

    static _HudTick() {
        head := Format("[{1}]  {2}  -  {3}", Mode.Name(),
                       Runner.Busy() ? Runner.active : "idle", Runner.Status())
        if (Mode.cur = Mode.STEP)
            head .= "`n" (Mode.pending ? "HOLDING: " Mode.pending "  -- press "
                          CFG.KEY_STEP : "(waiting for the next input)")
        ToolTip head "`n`n" Log.Tail(10)
    }

    static live := false
    static ToggleLive() {
        this.live := !this.live
        if this.live
            SetTimer(ObjBindMethod(Diag, "_LiveTick"), 100)
        else {
            SetTimer(ObjBindMethod(Diag, "_LiveTick"), 0)
            ToolTip
        }
    }
    static _LiveTick() {
        Geom.Refresh()
        if !Rd.On("stamina") {
            ToolTip "stamina reader is OFF -- nothing is being captured"
            return
        }

        if !Calib.ok
            Calib.RunClear()
        if !Read.staminaB
            Read.LockStaminaRow()
        st := Read.Stamina()
        aw := Read.AutoWeight()
        mo := Read.MenuOpen()
        ToolTip st.ok
            ? Format("stamina {1}%  f{2}/e{3}/l{4}  row B={5}`n"
                   . "lifting {6}  autoweight {7}  menu {8}`n{9}",
                     Round(st.pct * 100), st.filled, st.empty, st.label, Read.staminaB,
                     aw.lifting, aw.on, mo.open, Calib.Desc())
            : "stamina UNREADABLE -- " st.why
    }
}

class Mode {
    static LIVE := 1, DRY := 2, STEP := 3
    static cur     := 1
    static tokens  := 0
    static pending := ""

    static Name() => this.cur = this.LIVE ? "LIVE" : this.cur = this.DRY ? "DRY" : "STEP"

    static Cycle() {
        this.cur := (this.cur = this.STEP) ? this.LIVE : this.cur + 1
        this.tokens := 0, this.pending := ""
        Log.Add("---- mode -> " this.Name() " ----")
        UI.dirty := true
    }

    static Release() {
        if (this.cur = this.STEP)
            this.tokens++
    }

    static Allow() {
        if (this.cur = this.LIVE)
            return "send"
        if (this.cur = this.DRY)
            return "log"
        if (this.tokens > 0) {
            this.tokens--
            this.pending := ""
            return "send"
        }
        return "wait"
    }
}

class Log {
    static ring := []
    static started := false

    static Add(line) {

        entry := Format("{1}.{2:03}  [{3}]  {4}", FormatTime(, "HH:mm:ss"),
                        A_MSec + 0, Runner.State(), line)
        this.ring.Push(entry)
        if (this.ring.Length > 200)
            this.ring.RemoveAt(1)
        try {
            if !this.started {
                this.started := true
                try DirCreate CFG.DATA_DIR
                try FileDelete CFG.LOG_PATH
                FileAppend "SPEARHEADS v" BUILD.VERSION " transcript`n"
                         . FormatTime(, "yyyy-MM-dd HH:mm:ss") "`n`n", CFG.LOG_PATH
            }
            FileAppend entry "`n", CFG.LOG_PATH
        }
    }

    static Tail(n := 12) {
        out := "", i := Max(1, this.ring.Length - n + 1)
        while (i <= this.ring.Length)
            out .= this.ring[i++] "`n"
        return out
    }
}

Say(title, body) {
    if (IsSet(UI) && UI.ready)
        UI.Say(title, body)
    else
        MsgBox body, title, "Iconi"
}

class Runner {
    static active := ""

    static KeepAwake(on) {
        try DllCall("SetThreadExecutionState",
                    "UInt", on ? 0x80000003 : 0x80000000)
    }

    static State() =>
        this.active = "lift"   ? Engine.state
      : this.active = "eat"    ? Eat.state
      : this.active = "shaker" ? Shaker.state
      : "idle"

    static Status() =>
        this.active = "lift"   ? Engine.status
      : this.active = "eat"    ? Eat.status
      : this.active = "shaker" ? Shaker.status
      : "Idle"

    static Busy() => this.active != ""

    static Claim(who) {
        if (this.active != "" && this.active != who)
            return false
        this.active := who
        this.KeepAwake(true)
        return true
    }

    static Release(who) {
        if (this.active = who) {
            this.active := ""
            this.KeepAwake(false)
        }
    }

    static StopAll() {
        Engine.Stop("stopped"), Eat.Stop("stopped"), Shaker.Stop("stopped")
        this.active := ""
        this.KeepAwake(false)
    }
}

class Shaker {
    static state    := "IDLE"
    static status   := "Idle"
    static running  := false
    static inTick   := false
    static tState   := 0
    static deadline := 0

    static recipe := []
    static idx    := 0
    static navOn  := false
    static seq    := []
    static seqIdx := 0
    static clicked := false

    static Validate(pre, whey, crea) {
        if (pre < 0 || whey < 0 || crea < 0)
            return { ok: false, why: "counts cannot be negative" }
        if (pre > 1)
            return { ok: false, why: "pre-workout is limited to 1 scoop" }
        if (whey > 5)
            return { ok: false, why: "whey is limited to 5 scoops" }
        if (crea > 5)
            return { ok: false, why: "creatine is limited to 5 scoops" }
        total := pre + whey + crea
        if (total = 0)
            return { ok: false, why: "the recipe is empty" }
        if (total > CFG.SHK_SLOTS)
            return { ok: false, why: "that is " total " scoops; the shaker holds "
                     . CFG.SHK_SLOTS }
        return { ok: true, total: total }
    }

    static Build(pre, whey, crea) {
        r := []
        loop pre
            r.Push("P")
        loop whey
            r.Push("W")
        loop crea
            r.Push("C")
        return r
    }

    static Desc() {
        m := Map("P", "pre-workout", "W", "whey", "C", "creatine"), out := ""
        for t in this.recipe
            out .= (out ? ", " : "") m[t]
        return out ? out : "(empty)"
    }

    static Start() {
        if this.running
            return
        if !Runner.Claim("shaker") {
            this.status := "another routine is running"
            return
        }
        if !Geom.Refresh() || !Geom.Active() {
            this.status := "Roblox is not focused"
            Runner.Release("shaker")
            return
        }

        v := this.Validate(CFG.SHK_PREWORK, CFG.SHK_WHEY, CFG.SHK_CREATINE)
        if !v.ok {
            this.status := "recipe rejected: " v.why
            Log.Add("SHAKER REFUSED -- " v.why)
            Runner.Release("shaker")
            Say("BAD RECIPE", v.why ". Change it on the Calories tab.")
            return
        }
        this.recipe := this.Build(CFG.SHK_PREWORK, CFG.SHK_WHEY, CFG.SHK_CREATINE)
        this.running := true, this.idx := 0, this.navOn := false
        Log.Add("==== SHAKER " this.Desc() " (" this.recipe.Length " scoops) ====")
        this.Go("SHK_EQUIP")
        SetTimer(ObjBindMethod(Shaker, "Tick"), CFG.TICK_MS)
    }

    static Stop(why := "done") {
        if !this.running
            return
        SetTimer(ObjBindMethod(Shaker, "Tick"), 0)
        this.running := false, this.state := "IDLE", this.status := why
        Log.Add("==== SHAKER end: " why " ====")
        Runner.Release("shaker")
        if (why = "done" && CFG.SHK_LIFT_AFTER)
            Engine.Start()
    }

    static Go(s) {
        this.state := s, this.tState := A_TickCount, this.deadline := 0
    }
    static Wait(ms) => (A_TickCount - this.tState) >= ms

    static Step(key, next, ms := 0) {
        if (this.deadline = 0) {
            if !Inp.Key(key)
                return
            this.deadline := A_TickCount + (ms ? ms : CFG.SHK_STEP_MS)
            return
        }
        if (A_TickCount >= this.deadline)
            this.Go(next)
    }

    static Dwell(key) => (key = CFG.KEY_ENTER) ? CFG.SHK_MENU_MS : CFG.SHK_STEP_MS

    static RunSeq(next) {
        if (this.seqIdx >= this.seq.Length) {
            this.Go(next)
            return
        }
        if (this.deadline && A_TickCount < this.deadline)
            return
        key := this.seq[this.seqIdx + 1]
        if !Inp.Key(key)
            return
        this.seqIdx++
        this.deadline := A_TickCount + this.Dwell(key)
    }

    static Tick() {
        if (this.inTick || !this.running)
            return
        this.inTick := true
        try
            this._Tick()
        finally
            this.inTick := false
    }

    static _Tick() {
        if !Geom.Refresh() {
            this.Stop("lost the Roblox client")
            return
        }
        if !Geom.Active() {
            this.status := "PAUSED -- Roblox lost focus"
            return
        }
        switch this.state {
            case "SHK_EQUIP":    this.S_Equip()
            case "SHK_NAVON":    this.S_NavOn()
            case "SHK_PICK":     this.S_Pick()
            case "SHK_NEXT":     this.S_Next()
            case "SHK_HOME_OFF": this.S_HomeOff()
            case "SHK_HOME_ON":  this.S_HomeOn()
            case "SHK_FINAL":    this.S_Final()
            case "SHK_NAVOFF":   this.S_NavOff()
        }
    }

    static S_Equip() {
        this.status := "Shaker: equipping"
        this.Step("1", "SHK_NAVON", CFG.SHK_EQUIP_MS)
    }

    static S_NavOn() {
        this.status := "Shaker: navigation on"
        if (this.deadline = 0) {
            if !Inp.Key(CFG.KEY_NAV)
                return
            this.navOn := true
            this.deadline := A_TickCount + CFG.SHK_MENU_MS
            return
        }
        if (A_TickCount >= this.deadline)
            this.Go(this.idx >= this.recipe.Length ? "SHK_FINAL" : "SHK_PICK")
    }

    static S_Pick() {
        if !this.seq.Length {
            t := this.recipe[this.idx + 1]
            this.seq := [CFG.KEY_ENTER, CFG.KEY_UP]
            if (t = "C")
                this.seq.Push(CFG.KEY_LEFT)
            else if (t = "W")
                this.seq.Push(CFG.KEY_RIGHT)
            this.seq.Push(CFG.KEY_ENTER)
            this.seqIdx := 0
            this.status := Format("Shaker: scoop {1} of {2}",
                                  this.idx + 1, this.recipe.Length)
        }
        this.RunSeq("SHK_NEXT")
    }

    static S_Next() {
        Log.Add(Format("scoop {1} = {2} into slot {3}", this.idx + 1,
                       this.recipe[this.idx + 1], this.idx + 1))
        this.idx++
        this.seq := [], this.seqIdx := 0

        this.Go((this.idx >= this.recipe.Length) ? "SHK_FINAL" : "SHK_HOME_OFF")
    }

    static S_HomeOff() {
        this.status := "Shaker: re-anchoring"
        if (this.deadline = 0) {
            if !Inp.Key(CFG.KEY_NAV)
                return
            this.navOn := false
            this.deadline := A_TickCount + CFG.SHK_STEP_MS
            return
        }
        if (A_TickCount >= this.deadline)
            this.Go("SHK_HOME_ON")
    }

    static S_HomeOn() {
        if (this.deadline = 0) {
            if !Inp.Key(CFG.KEY_NAV)
                return
            this.navOn := true
            this.deadline := A_TickCount + CFG.SHK_MENU_MS
            return
        }
        if (A_TickCount >= this.deadline)
            this.Go(this.idx >= this.recipe.Length ? "SHK_FINAL" : "SHK_PICK")
    }

    static S_Final() {
        if !this.seq.Length {
            this.status := "Shaker: finalising"
            this.seq := [CFG.KEY_ENTER]
            this.seqIdx := 0
            this.clicked := false
        }
        if !this.clicked {
            if (this.deadline && A_TickCount < this.deadline)
                return
            if !Inp.Click()
                return
            this.clicked := true
            this.deadline := A_TickCount + CFG.SHK_MENU_MS
            return
        }
        if (this.deadline && A_TickCount < this.deadline)
            return
        this.RunSeq("SHK_NAVOFF")
    }

    static S_NavOff() {
        this.status := "Shaker: navigation off"
        if !this.navOn {
            this.Stop("done")
            return
        }
        if (this.deadline = 0) {
            if !Inp.Key(CFG.KEY_NAV)
                return
            this.navOn := false
            this.deadline := A_TickCount + CFG.NAV_SETTLE_MS
            return
        }
        if (A_TickCount >= this.deadline)
            this.Stop("done")
    }
}

class Eat {
    static state    := "IDLE"
    static status   := "Idle"
    static running  := false
    static inTick   := false
    static tState   := 0
    static deadline := 0

    static bought   := 0
    static eaten    := 0
    static held     := 0
    static clicks   := 0
    static equipped := false
    static slotIdx  := 1
    static tNextBuy := 0
    static tNextClk := 0
    static tSlotFree := 0
    static seq      := []
    static seqIdx   := 0
    static stopWhy  := ""

    static stopOrd := { ok: false, why: "" }
    static tBuyGuard := 0
    static sweepIdx  := 1
    static sweepPass := 0
    static Capacity() => Max(1, CFG.EAT_SLOTS - CFG.EAT_SLOT_MARGIN)
    static ClicksPer() => CFG.EAT_INSTANT ? 1 : 3
    static SlotKey() => CFG.EAT_SLOT_KEYS[CFG.EAT_SLOT_ADV ? this.slotIdx : 1]

    static Start() {
        if this.running
            return
        if !Runner.Claim("eat") {
            this.status := "another routine is running"
            return
        }
        if !Geom.Refresh() || !Geom.Active() {
            this.status := "Roblox is not focused"
            Runner.Release("eat")
            return
        }
        this.running := true
        this.bought := 0, this.eaten := 0, this.held := 0, this.clicks := 0
        this.equipped := false, this.slotIdx := 1
        this.tNextBuy := 0, this.tNextClk := 0, this.tSlotFree := 0
        this.tBuyGuard := 0, this.sweepIdx := 1, this.sweepPass := 0
        this.seq := [], this.seqIdx := 0, this.stopWhy := ""

        if (CFG.EAT_STOP_MODE = "phase" && !Rd.On("phase")) {
            this.status := "phase target needs the phase reader"
            Log.Add("EAT REFUSED -- phase reader is off")
            this.running := false
            Runner.Release("eat")
            Say("READER REQUIRED",
                "Stopping at a phase needs the phase badge reader, which is "
              . "switched off in Settings. Turn it back on, or set a chicken "
              . "count instead.")
            return
        }
        this.stopOrd := (CFG.EAT_STOP_MODE = "phase")
            ? Read.TargetOrdinal(CFG.EAT_STOP_PHASE)
            : { ok: false, why: "" }
        if (CFG.EAT_STOP_MODE = "count" && CFG.EAT_TARGET <= 0) {
            this.status := "chicken target is 0"
            Log.Add("EAT REFUSED -- target is 0")
            this.running := false
            Runner.Release("eat")
            Say("NOTHING TO DO",
                "The chicken target is 0. Set a count or a phase target on the "
              . "Calories tab.")
            return
        }
        if (CFG.EAT_STOP_MODE = "phase" && !this.stopOrd.ok) {
            this.status := "phase target rejected: " this.stopOrd.why
            Log.Add("EAT REFUSED -- " this.stopOrd.why)
            this.running := false
            Runner.Release("eat")
            MsgBox this.stopOrd.why, "Eat: bad phase target", "Icon!"
            return
        }
        Log.Add("==== EAT target " CFG.EAT_TARGET " bought"
              . (this.stopOrd.ok ? ", or " this.stopOrd.label " or higher" : "")
              . ", " this.ClicksPer() " click(s) per chicken ====")
        this.Go("EAT_OPEN")
        SetTimer(ObjBindMethod(Eat, "Tick"), CFG.TICK_MS)
    }

    static Stop(why := "done") {
        if !this.running
            return
        SetTimer(ObjBindMethod(Eat, "Tick"), 0)
        this.running := false, this.state := "IDLE", this.status := why
        Log.Add(Format("==== EAT end: {1} -- bought {2}, eaten {3}, held {4} ====",
                       why, this.bought, this.eaten, this.held))
        Runner.Release("eat")
        if (this.bought > 0)
            Hook.EatDone(this.bought, this.eaten, why)
    }

    static Go(s) {
        this.state := s, this.tState := A_TickCount, this.deadline := 0
    }
    static Wait(ms) => (A_TickCount - this.tState) >= ms

    static Step(key, next, ms := 0) {
        if (this.deadline = 0) {
            if !Inp.Key(key)
                return
            this.deadline := A_TickCount + (ms ? ms : CFG.NAV_STEP_MS)
            return
        }
        if (A_TickCount >= this.deadline)
            this.Go(next)
    }

    static RunSeq(next) {
        if (this.seqIdx >= this.seq.Length) {
            this.Go(next)
            return
        }
        if (this.deadline && A_TickCount < this.deadline)
            return
        if !Inp.Key(this.seq[this.seqIdx + 1])
            return
        this.seqIdx++
        this.deadline := A_TickCount + CFG.NAV_STEP_MS
    }

    static Tick() {
        if (this.inTick || !this.running)
            return
        this.inTick := true
        try
            this._Tick()
        finally
            this.inTick := false
    }

    static _Tick() {
        if !Geom.Refresh() {
            this.Stop("lost the Roblox client")
            return
        }
        if !Geom.Active() {
            this.status := "PAUSED -- Roblox lost focus"
            return
        }

        now := A_TickCount
        if (this.tSlotFree && now >= this.tSlotFree) {
            this.tSlotFree := 0
            this.clicks := 0, this.equipped := false

            if (this.held > 0)
                this.held--, this.eaten++

            this.tBuyGuard := now + CFG.EAT_FREE_GUARD_MS
            if (this.state = "EAT_DRAIN")
                this.sweepIdx++
            else if CFG.EAT_SLOT_ADV
                this.slotIdx := Mod(this.slotIdx, CFG.EAT_SLOTS) + 1
            Log.Add(Format("ate one -- bought {1}, eaten {2}, held {3}",
                           this.bought, this.eaten, this.held))
        }

        switch this.state {
            case "EAT_OPEN":   this.S_Open()
            case "EAT_NAVON":  this.S_NavOn()
            case "EAT_DOWN":   this.S_Down()
            case "EAT_RUN":    this.S_Run()
            case "EAT_CLOSE":  this.S_Close()
            case "EAT_NAVOFF": this.S_NavOff()
            case "EAT_DRAIN":  this.S_Drain()
        }
    }

    static S_Open() {
        this.status := "Eat: opening the vendor"
        if (this.deadline = 0) {
            if !Inp.Tap(CFG.KEY_PROMPT)
                return
            this.deadline := A_TickCount + CFG.PROMPT_WAIT_MS
            return
        }
        if (A_TickCount >= this.deadline)
            this.Go("EAT_NAVON")
    }

    static S_NavOn() {
        this.status := "Eat: navigation on"
        this.Step(CFG.KEY_NAV, "EAT_DOWN", CFG.NAV_SETTLE_MS)
    }

    static S_Down() {
        this.status := "Eat: selecting chicken"
        this.Step(CFG.KEY_DOWN, "EAT_RUN")
    }

    static S_Run() {
        now := A_TickCount

        if !this.stopWhy {
            if this.stopOrd.ok {
                cur := Read.PhaseOrdinal()
                if (cur.ok && cur.ord >= this.stopOrd.ord)
                    this.stopWhy := "reached " cur.label
            } else if (this.bought >= CFG.EAT_TARGET)
                this.stopWhy := "bought " this.bought
        }

        if this.stopWhy {
            this.seq := [], this.seqIdx := 0
            this.Go("EAT_CLOSE")
            return
        }

        if (now >= this.tNextBuy && now >= this.tBuyGuard
            && this.held < this.Capacity()) {
            if Inp.Key(CFG.KEY_ENTER) {
                this.bought++, this.held++
                this.tNextBuy := now + CFG.EAT_BUY_MS
                Log.Add(Format("bought #{1} -- held {2}", this.bought, this.held))
            }
        }

        if (this.bought >= CFG.EAT_START_AT && this.held > 0)
            this._EatTick(now, this.SlotKey())

        this.status := Format("Eat: bought {1}/{2} - eaten {3} - held {4}/{5} - slot {6}",
                              this.bought, this.stopOrd.ok ? "phase" : CFG.EAT_TARGET,
                              this.eaten, this.held, this.Capacity(), this.SlotKey())
    }

    static _EatTick(now, key) {
        if (this.tSlotFree || now < this.tNextClk)
            return
        if !this.equipped {
            if Inp.Key(key) {
                this.equipped := true
                this.clicks := 0
                this.tNextClk := now + CFG.EAT_EQUIP_MS
            }
            return
        }
        if Inp.Click() {
            this.clicks++
            if (this.clicks >= this.ClicksPer())
                this.tSlotFree := now + CFG.EAT_FREE_MS
            else
                this.tNextClk := now + CFG.EAT_CLICK_MS
        }
    }

    static S_Close() {
        if !this.seq.Length {
            this.status := "Eat: closing the shop"
            this.seq := [CFG.KEY_UP, CFG.KEY_ENTER]
            this.seqIdx := 0
        }
        this.RunSeq("EAT_NAVOFF")
    }

    static S_NavOff() {
        this.status := "Eat: navigation off"
        if (this.deadline = 0) {
            if !Inp.Key(CFG.KEY_NAV)
                return
            this.deadline := A_TickCount + CFG.NAV_SETTLE_MS
            return
        }
        if (A_TickCount >= this.deadline) {
            this.sweepIdx := 1, this.sweepPass := 0
            this.equipped := false, this.clicks := 0
            this.Go("EAT_DRAIN")
        }
    }

    static S_Drain() {
        now := A_TickCount
        if (this.sweepIdx > CFG.EAT_SLOTS) {
            this.sweepPass++
            this.sweepIdx := 1
            Log.Add(Format("drain pass {1} complete -- held {2}",
                           this.sweepPass, this.held))

            if (this.held <= 0 || this.sweepPass >= CFG.EAT_SWEEP_MAX) {
                this.Stop(this.stopWhy ? this.stopWhy : "done")
                return
            }
        }
        this._EatTick(now, CFG.EAT_SLOT_KEYS[this.sweepIdx])
        this.status := Format("Eat: clearing slot {1} ({2}/{3}) - pass {4} - eaten {5}",
                              CFG.EAT_SLOT_KEYS[this.sweepIdx], this.sweepIdx,
                              CFG.EAT_SLOTS, this.sweepPass + 1, this.eaten)
    }
}

class Http {
    static Request(method, url, body := "", headers := 0) {
        try {
            req := ComObject("WinHttp.WinHttpRequest.5.1")
            req.SetTimeouts(CFG.HTTP_TIMEOUT, CFG.HTTP_TIMEOUT,
                            CFG.HTTP_TIMEOUT, CFG.HTTP_TIMEOUT * 2)
            req.Open(method, url, false)

            req.SetRequestHeader("User-Agent", "SPEARHEADS-UGG/" BUILD.VERSION)
            if headers {
                for k, v in headers
                    req.SetRequestHeader(k, v)
            }

            (body != "") ? req.Send(this.Utf8(body)) : req.Send()
            return { ok: (req.Status >= 200 && req.Status < 300),
                     status: req.Status, body: req.ResponseText }
        } catch as e
            return { ok: false, status: 0, body: "", why: e.Message }
    }

    static Utf8(str) {
        n := StrPut(str, "UTF-8") - 1
        buf := Buffer(n + 1, 0)
        StrPut(str, buf, "UTF-8")
        arr := ComObjArray(0x11, n)
        loop n
            arr[A_Index - 1] := NumGet(buf, A_Index - 1, "UChar")
        return arr
    }

    static Esc(t) {
        t := StrReplace(t, "\", "\\")
        t := StrReplace(t, '"', '\"')
        t := StrReplace(t, "`n", "\n")
        t := StrReplace(t, "`r", "")
        t := StrReplace(t, "`t", "\t")
        return t
    }

    static Clamp(t, n) => (StrLen(t) > n) ? SubStr(t, 1, n - 3) "..." : t
}

class Update {
    static available := false
    static latest    := ""
    static checked   := false
    static why       := ""

    static Part(arr, i) {
        if (arr.Length < i)
            return 0
        d := RegExReplace(arr[i], "\D")
        return (d = "") ? 0 : Integer(d)
    }

    static Newer(a, b) {
        if (a = "" || b = "")
            return false
        pa := StrSplit(RegExReplace(a, "^[vV]"), ".")
        pb := StrSplit(RegExReplace(b, "^[vV]"), ".")
        loop 3 {
            x := this.Part(pa, A_Index), y := this.Part(pb, A_Index)
            if (x != y)
                return x > y
        }
        return false
    }

    static Check() {
        r := Http.Request("GET", CFG.RELEASES_API)
        this.checked := true
        if !r.ok {

            this.why := r.status ? "HTTP " r.status : ("no connection: " (r.HasOwnProp("why") ? r.why : "?"))
            Log.Add("update check failed -- " this.why)
            return false
        }
        if !RegExMatch(r.body, '"tag_name"\s*:\s*"([^"]+)"', &m) {
            this.why := "no tag_name in the response"
            Log.Add("update check failed -- " this.why)
            return false
        }

        this.latest := RegExMatch(m[1], "\d+(?:\.\d+)*", &vm)
            ? vm[0] : RegExReplace(m[1], "^\s*[vV]")
        try
            this.available := this.Newer(this.latest, BUILD.VERSION)
        catch as e {
            this.available := false
            this.why := "could not read the release tag"
            Log.Add("update check: unparseable tag '" this.latest "'")
            return false
        }
        this.why := ""
        Log.Add("update check: latest " this.latest ", running " BUILD.VERSION
              . (this.available ? " -- UPDATE AVAILABLE" : " -- up to date"))
        return true
    }

    static CheckAsync() => SetTimer((*) => Update.Check(), -1500)

    static Notice() => this.available
        ? Format("v{1} available (running v{2}) -- {3}", this.latest, BUILD.VERSION,
                 CFG.RELEASES_URL)
        : ""
}

class Hook {
    static sent := 0, failed := 0, lastErr := "", lastBody := "", lastJson := ""
    static lastPostSets := 0

    static Ready() => CFG.WEBHOOK_URL != ""

    static Colour(kind) =>
        (kind = "fail")  ? 0xC0392B
      : (kind = "phase") ? 0x2ECC71
      : (kind = "best")  ? 0xF1C40F
      : (kind = "end")   ? 0x34764C
      :                    0x293A1D

    static Fields(parts*) {
        out := ""
        for v in parts
            out .= (out ? "," : "") v
        return out
    }

    static Field(name, value, inline := true) =>
        '{"name":"' Http.Esc(Http.Clamp(name, 256))
      . '","value":"' Http.Esc(Http.Clamp(value != "" ? value : "-", CFG.EMBED_FIELD_MAX))
      . '","inline":' (inline ? "true" : "false") "}"

    static Post(kind, title, desc, fields := "", ping := false) {
        if !this.Ready()
            return false
        content := (ping && CFG.DISCORD_ID != "") ? "<@" CFG.DISCORD_ID ">" : ""
        json := '{"username":"' Http.Esc(Http.Clamp(CFG.WEBHOOK_NAME, 80)) '"'
              . ',"content":"' Http.Esc(content) '"'
              . ',"embeds":[{"title":"' Http.Esc(Http.Clamp(title, 256)) '"'
              . ',"description":"' Http.Esc(Http.Clamp(desc, CFG.EMBED_DESC_MAX)) '"'
              . ',"color":' this.Colour(kind)
              . (fields != "" ? ',"fields":[' fields "]" : "")
              . ',"footer":{"text":"SPEARHEADS - UGG Macro v' BUILD.VERSION
              . " - " (CFG.IRONMAN ? "IRONMAN" : "DEFAULT") '"}'
              . "}]}"

        r := Http.Request("POST", CFG.WEBHOOK_URL, json,
                          Map("Content-Type", "application/json; charset=utf-8"))
        if r.ok {
            this.sent++
            Log.Add("webhook " kind " -> " r.status)
            return true
        }
        this.failed++

        this.lastErr := "HTTP " r.status
        this.lastBody := Http.Clamp(r.body, 400)
        this.lastJson := Http.Clamp(json, 400)
        Log.Add("WEBHOOK FAILED " kind " -> " this.lastErr " | " this.lastBody)
        Log.Add("  payload was: " this.lastJson)
        return false
    }

    static SessionStart(mode, exercise) {
        this.lastPostSets := 0
        this.Post("start", "Session started",
                  Update.available ? "**" Update.Notice() "**" : "",
                  this.Fields(this.Field("Exercise", exercise),
                              this.Field("Mode", mode),
                              this.Field("Profile", CFG.IRONMAN ? "Ironman" : "Default"),
                              this.Field("Phase", Stats.phaseLabel)))
    }

    static Progress() {
        this.Post("progress", "Progress", "", Stats.Fields())
    }

    static SessionEnd(why) {
        this.Post("end", "Session ended", why, Stats.Fields())
    }

    static PhaseChange(from, to, ord) {
        if (ord > 0)
            return
        this.Post("phase", "Phase changed", "**" from "**  ->  **" to "**",
                  "", CFG.PING_PHASE)
    }

    static PersonalBest(exercise, kg, startedAt) {
        this.Post("best", "Personal best",
                  "**" exercise "** -- " kg " kg"
                . ((startedAt && startedAt < kg)
                   ? "  (started this session at " startedAt " kg, +" (kg - startedAt) ")"
                   : ""))
    }

    static EatDone(bought, eaten, why) {
        this.Post("end", "Eating finished", why,
                  this.Fields(this.Field("Bought", bought),
                              this.Field("Eaten", eaten),
                              this.Field("Phase", Stats.phaseLabel)),
                  CFG.PING_PHASE)
    }

    static Failure(why) {
        this.Post("fail", "Macro stopped", why, "", CFG.PING_FAIL)
    }

    static Test() {
        if !this.Ready() {
            Say("NO WEBHOOK", "Set a webhook URL first, on the Settings tab under "
                            . "Discord.")
            return
        }
        ok := this.Post("progress", "Test post",
                        "If you can read this, the webhook is configured correctly.",
                        this.Fields(this.Field("Version", "v" BUILD.VERSION),
                                    this.Field("Update", Update.checked
                                        ? (Update.available ? Update.latest " available"
                                                            : "up to date")
                                        : "not checked yet")))
        Say(ok ? "TEST SENT" : "TEST FAILED",
            ok ? "The webhook is configured correctly."
               : (this.lastErr ". Discord said: " this.lastBody))
    }
}

class UX {

    static BG        := 0xF20A0B0A
    static PANEL     := 0xFF121412
    static PANEL_HI  := 0xFF181B18
    static EDGE      := 0xFF232823
    static HAIR      := 0xFF2E342E
    static TEXT      := 0xFFFFFFFF
    static DIM       := 0xFF6E766E
    static ACCENT    := 0xFF34764C
    static ACCENT_HI := 0xFF57D98C
    static WARN      := 0xFFC8A03C
    static FAIL      := 0xFFC0392B

    static S1 := 6, S2 := 10, S3 := 16, S4 := 24

    static RULE   := 2
    static BORDER := 2

    static TOPBAR := 42
    static TABBAR := 34
    static NOTICE := 26
    static ROW    := 34
    static FOOT   := 22
    static WIN_W  := 700
    static RADIUS := 0

    static SCALE := 1.0

    static AutoScale() {
        d := A_ScreenDPI
        return (d >= 72 && d <= 480) ? Round(d / 96, 2) : 1.0
    }

    static NUDGE := 0

    static Role(name) {
        r := this._Role(name)
        r.dy += this.NUDGE
        return r
    }

    static _Role(name) {
        switch name {
            case "title":  return { s: 16, b: 1, c: this.TEXT,      dy: 2 }
            case "tab":    return { s: 11, b: 1, c: this.TEXT,      dy: 3 }
            case "label":  return { s: 10, b: 1, c: this.DIM,       dy: 2 }
            case "value":  return { s: 13, b: 1, c: this.TEXT,      dy: 2 }
            case "key":    return { s: 17, b: 1, c: this.ACCENT_HI, dy: 2 }
            case "icon":   return { s: 19, b: 1, c: this.TEXT,      dy: 3 }
            case "index":  return { s: 34, b: 1, c: this.PANEL_HI,  dy: 2 }
            case "status": return { s: 11, b: 1, c: this.TEXT,      dy: 2 }
            case "dim":    return { s: 10, b: 1, c: this.DIM,       dy: 3 }

            case "subtab": return { s: 10, b: 1, c: this.DIM,       dy: 5 }
            default:       return { s: 11, b: 0, c: this.TEXT,      dy: 2 }
        }
    }

    static FONTS := ["Bahnschrift", "Segoe UI"]

    static WEIGHT := 0.7

    static TRACK := 4

}

class Gfx {
    static token := 0, hModule := 0, fontCache := Map()

    static Start() {
        if this.token
            return true
        this.hModule := DllCall("LoadLibrary", "Str", "gdiplus.dll", "Ptr")
        si := Buffer(24, 0)
        NumPut("UInt", 1, si, 0)
        if DllCall("gdiplus\GdiplusStartup", "UPtr*", &tok := 0, "Ptr", si, "Ptr", 0)
            return false
        this.token := tok
        return true
    }

    static Stop() {
        for , f in this.fontCache {
            DllCall("gdiplus\GdipDeleteFont", "UPtr", f.font)
            DllCall("gdiplus\GdipDeleteFontFamily", "UPtr", f.fam)
        }
        this.fontCache := Map()
        if this.token
            DllCall("gdiplus\GdiplusShutdown", "UPtr", this.token), this.token := 0
        if this.hModule
            DllCall("FreeLibrary", "Ptr", this.hModule), this.hModule := 0
    }

    static Graphics(hdc, scale := 0) {
        DllCall("gdiplus\GdipCreateFromHDC", "Ptr", hdc, "UPtr*", &g := 0)
        if (scale && scale != 1.0)
            DllCall("gdiplus\GdipScaleWorldTransform", "UPtr", g, "Float", scale,
                    "Float", scale, "Int", 0)
        DllCall("gdiplus\GdipSetSmoothingMode", "UPtr", g, "Int", 4)
        DllCall("gdiplus\GdipSetTextRenderingHint", "UPtr", g, "Int", 4)
        return g
    }
    static Free(g) => DllCall("gdiplus\GdipDeleteGraphics", "UPtr", g)
    static Clear(g) => DllCall("gdiplus\GdipGraphicsClear", "UPtr", g, "UInt", 0x00000000)

    static Brush(argb) {
        DllCall("gdiplus\GdipCreateSolidFill", "UInt", argb, "UPtr*", &b := 0)
        return b
    }
    static FreeBrush(b) => DllCall("gdiplus\GdipDeleteBrush", "UPtr", b)

    static Pen(argb, w := 1) {
        DllCall("gdiplus\GdipCreatePen1", "UInt", argb, "Float", w, "Int", 2, "UPtr*", &p := 0)
        return p
    }
    static FreePen(p) => DllCall("gdiplus\GdipDeletePen", "UPtr", p)

    static Rect(g, x, y, w, h, argb) {
        b := this.Brush(argb)
        DllCall("gdiplus\GdipFillRectangle", "UPtr", g, "UPtr", b,
                "Float", x, "Float", y, "Float", w, "Float", h)
        this.FreeBrush(b)
    }

    static Line(g, x1, y1, x2, y2, argb, w := 1) {
        p := this.Pen(argb, w)
        DllCall("gdiplus\GdipDrawLine", "UPtr", g, "UPtr", p,
                "Float", x1, "Float", y1, "Float", x2, "Float", y2)
        this.FreePen(p)
    }

    static RoundPath(x, y, w, h, r) {
        DllCall("gdiplus\GdipCreatePath", "Int", 0, "UPtr*", &path := 0)
        d := r * 2
        DllCall("gdiplus\GdipAddPathArc", "UPtr", path, "Float", x, "Float", y,
                "Float", d, "Float", d, "Float", 180, "Float", 90)
        DllCall("gdiplus\GdipAddPathArc", "UPtr", path, "Float", x + w - d, "Float", y,
                "Float", d, "Float", d, "Float", 270, "Float", 90)
        DllCall("gdiplus\GdipAddPathArc", "UPtr", path, "Float", x + w - d,
                "Float", y + h - d, "Float", d, "Float", d, "Float", 0, "Float", 90)
        DllCall("gdiplus\GdipAddPathArc", "UPtr", path, "Float", x, "Float", y + h - d,
                "Float", d, "Float", d, "Float", 90, "Float", 90)
        DllCall("gdiplus\GdipClosePathFigure", "UPtr", path)
        return path
    }

    static Round(g, x, y, w, h, r, argb) {
        path := this.RoundPath(x, y, w, h, r)
        b := this.Brush(argb)
        DllCall("gdiplus\GdipFillPath", "UPtr", g, "UPtr", b, "UPtr", path)
        this.FreeBrush(b)
        DllCall("gdiplus\GdipDeletePath", "UPtr", path)
    }

    static RoundEdge(g, x, y, w, h, r, argb, width := 1) {
        path := this.RoundPath(x, y, w, h, r)
        p := this.Pen(argb, width)
        DllCall("gdiplus\GdipDrawPath", "UPtr", g, "UPtr", p, "UPtr", path)
        this.FreePen(p)
        DllCall("gdiplus\GdipDeletePath", "UPtr", path)
    }

    static Clip(g, x, y, w, h) =>
        DllCall("gdiplus\GdipSetClipRect", "UPtr", g, "Float", x, "Float", y,
                "Float", w, "Float", h, "Int", 0)
    static Unclip(g) => DllCall("gdiplus\GdipResetClip", "UPtr", g)

    static Ellipse(g, x, y, w, h, argb, fill := true, width := 1) {
        if fill {
            b := this.Brush(argb)
            DllCall("gdiplus\GdipFillEllipse", "UPtr", g, "UPtr", b,
                    "Float", x, "Float", y, "Float", w, "Float", h)
            this.FreeBrush(b)
        } else {
            p := this.Pen(argb, width)
            DllCall("gdiplus\GdipDrawEllipse", "UPtr", g, "UPtr", p,
                    "Float", x, "Float", y, "Float", w, "Float", h)
            this.FreePen(p)
        }
    }

    static Hatch(g, x, y, w, h, argb, step := 6, width := 1) {
        DllCall("gdiplus\GdipSetClipRect", "UPtr", g, "Float", x, "Float", y,
                "Float", w, "Float", h, "Int", 0)
        px := x - h
        while (px < x + w) {
            this.Line(g, px, y + h, px + h, y, argb, width)
            px += step
        }
        DllCall("gdiplus\GdipResetClip", "UPtr", g)
    }

    static Tri(g, x1, y1, x2, y2, x3, y3, argb) {
        DllCall("gdiplus\GdipCreatePath", "Int", 0, "UPtr*", &path := 0)
        DllCall("gdiplus\GdipAddPathLine", "UPtr", path, "Float", x1, "Float", y1,
                "Float", x2, "Float", y2)
        DllCall("gdiplus\GdipAddPathLine", "UPtr", path, "Float", x2, "Float", y2,
                "Float", x3, "Float", y3)
        DllCall("gdiplus\GdipClosePathFigure", "UPtr", path)
        b := this.Brush(argb)
        DllCall("gdiplus\GdipFillPath", "UPtr", g, "UPtr", b, "UPtr", path)
        this.FreeBrush(b)
        DllCall("gdiplus\GdipDeletePath", "UPtr", path)
    }

    static Lens(g, cx, cy, w, h, argb, width := 1) {
        DllCall("gdiplus\GdipCreatePath", "Int", 0, "UPtr*", &path := 0)
        DllCall("gdiplus\GdipAddPathBezier", "UPtr", path,
                "Float", cx - w, "Float", cy, "Float", cx - w * 0.5, "Float", cy - h,
                "Float", cx + w * 0.5, "Float", cy - h, "Float", cx + w, "Float", cy)
        DllCall("gdiplus\GdipAddPathBezier", "UPtr", path,
                "Float", cx + w, "Float", cy, "Float", cx + w * 0.5, "Float", cy + h,
                "Float", cx - w * 0.5, "Float", cy + h, "Float", cx - w, "Float", cy)
        DllCall("gdiplus\GdipClosePathFigure", "UPtr", path)
        p := this.Pen(argb, width)
        DllCall("gdiplus\GdipDrawPath", "UPtr", g, "UPtr", p, "UPtr", path)
        this.FreePen(p)
        DllCall("gdiplus\GdipDeletePath", "UPtr", path)
    }

    static Font(size, bold) {
        key := size "|" bold
        if this.fontCache.Has(key)
            return this.fontCache[key]
        fam := 0
        for , name in UX.FONTS {
            if !DllCall("gdiplus\GdipCreateFontFamilyFromName", "Str", name,
                        "UPtr", 0, "UPtr*", &fam := 0)
                break
        }
        DllCall("gdiplus\GdipCreateFont", "UPtr", fam, "Float", size,
                "Int", bold ? 1 : 0, "Int", 2, "UPtr*", &font := 0)
        this.fontCache[key] := { font: font, fam: fam }
        return this.fontCache[key]
    }

    static Width(g, str, role) {
        r := UX.Role(role)
        f := this.Font(r.s, r.b)

        DllCall("gdiplus\GdipStringFormatGetGenericTypographic", "UPtr*", &fmt := 0)
        layout := Buffer(16, 0), box := Buffer(16, 0)
        NumPut("Float", 0, layout, 0), NumPut("Float", 0, layout, 4)
        NumPut("Float", 4000, layout, 8), NumPut("Float", 300, layout, 12)
        DllCall("gdiplus\GdipMeasureString", "UPtr", g, "Str", str, "Int", -1,
                "UPtr", f.font, "Ptr", layout, "UPtr", fmt, "Ptr", box,
                "UInt*", 0, "UInt*", 0)
        return NumGet(box, 8, "Float")
    }

    static trackCache := Map()
    static TrackedWidth(g, str, role, gap) {
        key := role "|" gap "|" str
        if this.trackCache.Has(key)
            return this.trackCache[key]
        total := 0, n := 0
        loop parse str {
            total += this.Width(g, A_LoopField, role)
            n++
        }
        this.trackCache[key] := total + gap * Max(0, n - 1)
        return this.trackCache[key]
    }

    static TrackedC(g, str, x, y, w, h, role, gap, colour := 0) {
        tw := this.TrackedWidth(g, str, role, gap)
        this.Tracked(g, str, x + (w - tw) / 2, y, h, role, gap, colour)
    }

    static Tracked(g, str, x, y, h, role, gap, colour := 0) {
        loop parse str {
            ch := A_LoopField
            cw := this.Width(g, ch, role)
            this.Text(g, ch, x, y, cw + 2, h, role, 0, colour)
            x += cw + gap
        }
    }

    static Wrap(g, str, x, y, w, role, colour := 0) {
        r := UX.Role(role)
        f := this.Font(r.s, r.b)
        DllCall("gdiplus\GdipCreateStringFormat", "Int", 0, "Int", 0, "UPtr*", &fmt := 0)
        layout := Buffer(16, 0), box := Buffer(16, 0)
        NumPut("Float", 0, layout, 0), NumPut("Float", 0, layout, 4)
        NumPut("Float", w, layout, 8), NumPut("Float", 3000, layout, 12)
        DllCall("gdiplus\GdipMeasureString", "UPtr", g, "Str", str, "Int", -1,
                "UPtr", f.font, "Ptr", layout, "UPtr", fmt, "Ptr", box,
                "UInt*", 0, "UInt*", 0)
        h := NumGet(box, 12, "Float") + 4
        rect := Buffer(16, 0)
        NumPut("Float", x, rect, 0), NumPut("Float", y, rect, 4)
        NumPut("Float", w, rect, 8), NumPut("Float", h, rect, 12)
        b := this.Brush(colour ? colour : r.c)
        DllCall("gdiplus\GdipDrawString", "UPtr", g, "Str", str, "Int", -1,
                "UPtr", f.font, "Ptr", rect, "UPtr", fmt, "UPtr", b)
        this.FreeBrush(b)
        DllCall("gdiplus\GdipDeleteStringFormat", "UPtr", fmt)
        return h
    }

    static Text(g, str, x, y, w, h, role, align := 0, colour := 0) {
        r := UX.Role(role)

        y += r.HasOwnProp("dy") ? r.dy : 0
        f := this.Font(r.s, r.b)
        DllCall("gdiplus\GdipCreateStringFormat", "Int", 0, "Int", 0, "UPtr*", &fmt := 0)
        DllCall("gdiplus\GdipSetStringFormatAlign", "UPtr", fmt, "Int", align)
        DllCall("gdiplus\GdipSetStringFormatLineAlign", "UPtr", fmt, "Int", 1)
        DllCall("gdiplus\GdipSetStringFormatFlags", "UPtr", fmt, "Int", 0x1000)
        rect := Buffer(16, 0)
        NumPut("Float", x, rect, 0), NumPut("Float", y, rect, 4)
        NumPut("Float", w, rect, 8), NumPut("Float", h, rect, 12)
        b := this.Brush(colour ? colour : r.c)

        if (UX.WEIGHT > 0) {
            loop 2 {
                off := (A_Index = 1) ? -UX.WEIGHT / 2 : UX.WEIGHT / 2
                NumPut("Float", x + off, rect, 0)
                DllCall("gdiplus\GdipDrawString", "UPtr", g, "Str", str, "Int", -1,
                        "UPtr", f.font, "Ptr", rect, "UPtr", fmt, "UPtr", b)
            }
        } else
            DllCall("gdiplus\GdipDrawString", "UPtr", g, "Str", str, "Int", -1,
                    "UPtr", f.font, "Ptr", rect, "UPtr", fmt, "UPtr", b)
        this.FreeBrush(b)
        DllCall("gdiplus\GdipDeleteStringFormat", "UPtr", fmt)
    }
}

class UI {
    static gui := 0, hwnd := 0
    static hdc := 0, hbm := 0, obm := 0, gr := 0
    static w := 0, h := 0
    static x := 0, y := 0
    static ready := false, visible := false

    static tab := "LIFTING"
    static TABS := ["LIFTING", "CALORIES", "STATS", "SETTINGS"]
    static collapsed := false
    static pinned := true

    static hNow := 0.0, hFrom := 0.0, hTo := 0.0
    static animT0 := 0, animMs := 0
    static sub := "GENERAL"

    static dlg := { on: false, title: "", body: "" }
    static Say(title, body) {
        this.dlg := { on: true, title: title, body: body }
        this.dirty := true
    }
    static picking := false
    static pickMachine := 0

    static slideT0 := 0
    static PICK_ROWS := 13
    static SLIDE_MS := 220

    static SlidePos() {
        if !this.pickMachine
            return 0
        return this.Ease(Min(1.0, (A_TickCount - this.slideT0) / this.SLIDE_MS))
    }
    static SlideSettled() =>
        this.pickMachine && (A_TickCount - this.slideT0) >= this.SLIDE_MS

    static SelectMachine(i) {
        this.pickMachine := i
        this.slideT0 := A_TickCount
        this.dirty := true
    }
    static showBests := false
    static showKeys := false
    static showReaders := false
    static pickScroll := 0

    static stam := { ok: false, pct: 0 }
    static tPoll := 0
    static tClient := 0
    static tOverlay := 0
    static NextCheck() =>
        Max(0, Round((CFG.CLIENT_CHECK_MS - (A_TickCount - this.tClient)) / 1000))
    static hot := ""
    static hits := Map()
    static drag := false, dragX := 0, dragY := 0
    static dirty := true

    static measured := Map()
    static bodyLast := 0

    static ViewKey() =>
        this.tab (this.tab = "SETTINGS" ? ":" this.sub : "")
      . (this.picking   ? ":pick" : "")
      . (this.showBests ? ":pb"   : "")
      . (this.showKeys  ? ":keys" : "")
      . (this.showReaders ? ":rd" : "")
      . (this.dlg.on    ? ":dlg"  : "")
      . (this.collapsed ? ":col"  : "")

    static BodyHeight(tab) {
        k := this.ViewKey()
        return this.measured.Has(k) ? this.measured[k] : UX.ROW * 4 + UX.S3 * 2
    }

    static NoteBody(usedH) {
        key := this.ViewKey()
        h := Round(usedH + UX.S3 * 2)
        if (!this.measured.Has(key) || Abs(this.measured[key] - h) > 1)
            this.measured[key] := h
    }

    static NoticeH() => Update.available ? UX.NOTICE : 0

    static TargetHeight() {

        if this.dlg.on
            return UX.TOPBAR + this.NoticeH() + this.BodyHeight(this.tab) + UX.S2

        if this.collapsed
            return UX.TOPBAR + this.NoticeH() + (UX.ROW - 6) + 22 + UX.S2 * 2
        return UX.TOPBAR + this.NoticeH() + UX.TABBAR + this.BodyHeight(this.tab)
             + UX.FOOT + UX.S2
    }

    static Init() {
        if !Gfx.Start()
            return false

        this.gui := Gui("-Caption +E0x08080000")
        this.gui.Title := "SPEARHEADS UGG Macro"
        this.gui.Opt("+AlwaysOnTop")
        this.gui.Show("NA Hide")
        this.hwnd := this.gui.Hwnd

        Geom.Refresh()
        bx := Geom.ok ? Geom.cx + Geom.cw - this.PhysW() - UX.S4
                      : A_ScreenWidth - this.PhysW() - 40
        by := Geom.ok ? Geom.cy + UX.S4 : 40
        this.x := IniRead(CFG.CFG_PATH, "ui", "x", bx) + 0
        this.y := IniRead(CFG.CFG_PATH, "ui", "y", by) + 0

        sc := IniRead(CFG.CFG_PATH, "ui", "scale", "auto")
        UX.SCALE := (sc = "auto") ? UX.AutoScale()
                  : ((sc + 0 >= 0.75 && sc + 0 <= 3.0) ? sc + 0 : UX.AutoScale())
        this.pinned := IniRead(CFG.CFG_PATH, "ui", "pinned", "1") = "1"
        this.collapsed := IniRead(CFG.CFG_PATH, "ui", "collapsed", "0") = "1"

        this.hNow := this.TargetHeight(), this.hTo := this.hNow
        this.Clamp()

        this.ready := true
        OnMessage(0x0201, ObjBindMethod(UI, "OnDown"))
        OnMessage(0x0202, ObjBindMethod(UI, "OnUp"))
        OnMessage(0x0200, ObjBindMethod(UI, "OnMove"))

        OnMessage(0x007E, ObjBindMethod(UI, "OnDisplayChange"))
        this.Show()
        SetTimer(ObjBindMethod(UI, "Tick"), 16)
        return true
    }

    static Show() {
        this.visible := true

        this.dirty := true
        this.Paint()
        DllCall("ShowWindow", "Ptr", this.hwnd, "Int", 8)
        this.Raise()
    }

    static Raise() {
        DllCall("SetWindowPos", "Ptr", this.hwnd,
                "Ptr", this.pinned ? -1 : -2,
                "Int", 0, "Int", 0, "Int", 0, "Int", 0,
                "UInt", 0x0013)
        if !this.pinned
            DllCall("SetWindowPos", "Ptr", this.hwnd, "Ptr", 0, "Int", 0, "Int", 0,
                    "Int", 0, "Int", 0, "UInt", 0x0013)
    }

    static Hide() {
        this.visible := false
        this.gui.Hide()
    }

    static Toggle() => this.visible ? this.Hide() : this.Show()

    static Rescue() {
        if !this.visible {
            this.Clamp()
            this.Show()
            return
        }
        if this.Offscreen() {
            this.Recentre()
            this.Raise()
            Diag.Toast("Panel brought back on screen", 3000)
            return
        }
        this.Hide()
    }

    static Clamp() {
        vx := DllCall("GetSystemMetrics", "Int", 76, "Int")
        vy := DllCall("GetSystemMetrics", "Int", 77, "Int")
        vw := DllCall("GetSystemMetrics", "Int", 78, "Int")
        vh := DllCall("GetSystemMetrics", "Int", 79, "Int")
        if (vw < 1 || vh < 1)
            return false
        grab := 140
        nx := Max(vx - this.PhysW() + grab, Min(this.x, vx + vw - grab))
        ny := Max(vy, Min(this.y, vy + vh - Round(UX.TOPBAR * UX.SCALE)))
        moved := (nx != this.x || ny != this.y)
        this.x := nx, this.y := ny
        if moved
            this.dirty := true
        return moved
    }

    static Recentre() {
        Geom.Refresh()
        this.x := Geom.ok ? Geom.cx + Geom.cw - this.PhysW() - UX.S4
                          : DllCall("GetSystemMetrics", "Int", 0, "Int") - this.PhysW() - 40
        this.y := Geom.ok ? Geom.cy + UX.S4 : 40
        this.Clamp()
        this.SavePos()
        this.dirty := true
    }

    static Offscreen() {
        vx := DllCall("GetSystemMetrics", "Int", 76, "Int")
        vy := DllCall("GetSystemMetrics", "Int", 77, "Int")
        vw := DllCall("GetSystemMetrics", "Int", 78, "Int")
        vh := DllCall("GetSystemMetrics", "Int", 79, "Int")
        return (this.x + 140 < vx) || (this.x > vx + vw - 60)
            || (this.y < vy - 2) || (this.y > vy + vh - Round(UX.TOPBAR * UX.SCALE))
    }

    static SavePos() {
        try {
            DirCreate A_AppData "\UGGMacro"
            IniWrite this.x, CFG.CFG_PATH, "ui", "x"
            IniWrite this.y, CFG.CFG_PATH, "ui", "y"
            IniWrite this.pinned ? 1 : 0, CFG.CFG_PATH, "ui", "pinned"
            IniWrite Format("{:.2f}", UX.SCALE), CFG.CFG_PATH, "ui", "scale"
            IniWrite this.collapsed ? 1 : 0, CFG.CFG_PATH, "ui", "collapsed"
        }
    }

    static Close() {
        SetTimer(ObjBindMethod(UI, "Tick"), 0)
        this.SavePos()
        this.Release()
        Gfx.Stop()
    }

    static Surface(w, h) {
        pw := Round(w * UX.SCALE), ph := Round(h * UX.SCALE)
        if (this.hbm && this.w = pw && this.h = ph)
            return true
        this.Release()
        w := pw, h := ph
        bi := Buffer(40, 0)
        NumPut("UInt", 40, bi, 0)
        NumPut("Int", w, bi, 4)
        NumPut("Int", -h, bi, 8)
        NumPut("UShort", 1, bi, 12)
        NumPut("UShort", 32, bi, 14)
        NumPut("UInt", 0, bi, 16)
        this.hdc := DllCall("gdi32\CreateCompatibleDC", "Ptr", 0, "Ptr")
        this.hbm := DllCall("gdi32\CreateDIBSection", "Ptr", this.hdc, "Ptr", bi,
                            "UInt", 0, "Ptr*", &bits := 0, "Ptr", 0, "UInt", 0, "Ptr")
        if !this.hbm
            return false
        this.obm := DllCall("gdi32\SelectObject", "Ptr", this.hdc, "Ptr", this.hbm, "Ptr")
        this.gr := Gfx.Graphics(this.hdc, UX.SCALE)
        this.w := w, this.h := h
        return true
    }

    static Release() {
        if this.gr
            Gfx.Free(this.gr), this.gr := 0
        if (this.hdc && this.obm)
            DllCall("gdi32\SelectObject", "Ptr", this.hdc, "Ptr", this.obm)
        if this.hbm
            DllCall("gdi32\DeleteObject", "Ptr", this.hbm), this.hbm := 0
        if this.hdc
            DllCall("gdi32\DeleteDC", "Ptr", this.hdc), this.hdc := 0
        this.w := 0, this.h := 0
    }

    static PhysW() => Round(UX.WIN_W * UX.SCALE)

    static Push() {
        pt  := Buffer(8, 0), sz := Buffer(8, 0), src := Buffer(8, 0), bl := Buffer(4, 0)
        NumPut("Int", this.x, pt, 0), NumPut("Int", this.y, pt, 4)
        NumPut("Int", this.w, sz, 0), NumPut("Int", this.h, sz, 4)
        NumPut("UChar", 0, bl, 0), NumPut("UChar", 0, bl, 1)
        NumPut("UChar", 255, bl, 2), NumPut("UChar", 1, bl, 3)
        DllCall("UpdateLayeredWindow", "Ptr", this.hwnd, "Ptr", 0, "Ptr", pt,
                "Ptr", sz, "Ptr", this.hdc, "Ptr", src, "UInt", 0, "Ptr", bl,
                "UInt", 2)
    }

    static AnimateTo(h, ms := 220) {
        if (Abs(h - this.hTo) < 0.5)
            return
        this.hFrom := this.hNow, this.hTo := h
        this.animT0 := A_TickCount, this.animMs := ms
        this.dirty := true
    }

    static Ease(t) => 1 - (1 - t) ** 3

    static Tick() {
        if !this.ready || !this.visible
            return
        this.DragGuard()
        if (A_TickCount - this.tOverlay > 300) {
            this.tOverlay := A_TickCount
            was := Overlay.blocked.Length
            Overlay.Tick()
            if (was != Overlay.blocked.Length)
                this.dirty := true
        }
        if (A_TickCount - this.tClient > CFG.CLIENT_CHECK_MS) {
            this.tClient := A_TickCount
            Geom.Refresh()
            Geom.CheckDpi()
            this.dirty := true
        }
        if (A_TickCount - this.tPoll > 150) {
            this.tPoll := A_TickCount

            if (Rd.On("stamina") && Geom.ok && Read.staminaB)
                this.stam := Read.Stamina()
            else if !Rd.On("stamina")
                this.stam := { ok: false, pct: 0 }
            this.dirty := true
        }

        if (this.picking && !this.SlideSettled())
            this.dirty := true
        if (this.edit.on)
            this.dirty := true
        this.EditGuard()
        want := this.TargetHeight()
        if (Abs(want - this.hTo) > 0.5)
            this.AnimateTo(want)

        if (Abs(this.hNow - this.hTo) > 0.4) {
            t := this.animMs ? Min(1.0, (A_TickCount - this.animT0) / this.animMs) : 1.0
            this.hNow := this.hFrom + (this.hTo - this.hFrom) * this.Ease(t)
            if (t >= 1.0)
                this.hNow := this.hTo
            this.dirty := true
        }
        if this.dirty
            this.Paint()
    }

    static Hit(id, x, y, w, h) {
        this.hits[id] := [x, y, w, h]
        return this.hot = id
    }

    static At(mx, my) {

        if (UX.SCALE != 1.0)
            mx /= UX.SCALE, my /= UX.SCALE
        for id, r in this.hits {
            if (mx >= r[1] && mx < r[1] + r[3] && my >= r[2] && my < r[2] + r[4])
                return id
        }
        return ""
    }

    static OnMove(wp, lp, msg, hw) {
        if (hw != this.hwnd)
            return
        mx := lp & 0xFFFF, my := (lp >> 16) & 0xFFFF
        if (mx > 32767)
            mx -= 65536
        if (my > 32767)
            my -= 65536
        if this.drag {
            MouseGetPos(&sx, &sy)
            this.x := sx - this.dragX, this.y := sy - this.dragY
            this.dirty := true
            return
        }
        id := this.At(mx, my)
        if (id != this.hot) {
            this.hot := id, this.dirty := true
            if (SubStr(id, 1, 5) != "band:")
                Overlay.preview := 0
        }
    }

    static OnDown(wp, lp, msg, hw) {
        if (hw != this.hwnd)
            return
        mx := lp & 0xFFFF, my := (lp >> 16) & 0xFFFF
        id := this.At(mx, my)

        if (this.edit.on && id != "type:" this.edit.id
            && !(this.edit.id = "pick" && SubStr(id, 1, 5) = "pick:"))
            this.EndEdit(this.edit.id != "pick")
        if (id = "") {
            my /= (UX.SCALE ? UX.SCALE : 1)

            if (my < UX.TOPBAR) {
                MouseGetPos(&sx, &sy)
                this.drag := true, this.dragX := sx - this.x, this.dragY := sy - this.y

                DllCall("SetCapture", "Ptr", this.hwnd)
            }
            return
        }
        this.Click(id)
    }

    static OnUp(wp, lp, msg, hw) {
        if this.drag {
            this.drag := false
            DllCall("ReleaseCapture")
            this.Clamp()
            this.SavePos()
        }
    }

    static OnDisplayChange(wp, lp, msg, hw) {
        if this.Clamp()
            Diag.Toast("Screen changed -- panel moved back on screen", 3500)
        this.dirty := true
    }

    static DragGuard() {
        if (this.drag && !GetKeyState("LButton", "P")) {
            this.drag := false
            DllCall("ReleaseCapture")
            this.SavePos()
        }
    }

    static Click(id) {
        switch id {
            case "close":    ExitApp()
            case "pin":      this.pinned := !this.pinned
                             this.Raise()
                             this.SavePos()
                             Diag.Toast(this.pinned
                                 ? "Panel pinned above other windows"
                                 : "Panel unpinned -- it stays in the taskbar, and "
                                 . "Ctrl+Shift+F brings it back", 4000)
            case "collapse": this.collapsed := !this.collapsed, this.SavePos()
            case "info":     this.ShowInfo()
            case "notice":   try Run(CFG.RELEASES_URL)
        }
        if (SubStr(id, 1, 4) = "tab:")
            this.tab := SubStr(id, 5)
        else if (SubStr(id, 1, 4) = "sub:")
            this.sub := SubStr(id, 5)
        else if (SubStr(id, 1, 5) = "mode:") {
            Engine.mode := SubStr(id, 6)

            Engine.lastGameMode := ""
            TestCfg.Save()
        }
        else if (SubStr(id, 1, 4) = "act:")
            this.RefuseAction(id)
        else
            this.Control(id)
        this.dirty := true
    }

    static Paint() {
        if !this.ready
            return
        hgt := Round(this.hNow)
        if (hgt < 8)
            return
        if !this.Surface(UX.WIN_W, hgt)
            return
        this.hits := Map()

        Paint.Frame(this.gr, UX.WIN_W, hgt)
        this.Push()
        this.dirty := false
    }

    static edit := { on: false, id: "", buf: "", label: "" }
    static ih := 0

    static BeginEdit(id, label, initial := "") {

        if (this.edit.on && this.edit.id = id)
            return
        if this.edit.on
            this.EndEdit(false)
        this.edit := { on: true, id: id, buf: "" initial, label: label }
        this.ih := InputHook("I1")
        this.ih.KeyOpt("{All}", "S")

        this.ih.KeyOpt("{LShift}{RShift}{LCtrl}{RCtrl}{LAlt}{RAlt}{CapsLock}", "-S")

        this.ih.KeyOpt("{All}", "N")
        this.ih.OnChar := (h, ch) => UI.EditChar(ch)
        this.ih.OnKeyDown := (h, vk, sc) => UI.EditKey(vk)
        this.ih.Start()
        this.dirty := true
    }

    static EditChar(ch) {

        if (GetKeyState("Ctrl", "P"))
            return
        if (Ord(ch) < 32 || StrLen(this.edit.buf) >= 400)
            return

        if (ch ~= "^[A-Za-z]$") {
            upper := GetKeyState("Shift", "P") != GetKeyState("CapsLock", "T")
            ch := upper ? StrUpper(ch) : StrLower(ch)
        }
        this.edit.buf .= ch
        this.dirty := true
    }

    static EditKey(vk) {
        if (vk = 86 && GetKeyState("Ctrl", "P")) {
            paste := ""
            try paste := A_Clipboard
            paste := RegExReplace(paste, "[\r\n\t]", "")
            this.edit.buf := SubStr(this.edit.buf paste, 1, 400)
            this.dirty := true
            return
        }
        if (vk = 8)
            this.edit.buf := SubStr(this.edit.buf, 1, -1)
        else if (vk = 13)
            this.EndEdit(true)
        else if (vk = 27 || vk = 9)
            this.EndEdit(false)
        this.dirty := true
    }

    static EditGuard() {
        if !this.edit.on
            return
        if (!this.ih || !this.ih.InProgress) {
            this.EndEdit(true)
            return
        }

        if GetKeyState("LButton", "P") {
            MouseGetPos(&mx, &my)
            if (mx < this.x || mx >= this.x + this.w
                || my < this.y || my >= this.y + this.h)
                this.EndEdit(true)
        }
    }

    static EndEdit(commit) {
        if !this.edit.on
            return
        id := this.edit.id, val := Trim(this.edit.buf)
        this.edit := { on: false, id: "", buf: "", label: "" }
        try this.ih.Stop()
        this.ih := 0
        this.dirty := true
        if !commit
            return
        switch id {
            case "eat:count":
                if (n := Integer(RegExReplace(val, "\D")) + 0)
                    CFG.EAT_TARGET := Max(1, Min(9999, n)), CFG.EAT_STOP_MODE := "count"
            case "eat:phase":
                if RegExMatch(val, "^-?\d+$")
                    CFG.EAT_STOP_PHASE := val, CFG.EAT_STOP_MODE := "phase"
            case "dsc:url":
                CFG.WEBHOOK_URL := RegExMatch(val, "i)^https://discord") ? val : ""
            case "dsc:name":
                if (val != "")
                    CFG.WEBHOOK_NAME := SubStr(val, 1, 32)
            case "dsc:every":
                CFG.WEBHOOK_EVERY := Max(0, Min(999, Integer(RegExReplace(val, "\D")) + 0))
            case "dsc:id":
                CFG.DISCORD_ID := RegExReplace(val, "\D")
            case "pick":
                this.pickQuery := val
                return
        }
        TestCfg.Save()
    }

    static pickQuery := ""

    static binding := ""
    static bindHook := 0

    static BeginBind(id) {
        this.EndEdit(false)
        this.binding := id
        this.bindHook := InputHook("I1")
        this.bindHook.KeyOpt("{All}", "NS")
        this.bindHook.OnKeyDown := (h, vk, sc) => UI.BindKey(vk, sc)
        this.bindHook.Start()
        this.dirty := true
    }

    static BindKey(vk, sc) {
        if (vk = 16 || vk = 17 || vk = 18 || vk = 91 || vk = 92)
            return
        id := this.binding
        this.binding := ""
        try this.bindHook.Stop()
        this.bindHook := 0
        this.dirty := true
        if (vk = 27)
            return
        name := ""
        try name := GetKeyName(Format("vk{:X}sc{:X}", vk, sc))
        if (name = "")
            return
        if (SubStr(id, 1, 5) = "game.") {

            CFG.KEY_NAV := Format("{{vk{:X}sc{:X}}}", vk, sc)
            CFG.KEY_NAV_NAME := StrUpper(name)
            TestCfg.Save()
            return
        }
        if (clash := Keys.Clash(id, name)) {
            this.Say("KEY IN USE", "That key is already bound to " clash ". Pick "
                                 . "another one.")
            return
        }
        Keys.Set(id, name)
    }

    static SearchText() =>
        (this.edit.on && this.edit.id = "pick") ? this.edit.buf : this.pickQuery

    static RefuseAction(id) {
        key := (id = "act:eat") ? Keys.Show("eat")
             : (id = "act:shaker") ? Keys.Show("shaker")
             : (id = "act:lifth") ? Keys.Show("lift.hyp") : Keys.Show("lift.str")
        what := (id = "act:eat") ? "eating"
              : (id = "act:shaker") ? "the shaker"
              : (id = "act:lifth") ? "hypertrophy lifting" : "strength lifting"
        this.Say("USE THE KEY",
                 "Press " key " to start " what ". This panel will not start it for "
               . "you on purpose: Roblox has to be the focused window, and clicking "
               . "here means it is not, so the first inputs would go nowhere. Click "
               . "into the game, then press " key ".")
    }

    static Step(v, d, lo, hi) => Max(lo, Min(hi, v + d))

    static Control(id) {
        parts := StrSplit(id, ":")
        grp := parts[1], item := parts.Length > 1 ? parts[2] : ""
        dir := parts.Length > 2 ? (parts[3] = "inc" ? 1 : -1) : 0

        switch grp {
            case "eat":
                if (item = "mode")
                    CFG.EAT_STOP_MODE := (CFG.EAT_STOP_MODE = "phase") ? "count" : "phase"
                else if (item = "instant")
                    CFG.EAT_INSTANT := !CFG.EAT_INSTANT
                else if (item = "count")
                    CFG.EAT_TARGET := this.Step(CFG.EAT_TARGET, dir * 5, 1, 999)
                else if (item = "phase") {
                    cur := (CFG.EAT_STOP_PHASE = "" || !IsInteger(CFG.EAT_STOP_PHASE))
                        ? 0 : Integer(CFG.EAT_STOP_PHASE)
                    CFG.EAT_STOP_PHASE := this.Step(cur, dir, -2, 999)
                }
                TestCfg.Save()

            case "shk":

                tot := CFG.SHK_PREWORK + CFG.SHK_WHEY + CFG.SHK_CREATINE
                if (dir > 0 && tot >= CFG.SHK_SLOTS)
                    return
                if (item = "P")
                    CFG.SHK_PREWORK := this.Step(CFG.SHK_PREWORK, dir, 0, 1)
                else if (item = "W")
                    CFG.SHK_WHEY := this.Step(CFG.SHK_WHEY, dir, 0, 5)
                else if (item = "C")
                    CFG.SHK_CREATINE := this.Step(CFG.SHK_CREATINE, dir, 0, 5)
                TestCfg.Save()

            case "cfg":
                switch item {
                    case "ontop":     this.pinned := !this.pinned, this.Raise(), this.SavePos()
                    case "collapse":  this.collapsed := !this.collapsed, this.SavePos()
                    case "ironman":   Stats.SwitchProfile(!CFG.IRONMAN), TestCfg.Save()
                    case "instant2":  CFG.EAT_INSTANT := !CFG.EAT_INSTANT, TestCfg.Save()
                    case "speed":     CFG.LIFT_SPEED_PASS := !CFG.LIFT_SPEED_PASS
                    case "liftafter": CFG.SHK_LIFT_AFTER := !CFG.SHK_LIFT_AFTER
                }

            case "band":
                Overlay.preview := 0
                if Calib.Use(Integer(item)) {
                    Read.InvalidateLock()
                    if Read.LockStaminaRow()
                        this.Say("BAND SELECTED",
                                 "Using the " Calib.barW "px bar. " Read.lockedAt)
                    else
                        this.Say("BAND SELECTED",
                                 "Using the " Calib.barW "px bar, but the row would "
                               . "not lock: " Read.lockedAt)
                } else
                    this.Say("BAND REJECTED", Calib.why)

            case "dbg":
                if (item = "outline")
                    Overlay.Flash(5000)
                else if (item = "calib") {
                    Read.InvalidateLock()
                    Overlay.preview := 0
                    if (Calib.RunClear() && Read.LockStaminaRow())
                        this.Say("RE-SCAN DONE",
                                 "HUD measured at " Calib.scale "x. " Read.lockedAt)
                    else if Calib.bands.Length

                        this.Say("PICK A BAR",
                                 (Calib.ok ? Read.lockedAt : Calib.why)
                               . "`n`n" Calib.bands.Length " candidate bar(s) were "
                               . "found. Hover each one below to see it outlined on "
                               . "screen, and click the stamina bar.")
                    else
                        this.Say("RE-SCAN FAILED",
                                 Calib.why
                               . "`n`nStand still in the gym with a full stamina bar, "
                               . "with nothing covering the bottom-left of the screen, "
                               . "and try again.")
                }

            case "ui":
                if (item = "scale") {
                    UX.SCALE := Max(0.75, Min(3.0, Round(UX.SCALE + dir * 0.25, 2)))
                    this.Release()
                    this.Clamp()
                    this.SavePos()
                } else if (item = "autoscale") {
                    UX.SCALE := UX.AutoScale()
                    this.Release()
                    this.Clamp()
                    this.SavePos()
                } else if (item = "weight")
                    UX.WEIGHT := Max(0, Min(2.0, Round(UX.WEIGHT + dir * 0.1, 1)))
                else if (item = "nudge")
                    UX.NUDGE := Max(-4, Min(4, UX.NUDGE + dir))
                TestCfg.Save()

            case "band":
                Overlay.preview := 0
                if Calib.Use(Integer(item)) {
                    Read.InvalidateLock()
                    if Read.LockStaminaRow()
                        this.Say("BAND SELECTED",
                                 "Using the " Calib.barW "px bar. " Read.lockedAt)
                    else
                        this.Say("BAND SELECTED",
                                 "Using the " Calib.barW "px bar, but the row would "
                               . "not lock: " Read.lockedAt)
                } else
                    this.Say("BAND REJECTED", Calib.why)

            case "dbg":
                if (item = "outline")
                    Overlay.Flash(5000)
                else if (item = "calib") {
                    Read.InvalidateLock()
                    Overlay.preview := 0
                    if (Calib.RunClear() && Read.LockStaminaRow())
                        this.Say("RE-SCAN DONE",
                                 "HUD measured at " Calib.scale "x. " Read.lockedAt)
                    else if Calib.bands.Length

                        this.Say("PICK A BAR",
                                 (Calib.ok ? Read.lockedAt : Calib.why)
                               . "`n`n" Calib.bands.Length " candidate bar(s) were "
                               . "found. Hover each one below to see it outlined on "
                               . "screen, and click the stamina bar.")
                    else
                        this.Say("RE-SCAN FAILED",
                                 Calib.why
                               . "`n`nStand still in the gym with a full stamina bar, "
                               . "with nothing covering the bottom-left of the screen, "
                               . "and try again.")
                }

            case "ui":
                if (item = "scale") {
                    UX.SCALE := Max(0.75, Min(3.0, Round(UX.SCALE + dir * 0.25, 2)))
                    this.Release()
                    this.Clamp()
                    this.SavePos()
                } else if (item = "autoscale") {
                    UX.SCALE := UX.AutoScale()
                    this.Release()
                    this.Clamp()
                    this.SavePos()
                } else if (item = "weight")
                    UX.WEIGHT := Max(0, Min(2.0, Round(UX.WEIGHT + dir * 0.1, 1)))
                else if (item = "nudge")
                    UX.NUDGE := Max(-4, Min(4, UX.NUDGE + dir))
                TestCfg.Save()

            case "pick":
                if (item = "close")
                    this.picking := false, this.pickQuery := "", this.EndEdit(false)
                else if (item = "open") {

                    if this.picking {
                        this.picking := false, this.pickQuery := ""
                        this.EndEdit(false)
                        return
                    }
                    this.picking := true
                    this.slideT0 := A_TickCount
                    if (Engine.target) {
                        for i, m in Cat.MACHINES
                            if (m.name = Engine.target.machine)
                                this.pickMachine := i
                    }
                } else if (item = "mach")
                    this.SelectMachine(Integer(parts[3]))
                else if (item = "ex") {
                    m := Cat.MACHINES[Integer(parts[3])]
                    if (e := Cat.Find(m.exercises[Integer(parts[4])]))
                        Picker.Set(e)
                    this.picking := false, this.EndEdit(false)
                } else if (item = "row") {
                    list := Cat.Search(this.SearchText())
                    idx := Integer(parts[3])
                    if (idx >= 1 && idx <= list.Length) {
                        Picker.Set(list[idx])
                        this.picking := false, this.EndEdit(false)
                    }
                }
            case "rd":        Rd.Toggle(item)
            case "rdrestore": Rd.RestoreAll()
            case "bests": this.showBests := !this.showBests
            case "type":
                fid := (parts.Length >= 3) ? parts[2] ":" parts[3] : parts[2]
                if (fid = "pick")
                    this.picking := true
                this.BeginEdit(fid, "")
            case "keys":    this.showKeys := !this.showKeys, this.showReaders := false
            case "readers": this.showReaders := !this.showReaders, this.showKeys := false
            case "bind":  this.BeginBind(parts[2] "." (parts.Length > 2 ? parts[3] : ""))
            case "kofi":    try Run(CFG.KOFI_URL)
            case "discord": try Run(CFG.DISCORD_URL)
            case "unused1": this.Say("KEYBINDS",
                            "Custom keybinds arrive with the collapsed mode. For now: "
                          . CFG.KEY_LIFT_STR " lift, " CFG.KEY_EAT " eat, "
                          . CFG.KEY_SHAKER " shaker, " CFG.KEY_QUIT " quit.")
            case "dlg":   this.dlg := { on: false, title: "", body: "" }
            case "dbg":
                switch item {
                    case "self": Diag.Show()
                    case "dump": Teach.Dump()
                    case "mode": Mode.Cycle()
                }
            case "dsc":
                switch item {
                    case "test": Hook.Test()
                    case "help": this.Say("DISCORD WEBHOOK",
                                   "In Discord, open the channel you want posts in, then "
                                 . "Edit Channel, Integrations, Webhooks, New Webhook, and "
                                 . "Copy Webhook URL. Click the WEBHOOK URL field above and "
                                 . "paste it in, then press Enter.`n`n"
                                 . "No server of your own? The SPEARHEADS server has a place "
                                 . "to make your own logs channel -- the DISCORD SERVER "
                                 . "button on the General tab.")
                }
        }
    }

    static ShowInfo() {
        this.Say("HOW THIS WORKS",
                 "Roblox must be the focused window. It ignores input it did not "
               . "receive directly, so the macro cannot run in the background or while "
               . "you are in another program.`n`n"
               . "The macro never moves your mouse. Reps are clicks wherever the cursor "
               . "already sits, so park it over the game and leave it there.`n`n"
               . "This panel cannot take focus, so clicking it will not interrupt a "
               . "running session. Drag it by the top bar; if you unpin it and lose it, "
               . "Ctrl+Shift+F brings it back.`n`n"
               . "Keys:  " Keys.Show("lift.str") " strength  -  "
               . Keys.Show("lift.hyp") " hypertrophy  -  " Keys.Show("eat")
               . " eat  -  " Keys.Show("shaker") " shaker  -  " Keys.Show("quit")
               . " quit")
    }
}

class Overlay {
    static gui := 0, hwnd := 0, hdc := 0, hbm := 0, obm := 0, gr := 0
    static w := 0, h := 0, shown := false
    static until := 0
    static blocked := []

    static preview := 0

    static Watched() {
        m := Map()
        if Rd.On("stamina")
            m["STAMINA"] := Rgn.Stamina()
        if Rd.On("phase")
            m["PHASE"] := Digits.PhaseRegion()
        if Rd.On("weight")
            m["WEIGHT"] := Digits.WeightRegion()
        if Rd.On("lift")
            m["LIFTING"] := Rgn.AutoWeight()
        if Rd.On("menu")
            m["MENU"] := Rgn.MenuX()
        return m
    }

    static Check() {
        out := []
        if (!Geom.ok || !UI.visible)
            return out
        px := UI.x, py := UI.y, pw := UI.w, ph := UI.h
        for name, r in this.Watched() {
            if (r.w < 1 || r.h < 1)
                continue
            if !(px + pw <= r.x || px >= r.x + r.w
                 || py + ph <= r.y || py >= r.y + r.h)
                out.Push(name)
        }
        return out
    }

    static Init() {
        if this.hwnd
            return true

        this.gui := Gui("-Caption +ToolWindow +E0x08080020")
        this.gui.Show("NA Hide")
        this.hwnd := this.gui.Hwnd
        return true
    }

    static Surface(w, h) {
        pw := Round(w * UX.SCALE), ph := Round(h * UX.SCALE)
        if (this.hbm && this.w = pw && this.h = ph)
            return true
        this.Release()
        w := pw, h := ph
        bi := Buffer(40, 0)
        NumPut("UInt", 40, bi, 0), NumPut("Int", w, bi, 4), NumPut("Int", -h, bi, 8)
        NumPut("UShort", 1, bi, 12), NumPut("UShort", 32, bi, 14)
        this.hdc := DllCall("gdi32\CreateCompatibleDC", "Ptr", 0, "Ptr")
        this.hbm := DllCall("gdi32\CreateDIBSection", "Ptr", this.hdc, "Ptr", bi,
                            "UInt", 0, "Ptr*", &bits := 0, "Ptr", 0, "UInt", 0, "Ptr")
        if !this.hbm
            return false
        this.obm := DllCall("gdi32\SelectObject", "Ptr", this.hdc, "Ptr", this.hbm, "Ptr")
        this.gr := Gfx.Graphics(this.hdc)
        this.w := w, this.h := h
        return true
    }

    static Release() {
        if this.gr
            Gfx.Free(this.gr), this.gr := 0
        if (this.hdc && this.obm)
            DllCall("gdi32\SelectObject", "Ptr", this.hdc, "Ptr", this.obm)
        if this.hbm
            DllCall("gdi32\DeleteObject", "Ptr", this.hbm), this.hbm := 0
        if this.hdc
            DllCall("gdi32\DeleteDC", "Ptr", this.hdc), this.hdc := 0
        this.w := 0, this.h := 0
    }

    static Flash(ms := 5000) {
        this.until := A_TickCount + ms
        this.Draw()
    }

    static Hide() {
        if this.shown
            this.gui.Hide(), this.shown := false
    }

    static Tick() {
        this.blocked := this.Check()
        manual := (this.until && A_TickCount < this.until) || this.preview
        if (this.blocked.Length || manual)
            this.Draw()
        else
            this.Hide()
    }

    static Draw() {
        if (!Geom.ok || !this.Init())
            return
        if !this.Surface(Geom.cw, Geom.ch)
            return
        g := this.gr
        Gfx.Clear(g)

        if (this.preview && Calib.bands.Length >= this.preview) {
            bd := Calib.bands[this.preview]
            r := Geom.BL(bd.start, bd.bot, bd.len, bd.top - bd.bot + 1)
            x := r.x - Geom.cx, y := r.y - Geom.cy
            Gfx.Rect(g, x - 1, y - 1, r.w + 2, 2, UX.ACCENT_HI)
            Gfx.Rect(g, x - 1, y + r.h - 1, r.w + 2, 2, UX.ACCENT_HI)
            Gfx.Rect(g, x - 1, y - 1, 2, r.h + 2, UX.ACCENT_HI)
            Gfx.Rect(g, x + r.w - 1, y - 1, 2, r.h + 2, UX.ACCENT_HI)
            lbl := bd.len "px"
            ly := (y > 20) ? y - 19 : y + r.h + 3
            tw := Gfx.Width(g, lbl, "tab") + 12
            Gfx.Rect(g, x - 1, ly, tw, 17, UX.ACCENT_HI)
            Gfx.Text(g, lbl, x + 5, ly, tw, 17, "tab", 0, 0xFF000000)
            this.Push()
            return
        }

        onlyBlocked := !(this.until && A_TickCount < this.until)
        for name, r in this.Watched() {
            hit := false
            for , b in this.blocked
                hit := hit || (b = name)
            if (onlyBlocked && !hit)
                continue
            col := hit ? UX.FAIL : UX.ACCENT_HI
            x := r.x - Geom.cx, y := r.y - Geom.cy
            Gfx.Rect(g, x - 1, y - 1, r.w + 2, 2, col)
            Gfx.Rect(g, x - 1, y + r.h - 1, r.w + 2, 2, col)
            Gfx.Rect(g, x - 1, y - 1, 2, r.h + 2, col)
            Gfx.Rect(g, x + r.w - 1, y - 1, 2, r.h + 2, col)

            ly := (y > 20) ? y - 19 : y + r.h + 3
            tw := Gfx.Width(g, name, "tab") + 12
            Gfx.Rect(g, x - 1, ly, tw, 17, col)
            Gfx.Text(g, name, x + 5, ly, tw, 17, "tab", 0, 0xFF000000)
        }
        this.Push()
    }

    static Push() {
        pt := Buffer(8, 0), sz := Buffer(8, 0), src := Buffer(8, 0), bl := Buffer(4, 0)
        NumPut("Int", Geom.cx, pt, 0), NumPut("Int", Geom.cy, pt, 4)
        NumPut("Int", this.w, sz, 0), NumPut("Int", this.h, sz, 4)
        NumPut("UChar", 255, bl, 2), NumPut("UChar", 1, bl, 3)
        if !this.shown
            DllCall("ShowWindow", "Ptr", this.hwnd, "Int", 8), this.shown := true
        DllCall("SetWindowPos", "Ptr", this.hwnd, "Ptr", -1, "Int", 0, "Int", 0,
                "Int", 0, "Int", 0, "UInt", 0x0013)
        DllCall("UpdateLayeredWindow", "Ptr", this.hwnd, "Ptr", 0, "Ptr", pt,
                "Ptr", sz, "Ptr", this.hdc, "Ptr", src, "UInt", 0, "Ptr", bl,
                "UInt", 2)
    }

    static Close() {
        this.Release()
        try this.gui.Destroy()
    }
}

class Paint {

    static Mark(g, cx, cy, r, argb) {
        Gfx.Ellipse(g, cx - r, cy - r, r * 2, r * 2, argb, false, 2)
        Gfx.Lens(g, cx, cy, r * 0.86, r * 0.72, argb, 1.6)
        Gfx.Ellipse(g, cx - r * 0.46, cy - r * 0.46, r * 0.92, r * 0.92,
                    argb, false, 1.2)
        Gfx.Ellipse(g, cx - r * 0.2, cy - r * 0.2, r * 0.4, r * 0.4, argb)

        pi := 3.14159265
        loop 3 {
            rad := ((A_Index - 1) * 120 - 90) * pi / 180
            dx := Cos(rad), dy := Sin(rad)
            px := -dy, py := dx
            ox := cx + dx * r * 0.92, oy := cy + dy * r * 0.92
            hx := cx + dx * r * 0.46, hy := cy + dy * r * 0.46
            tx := cx + dx * r * 0.26, ty := cy + dy * r * 0.26
            Gfx.Line(g, ox, oy, hx, hy, argb, 1.6)
            Gfx.Tri(g, tx, ty, hx + px * r * 0.17, hy + py * r * 0.17,
                    hx - px * r * 0.17, hy - py * r * 0.17, argb)
        }
    }

    static Brackets(g, x, y, w, h, argb, len := 14) {
        t := 3
        Gfx.Rect(g, x, y, len, t, argb),            Gfx.Rect(g, x, y, t, len, argb)
        Gfx.Rect(g, x + w - len, y, len, t, argb),  Gfx.Rect(g, x + w - t, y, t, len, argb)
        Gfx.Rect(g, x, y + h - t, len, t, argb),    Gfx.Rect(g, x, y + h - len, t, len, argb)
        Gfx.Rect(g, x + w - len, y + h - t, len, t, argb)
        Gfx.Rect(g, x + w - t, y + h - len, t, len, argb)
    }

    static IconBtn(g, id, x, y, size) {
        on := (UI.hot = id)
        UI.Hit(id, x, y, size, size)
        if on {
            Gfx.Rect(g, x, y, size, size, UX.PANEL_HI)
            Gfx.Rect(g, x, y, size, 2, id = "close" ? UX.FAIL : UX.ACCENT_HI)
        }
        col := (id = "close" && on) ? UX.FAIL
             : (id = "pin" && UI.pinned) ? UX.ACCENT_HI
             : on ? UX.TEXT : UX.DIM
        cx := x + size / 2, cy := y + size / 2
        switch id {
            case "close":
                Gfx.Line(g, cx - 5, cy - 5, cx + 5, cy + 5, col, 3)
                Gfx.Line(g, cx + 5, cy - 5, cx - 5, cy + 5, col, 3)
            case "pin":

                if UI.pinned
                    Gfx.Rect(g, cx - 4, cy - 6, 8, 6, col)
                else
                    Gfx.Rect(g, cx - 4, cy - 6, 8, 6, col), Gfx.Rect(g, cx - 2.5, cy - 4.5, 5, 3, UX.PANEL)
                Gfx.Rect(g, cx - 1.5, cy, 3, 4, col)
                Gfx.Tri(g, cx, cy + 8, cx - 3, cy + 4, cx + 3, cy + 4, col)
            case "info":

                Gfx.Text(g, "?", x, y, size, size, "icon", 1, col)
            case "collapse":

                if UI.collapsed {
                    Gfx.Tri(g, cx, cy + 7, cx - 6, cy + 2, cx + 6, cy + 2, col)
                    Gfx.Tri(g, cx, cy + 1, cx - 6, cy - 4, cx + 6, cy - 4, col)
                } else {
                    Gfx.Tri(g, cx, cy - 5, cx - 6, cy, cx + 6, cy, col)
                    Gfx.Tri(g, cx, cy + 1, cx - 6, cy + 6, cx + 6, cy + 6, col)
                }
        }
    }

    static IconLabel() {
        switch UI.hot {
            case "close":    return "Quit the macro"
            case "pin":      return UI.pinned ? "Unpin from the top" : "Keep above other windows"
            case "info":     return "How this works"
            case "collapse": return UI.collapsed ? "Expand the panel" : "Collapse the panel"
        }
        return ""
    }

    static StatusText() {

        if Overlay.blocked.Length {
            names := ""
            for , n in Overlay.blocked
                names .= (names ? ", " : "") n
            return "PANEL IS COVERING " names " -- MOVE IT"
        }
        if !Geom.ok
            return "ROBLOX NOT FOUND -- rechecking in " UI.NextCheck() "s"
        if (Runner.Busy() && Rd.DegradedCount())
            return Runner.Status() "   [" Rd.DegradedCount() " reader(s) auto-disabled]"
        if (Runner.Busy() && Rd.AnyOff())
            return Runner.Status() "   [" Rd.OffCount() " reader(s) off]"
        if Runner.Busy()
            return Runner.Status()
        if (Engine.failWhy != "")
            return "FAIL: " Engine.failWhy
        return Engine.status
    }

    static Row(g, x, y, w, label, value, vcol := 0) {
        Gfx.Text(g, label, x, y, w * 0.45, UX.ROW, "label", 0)
        Gfx.Text(g, value, x + w * 0.45, y, w * 0.55, UX.ROW, "value", 2, vcol)
        Gfx.Rect(g, x, y + UX.ROW - 1, w, 1, UX.EDGE)
    }

    static Btn(g, id, x, y, w, h, text, active := false) {
        on := (UI.hot = id)
        UI.Hit(id, x, y, w, h)
        Gfx.Rect(g, x, y, w, h, active ? UX.ACCENT : (on ? UX.PANEL_HI : UX.BG))
        Gfx.Rect(g, x, y, w, 2, active ? UX.ACCENT_HI : (on ? UX.ACCENT : UX.EDGE))
        Gfx.Rect(g, x, y + h - 2, w, 2, active ? UX.ACCENT_HI : UX.EDGE)
        Gfx.TrackedC(g, text, x, y, w, h, "tab", 2,
                     active ? UX.BG : (on ? UX.TEXT : UX.DIM))
    }

    static Stepper(g, id, x, y, w, label, value, atMin := false, atMax := false) {
        bw := 26
        Gfx.Text(g, label, x, y, w - bw * 2 - UX.S2, UX.ROW, "label", 0)
        mx := x + w - bw * 2 - UX.S1, px := x + w - bw
        vx := x + w - bw * 2 - UX.S1 - 54
        Gfx.Text(g, value, vx, y, 50, UX.ROW, "value", 2)
        for side, bx in Map("-", mx, "+", px) {
            bid := id ":" (side = "-" ? "dec" : "inc")
            dead := (side = "-") ? atMin : atMax
            on := (UI.hot = bid) && !dead
            if !dead
                UI.Hit(bid, bx, y + 4, bw, UX.ROW - 8)
            Gfx.Rect(g, bx, y + 4, bw, UX.ROW - 8, on ? UX.ACCENT : UX.PANEL_HI)
            Gfx.Text(g, side, bx, y + 4, bw, UX.ROW - 8, "value", 1,
                     dead ? UX.EDGE : (on ? UX.BG : UX.TEXT))
        }
        Gfx.Rect(g, x, y + UX.ROW - 1, w, 1, UX.EDGE)
    }

    static Toggle(g, id, x, y, w, label, on) {
        UI.Hit(id, x, y, w, UX.ROW)
        hov := (UI.hot = id)
        Gfx.Text(g, label, x, y, w - 60, UX.ROW, "label", 0, hov ? UX.TEXT : 0)
        bw := 46, bx := x + w - bw
        Gfx.Rect(g, bx, y + 7, bw, UX.ROW - 14, on ? UX.ACCENT : UX.PANEL_HI)
        Gfx.Rect(g, bx, y + 7, bw, 2, on ? UX.ACCENT_HI : UX.EDGE)
        Gfx.TrackedC(g, on ? "ON" : "OFF", bx, y + 7, bw, UX.ROW - 14, "dim", 2,
                     on ? UX.BG : UX.DIM)
        Gfx.Rect(g, x, y + UX.ROW - 1, w, 1, UX.EDGE)
    }

    static Bar(g, x, y, w, h, pct, col) {
        Gfx.Rect(g, x, y, w, h, UX.PANEL_HI)
        if (pct > 0)
            Gfx.Rect(g, x, y, w * Min(1, pct), h, col)
        Gfx.Rect(g, x, y, w, 1, UX.EDGE)
        Gfx.Rect(g, x, y + h - 1, w, 1, UX.EDGE)
    }

    static KeyBlock(g, id, x, y, w, h, key, caption) {
        on := (UI.hot = id)
        UI.Hit(id, x, y, w, h)
        Gfx.Rect(g, x, y, w, h, on ? UX.PANEL_HI : UX.BG)
        Gfx.Rect(g, x, y, 4, h, UX.ACCENT)

        kw := Gfx.Width(g, key, "key")
        Gfx.Text(g, key, x + UX.S3, y, kw + 10, h, "key", 0)
        Gfx.Text(g, caption, x + UX.S3 + kw + UX.S3, y, w - kw - UX.S3 * 3, h * 0.55,
                 "label", 0)
        Gfx.Text(g, "PRESS THE KEY", x + UX.S3 + kw + UX.S3, y + h * 0.42,
                 w - kw - UX.S3 * 3, h * 0.5, "dim", 0)
    }

    static Tab(g, x, y, w, h) {
        px := x + UX.S3, pw := w - UX.S3 * 2, py := y + UX.S3
        used := 0
        switch UI.tab {
            case "LIFTING":  used := this.TabLifting(g, px, py, pw)
            case "CALORIES": used := this.TabCalories(g, px, py, pw)
            case "STATS":    used := this.TabStats(g, px, py, pw)
            case "SETTINGS": used := this.TabSettings(g, px, py, pw)
        }
        UI.NoteBody(used)
    }

    static Dialog(g, x, y, w) {
        y0 := y
        Gfx.Rect(g, x, y, 4, UX.ROW - 8, UX.ACCENT)
        Gfx.Text(g, UI.dlg.title, x + UX.S3, y, w - UX.S3, UX.ROW - 8, "value", 0)
        y += UX.ROW - 6
        y += Gfx.Wrap(g, UI.dlg.body, x, y, w, "label", UX.TEXT) + UX.S2
        this.Btn(g, "dlg", x + w - 120, y, 120, UX.ROW - 8, "GOT IT")
        return y + UX.ROW - 8 - y0
    }

    static Field(g, id, x, y, w, label, value, align := 2, labelW := 0) {
        editing := (UI.edit.on && UI.edit.id = id)
        UI.Hit("type:" id, x, y, w, UX.ROW)
        hov := InStr(UI.hot, id)
        lw := labelW ? labelW : w * 0.5
        Gfx.Text(g, label, x, y, lw, UX.ROW, "label", 0)
        bx := x + lw, bw := w - lw
        Gfx.Rect(g, bx, y + 5, bw, UX.ROW - 10,
                 (editing || hov) ? UX.PANEL_HI : UX.BG)
        Gfx.Rect(g, bx, y + 5, bw, 2, editing ? UX.ACCENT_HI : UX.EDGE)
        show := editing ? (UI.edit.buf (Mod(A_TickCount // 500, 2) ? "|" : " ")) : value
        Gfx.Text(g, show, bx + UX.S2, y, bw - UX.S2 * 2, UX.ROW, "value", align,
                 editing ? UX.ACCENT_HI : 0)
        Gfx.Rect(g, x, y + UX.ROW - 1, w, 1, UX.EDGE)
    }

    static TabLifting(g, x, y, w) {
        y0 := y
        e := Engine.target

        UI.Hit("pick:open", x, y, w, UX.ROW)
        hov := (UI.hot = "pick:open")
        Gfx.Text(g, "EXERCISE", x, y, w * 0.35, UX.ROW, "label", 0)
        Gfx.Text(g, e ? e.name : "choose an exercise", x + w * 0.35, y,
                 w * 0.65 - 18, UX.ROW, "value", 2, hov ? UX.ACCENT_HI : 0)
        Gfx.Tri(g, x + w - 4, y + 15, x + w - 14, y + 15, x + w - 9, y + 21,
                hov ? UX.ACCENT_HI : UX.DIM)
        Gfx.Rect(g, x, y + UX.ROW - 1, w, 1, UX.EDGE)
        y += UX.ROW

        if UI.picking
            return this.Dropdown(g, x, y, w) - y0

        Gfx.Text(g, "MODE", x, y, w * 0.3, UX.ROW, "label", 0)
        bw := (w * 0.62) / 2, bx := x + w - bw * 2
        for , m in MODES.ALL {
            this.Btn(g, "mode:" m, bx, y + 3, bw - 3, UX.ROW - 8, m, Engine.mode = m)
            bx += bw
        }
        Gfx.Rect(g, x, y + UX.ROW - 1, w, 1, UX.EDGE)
        y += UX.ROW

        st := UI.stam
        pct := st.HasOwnProp("pct") ? st.pct : 0
        okRead := st.HasOwnProp("ok") && st.ok
        Gfx.Text(g, "STAMINA", x, y, w * 0.3, UX.ROW, "label", 0)
        Gfx.Text(g, !Rd.On("stamina") ? "reader off"
                                      : (okRead ? Round(pct * 100) "%" : "no read"),
                 x + w - 80, y, 80, UX.ROW, "value", 2,
                 Rd.On("stamina") ? (okRead ? 0 : UX.WARN) : UX.DIM)
        this.Bar(g, x + w * 0.3, y + 12, w * 0.7 - 88, UX.ROW - 24,
                 Rd.On("stamina") ? pct : 0,
                 okRead ? (pct >= 0.99 ? UX.ACCENT_HI : UX.ACCENT) : UX.EDGE)
        Gfx.Rect(g, x, y + UX.ROW - 1, w, 1, UX.EDGE)
        y += UX.ROW + UX.S1

        this.KeyBlock(g, "act:lift", x, y, w * 0.5 - UX.S1, UX.ROW + 8,
                      Keys.Show("lift.str"), "LIFT - STRENGTH")
        this.KeyBlock(g, "act:lifth", x + w * 0.5 + UX.S1, y, w * 0.5 - UX.S1,
                      UX.ROW + 8, Keys.Show("lift.hyp"), "LIFT - HYPERTROPHY")
        return y + UX.ROW + 8 - y0
    }

    static Dropdown(g, x, y, w) {
        q := UI.SearchText()
        if (q != "")
            return this.DropdownSearch(g, x, y, w, q)
        return this.DropdownDecks(g, x, y, w)
    }

    static DropdownDecks(g, x, y, w) {
        UI.Hit("type:pick", x, y, w * 0.7, UX.ROW)
        Gfx.Rect(g, x, y + 4, w * 0.7, UX.ROW - 8, UX.PANEL_HI)
        Gfx.Rect(g, x, y + 4, w * 0.7, 2, UX.ACCENT_HI)
        Gfx.Text(g, "type to search", x + UX.S2, y, w * 0.7 - UX.S2, UX.ROW,
                 "value", 0, UX.DIM)
        this.Btn(g, "pick:close", x + w * 0.72, y + 4, w * 0.28, UX.ROW - 8, "CLOSE")
        y += UX.ROW

        rowH := UX.ROW - 12
        pageH := rowH * UI.PICK_ROWS
        lw := Round(w * 0.46)
        rx := x + lw + UX.S2
        rw := w - lw - UX.S2
        pos := UI.SlidePos()
        settled := UI.SlideSettled()

        for i, m in Cat.MACHINES {
            id := "pick:mach:" i
            ry := y + (i - 1) * rowH
            UI.Hit(id, x, ry, lw, rowH)
            on := (UI.hot = id)
            sel := (UI.pickMachine = i)
            if sel
                Gfx.Rect(g, x, ry, lw, rowH, UX.PANEL_HI)
            else if on
                Gfx.Rect(g, x, ry, lw, rowH, UX.EDGE)
            Gfx.Rect(g, x, ry, 3, rowH, sel ? UX.ACCENT_HI : UX.BG)
            Gfx.Text(g, m.name, x + UX.S2, ry, lw - 30, rowH, "dim", 0,
                     (sel || on) ? UX.TEXT : 0)
            Gfx.Text(g, m.exercises.Length, x, ry, lw - UX.S2, rowH, "dim", 2)
        }
        Gfx.Rect(g, x + lw + UX.S1, y, 1, pageH, UX.EDGE)

        Gfx.Clip(g, rx, y, rw, pageH)
        if UI.pickMachine {
            m := Cat.MACHINES[UI.pickMachine]
            ex := rx - (1 - pos) * rw
            for j, name in m.exercises {
                id := "pick:ex:" UI.pickMachine ":" j
                ry := y + (j - 1) * rowH

                if settled
                    UI.Hit(id, ex, ry, rw, rowH)
                on := settled && (UI.hot = id)
                cur := Engine.target && (Engine.target.name = name)
                if on
                    Gfx.Rect(g, ex, ry, rw, rowH, UX.PANEL_HI)
                Gfx.Rect(g, ex, ry, 3, rowH, cur ? UX.ACCENT_HI : UX.BG)
                Gfx.Text(g, name, ex + UX.S2, ry, rw - UX.S3, rowH, "dim", 0,
                         (on || cur) ? UX.TEXT : 0)
            }
        } else
            Gfx.Text(g, "pick a machine", rx, y, rw, rowH * 2, "dim", 1)
        Gfx.Unclip(g)
        return y + pageH
    }

    static DropdownSearch(g, x, y, w, q) {
        list := Cat.Search(q)
        y0 := y
        UI.Hit("type:pick", x, y, w * 0.7, UX.ROW)
        Gfx.Rect(g, x, y + 4, w * 0.7, UX.ROW - 8, UX.PANEL_HI)
        Gfx.Rect(g, x, y + 4, w * 0.7, 2, UX.ACCENT_HI)
        Gfx.Text(g, q (Mod(A_TickCount // 500, 2) ? "|" : " "),
                 x + UX.S2, y, w * 0.7 - UX.S2, UX.ROW, "value", 0, UX.ACCENT_HI)
        this.Btn(g, "pick:close", x + w * 0.72, y + 4, w * 0.28, UX.ROW - 8, "CLOSE")
        y += UX.ROW

        rowH := UX.ROW - 10
        shown := Min(list.Length, 6)
        loop shown {
            i := A_Index
            id := "pick:row:" i
            UI.Hit(id, x, y, w, rowH)
            on := (UI.hot = id)
            if on
                Gfx.Rect(g, x, y, w, rowH, UX.PANEL_HI)
            sel := Engine.target && (list[i].name = Engine.target.name)
            Gfx.Rect(g, x, y, 3, rowH, sel ? UX.ACCENT_HI : UX.BG)
            Gfx.Text(g, list[i].name, x + UX.S2, y, w * 0.6, rowH, "value", 0,
                     on ? UX.ACCENT_HI : 0)
            Gfx.Text(g, list[i].machine, x + w * 0.6, y, w * 0.4 - UX.S2, rowH,
                     "dim", 2)
            y += rowH
        }
        if !list.Length {
            Gfx.Text(g, "no match for '" q "'", x, y, w, rowH, "dim", 1)
            y += rowH
        } else if (list.Length > shown) {
            Gfx.Text(g, "+" (list.Length - shown) " more -- keep typing",
                     x, y, w, rowH, "dim", 1)
            y += rowH
        }
        return y
    }

    static TabCalories(g, x, y, w) {
        y0 := y
        half := (w - UX.S3) / 2
        byPhase := (CFG.EAT_STOP_MODE = "phase")
        this.Btn(g, "eat:mode", x, y + 3, half, UX.ROW - 8,
                 byPhase ? "UNTIL PHASE" : "CHICKEN COUNT", true)

        if byPhase
            this.Field(g, "eat:phase", x + half + UX.S3, y, half, "TARGET",
                       CFG.EAT_STOP_PHASE = "" ? "0" : CFG.EAT_STOP_PHASE)
        else
            this.Field(g, "eat:count", x + half + UX.S3, y, half, "CHICKENS",
                       CFG.EAT_TARGET)
        y += UX.ROW

        this.Toggle(g, "eat:instant", x, y, half, "INSTANT-EAT PASS", CFG.EAT_INSTANT)
        this.Toggle(g, "cfg:liftafter", x + half + UX.S3, y, half, "LIFT AFTER SHAKER",
                    CFG.SHK_LIFT_AFTER)
        y += UX.ROW

        third := (w - UX.S3 * 2) / 3
        tot := CFG.SHK_PREWORK + CFG.SHK_WHEY + CFG.SHK_CREATINE
        this.Stepper(g, "shk:P", x, y, third, "PRE", CFG.SHK_PREWORK,
                     CFG.SHK_PREWORK <= 0, CFG.SHK_PREWORK >= 1 || tot >= CFG.SHK_SLOTS)
        this.Stepper(g, "shk:W", x + third + UX.S3, y, third, "WHEY", CFG.SHK_WHEY,
                     CFG.SHK_WHEY <= 0, CFG.SHK_WHEY >= 5 || tot >= CFG.SHK_SLOTS)
        this.Stepper(g, "shk:C", x + (third + UX.S3) * 2, y, third, "CREA",
                     CFG.SHK_CREATINE, CFG.SHK_CREATINE <= 0,
                     CFG.SHK_CREATINE >= 5 || tot >= CFG.SHK_SLOTS)
        y += UX.ROW

        Gfx.Text(g, "SLOTS", x, y, 60, UX.ROW, "label", 0)
        pw := (w - 130) / CFG.SHK_SLOTS
        loop CFG.SHK_SLOTS {
            i := A_Index
            fill := (i <= CFG.SHK_PREWORK) ? UX.ACCENT_HI
                  : (i <= CFG.SHK_PREWORK + CFG.SHK_WHEY) ? UX.ACCENT
                  : (i <= tot) ? 0xFF255238 : UX.PANEL_HI
            Gfx.Rect(g, x + 64 + (i - 1) * pw, y + 9, pw - 3, UX.ROW - 18, fill)
        }
        Gfx.Text(g, tot "/" CFG.SHK_SLOTS, x + w - 60, y, 60, UX.ROW, "value", 2)
        y += UX.ROW + UX.S1

        this.KeyBlock(g, "act:eat", x, y, half, UX.ROW + 8, Keys.Show("eat"), "EAT")
        this.KeyBlock(g, "act:shaker", x + half + UX.S3, y, half, UX.ROW + 8,
                      Keys.Show("shaker"), "MAKE SHAKER")
        return y + UX.ROW + 8 - y0
    }

    static TabStats(g, x, y, w) {
        y0 := y
        half := (w - UX.S3) / 2
        if UI.showBests {
            Gfx.Text(g, "PERSONAL BESTS -- " (CFG.IRONMAN ? "IRONMAN" : "NORMAL"),
                     x, y, w * 0.6, UX.ROW, "label", 0)
            this.Btn(g, "bests", x + w - 90, y + 4, 90, UX.ROW - 10, "BACK")
            if (Stats.signature != "ok")
                Gfx.Text(g, Stats.signature, x, y + UX.ROW, w, UX.ROW - 10, "dim", 0, UX.WARN)
            y += UX.ROW
            n := 0
            for ex, kg in Stats.best {
                Gfx.Text(g, ex, x, y, w * 0.62, UX.ROW - 10, "value", 0)
                Gfx.Text(g, kg " kg", x + w * 0.62, y, w * 0.38, UX.ROW - 10, "value", 2,
                         UX.ACCENT_HI)
                Gfx.Rect(g, x, y + UX.ROW - 11, w, 1, UX.EDGE)
                y += UX.ROW - 10
                if (++n >= 8)
                    break
            }
            if !n {
                Gfx.Text(g, "none recorded yet", x, y, w, UX.ROW, "dim", 1)
                y += UX.ROW
            }
            return y - y0
        }

        this.Row(g, x, y, half, "REPS", Stats.reps " (" Stats.RepsPerHour() "/hr)")
        this.Row(g, x + half + UX.S3, y, half, "SETS", Stats.sets)
        y += UX.ROW
        this.Row(g, x, y, half, "ELAPSED",
                 Stats.ElapsedMs() ? Stats.Clock(Stats.ElapsedMs()) : "--",
                 Stats.running ? 0 : UX.DIM)
        this.Row(g, x + half + UX.S3, y, half, "GAIN", Stats.KgPerHour() " kg/hr")
        y += UX.ROW
        this.Row(g, x, y, half, "PHASE", Stats.phaseLabel)
        this.Row(g, x + half + UX.S3, y, half, "WEIGHT", Stats.WeightLabel())
        y += UX.ROW

        eff := Stats.Efficiency()
        Gfx.Text(g, "LIFTING VS WAITING", x, y, w * 0.4, UX.ROW, "label", 0)
        Gfx.Text(g, eff "%", x + w - 50, y, 50, UX.ROW, "value", 2)
        this.Bar(g, x + w * 0.4, y + 12, w * 0.6 - 58, UX.ROW - 24, eff / 100, UX.ACCENT)
        Gfx.Rect(g, x, y + UX.ROW - 1, w, 1, UX.EDGE)
        y += UX.ROW + UX.S1

        this.Btn(g, "bests", x, y, w, UX.ROW - 6,
                 "PERSONAL BESTS (" Stats.best.Count ")   "
               . (CFG.IRONMAN ? "IRONMAN" : "NORMAL"))
        return y + UX.ROW - 6 - y0
    }

    static SUBS := ["GENERAL", "DEBUG", "DISCORD"]

    static TabSettings(g, x, y, w) {
        y0 := y

        sw := w / this.SUBS.Length
        for i, sub in this.SUBS {
            id := "sub:" sub
            UI.Hit(id, x + (i - 1) * sw, y, sw, UX.ROW - 6)
            sel := (UI.sub = sub)
            Gfx.Rect(g, x + (i - 1) * sw, y, sw - 2, UX.ROW - 6,
                     sel ? UX.PANEL_HI : UX.BG)
            Gfx.Rect(g, x + (i - 1) * sw, y, sw - 2, 2, sel ? UX.ACCENT_HI : UX.EDGE)
            Gfx.TrackedC(g, sub, x + (i - 1) * sw, y, sw - 2, UX.ROW - 6, "subtab", 2,
                         sel ? UX.TEXT : UX.DIM)
        }
        y += UX.ROW
        half := (w - UX.S3) / 2

        switch UI.sub {
            case "GENERAL":
                this.Toggle(g, "cfg:ontop", x, y, half, "ALWAYS ON TOP", UI.pinned)
                this.Toggle(g, "cfg:collapse", x + half + UX.S3, y, half,
                            "START COLLAPSED", UI.collapsed)
                y += UX.ROW
                this.Toggle(g, "cfg:instant2", x, y, half, "INSTANT-EAT PASS",
                            CFG.EAT_INSTANT)
                this.Toggle(g, "cfg:speed", x + half + UX.S3, y, half,
                            "1.5x LIFT SPEED PASS", CFG.LIFT_SPEED_PASS)
                y += UX.ROW

                this.Toggle(g, "cfg:ironman", x, y, half, "IRONMAN PROFILE",
                            CFG.IRONMAN)

                nid := "bind:game:nav"
                UI.Hit(nid, x + half + UX.S3, y, half, UX.ROW)
                capturing := (UI.binding = "game.nav")
                hov := (UI.hot = nid)
                Gfx.Text(g, "NAVIGATION KEY", x + half + UX.S3, y, half - 90, UX.ROW,
                         "label", 0, hov ? UX.TEXT : 0)
                bw := 84, bx := x + w - bw
                Gfx.Rect(g, bx, y + 6, bw, UX.ROW - 14,
                         capturing ? UX.ACCENT : (hov ? UX.PANEL_HI : UX.BG))
                Gfx.Rect(g, bx, y + 6, bw, 2, capturing ? UX.ACCENT_HI : UX.EDGE)
                Gfx.TrackedC(g, capturing ? "PRESS" : CFG.KEY_NAV_NAME,
                             bx, y + 6, bw, UX.ROW - 14, "dim", 2,
                             capturing ? UX.BG : UX.TEXT)
                Gfx.Rect(g, x, y + UX.ROW - 1, w, 1, UX.EDGE)
                y += UX.ROW

                this.Stepper(g, "ui:scale", x, y, half, "UI SCALE",
                             Format("{:.2f}x", UX.SCALE),
                             UX.SCALE <= 0.75, UX.SCALE >= 3.0)
                this.Btn(g, "ui:autoscale", x + half + UX.S3, y + 3, half, UX.ROW - 8,
                         "MATCH DISPLAY " Format("{:.2f}x", UX.AutoScale()))
                y += UX.ROW

                if UI.showReaders {
                    Gfx.Text(g, "READERS", x, y, w * 0.5, UX.ROW - 6, "label", 0)
                    this.Btn(g, "readers", x + w - 90, y + 2, 90, UX.ROW - 10, "BACK")
                    y += UX.ROW - 4
                    Gfx.Text(g, "The macro reads the game's HUD to know what is "
                           . "happening. Turn one off to run on fixed timings "
                           . "instead -- slower, and less certain.",
                             x, y, w, UX.ROW - 10, "dim", 0)
                    y += UX.ROW - 10
                    if Rd.DegradedCount() {
                        this.Btn(g, "rdrestore", x, y, w, UX.ROW - 10,
                                 "RETRY " Rd.DegradedCount() " AUTO-DISABLED READER(S)",
                                 true)
                        y += UX.ROW - 6
                    }
                    for , rk in Rd.ORDER {
                        rid := "rd:" rk
                        UI.Hit(rid, x, y, w, UX.ROW - 8)
                        hov := (UI.hot = rid)
                        on := Rd.On(rk)
                        Gfx.Text(g, Rd.Label(rk), x, y, w * 0.4, UX.ROW - 8, "value", 0,
                                 on ? (hov ? UX.ACCENT_HI : 0) : UX.DIM)
                        note := Rd.IsDegraded(rk) ? Rd.DEGRADED[rk]
                                                  : (on ? "" : Rd.Cost(rk))
                        Gfx.Text(g, note, x + w * 0.4, y, w * 0.6 - 60, UX.ROW - 8,
                                 "dim", 0, UX.WARN)
                        bw := 52, bx := x + w - bw
                        Gfx.Rect(g, bx, y + 4, bw, UX.ROW - 16,
                                 on ? UX.ACCENT : UX.PANEL_HI)
                        Gfx.Rect(g, bx, y + 4, bw, 2, on ? UX.ACCENT_HI : UX.EDGE)
                        st := Rd.State(rk)
                        Gfx.TrackedC(g, st, bx, y + 4, bw, UX.ROW - 16, "dim", 2,
                                     on ? UX.BG : (st = "AUTO" ? UX.WARN : UX.DIM))
                        Gfx.Rect(g, x, y + UX.ROW - 9, w, 1, UX.EDGE)
                        y += UX.ROW - 8
                    }
                } else if UI.showKeys {
                    Gfx.Text(g, "KEYBINDS", x, y, w * 0.6, UX.ROW - 6, "label", 0)
                    this.Btn(g, "keys", x + w - 90, y + 2, 90, UX.ROW - 10, "BACK")
                    y += UX.ROW - 4
                    for , kid in Keys.ORDER {
                        rowId := "bind:" StrReplace(kid, ".", ":")
                        capturing := (UI.binding = kid)
                        UI.Hit(rowId, x, y, w, UX.ROW - 8)
                        hov := (UI.hot = rowId)
                        Gfx.Text(g, Keys.Label(kid), x, y, w * 0.6, UX.ROW - 8,
                                 "label", 0, hov ? UX.TEXT : 0)
                        bw := 120, bx := x + w - bw
                        Gfx.Rect(g, bx, y + 3, bw, UX.ROW - 14,
                                 capturing ? UX.ACCENT : (hov ? UX.PANEL_HI : UX.BG))
                        Gfx.Rect(g, bx, y + 3, bw, 2,
                                 capturing ? UX.ACCENT_HI : UX.EDGE)
                        Gfx.TrackedC(g, capturing ? "PRESS A KEY" : Keys.Show(kid),
                                     bx, y + 3, bw, UX.ROW - 14, "dim", 2,
                                     capturing ? UX.BG : UX.TEXT)
                        Gfx.Rect(g, x, y + UX.ROW - 9, w, 1, UX.EDGE)
                        y += UX.ROW - 8
                    }
                    Gfx.Text(g, "Binds are bare keys. Ctrl+Shift combinations stay "
                           . "reserved for the debug tools and never clash.",
                             x, y, w, UX.ROW - 10, "dim", 0)
                    y += UX.ROW - 10
                } else {
                    this.Btn(g, "keys", x, y + 3, w, UX.ROW - 8,
                             "KEYBINDS   " Keys.Show("lift.str") " / "
                           . Keys.Show("lift.hyp") " / " Keys.Show("eat") " / "
                           . Keys.Show("shaker"))
                    y += UX.ROW

                    this.Btn(g, "readers", x, y + 3, w, UX.ROW - 8,
                             Rd.AnyOff() ? "READERS   " Rd.OffCount() " OFF"
                                         : "READERS   ALL ON",
                             Rd.AnyOff())
                    y += UX.ROW
                    this.Btn(g, "kofi", x, y + 3, half, UX.ROW - 8, "SUPPORT THE MACRO")
                    this.Btn(g, "discord", x + half + UX.S3, y + 3, half, UX.ROW - 8,
                             "DISCORD SERVER")
                    y += UX.ROW
                }

            case "DEBUG":
                this.Row(g, x, y, half, "INPUT MODE", Mode.Name(),
                         Mode.cur = Mode.LIVE ? 0 : UX.WARN)
                this.Row(g, x + half + UX.S3, y, half, "STAMINA ROW",
                         Read.staminaB ? "B=" Read.staminaB : "not locked",
                         Read.staminaB ? 0 : UX.WARN)
                y += UX.ROW
                this.Row(g, x, y, half, "CLIENT",
                         (Geom.ok ? Geom.cw "x" Geom.ch : "not found")
                       . "  (" UI.NextCheck() "s)",
                         Geom.ok ? 0 : UX.FAIL)
                this.Row(g, x + half + UX.S3, y, half, "TEMPLATES",
                         "phase " Digits.Have("phase") "/10, weight "
                       . Digits.Have("weight") "/10")
                y += UX.ROW

                this.Btn(g, "dbg:outline", x, y + 3, half, UX.ROW - 8,
                         "SHOW READ REGIONS (5s)")
                this.Row(g, x + half + UX.S3, y, half, "READERS",
                         Overlay.blocked.Length ? "BLOCKED" : "clear",
                         Overlay.blocked.Length ? UX.FAIL : 0)
                y += UX.ROW

                this.Btn(g, "dbg:calib", x, y + 3, half, UX.ROW - 8,
                         "RE-SCAN STAMINA BAR")
                this.Row(g, x + half + UX.S3, y, half, "HUD SCALE",
                         Geom.dpiOk ? Calib.Desc() : "DPI VIRTUALISED",
                         (Calib.ok && Geom.dpiOk) ? 0 : UX.WARN)
                y += UX.ROW

                if (!Calib.ok && Calib.bands.Length) {
                    Gfx.Text(g, "CANDIDATE BARS -- hover to outline, click to use",
                             x, y, w, UX.ROW - 12, "dim", 0)
                    y += UX.ROW - 12
                    for i, bd in Calib.bands {
                        bid := "band:" i
                        UI.Hit(bid, x, y, w, UX.ROW - 12)
                        hov := (UI.hot = bid)
                        Overlay.preview := hov ? i : (Overlay.preview = i ? 0
                                                      : Overlay.preview)
                        cur := (Calib.barW = bd.len && Calib.barBot = bd.bot)
                        if hov
                            Gfx.Rect(g, x, y, w, UX.ROW - 12, UX.PANEL_HI)
                        Gfx.Rect(g, x, y, 3, UX.ROW - 12, cur ? UX.ACCENT_HI : UX.BG)
                        Gfx.Text(g, Format("{1}px wide at L{2}", bd.len, bd.start),
                                 x + UX.S2, y, w * 0.45, UX.ROW - 12, "dim", 0,
                                 (hov || cur) ? UX.TEXT : 0)
                        Gfx.Text(g, Format("B {1}..{2}   {3}x", bd.bot, bd.top,
                                           Round(bd.len / Calib.BASE_W, 3)),
                                 x + w * 0.45, y, w * 0.55 - UX.S2, UX.ROW - 12,
                                 "dim", 2, cur ? UX.ACCENT_HI : 0)
                        y += UX.ROW - 12
                    }
                }
                this.Stepper(g, "ui:weight", x, y, half, "TEXT WEIGHT",
                             Format("{:.1f}", UX.WEIGHT),
                             UX.WEIGHT <= 0, UX.WEIGHT >= 2.0)
                this.Stepper(g, "ui:nudge", x + half + UX.S3, y, half, "TEXT NUDGE",
                             UX.NUDGE, UX.NUDGE <= -4, UX.NUDGE >= 4)
                y += UX.ROW
                this.Row(g, x, y, half, "REFUSED SENDS", Inp.blocked)
                this.Row(g, x + half + UX.S3, y, half, "WEBHOOK",
                         Hook.sent " sent, " Hook.failed " failed",
                         Hook.failed ? UX.WARN : 0)
                y += UX.ROW
                this.Row(g, x, y, w, "LAST FAILURE",
                         Engine.lastFail ? Engine.lastFail : "none this session",
                         Engine.lastFail ? UX.WARN : 0)
                y += UX.ROW

            case "DISCORD":

                this.Field(g, "dsc:url", x, y, w, "WEBHOOK URL",
                           CFG.WEBHOOK_URL ? "set (hidden)" : "not set", 2,
                           ((w - UX.S3) / 2) * 0.5)
                y += UX.ROW
                this.Field(g, "dsc:name", x, y, half, "POST AS", CFG.WEBHOOK_NAME)
                this.Field(g, "dsc:every", x + half + UX.S3, y, half, "EVERY",
                           CFG.WEBHOOK_EVERY " sets")
                y += UX.ROW
                this.Field(g, "dsc:id", x, y, half, "PING ID",
                           CFG.DISCORD_ID ? CFG.DISCORD_ID : "none")
                this.Btn(g, "dsc:help", x + half + UX.S3, y + 3, half, UX.ROW - 8,
                         "WHERE DO I GET THIS")
                y += UX.ROW
                this.Btn(g, "dsc:test", x, y + 3, w, UX.ROW - 8, "SEND TEST POST")
                y += UX.ROW
        }
        return y - y0
    }

    static StatusColour() {
        if (Overlay.blocked.Length || !Geom.ok)
            return UX.FAIL
        if Rd.DegradedCount()
            return UX.WARN
        t := this.StatusText()
        if InStr(t, "FAIL")
            return UX.FAIL
        if InStr(t, "PAUSED") || InStr(t, "WARNING")
            return UX.WARN
        return Runner.Busy() ? UX.ACCENT_HI : UX.DIM
    }

    static Frame(g, w, h) {
        Gfx.Clear(g)
        Gfx.Rect(g, 0, 0, w, h, UX.BG)

        b := UX.BORDER
        Gfx.Rect(g, 0, 0, w, b, UX.EDGE)
        Gfx.Rect(g, 0, h - b, w, b, UX.EDGE)
        Gfx.Rect(g, 0, 0, b, h, UX.EDGE)
        Gfx.Rect(g, w - b, 0, b, h, UX.EDGE)

        Gfx.Rect(g, 0, 0, 3, h, Runner.Busy() ? UX.ACCENT : UX.EDGE)

        y := this.TopBar(g, w)
        y := this.Notice(g, w, y)

        if UI.dlg.on {
            px := UX.S3, pw := w - UX.S3 * 2
            Gfx.Rect(g, px, y + UX.S2, pw, h - y - UX.S2 * 2, UX.PANEL)
            UI.NoteBody(this.Dialog(g, px + UX.S3, y + UX.S3, pw - UX.S3 * 2)
                        + UX.S2 * 2)
        } else if UI.collapsed
            this.CollapsedBody(g, w, y, h)
        else {
            y := this.TabBar(g, w, y)
            this.Body(g, w, y, h)
            this.Foot(g, w, h)
        }
    }

    static TopBar(g, w) {
        hgt := UX.TOPBAR
        Gfx.Rect(g, 0, 0, w, hgt, UX.PANEL)
        Gfx.Rect(g, 0, hgt - UX.RULE, w, UX.RULE, UX.HAIR)

        cx := UX.S3 + 11
        this.Mark(g, cx, hgt / 2, 11, Runner.Busy() ? UX.ACCENT_HI : UX.TEXT)

        wx := cx + 18
        ww := Gfx.Width(g, "SPEARHEADS", "title")
        Gfx.Text(g, "SPEARHEADS", wx, hgt / 2 - 11, ww + 12, 22, "title", 0)
        statusX := wx + ww + UX.S4

        s := 22, gap := UX.S1
        iconsLeft := w - UX.S3 - s * 4 - gap * 3
        hint := this.IconLabel()
        Gfx.Text(g, hint ? hint : this.StatusText(), statusX, 0,
                 Max(40, iconsLeft - statusX - UX.S3), hgt,
                 "status", 0, hint ? UX.TEXT : this.StatusColour())

        bx := w - UX.S3 - s
        for id in ["close", "pin", "info", "collapse"] {
            this.IconBtn(g, id, bx, (hgt - s) / 2, s)
            bx -= s + gap
        }
        return hgt
    }

    static Notice(g, w, y) {
        if !Update.available
            return y
        hgt := UX.NOTICE
        on := (UI.hot = "notice")
        UI.Hit("notice", 0, y, w, hgt)
        Gfx.Rect(g, 0, y, w, hgt, 0xFF14210F)
        Gfx.Hatch(g, 0, y, w, hgt, on ? 0xFF2E5C2A : 0xFF213F1E, 7, 2)
        Gfx.Rect(g, 0, y, 6, hgt, UX.ACCENT_HI)
        Gfx.Tracked(g, "V" Update.latest " AVAILABLE", UX.S3 + 4, y, hgt, "tab",
                    UX.TRACK, UX.ACCENT_HI)

        Gfx.Text(g, "RUNNING v" BUILD.VERSION "  -  CLICK TO OPEN RELEASES",
                 w - UX.S3 - 340, y, 340, hgt, "dim", 2, UX.TEXT)
        Gfx.Rect(g, 0, y + hgt - UX.RULE, w, UX.RULE, UX.HAIR)
        return y + hgt
    }

    static TabBar(g, w, y) {
        hgt := UX.TABBAR
        Gfx.Rect(g, 0, y, w, hgt, UX.BG)
        left := UX.BORDER + 1
        tw := (w - left - UX.BORDER) / UI.TABS.Length
        for i, t in UI.TABS {
            x := left + (i - 1) * tw
            id := "tab:" t
            UI.Hit(id, x, y, tw, hgt)
            sel := (UI.tab = t)

            if sel
                Gfx.Rect(g, x, y, tw, hgt, UX.ACCENT)
            else if (UI.hot = id)
                Gfx.Rect(g, x, y, tw, hgt, UX.PANEL_HI)
            if (i > 1)
                Gfx.Rect(g, x, y + 6, 1, hgt - 12, UX.HAIR)
            Gfx.TrackedC(g, t, x, y, tw, hgt, "tab", UX.TRACK,
                         sel ? UX.BG : (UI.hot = id ? UX.TEXT : UX.DIM))
        }
        Gfx.Rect(g, 0, y + hgt - UX.RULE, w, UX.RULE, UX.HAIR)
        return y + hgt
    }

    static Body(g, w, y, h) {
        bh := h - y - UX.FOOT - UX.S2
        if (bh < 8)
            return
        px := UX.S3, pw := w - UX.S3 * 2
        py := y + UX.S2, ph := bh - UX.S2
        Gfx.Rect(g, px, py, pw, ph, UX.PANEL)
        Gfx.Rect(g, px, py, pw, UX.RULE, UX.HAIR)
        this.Brackets(g, px, py, pw, ph, UX.EDGE, 14)

        idx := 1
        for i, t in UI.TABS
            if (t = UI.tab)
                idx := i
        Gfx.Text(g, Format("{:02}", idx), px + UX.S3, py + UX.S2, 60, 40, "index", 0)
        this.Tab(g, px, py, pw, ph)
    }

    static CollapsedBody(g, w, y, h) {
        px := UX.S3, pw := w - UX.S3 * 2
        Gfx.Rect(g, px, y + UX.S1, pw, h - y - UX.S1 - UX.S2, UX.PANEL)
        cx := px + UX.S2, cw := pw - UX.S2 * 2
        cy := y + UX.S2

        col := cw / 4
        e := Engine.target
        this.Cell(g, cx, cy, col, "EXERCISE", e ? e.name : "none")
        this.Cell(g, cx + col, cy, col, "MODE", Engine.mode)
        this.Cell(g, cx + col * 2, cy, col, "REPS", Stats.reps)
        this.Cell(g, cx + col * 3, cy, col, "ELAPSED",
                  Stats.ElapsedMs() ? Stats.Clock(Stats.ElapsedMs()) : "--")
        cy += UX.ROW - 6

        st := UI.stam
        pct := Rd.On("stamina") ? (st.HasOwnProp("pct") ? st.pct : 0) : 0
        ok := Rd.On("stamina") && st.HasOwnProp("ok") && st.ok
        this.Bar(g, cx, cy, cw, 7, pct,
                 ok ? (pct >= 0.99 ? UX.ACCENT_HI : UX.ACCENT) : UX.EDGE)
        cy += 11
        this.Bar(g, cx, cy, cw, 7, Stats.Efficiency() / 100, UX.ACCENT)
    }

    static Cell(g, x, y, w, label, value) {
        Gfx.Text(g, label, x, y, w - UX.S2, 13, "dim", 0)
        Gfx.Text(g, value, x, y + 11, w - UX.S2, 17, "value", 0)
    }

    static Foot(g, w, h) {
        y := h - UX.FOOT - UX.S1
        Gfx.Text(g, "v" BUILD.VERSION "  -  def.zalken", UX.S3, y, 240, UX.FOOT, "dim", 0)
        Gfx.Text(g, Keys.Show("lift.str") "/" Keys.Show("lift.hyp") " lift  -  "
               . Keys.Show("eat") " eat  -  " Keys.Show("shaker") " shaker  -  "
               . Keys.Show("quit") " quit",
                 w - UX.S3 - 340, y, 340, UX.FOOT, "dim", 2)
    }
}

class TestCfg {

    static Get(sec, key, def) {
        try
            return IniRead(CFG.CFG_PATH, sec, key, def)
        catch
            return def
    }
    static GetInt(sec, key, def) {
        v := this.Get(sec, key, def)
        return IsInteger(v) ? Integer(v) : def
    }

    static Load() {
        if !FileExist(CFG.CFG_PATH)
            return
        CFG.EAT_TARGET     := this.GetInt("eat", "target", CFG.EAT_TARGET)
        CFG.EAT_INSTANT    := this.Get("eat", "instant", "0") = "1"
        CFG.EAT_STOP_PHASE := this.Get("eat", "phase", "")
        CFG.EAT_STOP_MODE  := this.Get("eat", "mode", "count")
        CFG.SHK_PREWORK    := this.GetInt("shaker", "pre",  CFG.SHK_PREWORK)
        CFG.SHK_WHEY       := this.GetInt("shaker", "whey", CFG.SHK_WHEY)
        CFG.SHK_CREATINE   := this.GetInt("shaker", "crea", CFG.SHK_CREATINE)
        CFG.SHK_LIFT_AFTER := this.Get("shaker", "liftafter", "0") = "1"
        CFG.LIFT_SPEED_PASS := this.Get("lift", "speedpass", "0") = "1"
        CFG.IRONMAN      := this.Get("lift", "ironman", "0") = "1"
        for , rk in Rd.ORDER
            Rd.FLAGS[rk] := this.Get("readers", rk, "1") = "1"
        CFG.KEY_NAV      := this.Get("keys", "nav", CFG.KEY_NAV)
        CFG.KEY_NAV_NAME := this.Get("keys", "navname", CFG.KEY_NAV_NAME)

        m := this.Get("lift", "mode", Engine.mode)
        Engine.mode := (m = "Hypertrophy" || m = "Strength") ? m : "Strength"

        if (this.GetInt("meta", "cfgver", 0) >= CFG.CFG_VERSION) {
            CFG.KEY_LIFT_STR := this.Get("keys", "liftstr", CFG.KEY_LIFT_STR)
            CFG.KEY_LIFT_HYP := this.Get("keys", "lifthyp", CFG.KEY_LIFT_HYP)
            CFG.KEY_EAT      := this.Get("keys", "eat",     CFG.KEY_EAT)
            CFG.KEY_SHAKER   := this.Get("keys", "shaker",  CFG.KEY_SHAKER)
            CFG.KEY_QUIT     := this.Get("keys", "quit",    CFG.KEY_QUIT)
        }
        CFG.WEBHOOK_URL   := this.Get("discord", "url", "")
        CFG.WEBHOOK_NAME  := this.Get("discord", "name", CFG.WEBHOOK_NAME)
        CFG.DISCORD_ID    := this.Get("discord", "id", "")
        CFG.WEBHOOK_EVERY := this.GetInt("discord", "every", CFG.WEBHOOK_EVERY)
        w := this.Get("ui", "weight", "0.7")
        UX.WEIGHT := (w + 0 >= 0 && w + 0 <= 2) ? w + 0 : 0.7
        UX.NUDGE  := this.GetInt("ui", "nudge", 0)
    }

    static Save() {
        try {
            DirCreate A_AppData "\UGGMacro"
            IniWrite CFG.EAT_TARGET,   CFG.CFG_PATH, "eat", "target"
            IniWrite CFG.EAT_INSTANT ? 1 : 0, CFG.CFG_PATH, "eat", "instant"
            IniWrite CFG.EAT_STOP_PHASE, CFG.CFG_PATH, "eat", "phase"
            IniWrite CFG.EAT_STOP_MODE,  CFG.CFG_PATH, "eat", "mode"
            IniWrite CFG.SHK_PREWORK,  CFG.CFG_PATH, "shaker", "pre"
            IniWrite CFG.SHK_WHEY,     CFG.CFG_PATH, "shaker", "whey"
            IniWrite CFG.SHK_CREATINE, CFG.CFG_PATH, "shaker", "crea"
            IniWrite Engine.mode,      CFG.CFG_PATH, "lift", "mode"
            IniWrite CFG.LIFT_SPEED_PASS ? 1 : 0, CFG.CFG_PATH, "lift", "speedpass"
            IniWrite CFG.IRONMAN ? 1 : 0,         CFG.CFG_PATH, "lift", "ironman"
            for , rk in Rd.ORDER
                IniWrite Rd.On(rk) ? 1 : 0, CFG.CFG_PATH, "readers", rk
            IniWrite CFG.KEY_NAV,      CFG.CFG_PATH, "keys", "nav"
            IniWrite CFG.KEY_NAV_NAME, CFG.CFG_PATH, "keys", "navname"
            IniWrite CFG.SHK_LIFT_AFTER ? 1 : 0,  CFG.CFG_PATH, "shaker", "liftafter"
            IniWrite CFG.CFG_VERSION,  CFG.CFG_PATH, "meta", "cfgver"
            IniWrite CFG.KEY_LIFT_STR, CFG.CFG_PATH, "keys", "liftstr"
            IniWrite CFG.KEY_LIFT_HYP, CFG.CFG_PATH, "keys", "lifthyp"
            IniWrite CFG.KEY_EAT,      CFG.CFG_PATH, "keys", "eat"
            IniWrite CFG.KEY_SHAKER,   CFG.CFG_PATH, "keys", "shaker"
            IniWrite CFG.KEY_QUIT,     CFG.CFG_PATH, "keys", "quit"
            IniWrite CFG.WEBHOOK_URL,   CFG.CFG_PATH, "discord", "url"
            IniWrite CFG.WEBHOOK_NAME,  CFG.CFG_PATH, "discord", "name"
            IniWrite CFG.DISCORD_ID,    CFG.CFG_PATH, "discord", "id"
            IniWrite CFG.WEBHOOK_EVERY, CFG.CFG_PATH, "discord", "every"
            IniWrite Format("{:.1f}", UX.WEIGHT), CFG.CFG_PATH, "ui", "weight"
            IniWrite UX.NUDGE,          CFG.CFG_PATH, "ui", "nudge"
        }
    }

    static ShowUpdate() {
        msg := "Running v" BUILD.VERSION "`n"
        if !Update.checked
            msg .= "`nUpdate check has not completed yet."
        else if Update.why
            msg .= "`nLast check failed: " Update.why
                 . "`nThe macro keeps running; it will retry on next launch."
        else if Update.available
            msg .= "`nUPDATE AVAILABLE: " Update.latest
                 . "`n`n" CFG.RELEASES_URL
                 . "`n`nThe macro never downloads anything itself. This is a notice only."
        else
            msg .= "`nUp to date (latest is " Update.latest ")."
        msg .= "`n`nChecking again now..."
        MsgBox msg, "Update", "Iconi"
        Update.Check()
    }

}

class Probe {
    static Sample() {
        if !Geom.Refresh() {
            Diag.Toast("no Roblox client")
            return
        }
        MouseGetPos(&mx, &my)
        L := mx - Geom.cx, T := my - Geom.cy
        R := Geom.cw - L,  B := Geom.ch - T
        rgb := -1
        if (slot := Cap.Grab({x: mx, y: my, w: 1, h: 1}))
            rgb := Cap.Px(slot, 0)
        line := Format("PROBE  L={1} T={2} R={3} B={4}  colour={5}  (client {6}x{7})",
                       L, T, R, B,
                       rgb < 0 ? "unreadable" : Format("{:06X}", rgb),
                       Geom.cw, Geom.ch)
        Log.Add(line)
        Diag.Toast(line)
    }
}

class Teach {
    static Ask(ns) {
        which := (ns = "phase") ? "phase badge" : "weight panel"
        cur := Digits.Have(ns)
        r := InputBox("Teaching the " which " (" cur "/10 digits known).`n`n"
                    . "Type EXACTLY what is on screen right now, digits only.`n"
                    . (ns = "phase"
                        ? "At Bulking Phase 12 type: 12`n`nGo in ASCENDING order, 10 through "
                          . "20, no skipping. Touching pairs are split using the leading digit "
                          . "already learned from the lower numbers, so order alone handles it. "
                          . "Teach standalone 1-9 later to sharpen every glyph."
                        : "If the panel reads 145 type: 145`n`nWeight is upright bold, so "
                          . "glyphs never touch. One number containing each digit is enough; "
                          . "vary the digit COUNT (2, 3, 4) to exercise segmentation."),
                      "Teach " which, "w420 h230")
        if (r.Result != "OK" || Trim(r.Value) = "")
            return
        label := RegExReplace(Trim(r.Value), "\D")
        if (label = "") {
            Diag.Toast("digits only")
            return
        }
        if !Geom.Refresh() || !Geom.Active() {
            Diag.Toast("focus Roblox first, then press the key again")
            return
        }
        res := (ns = "phase")
            ? Digits.Teach(ns, Digits.PhaseRegion(),  0xFFA01E, 0x2D1C08, label)
            : Digits.Teach(ns, Digits.WeightRegion(), 0xFFFFFF, 0x111113, label)
        if !res.ok {
            Diag.Toast("teach failed: " res.why)
            Log.Add("TEACH " ns " '" label "' FAILED: " res.why)
            return
        }

        msg := Format("Taught {1}: {2}`n{3} run(s) in badge, used the last {4} "
                    . "for {5} digit(s): {6}`n{7}/10 glyphs known",
                      ns, res.learned.Length ? _Join(res.learned) : "nothing",
                      res.runs, res.used, res.chars, res.detail, res.have)
        Log.Add("TEACH " msg)
        Diag.Toast(msg, 4000)
    }

    static Dump() {
        if !Geom.Refresh() {
            Diag.Toast("no Roblox client")
            return
        }
        a := Digits.Dump("phase",  Digits.PhaseRegion(),  0xFFA01E, 0x2D1C08)
        b := Digits.Dump("weight", Digits.WeightRegion(), 0xFFFFFF, 0x111113)
        msg := a "`n`n" b "`n`nSaved raw + mask BMPs to:`n" CFG.CAPTURE_DIR
             . "`n`nSend both _raw and _mask files. The mask shows exactly what is"
             . "`nbeing treated as ink; if it is not the digits, the colours are wrong."
        A_Clipboard := a "`n" b
        MsgBox msg, "Region dump", "Iconi"
    }

    static Clear() {
        if (MsgBox("Delete all taught templates?", "Clear templates", "YesNo Icon!") != "Yes")
            return
        Digits.tpl := Map()
        try FileDelete CFG.TPL_PATH
        Log.Add("templates cleared")
        Diag.Toast("Templates cleared -- phase 0/10, weight 0/10")
    }

    static Verify() {
        if !Geom.Refresh() {
            Diag.Toast("no Roblox client")
            return
        }
        ph := Digits.PhaseNumber()
        wt := Digits.Weight()

        pi := Digits.Inspect(Digits.PhaseRegion(),  0xFFA01E, 0x2D1C08)
        wi := Digits.Inspect(Digits.WeightRegion(), 0xFFFFFF, 0x111113)

        msg := "phase:  " (ph.ok ? ph.n " (worst " Round(ph.dist) " bits off)" : ph.why)
             . (ph.HasOwnProp("runs") ? "   [" ph.runs " of " ph.allRuns " runs used]" : "")
             . "`nweight: " (wt.ok ? wt.kg " (worst " Round(wt.dist) " bits off)" : wt.why)
             . (wt.HasOwnProp("runs") ? "   [" wt.runs " of " wt.allRuns " runs used]" : "")
             . "`n`nsegmentation (no templates needed):"
             . "`n  phase  " (pi.ok ? pi.runs.Length " run(s), " pi.inkPct "% ink:  " pi.detail : pi.why)
             . "`n  weight " (wi.ok ? wi.runs.Length " run(s), " wi.inkPct "% ink:  " wi.detail : wi.why)
             . "`n`ntemplates: phase " Digits.Have("phase") "/10, weight "
             . Digits.Have("weight") "/10"
             . "`nstored in " CFG.TPL_PATH
        Log.Add("VERIFY " StrReplace(msg, "`n", " | "))
        MsgBox msg, "Digit read-back", "Iconi"
    }

    static Export() {
        out := "; SPEARHEADS taught templates -- " Geom.cw "x" Geom.ch "`n"
        for ns in ["phase", "weight"] {
            out .= "`n[" ns "]`n"
            loop 10 {
                d := A_Index - 1
                out .= d "=" (Digits.tpl.Has(ns "." d)
                              ? Digits.Hex(Digits.tpl[ns "." d]) : "") "`n"
            }
        }
        try DirCreate CFG.DATA_DIR
        try FileDelete CFG.EXPORT_PATH
        try FileAppend out, CFG.EXPORT_PATH
        A_Clipboard := out
        MsgBox out "`n`n(copied to clipboard, also saved to " CFG.EXPORT_PATH ")",
               "Export templates", "Iconi"
    }
}

_Join(arr, sep := ", ") {
    out := ""
    for v in arr
        out .= (out ? sep : "") v
    return out
}

class Picker {
    static Ask() {
        r := InputBox("Exercise or machine name.`n`n"
                    . "e.g.  pike   -   abs   -   deadlift   -   yoga`n`n"
                    . "Current: " (Engine.target ? Engine.target.name " (row "
                                   Engine.target.row " of " Engine.target.machine ")"
                                 : "none"),
                      "Pick exercise", "w400 h190")
        if (r.Result != "OK" || Trim(r.Value) = "")
            return
        hits := Cat.Search(Trim(r.Value))
        if !hits.Length {
            Diag.Toast("no match for '" Trim(r.Value) "'")
            return
        }
        if (hits.Length = 1) {
            this.Set(hits[1])
            return
        }
        list := ""
        for i, e in hits {
            if (i > 12)
                break
            list .= Format("{1}.  {2}  --  {3}, row {4}`n", i, e.name, e.machine, e.row)
        }
        r2 := InputBox(hits.Length " matches:`n`n" list "`nType a number.",
                       "Pick exercise", "w420 h" (140 + Min(hits.Length, 12) * 18))
        if (r2.Result != "OK")
            return
        i := Integer(RegExReplace(Trim(r2.Value), "\D"))
        if (i >= 1 && i <= hits.Length)
            this.Set(hits[i])
    }

    static Set(e) {
        Engine.target := e
        try {
            DirCreate A_AppData "\UGGMacro"
            IniWrite e.name, CFG.CFG_PATH, "lift", "exercise"
        }

        Engine.status := "Ready -- " e.name
        Log.Add("target -> " e.name " [" e.machine " row " e.row
                . (e.hasMenu ? "" : ", NO MENU") "]")
    }
}

Geom.Refresh()
Cap.Init()
TestCfg.Load()

Keys.Apply()
Digits.Load()

Update.CheckAsync()
Engine.target := Cat.Find(IniRead(CFG.CFG_PATH, "lift", "exercise", "Bench Press"))
if !Engine.target
    Engine.target := Cat.Find("Bench Press")
Engine.status := "Idle"

Hotkey(CFG.KEY_STEP, (*) => Mode.Release())

Hotkey("^+m", (*) => Mode.Cycle())
Hotkey("^+p", (*) => Probe.Sample())
Hotkey("^+v", (*) => Teach.Verify())
Hotkey("^+g", (*) => Teach.Dump())
Hotkey("^+b", (*) => Hook.Test())
Hotkey("^+u", (*) => TestCfg.ShowUpdate())
Hotkey("^+d", (*) => Diag.Show())
Hotkey("^+r", (*) => Diag.ToggleLive())
Hotkey("^+l", (*) => Diag.ToggleHud())

Hotkey("^+f", (*) => UI.Rescue())
Hotkey("^+n", (*) => (Inp.Key(CFG.KEY_NAV), Engine.navOn := !Engine.navOn,
                      Diag.Toast("nav toggled -- now tracked as "
                                 (Engine.navOn ? "ON" : "OFF"))))
Hotkey("^+x", (*) => Runner.StopAll())

try UI.Init()

OnExit((*) => (Runner.KeepAwake(false), Overlay.Close(), UI.Close(),
               Cap.Release(), 0))
