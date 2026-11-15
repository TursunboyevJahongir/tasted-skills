# Sinab ko'rilgan va ishlatilayotgan AI Skill hamda Tool'lar

**🇺🇿 O'zbekcha** | [🇬🇧 English](README.en.md) | [🇷🇺 Русский](README.ru.md)

<details>
<summary>Holat belgilari</summary>

- `✅ Faol` — doimiy ishlatilyapti
- `👍 Yaxshi variant` — tekshirilgan, kerakli vaziyatda ishlatishga arziydi
- `⛔ Rad etildi` — bizga kerak emas, ziddiyatli yoki xavfli

</details>

> [!TIP]
> **🛡️ Xavfsizlik qoidamiz (sizga ham tavsiya):** Hech qachon begona skill, plugin yoki MCP serverni faqat `README` yoki yulduzlariga qarab o'rnatmang. Biz har bitta nomzodni o'rnatishdan oldin **o'zimizning AI coding agentga birlamchi kodini (`SKILL.md`, skriptlar, hooklar, tarmoq/env murojaatlari) o'qitib tekshirtiramiz** hamda [**`skillshare`**](reviews/developer-tools/skillshare.md) ichidagi tayyor skill-check (`skillshare audit`) dan o'tkazamiz. Sizga ham har qanday yangi skillni o'rnatishdan avval AI agentingizga tekshirtirib olishni tavsiya qilamiz.

## ⭐ Eng keraklilari (Ishlatilish ustuvorligi bo'yicha)

| # | Nomi | Asosiy vazifasi | Turi | Baho | Holati | Sana | Qisqacha izoh |
|---|---|---|---|---|---|---|---|
| **1** | [**`grill-me`**](reviews/architecture/grill-me.md) | **Reja, Qarorlar va Chuqur Debug** | Skilllar to'plami | **9.5/10** | `✅ Faol` | `2026-11-16` | Kod yozishdan oldin qarorlar daraxti (`grilling` + `grill-with-docs` + `domain-modeling`) bo'ylab talabni pishitadi + `mattpocock/skills` dan on-demand **`diagnosing-bugs`** va **`improve-codebase-architecture`**. |
| **2** | [**`graphify`**](reviews/architecture/graphify.md) | **Kod bazasi xaritasi (Knowledge Graph)** | Skill + Python CLI | **9.5/10** | `✅ Faol` | `2026-11-15` | Kod (lokal AST, `0` token) va hujjatlardan doimiy bilim grafigi (`graph.json` + HTML) qurib, katta repoda modullar va fayllar aloqasini soniyada topib beradi. |
| **3** | [**`ponytail`**](reviews/architecture/ponytail.md) | **Minimal va toza kod (YAGNI)** | Skill | **9.5/10** | `✅ Faol` | `2026-11-15` | Har bir kod yozishda asosiy qoida: vazifani to'liq hal qiladigan eng kichik o'zgarish, ortiqcha abstraksiyasiz kod va bir o'qishda tushunarli qisqa javob. |
| **4** | [**`karpathy-guidelines`**](reviews/architecture/karpathy-guidelines.md) | **Jarrohlik aniqligida tahrir (`Surgical`)** | Skill | **9.5/10** | `✅ Faol` | `2026-11-15` | Taxminlarni oldindan ochiq aytish, soddalik va mavjud kodning qo'shni qismlariga tegmasdan faqat kerakli joyni aniq o'zgartirish. |
| **5** | [**`impeccable`**](reviews/ui-ux/impeccable.md) | **Asosiy UI/UX dizayn va audit** | Skill | **9.5/10** | `✅ Faol` | `2026-11-15` | Web, mobil veb va native iOS/Android ekranlarni loyihalash, UX/kontrast/tipografiya auditi va tozalash (`polish`, `clarify`, `harden`). |
| **6** | [**`elephant-goldfish-model`**](reviews/architecture/elephant-goldfish-model.md) | **Mustaqil Arxitektura va Kod Review** | Plugin (7 skill + 10 agent) | **9.5/10** | `✅ Faol` | `2026-11-15` | Xotirali me'mor (*Elephant*) + xotirasiz tanqidchi subagentlar (*Goldfish*): `egm-drift-report` va 5 bosqichli `egm-review` yashirin xatolarni va hujjat-kod uzilishlarini topadi. |
| **7** | [**`agent-desktop`**](reviews/developer-tools/agent-desktop.md) | **Web (`Chrome`) va Desktop UI test** | CLI + Skill | **9.5/10** | `✅ Faol` | `2026-11-15` | [agent-browser.dev/desktop](https://agent-browser.dev/desktop) — macOS Accessibility (`AX`) orqali Chrome va desktop dasturlarni kursorni qimirlatmasdan fonda boshqaradi (`iOS Device Hub` uchun ham fallback). |
| **8** | [**`agent-device`**](reviews/mobile/agent-device.md) | **Mobil va TV (`iOS` / `Android` / `tvOS`) UI test** | CLI + Skill | **9.5/10** | `✅ Faol` | `2026-11-16` | [agent-device.dev](https://agent-device.dev) — Callstack'ning 0-dependency CLI'i: oynasiz fonda iOS/tvOS Simulator (`~197ms`) va `-no-window` Android/TV Emulator (`~888ms`, 27x kam token, UTF-8 input) UI'ini `@ref` va `--settle` diff bilan boshqaradi (`0` MCP shishishi). |
| **9** | [**`cross-platform-qa`**](reviews/mobile/cross-platform-qa.md) | **2-bosqichli Web / Mobil / TV QA** | Skill | **9.5/10** | `✅ Faol` | `2026-11-16` | 1-bosqichda lokal kompyuterda (`agent-desktop` Web + `agent-device` headless iOS/Android/TV + `adb`) tekshirish, 2-bosqichda "Done" oldidan real qurilmada yakuniy sinash. |
| **10** | [**`sentry`**](reviews/backend/sentry.md) | **Full-Stack Xatolar va Trace tahlili** | Self-Hosted + Skill / MCP | **9.5/10** | `✅ Faol` | `2026-11-15` | Backend, Web va Mobil xatolar (`Issue Grouping`, `dSYM`/`ProGuard`, `Source Maps`), `Breadcrumbs`, `Session Replay` va `v8+` OTel-trace'larni AI orqali tahlil qilish. |
| **11** | [**`skillshare`**](reviews/developer-tools/skillshare.md) | **Skill sinxronlash va Xavfsizlik (`audit`)** | CLI + Skill | **9.5/10** | `✅ Faol` | `2026-11-15` | Barcha AI agentlar (`Codex`, `Claude`, `Antigravity`) o'rtasida skill/pluginlarni bitta manbadan sinxronlash va o'rnatilgan **skill-check (`skillshare audit`)** orqali tekshirish. |
| **12** | [**`animate-expo`**](reviews/mobile/animate-expo.md) | **Expo / React Native 60/120fps animatsiya** | Skill | **9.5/10** | `✅ Faol` | `2026-11-15` | Expo va React Native ilovalarda `Reanimated`, `Gesture Handler`, `expo-haptics` orqali UI oqimida qotmaydigan animatsiya va jestlar (`LOCAL-COMPATIBILITY.md` himoyasi bilan). |
| **13** | [**`T3 Code`** + CLI Subagent](reviews/developer-tools/t3-code.md) | **Multi-Agent kod va review** | Desktop App + CLI | **9.0/10** | `✅ Faol` | `2026-11-15` | Bir nechta AI'ni birga ishlatish (*"Codex yozsin, Claude tekshirsin"* deyilganda CLI orqali subagent qilib mustaqil review yurgizadi). |
| **14** | [**`adb`**](reviews/mobile/adb.md) | **Android port (`reverse`) va `logcat`** | CLI | **9.0/10** | `✅ Faol` | `2026-11-15` | Android emulyator (`-no-window`) va real telefonlarda port ulash (`reverse`), `logcat`, APK o'rnatish va past darajadagi boshqaruv (`-s <serial>` majburiy). |
| **15** | [**`xcrun simctl` + `Device Hub`**](reviews/mobile/ios-simulator-device-hub.md) | **iOS headless boot va `devicectl`** | Xcode CLI + App | **9.0/10** | `✅ Faol` | `2026-11-16` | iOS Simulator'ni oynasiz fonda yoqish/yopish (`simctl boot/shutdown`), real iPhone'ga build o'rnatish (`devicectl`) hamda `Device Hub` zaxirasi (`fallback`). |
| **16** | [**`mobile-native`**](reviews/mobile/mobile-native.md) | **Mobil Web / PWA native moslashtirish** | Skill | **8.5/10** | `✅ Faol` | `2026-11-15` | Mobil veb va PWA'ni native sezdiradigan 11 ta CSS/meta yechim (`dvh/svh`, `safe-area`, `16px` input, `overscroll-behavior`, hover gating; `LOCAL-COMPATIBILITY.md` himoyasi bilan). |

---

## Yo'nalishlar bo'yicha

### 🧠 Lokal modellar

| Nomi | Turi | Sifat | Keraklilik | Holati | Sana | Qisqacha izoh |
|---|---|---|---|---|---|---|
| [**`kimi-k3-in-c`**](reviews/local-models/kimi-k3-in-c.md) | C99 CLI Inference Engine | **8.5/10** | **1.0/10** | `⛔ Rad etildi` | `2026-11-16` | `2.78T` Kimi K3 modelini `8 GB RAM` da GPU'siz diskdan o'qib yurgizuvchi C99 eksperiment: **`~1.7 TB` bo'sh disk** talab qiladi, **1 ta token = `~24–33 soniya`** (`500` token kod = `~3.5 soat` + SSD'dan `~50 TB` o'qish). **O'rniga:** [**`T3 Code`**](reviews/developer-tools/t3-code.md) + CLI Subagent (`Argon` / `Claude` / `Codex`). |

### 🌐 Web

| Nomi | Turi | Sifat | Keraklilik | Holati | Sana | Qisqacha izoh |
|---|---|---|---|---|---|---|
| [**`taste-skill` v2.5**](reviews/web/taste-skill.md) | Landing Kit + Hook | **8.0/10** | **4.0/10** | `👍 Yaxshi variant` | `2026-11-15` | Noldan promo-landing qurishda kuchli; o'rnatilsa `Stop` hook (600s) kesib tashlanishi va faqat `-p` da ishlatilishi shart. |

### 📱 Mobile

| Nomi | Turi | Sifat | Keraklilik | Holati | Sana | Qisqacha izoh |
|---|---|---|---|---|---|---|
| [**`swiftui-agent-skill`**](reviews/mobile/swiftui-agent-skill.md) | Skill (`twostraws` / `AvdLee` / `apple-design`) | **8.5/10** | **3.0/10** | `👍 Yaxshi variant` | `2026-11-16` | Sof SwiftUI va Apple HIG qoidalari; asosiy stekimiz Expo / React Native bo'lgani uchun faqat sof SwiftUI moduli (Widget / Live Activity) yozilganda `-p` da olinadi. **O'rniga:** [**`impeccable`**](reviews/ui-ux/impeccable.md) (`reference/ios.md`) + [**`animate-expo`**](reviews/mobile/animate-expo.md). |
| [**`mobile-mcp`**](reviews/mobile/mobile-mcp.md) | MCP Server (34 tool) | **7.0/10** | **2.0/10** | `⛔ Rad etildi` | `2026-11-16` | Jonli sinovda rad etildi: har bitta xabarda `~7,580` token MCP sxema shishishi, `agent-device` dan `6.5x–37x` sekin (`7.3s` iOS, `5.8s` Android), `Scarf` + `PostHog` telemetriyasi va `mobilenext.ai` cloud reklamalari bor. **O'rniga:** [**`agent-device`**](reviews/mobile/agent-device.md) + [**`adb`**](reviews/mobile/adb.md). |

### 🎨 UI/UX

| Nomi | Turi | Sifat | Keraklilik | Holati | Sana | Qisqacha izoh |
|---|---|---|---|---|---|---|
| [**`animate`**](reviews/ui-ux/animate.md) | Skill (2 fayl) | **8.5/10** | **3.0/10** | `⛔ Rad etildi` | `2026-11-15` | Emil Kowalski'ning veb-animatsiya skilli; `auto-trigger` va qoidalari mavjud tizim bilan to'qnashadi. **O'rniga:** [**`impeccable`**](reviews/ui-ux/impeccable.md) (`animate`) + [**`animate-expo`**](reviews/mobile/animate-expo.md). |
| [**`unslop`**](reviews/ui-ux/unslop.md) | Skill + Playwright skriptlar | **8.5/10** | **2.5/10** | `⛔ Rad etildi` | `2026-11-16` | `@heydamir`ning AI/vibecoded veb-ekranlarni 9 bosqichda tozalash skilli (`CC-BY-4.0`); faqat Web uchun va `auto-trigger`i mavjud tizim bilan urishadi. **O'rniga:** [**`impeccable`**](reviews/ui-ux/impeccable.md) (`craft-floor` + `polish` / `quieter` / `clarify`). |
| [**`break-ui`**](reviews/ui-ux/break-ui.md) | Skill (2 fayl) | **8.0/10** | **3.0/10** | `⛔ Rad etildi` | `2026-11-15` | Worst-case data stress-test; repoga vaqtinchalik fixture/toggle qo'shadi va tuzatmay to'xtaydi. **O'rniga:** [**`impeccable`**](reviews/ui-ux/impeccable.md) (`harden`). |
| [**`make-interfaces-feel-better`**](reviews/ui-ux/make-interfaces-feel-better.md) | Skill (6 fayl) | **7.5/10** | **2.5/10** | `⛔ Rad etildi` | `2026-11-15` | Sinab ko'rilib olib tashlandi (`auto-trigger` to'qnashuvi va uzun hisobot jadvallari sabab). **O'rniga:** [**`impeccable`**](reviews/ui-ux/impeccable.md) + [**`animate-expo`**](reviews/mobile/animate-expo.md). |
| [**`ui-ux-pro-max`**](reviews/ui-ux/ui-ux-pro-max.md) | Skill + CSV/Python | **7.0/10** | **3.5/10** | `⛔ Rad etildi` | `2026-11-15` | `impeccable` dan kuchsizroq va auto-trigger'i u bilan urishadi. **O'rniga:** [**`impeccable`**](reviews/ui-ux/impeccable.md). |

### 🏗️ Arxitektura va Review

| Nomi | Turi | Sifat | Keraklilik | Holati | Sana | Qisqacha izoh |
|---|---|---|---|---|---|---|
| [**`addy-agent-skills`**](reviews/architecture/addy-agent-skills.md) | Plugin (25 skill + 9 command) | **8.0/10** | **2.5/10** | `⛔ Rad etildi` | `2026-11-16` | Addy Osmani'ning to'liq SDLC konveyeri (`/spec -> /ship`); majburiy TDD va `doubt-driven` to'xtashlari kundalik ishda ortiqcha sikl. **O'rniga:** [**`grill-me`**](reviews/architecture/grill-me.md) + [**`ponytail`**](reviews/architecture/ponytail.md) + [**`elephant-goldfish-model`**](reviews/architecture/elephant-goldfish-model.md). |
| [**`agency-agents`**](reviews/architecture/agency-agents.md) | 283 persona prompt + installer | **6.5/10** | **2.5/10** | `⛔ Rad etildi` | `2026-11-16` | 18 bo'limdagi 283 ta `.md` rol-prompt (`~18.5K` token frontmatter shishishi va shablon copy-paste qoldiqlari bor). **O'rniga:** [**`impeccable`**](reviews/ui-ux/impeccable.md), [**`ponytail`**](reviews/architecture/ponytail.md), [**`elephant-goldfish-model`**](reviews/architecture/elephant-goldfish-model.md), [**`cross-platform-qa`**](reviews/mobile/cross-platform-qa.md). |
| [**`superpowers`**](reviews/architecture/superpowers.md) | Plugin (14 skill + hook) | **6.5/10** | **2.0/10** | `⛔ Rad etildi` | `2026-11-15` | Sinab ko'rilib o'chirib tashlandi: ortiqcha o'ylanish (`SessionStart` hook), keraksiz `brainstorming` savollari (muqobili: `grill-me`), sekinlashtiruvchi subagent looplari va Web/Mobile/Backend uchun 2x ortiqcha ish bo'ladigan majburiy TDD. |

### ⚙️ Backend

| Nomi | Turi | Sifat | Keraklilik | Holati | Sana | Qisqacha izoh |
|---|---|---|---|---|---|---|
| [**`opentelemetry`**](reviews/backend/opentelemetry.md) | Standard + Collector (`SigNoz` / `Grafana`) | **9.0/10** | **4.0/10** | `👍 Yaxshi variant` | `2026-11-15` | Servislararo `Traces + Metrics + Logs` va server/DB yuklamasi uchun kuchli standart (`Collector + SigNoz/Grafana` talab qiladi). **O'rniga:** [**`sentry`**](reviews/backend/sentry.md) (xato, replay va bazaviy trace'larni bitta joyda yopadi). |
| [**`Shannon`**](reviews/backend/shannon.md) | Standalone CLI + [`hacker-test`](skills/hacker-test/SKILL.md) | **8.5/10** | **6.5/10** | `👍 Yaxshi variant` | `2026-11-16` | Avtonom White-Box AI pentester (Auth bypass, IDOR, Injection, XSS, SSRF). Og'ir pluginini o'rnatmasdan, ushbu repodagi yengil [`hacker-test`](skills/hacker-test/SKILL.md) skilli orqali faqat lokal/staging'da `npx` bilan chaqiriladi (production taqiqlangan). |

### 🛠️ Developer Tools va Memory

| Nomi | Turi | Sifat | Keraklilik | Holati | Sana | Qisqacha izoh |
|---|---|---|---|---|---|---|
| [**`SkillSpector`**](reviews/developer-tools/skillspector.md) | Python CLI + MCP + Skill | **9.0/10** | **3.5/10** | `⛔ Rad etildi` | `2026-11-16` | NVIDIA'ning AI skill va MCP xavfsizlik skaneri (`AST + YARA + OSV + LLM`). Kundalik ishda ortiqcha sikl bo'lgani uchun o'rnatmadik — **O'rniga:** [**`skillshare`**](reviews/developer-tools/skillshare.md) (`skillshare audit` skill-check) + **AI agent orqali kodni bevosita tekshirtirish**. |
| [**`AssetDiet`**](reviews/developer-tools/assetdiet.md) | Standalone CLI + [`asset-diet`](skills/asset-diet/SKILL.md) | **7.5/10** | **6.5/10** | `✅ Faol` | `2026-11-16` | 100% lokal rasm/SVG/video/3D siqish (`Sharp`, `SVGO`, `FFmpeg`) + rollback. Doimiy 16-tool MCP o'rniga ushbu repodagi yengil [`asset-diet`](skills/asset-diet/SKILL.md) skilli orqali faqat kerak paytda `npx assetdiet-mcp@0.1.4` CLI chaqiriladi. |
| [**`humanizer` + `stop-slop`**](reviews/developer-tools/humanizer-stop-slop.md) | Skill (`Markdown`) | **7.5/10** | **2.0/10** | `⛔ Rad etildi` | `2026-11-16` | Uzun maqola va esselardan AI yozuv shtamplarini tozalaydi (`humanizer` `~32 KB`); kod va mahsulot UI'i uchun emas. **O'rniga:** [**`ponytail`**](reviews/architecture/ponytail.md) + [**`impeccable`**](reviews/ui-ux/impeccable.md) (`clarify`). |
| [**`claude-code-setup`**](reviews/developer-tools/claude-code-setup.md) | Plugin (Recommender Skill) | **7.5/10** | **2.0/10** | `⛔ Rad etildi` | `2026-11-16` | Anthropic'ning yangi repo uchun boshlang'ich Claude Code sozlamalarini tavsiya qiluvchi read-only plagini. **O'rniga:** [**`skillshare`**](reviews/developer-tools/skillshare.md). |
| [**`OmniRoute`**](reviews/developer-tools/omniroute.md) | Local Proxy + 44 Admin Skill | **7.5/10** | **2.0/10** | `⛔ Rad etildi` | `2026-11-16` | Lokal LLM reverse-proxy (`localhost:20128`); ichidagi 44 ta skill kodlash uchun emas, uzoq sessiyalarni uzadi (`#7287`), limitda kuchsiz modelga tushiradi va TLS-stealth (`wreq-js`) pullik obunalarda ToS ban xavfini tug'diradi. **O'rniga:** [**`T3 Code`**](reviews/developer-tools/t3-code.md) + [**`ponytail`**](reviews/architecture/ponytail.md). |

---

<details>
<summary>Global <code>tasted-skills</code>, <code>hacker-test</code> va <code>asset-diet</code> skillarini ulash</summary>

```bash
skillshare install TursunboyevJahongir/tasted-skills -s tasted-skills -s hacker-test -s asset-diet -g && skillshare sync -g
```

</details>
