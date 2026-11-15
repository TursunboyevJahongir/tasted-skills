# Ishlatib ko'rilgan Skill va AI Tool'lar

**🇺🇿 O'zbekcha** | [🇬🇧 English](README.en.md) | [🇷🇺 Русский](README.ru.md)

<details>
<summary>Holat belgilari</summary>

- `✅ Ishlatilyapti` — sinab ko'rilgan, doimiy ishlatilyapti
- `🧪 Sinab ko'rildi` — o'rnatib sinab ko'rilgan (vaqtincha yoki alohida loyihada)
- `👀 Ko'rib chiqdik (sinab ko'rmadik)` — kodi tekshirildi, yaxshi nomzod, hali sinab ko'rilmadi
- `⚠️ Faqat local (-p) (sinab ko'rmadik)` — tor holat uchun yaroqli, globalga emas, hali sinab ko'rilmadi
- `⏭️ O'tkazib yuborildi (sinab ko'rmadik)` — ko'rib chiqdik, kerak bo'lmagani uchun sinab ko'rmadik
- `⛔ Rad etildi` / `⛔ Rad etildi (sinab ko'rmadik)` — xavfsizlik yoki ziddiyat sababli rad etilgan

</details>

## ⭐ Eng keraklilari

| Nomi | Yo'nalish | Turi | Baho | Holati | Sana | Qisqacha izoh |
|---|---|---|---|---|---|---|
| [**`agent-desktop`**](reviews/developer-tools/agent-desktop.md) | Desktop / Web / iOS | CLI + Skill | **9.5/10** | `✅ Ishlatilyapti` | `2026-11-15` | [agent-browser.dev/desktop](https://agent-browser.dev/desktop) — macOS Accessibility (`AX`) orqali Chrome, desktop dasturlar va iOS `Device Hub` ni kursorni qimirlatmasdan fonda boshqaradi. |
| [**`adb`**](reviews/mobile/adb.md) | Mobile (Android) | CLI | **9.5/10** | `✅ Ishlatilyapti` | `2026-11-15` | Android emulyator (`-no-window`) va real telefonlarda ilovani boshqarish (`uiautomator dump`, `input tap`, `screencap`, `reverse`, `logcat`). `-s <serial>` majburiy. |
| [**`skillshare`**](reviews/developer-tools/skillshare.md) | Developer Tools | CLI + Skill | **9.5/10** | `✅ Ishlatilyapti` | `2026-11-15` | Barcha AI agentlar (`Codex`, `Claude`, `Antigravity`) o'rtasida skill/pluginlarni bitta manbadan sinxronlash va xavfsizlik auditidan (`audit`) o'tkazish. |
| [**`cross-platform-qa`**](reviews/mobile/cross-platform-qa.md) | Web / iOS / Android | Skill | **9.5/10** | `✅ Ishlatilyapti` | `2026-11-15` | 2-bosqichli QA: 1) lokal kompyuterda (`agent-desktop` + `Device Hub` + `adb` emulyator) tekshirish, 2) "Done" oldidan real telefonda `adb` orqali 1 marta sinash. |
| [**`impeccable`**](reviews/ui-ux/impeccable.md) | UI/UX | Skill | **9.5/10** | `✅ Ishlatilyapti` | `2026-11-15` | Web, mobil veb va native iOS/Android ekranlar uchun asosiy dizayn va UX audit tizimi (xavfli tashqi hooklari o'chirilgan holda). |
| [**`grill-me`**](reviews/architecture/grill-me.md) | Architecture / Planning | Skilllar to'plami | **9.5/10** | `✅ Ishlatilyapti` | `2026-11-15` | Kod yozishdan oldin qarorlar daraxti (`design tree`) bo'ylab tavsiya etilgan javoblar bilan talabni oxirigacha pishitadi (`grilling` + `grill-with-docs`). |
| [**`elephant-goldfish-model`**](reviews/architecture/elephant-goldfish-model.md) | Architecture / Audit | Plugin (7 skill + 10 agent) | **9.5/10** | `✅ Ishlatilyapti` | `2026-11-15` | Xotirali me'mor (*Elephant*) + xotirasiz tanqidchi subagentlar (*Goldfish*): `egm-drift-report` va 5 bosqichli `egm-review` ko'p-repoli tizimlarda hujjat-kod uzilishlari va yashirin xatolarni aniq topadi. |
| [**`animate-expo`**](reviews/mobile/animate-expo.md) | Mobile (Expo / RN) | Skill | **9.5/10** | `✅ Ishlatilyapti` | `2026-11-15` | Expo va React Native ilovalarda `Reanimated`, `Gesture Handler`, `expo-haptics` orqali UI oqimida (60/120fps) qotmaydigan animatsiya va jestlar (`LOCAL-COMPATIBILITY.md` himoyasi bilan). |
| [**`sentry`**](reviews/backend/sentry.md) | Backend / Web / Mobile | Self-Hosted + Skill / MCP | **9.5/10** | `✅ Ishlatilyapti` | `2026-11-15` | Full-stack xatolar (`Issue Grouping`, `dSYM`/`ProGuard`, `Source Maps`), `Breadcrumbs`, `Session Replay` va `v8+` OTel-trace'larni bitta markazda AI orqali tahlil qilish. |
| [**`T3 Code`** + CLI Subagent](reviews/developer-tools/t3-code.md) | Multi-Agent | Desktop App + CLI | **9.0/10** | `✅ Ishlatilyapti` | `2026-11-15` | Bir nechta AI'ni birga ishlatish (*"Codex yozsin, Claude tekshirsin"* deyilganda CLI orqali subagent qilib mustaqil review yurgizadi). |
| [**`xcrun simctl` + `Device Hub`**](reviews/mobile/ios-simulator-device-hub.md) | Mobile (iOS) | Xcode CLI + App | **9.0/10** | `✅ Ishlatilyapti` | `2026-11-15` | iOS Simulator'ni yoqish va Xcode `Device Hub` + `agent-desktop` orqali ichki iOS UI elementlarini fonda boshqarish (+ real iPhone uchun `devicectl`). |
| [**`ponytail`**](reviews/architecture/ponytail.md) | Architecture / Code | Skill | **9.0/10** | `✅ Ishlatilyapti` | `2026-11-15` | Vazifani hal qiladigan eng kichik o'zgarish (YAGNI), ortiqcha abstraksiyasiz kod va bir o'qishda tushunarli qisqa javob. |
| [**`karpathy-guidelines`**](reviews/architecture/karpathy-guidelines.md) | Architecture / Code | Skill | **9.0/10** | `✅ Ishlatilyapti` | `2026-11-15` | Taxminlarni ochiq aytish, soddalik va mavjud kodning boshqa qismlariga tegmasdan jarrohlik aniqligida (`surgical`) tahrirlash. |
| [**`graphify`**](reviews/architecture/graphify.md) | Architecture / Codebase | Skill + Python CLI | **9.0/10** | `✅ Ishlatilyapti` | `2026-11-15` | Kod (lokal AST, 0 token) va hujjatlardan doimiy bilim grafigi (`graph.json` + HTML) qurib, katta repoda modullar aloqasini soniyada topadi. |
| [**`mobile-native`**](reviews/mobile/mobile-native.md) | Mobile Web / PWA | Skill | **8.5/10** | `✅ Ishlatilyapti` | `2026-11-15` | Mobil veb va PWA'ni native sezdiradigan 11 ta CSS/meta yechim (`dvh/svh`, `safe-area`, `16px` input, `overscroll-behavior`, hover gating; `LOCAL-COMPATIBILITY.md` himoyasi bilan). |

---

## Yo'nalishlar bo'yicha

### 🌐 Web

| Nomi | Turi | Sifat | Keraklilik | Holati | Sana | Qisqacha izoh |
|---|---|---|---|---|---|---|
| [**`taste-skill` v2.5**](reviews/web/taste-skill.md) | Landing Kit + Hook | **8.0/10** | **4.0/10** | `⚠️ Faqat local (-p) (sinab ko'rmadik)` | `2026-11-15` | Noldan promo-landing qurishda kuchli; o'rnatilsa `Stop` hook (600s) kesib tashlanishi va faqat `-p` da ishlatilishi shart. |

### 📱 Mobile

*Asosiy faol mobil vositalar (`adb`, `xcrun simctl` + `Device Hub`, `cross-platform-qa`, `animate-expo`, `mobile-native`) yuqoridagi **⭐ Eng keraklilari** jadvalida.*

### 🎨 UI/UX

| Nomi | Turi | Sifat | Keraklilik | Holati | Sana | Qisqacha izoh |
|---|---|---|---|---|---|---|
| [**`animate`**](reviews/ui-ux/animate.md) | Skill (2 fayl) | **8.5/10** | **3.0/10** | `⏭️ O'tkazib yuborildi (sinab ko'rmadik)` | `2026-11-15` | Emil Kowalski'ning veb-animatsiya skilli; `auto-trigger` va qoidalari mavjud tizim bilan to'qnashadi. **O'rniga:** [**`impeccable`**](reviews/ui-ux/impeccable.md) (`animate`) + [**`animate-expo`**](reviews/mobile/animate-expo.md). |
| [**`break-ui`**](reviews/ui-ux/break-ui.md) | Skill (2 fayl) | **8.0/10** | **3.0/10** | `⏭️ O'tkazib yuborildi (sinab ko'rmadik)` | `2026-11-15` | Worst-case data stress-test; repoga vaqtinchalik fixture/toggle qo'shadi va tuzatmay to'xtaydi. **O'rniga:** [**`impeccable`**](reviews/ui-ux/impeccable.md) (`harden`). |
| [**`make-interfaces-feel-better`**](reviews/ui-ux/make-interfaces-feel-better.md) | Skill (6 fayl) | **7.5/10** | **2.5/10** | `⛔ Rad etildi` | `2026-11-15` | Sinab ko'rilib olib tashlandi (`auto-trigger` to'qnashuvi va uzun hisobot jadvallari sabab). **O'rniga:** [**`impeccable`**](reviews/ui-ux/impeccable.md) + [**`animate-expo`**](reviews/mobile/animate-expo.md). |
| [**`ui-ux-pro-max`**](reviews/ui-ux/ui-ux-pro-max.md) | Skill + CSV/Python | **7.0/10** | **3.5/10** | `⏭️ O'tkazib yuborildi (sinab ko'rmadik)` | `2026-11-15` | `impeccable` dan kuchsizroq va auto-trigger'i u bilan urishadi. **O'rniga:** [**`impeccable`**](reviews/ui-ux/impeccable.md). |

### 🏗️ Arxitektura va Review

| Nomi | Turi | Sifat | Keraklilik | Holati | Sana | Qisqacha izoh |
|---|---|---|---|---|---|---|
| [**`agency-agents`**](reviews/architecture/agency-agents.md) | 283 persona prompt + installer | **6.5/10** | **2.5/10** | `⏭️ O'tkazib yuborildi (sinab ko'rmadik)` | `2026-11-16` | 18 bo'limdagi 283 ta `.md` rol-prompt (`~18.5K` token frontmatter shishishi va shablon copy-paste qoldiqlari bor). **O'rniga:** [**`impeccable`**](reviews/ui-ux/impeccable.md), [**`ponytail`**](reviews/architecture/ponytail.md), [**`elephant-goldfish-model`**](reviews/architecture/elephant-goldfish-model.md), [**`cross-platform-qa`**](reviews/mobile/cross-platform-qa.md). |
| [**`superpowers`**](reviews/architecture/superpowers.md) | Plugin (14 skill + hook) | **6.5/10** | **2.0/10** | `⛔ Rad etildi` | `2026-11-15` | Sinab ko'rilib o'chirib tashlandi: ortiqcha o'ylanish (`SessionStart` hook), keraksiz `brainstorming` savollari (muqobili: `grill-me`), sekinlashtiruvchi subagent looplari va Web/Mobile/Backend uchun 2x ortiqcha ish bo'ladigan majburiy TDD. |

### ⚙️ Backend

| Nomi | Turi | Sifat | Keraklilik | Holati | Sana | Qisqacha izoh |
|---|---|---|---|---|---|---|
| [**`opentelemetry`**](reviews/backend/opentelemetry.md) | Standard + Collector (`SigNoz` / `Grafana`) | **9.0/10** | **4.0/10** | `⏭️ O'tkazib yuborildi (sinab ko'rmadik)` | `2026-11-15` | Servislararo `Traces + Metrics + Logs` va server/DB yuklamasi uchun kuchli standart (`Collector + SigNoz/Grafana` talab qiladi). **O'rniga:** [**`sentry`**](reviews/backend/sentry.md) (xato, replay va bazaviy trace'larni bitta joyda yopadi). |

### 🛠️ Developer Tools va Memory

| Nomi | Turi | Sifat | Keraklilik | Holati | Sana | Qisqacha izoh |
|---|---|---|---|---|---|---|
| [**`OmniRoute`**](reviews/developer-tools/omniroute.md) | Local Proxy + 44 Admin Skill | **7.5/10** | **2.0/10** | `⛔ Rad etildi (sinab ko'rmadik)` | `2026-11-16` | Lokal LLM reverse-proxy (`localhost:20128`); ichidagi 44 ta skill kodlash uchun emas, uzoq sessiyalarni uzadi (`#7287`), limitda kuchsiz modelga tushiradi va TLS-stealth (`wreq-js`) pullik obunalarda ToS ban xavfini tug'diradi. **O'rniga:** [**`T3 Code`**](reviews/developer-tools/t3-code.md) + [**`ponytail`**](reviews/architecture/ponytail.md). |

---

<details>
<summary>Global <code>tasted-skills</code> skillini ulash</summary>

```bash
skillshare install TursunboyevJahongir/tasted-skills -s tasted-skills -g && skillshare sync -g
```

</details>
