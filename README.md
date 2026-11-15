# Ishlatib ko'rilgan Skill va AI Tool'lar

<details>
<summary>Holat belgilari</summary>

- `✅ Ishlatilyapti` — sinab ko'rilgan, doimiy ishlatilyapti
- `🧪 Sinab ko'rildi` — o'rnatib sinab ko'rilgan (vaqtincha yoki alohida loyihada)
- `👀 Ko'rib chiqdik (sinab ko'rmadik)` — kodi tekshirildi, yaxshi nomzod, hali sinab ko'rilmadi
- `⚠️ Faqat local (-p) (sinab ko'rmadik)` — tor holat uchun yaroqli, globalga emas, hali sinab ko'rilmadi
- `⏭️ O'tkazib yuborildi (sinab ko'rmadik)` — ko'rib chiqdik, kerak bo'lmagani uchun sinab ko'rmadik
- `⛔ Rad etildi` — xavfsizlik yoki ziddiyat sababli rad etilgan

</details>

## ⭐ Eng keraklilari

| Nomi | Yo'nalish | Turi | Baho | Holati | Sana | Qisqacha izoh |
|---|---|---|---|---|---|---|
| [**`T3 Code`** + CLI Subagent](reviews/developer-tools/t3-code.md) | Multi-Agent | Desktop App + CLI | **9.0/10** | `✅ Ishlatilyapti` | `2026-11-15` | Bir nechta AI'ni birga ishlatish (*"Codex yozsin, Claude tekshirsin"* deyilganda CLI orqali subagent qilib mustaqil review yurgizadi). |
| [**`agent-desktop`**](reviews/developer-tools/agent-desktop.md) | Desktop / Web / iOS | CLI + Skill | **9.5/10** | `✅ Ishlatilyapti` | `2026-11-15` | [agent-browser.dev/desktop](https://agent-browser.dev/desktop) — macOS Accessibility (`AX`) orqali Chrome, desktop dasturlar va iOS `Device Hub` ni kursorni qimirlatmasdan fonda boshqaradi. |
| [**`adb`**](reviews/mobile/adb.md) | Mobile (Android) | CLI | **9.5/10** | `✅ Ishlatilyapti` | `2026-11-15` | Android emulyator (`-no-window`) va real telefonlarda ilovani boshqarish (`uiautomator dump`, `input tap`, `screencap`, `reverse`, `logcat`). `-s <serial>` majburiy. |
| [**`xcrun simctl` + `Device Hub`**](reviews/mobile/ios-simulator-device-hub.md) | Mobile (iOS) | Xcode CLI + App | **9.0/10** | `✅ Ishlatilyapti` | `2026-11-15` | iOS Simulator'ni yoqish va Xcode `Device Hub` + `agent-desktop` orqali ichki iOS UI elementlarini fonda boshqarish (+ real iPhone uchun `devicectl`). |
| [**`skillshare`**](reviews/developer-tools/skillshare.md) | Developer Tools | CLI + Skill | **9.5/10** | `✅ Ishlatilyapti` | `2026-11-15` | Barcha AI agentlar (`Codex`, `Claude`, `Antigravity`) o'rtasida skill/pluginlarni bitta manbadan sinxronlash va xavfsizlik auditidan (`audit`) o'tkazish. |
| [**`impeccable`**](reviews/ui-ux/impeccable.md) | UI/UX | Skill | **9.5/10** | `✅ Ishlatilyapti` | `2026-11-15` | Web, mobil veb va native iOS/Android ekranlar uchun asosiy dizayn va UX audit tizimi (xavfli tashqi hooklari o'chirilgan holda). |

---

## Yo'nalishlar bo'yicha

### 🌐 Web

| Nomi | Turi | Sifat | Keraklilik | Holati | Sana | Qisqacha izoh |
|---|---|---|---|---|---|---|
| [**`taste-skill` v2.5**](reviews/web/taste-skill.md) | Landing Kit + Hook | **8.0/10** | **4.0/10** | `⚠️ Faqat local (-p) (sinab ko'rmadik)` | `2026-11-15` | Noldan promo-landing qurishda kuchli; o'rnatilsa `Stop` hook (600s) kesib tashlanishi va faqat `-p` da ishlatilishi shart. |

### 📱 Mobile

| Nomi | Turi | Sifat | Keraklilik | Holati | Sana | Qisqacha izoh |
|---|---|---|---|---|---|---|
| [**`mobile-native`**](reviews/mobile/mobile-native.md) | Skill | **8.5/10** | **7.5/10** | `👀 Ko'rib chiqdik (sinab ko'rmadik)` | `2026-11-15` | Mobil veb va PWA'ni native sezdiradigan 11 ta CSS/meta yechim; o'rnatishdan oldin `Initial Response` olib tashlanadi. |

### 🎨 UI/UX

| Nomi | Turi | Sifat | Keraklilik | Holati | Sana | Qisqacha izoh |
|---|---|---|---|---|---|---|
| [**`ui-ux-pro-max`**](reviews/ui-ux/ui-ux-pro-max.md) | Skill + CSV/Python | **7.0/10** | **3.5/10** | `⏭️ O'tkazib yuborildi (sinab ko'rmadik)` | `2026-11-15` | `impeccable` dan kuchsizroq va auto-trigger'i u bilan urishadi. |

### 🏗️ Arxitektura va Review

| Nomi | Turi | Sifat | Keraklilik | Holati | Sana | Qisqacha izoh |
|---|---|---|---|---|---|---|
| [**`elephant-goldfish-model`**](reviews/architecture/elephant-goldfish-model.md) | Plugin (7 skill + 10 agent) | **9.0/10** | **8.0/10** | `👀 Ko'rib chiqdik (sinab ko'rmadik)` | `2026-11-15` | 5 bosqichli fresh-context Goldfish spec-review + `egm-drift-report`; katta arxitektura uchun kuchli nomzod. |

### ⚙️ Backend

*Hozircha bo'sh.*

### 🛠️ Developer Tools va Memory

*Hozircha bo'sh.*

---

<details>
<summary>Global <code>tasted-skills</code> skillini ulash</summary>

```bash
skillshare install TursunboyevJahongir/tasted-skills -s tasted-skills -g && skillshare sync -g
```

</details>
