# 7. Skill va Tool'larni Bir-Biri Bilan Solishtirish (Nima Uchun Qaysi Birini Tanladik?)

**🇺🇿 O'zbekcha** | [🇬🇧 English](en/07-tool-and-skill-comparisons.md) | [🇷🇺 Русский](ru/07-tool-and-skill-comparisons.md)

⬅️ [Practices Mundarijasiga qaytish](README.md)

Ushbu qo'llanmada biz jonli sinab ko'rgan va manba kodini audit qilgan barcha skill, CLI vosita, MCP server hamda modellarning **yonma-yon solishtiruvi (`Nimani tanladik vs Nimadan voz kechdik va Nega`)** jamlangan.

---

## 1. 📱 Mobil va TV UI Avtomatizatsiyasi (`agent-device` vs `Maestro` vs `ARTEMIS` vs `mobile-mcp`)

| Ko'rsatkich | ✅ [**agent-device**](../reviews/mobile/agent-device.md) *(Bizdagi asosiy)* | [**Maestro CLI**](01-mobile-tv-headless-qa.md) | [**ARTEMIS** (google/artemis)](../reviews/mobile/artemis.md) | ❌ [**mobile-mcp**](../reviews/mobile/mobile-mcp.md) |
|---|---|---|---|---|
| **Platformalar** | **`iOS + Android + tvOS + Android TV`** | `iOS + Android` *(TV yo'q)* | Faqat `Android` *(iOS/TV yo'q)* | `iOS + Android` |
| **1 amal tezligi** | **`197 ms` (iOS) / `888 ms` (Android)** | `~1.5 – 4 s` (JVM + driver) | `3 – 40 soniya / qadam` | `7.3 s` (iOS) / `5.8 s` (Android) |
| **MCP / Kontekst yuki** | **`0 token`** *(CLI, `@e1` diff ~200 tok)* | `0 token` *(CLI)* | MCP yoqilsa sxema yuki bor | **`~7,580 token / har xabarda`** (34 tool) |
| **Qo'shimcha API narxi** | **`$0` (100% bepul)** | `$0` (lokal CLI, Cloud pullik) | **Pullik** (`.env` da alohida LLM API kalit shart) | `$0` *(lekin `mobilenext.ai` cloud reklamasi bor)* |
| **Bog'liqlik (`Deps`)** | **`0` (tayyor binar, Java kerakmas)** | **Java (`JDK 17+`) shart** | Python `3.12+` + LLM SDK | Node + `Scarf`/`PostHog` telemetriya |
| **Maestro `.yaml` E2E** | **Ichida tayyor (`replay/test --maestro`)** | Asl `.yaml` dvijogi | Yo'q | Yo'q |
| **Xulosa** | **✅ Asosiy vosita (`#8`)** | Alohida o'rnatilmaydi (`agent-device --maestro` yetarli) | `👍` Faqat `Canvas`/o'yin ekranlarida kerak bo'lsa | `⚠️ Tavsiya etilmaydi` (`6.5x–37x` sekin va shishgan) |

---

## 2. 📱 Mobil Emulyator Optimallashtirish (`simslim` va `avdslim`: USIZ vs U BILAN)

| Platforma | ❌ Odatiy (Stock) holatda | ✅ [**simslim**](../reviews/mobile/simslim.md) + [**avdslim**](../reviews/mobile/avdslim.md) bilan | Qanday o'zgarish bo'ldi? |
|---|---|---|---|
| **iOS 26.5 Simulator (`simctl boot` oynasiz)** | `2.70 GB` RAM · `182` ta jarayon (`Siri`, `Apple Intelligence`, `Wallpaper`) | **`1.16 GB` RAM (`-57%`)** · **`78` ta jarayon** (`--except web,photos,search --keep com.apple.apsd`) | **`-1.54 GB` RAM tejaldi**, Push/Links/Photos/GPS `100%` ishlaydi (`4/4 OK`) + `1.51 GB` disk tozalandi. |
| **iOS Simulator (`GUI` oynali)** | `~4.0 GB` RAM | **`~0.9 GB` RAM (`-77.5%`)** | Oynali rejimda `~3.1 GB` RAM bo'shaydi. |
| **Android API 35 Emulator (`-no-window`)** | `4.41 GB` RAM (Studio'da `8.5 GB`) · `SwiftShader` CPU GPU · `22.81s` boot | **`2.64 GB` RAM (`-40.2%`)** · **Native Apple Metal GPU (`host`)** · **`13.79s` Golden Snapshot boot** | **`-1.77 GB` RAM tejaldi**, Mapbox/xarita GPU'da silliq ishlaydi, `defaults` orqali GPS (`location_mode=3`) himoyalangan. |
| **Ikkalasi birga fonda yoqilganda** | **`~7.11 – 12.5 GB` RAM** | **`3.80 GB` RAM** (`1.16 GB` iOS + `2.64 GB` Android) | **Kompyuter qotmaydi (`~3.3–8.7 GB` tejamkorlik).** |

---

## 3. 🌐 Web va Desktop UI Boshqaruvi (`agent-desktop` vs `vercel-labs/ui`)

| Ko'rsatkich | ✅ [**agent-desktop**](../reviews/developer-tools/agent-desktop.md) *(Bizdagi asosiy)* | ❌ [**vercel-labs/ui** (@ui-sdk/*)](../reviews/web/vercel-ui-sdk.md) |
|---|---|---|
| **Qaysi sayt va dasturlarda ishlaydi?** | **Har qanday veb-sayt (`React`, `Next.js`, `Shadcn`, `Radix`, oddiy HTML) + barcha macOS dasturlari** (`Chrome`, `Telegram`, `Postman`, `Docker`, `Finder`) | **Faqat `@ui-sdk/*` komponentlarida noldan qayta yozilgan saytlardagina** ishlaydi (oddiy `<button>`/`<input>` ni ko'rmaydi) |
| **Mobil / Expo mosligi** | Web va Desktop uchun (`iOS Device Hub` fallback bilan) | `React Native / Expo` da umuman ishlamaydi |
| **Qo'shimcha imkoniyati** | C-ABI (`libagent_desktop_ffi.dylib`) orqali Python/Swift/Go'dan CLI'siz chaqirish | Public Beta (`0.1.0-beta`), har versiyada breaking change |
| **Xulosa** | **✅ Asosiy vosita (`#7`)** | 🔄 **Alternativi yaxshiroq:** [agent-desktop](../reviews/developer-tools/agent-desktop.md) (mavjud loyihalarni `@ui-sdk/*` ga qayta yozish mantiqsiz) |

---

## 4. 🎨 UI/UX Dizayn va Animatsiya Skilllari Solishtiruvi

### A. UI Dizayn, Audit va Tozalash (`impeccable` + `mobile-native` vs boshqalar)

| Skill | Qamrovi | Nima qiladi? | Nima uchun tanladik / rad etdik? |
|---|---|---|---|
| ✅ [**impeccable**](../reviews/ui-ux/impeccable.md) + [**mobile-native**](../reviews/mobile/mobile-native.md) | **Web + Mobile Web/PWA + Native iOS/Android** | `craft-floor` (AI-slop taqiqi) + 20 buyruq (`polish`, `clarify`, `harden`, `quieter`, `bolder`) + **APCA kontrast (`\|Lc\| ≥ 60`)** + 11 ta mobil veb CSS/meta fix (`dvh`, `safe-area`, `16px`). | **✅ Asosiy kundalik juftlik (`#5` va `#19`)** — mahsulot UI, dashboard va barcha mobil ekranlarni to'liq yopadi. |
| 👍 [**Hallmark v2**](../reviews/web/hallmark.md) | **Web Landing Page va To'liq Sayt Redesign** | **50 ta tayyor ko'rib-tanlanadigan mavzu**, **755 ta real fotosurat**, dasturdan avto-skrinshot (`capture.mjs`), link/forma yo'qolmaslik himoyasi (`sloplint --before/--kept`) va `8` ekran o'lchamida mexanik `sloplint` (`taste-skill` dan ustun). | `👍 Yaxshi variant` — `impeccable` da yo'q 5 ta landing quroliga ega; kundalik ishga xalaqit bermasligi uchun **faqat landing page kerak bo'lganda (`-p` / `/hallmark`)** ishlatiladi. |
| ❌ [**unslop**](../reviews/ui-ux/unslop.md) | Faqat Web | AI/vibecoded veb-ekranlarni 9 bosqichda tozalaydi (`Playwright` bilan). | 🔄 **Alternativi yaxshiroq:** [impeccable](../reviews/ui-ux/impeccable.md) — `auto-trigger`i urishadi, mobilda ishlamaydi (`impeccable polish/quieter` buni qiladi). |
| ❌ [**break-ui**](../reviews/ui-ux/break-ui.md) | Faqat Web | Ekstremal uzun/bo'sh ma'lumot bilan UI'ni buzib ko'rsatadi. | 🔄 **Alternativi yaxshiroq:** [impeccable](../reviews/ui-ux/impeccable.md) (`harden`) — repoga vaqtinchalik fixture/toggle qo'shib, **xatoni tuzatmay to'xtaydi** (`impeccable harden` esa darhol tuzatadi). |
| ❌ [**make-interfaces-feel-better**](../reviews/ui-ux/make-interfaces-feel-better.md) | Web | Chegara, radius va soyalarni tekshiradi. | 🔄 **Alternativi yaxshiroq:** [impeccable](../reviews/ui-ux/impeccable.md) + [animate-expo](../reviews/mobile/animate-expo.md) — 16 kun ishlatilib o'chirildi (4 ta uzun markdown jadval chiqarib token yeydi). |
| ❌ [**ui-ux-pro-max**](../reviews/ui-ux/ui-ux-pro-max.md) | Web | CSV/Python orqali rang va shrift tanlaydi. | 🔄 **Alternativi yaxshiroq:** [impeccable](../reviews/ui-ux/impeccable.md) — undan kuchsiz va auto-trigger'i to'qnashadi. |

### B. Animatsiya va SwiftUI (`animate-expo` + `impeccable` vs `animate` vs `swiftui-agent-skill`)

| Skill | Yo'nalishi | Qaror va Sabab |
|---|---|---|
| ✅ [**animate-expo**](../reviews/mobile/animate-expo.md) + [**impeccable (animate)**](../reviews/ui-ux/impeccable.md) | **Expo / React Native (`Reanimated` UI-thread `60/120fps` + haptics)** va **Web CSS/WAAPI motion** | **✅ Asosiy (`#12` va `#5`)** — ham mobil ilovada, ham vebda qotmaydigan animatsiya beradi. |
| ❌ [**animate** *(Emil Kowalski)*](../reviews/ui-ux/animate.md) | Faqat Web CSS/JS animatsiya | 🔄 **Alternativi yaxshiroq:** [impeccable](../reviews/ui-ux/impeccable.md) + [animate-expo](../reviews/mobile/animate-expo.md) — qoidalari bor, auto-trigger'i esa `animate-expo` bilan urishadi. |
| 👍 [**swiftui-agent-skill**](../reviews/mobile/swiftui-agent-skill.md) | Sof native SwiftUI (`iOS 26+ Liquid Glass`, `WidgetKit`, `ActivityKit`) | `👍 Yaxshi variant` — asosiy stekimiz Expo bo'lgani uchun global o'rnatilmaydi, faqat iOS Widget / Live Activity yozilganda `-p` da olinadi. |

---

## 5. 🏗️ Rejalashtirish, Kod Sifati, Qisqa Javob va Multi-Agent Review

### A. Arxitektura va SDLC Konveyerlari (`grill-me` + `graphify` + `ponytail` vs boshqalar)

| Vosita | Yondashuv | Qaror va Sabab |
|---|---|---|
| ✅ [**grill-me**](../reviews/architecture/grill-me.md) + [**graphify**](../reviews/architecture/graphify.md) + [**ponytail**](../reviews/architecture/ponytail.md) + [**karpathy-guidelines**](../reviews/architecture/karpathy-guidelines.md) | `0` token loyiha qolipi (`graphify`, katta repolarda `~10x–20x` token tejaydi) -> ko'r-ko'rona kod yozishdan oldin oxirigacha o'ylab olish (`grill-me`, 2–3x qayta yozishdan saqlaydi) -> minimal YAGNI va `surgical` kod (`ponytail` + `karpathy`). | **✅ Asosiy to'rtlik (`#1–#4`)** — tez, ortiqcha byurokratiyasiz va token tejamkor. |
| ❌ [**superpowers**](../reviews/architecture/superpowers.md) | 14 ta skill + `SessionStart` hook + har o'zgarishda majburiy TDD va subagent sikllari. | `⚠️ Tavsiya etilmaydi` — 5 oy ishlatilib o'chirildi (ishni `2x` sekinlashtiradi va kvotani yeydi). |
| ❌ [**addy-agent-skills**](../reviews/architecture/addy-agent-skills.md) | 25 skill + `/spec -> /ship` og'ir SDLC konveyeri va `doubt-driven` to'xtashlar. | 🔄 **Alternativi yaxshiroq:** [grill-me](../reviews/architecture/grill-me.md) + [ponytail](../reviews/architecture/ponytail.md) — kundalik vazifalarda ortiqcha sikl. |
| ❌ [**agency-agents**](../reviews/architecture/agency-agents.md) | 283 ta `.md` persona-prompt (`~18.5K` token frontmatter shishishi). | `⚠️ Tavsiya etilmaydi` — `~18.5K` token shishishi va yuzaki shablon rollar. |

### B. Qisqa Javob va Yozuv Usuli (`ponytail` vs `caveman` vs `humanizer`)

| Skill | Nima qisqartiradi? | Telemetriya / Hajm | Qaror |
|---|---|---|---|
| ✅ [**ponytail**](../reviews/architecture/ponytail.md) | **Ham AI javobini, ham yoziladigan kod/diff hajmini** (YAGNI, 0 ortiqcha abstraksiya). | **`0` telemetriya**, yengil `SKILL.md` | **✅ Asosiy (`#3`)** |
| 👍 [**caveman**](../reviews/developer-tools/caveman.md) | Faqat terminaldagi **matn javobidan** artikl/bog'lovchilarni kesadi (`~65%` output token); kod hajmiga ta'sir qilmaydi. | CLI paketida `fetch` telemetriya va `SessionStart` hook bor (faqat toza `SKILL.md` olinishi shart) | `👍` Zaxira (`ponytail` yetarli) |
| ❌ [**humanizer + stop-slop**](../reviews/developer-tools/humanizer-stop-slop.md) | Maqola va esselardagi AI shtamplarini tahrirlaydi. | `~32 KB` (`humanizer`) | 🔄 **Alternativi yaxshiroq:** [ponytail](../reviews/architecture/ponytail.md) + [impeccable](../reviews/ui-ux/impeccable.md) (kod uchun emas) |

### C. Multi-Agent Ishlash va Review (`Orca` + `EGM` vs `T3 Code` vs `OmniRoute`)

| Vosita | Vazifasi | Qaror |
|---|---|---|
| ✅ [**Orca**](../reviews/developer-tools/orca.md) + `orchestration` + `task-context` | **Bitta promptdan ko'p-agentli zanjir + Mobil boshqaruv:** Chat UI ichida jonli subagent kartalari (`Codex`, `Claude`, `Argon`), `Lock Screen` (`caffeinate`) rejimida uxlamaslik, uzilmas `Orca IDE` telefon ilovasi va `task-context` orqali estafeta uzatish (`841 MB` RAM). | **✅ Ishlatyapman (`#13`)** |
| ✅ [**elephant-goldfish-model**](../reviews/architecture/elephant-goldfish-model.md) | **Xotirasiz (`Goldfish`) 5-persona Review + Drift + TRIZ:** Oldingi suhbatdan bexabar 5 ta tanqidchi bilan Arxitektura/PR tekshirish, hujjat-kod farqini tutish (`egm-drift-report`) va TRIZ yechim topish. | **✅ Ishlatyapman (`#6`)** |
| ❌ [**T3 Code**](../reviews/developer-tools/t3-code.md) | Eski multi-agent desktop dasturimiz (`2026-10-23 → 2026-11-16`). | 🔄 **Alternativi yaxshiroq:** [Orca](../reviews/developer-tools/orca.md) — Beta telefon ilovasi tez-tez uziladi, kompyuter bloklanganda (`Lock Screen`) to'xtab qoladi va Chat UI'da jonli subagent kartalari yo'q (`Orca` ga o'tildi). |
| ❌ [**OmniRoute**](../reviews/developer-tools/omniroute.md) | Lokal LLM reverse-proxy (`localhost:20128`) + 44 ta proxy-admin skill. | `⚠️ Tavsiya etilmaydi` — uzoq sessiyalarni uzadi (`#7287`), modelni yashirincha pasaytiradi va `wreq-js` TLS-stealth sabab akkaunt ban xavfi bor. |

---

## 6. 🛡️ Xavfsizlik, Kod Auditi, Pentest va Monitoring

| Yo'nalish | ✅ Biz tanlagan vosita | Solishtirilgan muqobillar va Farqi |
|---|---|---|
| **Yangi Skilllarni Tekshirish** | [**skillshare** (skillshare audit)](../reviews/developer-tools/skillshare.md) + **AI agent manba kodi tekshiruvi** | ❌ [**SkillSpector**](../reviews/developer-tools/skillspector.md) (alohida Python/Docker/YARA sikli — ortiqcha) · ❌ [**claude-code-setup**](../reviews/developer-tools/claude-code-setup.md) (boshlang'ich tavsiyachi). |
| **Ilova Xavfsizligi (Static vs Live)** | [**security-audit**](../reviews/backend/security-audit-skill.md) *(PR oldidan Docker'siz 6-bosqichli manba kodi auditi: Backend + Web + Mobil `deep-link`/`WebView`)* **+** [**Shannon (hacker-test)**](../reviews/backend/shannon.md) *(reliz oldidan lokal/staging HTTP API'ga Docker'da jonli exploit otish)* | Ikkalasi bir-birini to'ldiradi: `security-audit` barcha kod bazasini (mobil ilova bilan birga) server ko'tarmasdan tekshiradi; `hacker-test` esa jonli web/API serverni real hujum bilan sinaydi. |
| **Yopiq Binar / APK / `.asar` Tahlili (`Reverse Engineering`)** | 👍 [**REA** (rea skilli)](../reviews/developer-tools/rea.md) *(faqat `"rea"` deb signal berilganda vaqtinchalik CLI sifatida — `0` doimiy MCP yuki)* | O'zimizning manba kodi bor loyihalarda [**graphify**](../reviews/architecture/graphify.md) (`0` token AST qolip) ishlatiladi; begona kodi yopiq `.asar`/`.apk`/binar tahlilida va `audit-release-exposure` tekshiruvida `REA` ishga tushadi (standart global MCP `~75K` token yegani uchun rad etilgan). |
| **Xatolar va Kuzatuv (`Observability`)** | [**sentry**](../reviews/backend/sentry.md) *(Xato + `SourceMap`/`dSYM` + `Session Replay` + `v8+` OTel trace bitta joyda)* | 👍 [**opentelemetry**](../reviews/backend/opentelemetry.md) (`Collector + SigNoz/Grafana`) — faqat o'nlab mikroservisli og'ir infratuzilma metrikalari kerak bo'lganda qo'shiladi. |

---

## 7. 🧠 Lokal Modellar va 🔌 Tashqi API'lar Solishtiruvi

| Model / Variant | Asosiy yo'nalishi | Kod yozishga ishlaydimi? | Temir talabi / Narxi | Xulosa |
|---|---|---|---|---|
| **Lokal `Ollama` / `MLX` (`Qwen3-Coder` / `Qwen2.5-Coder`)** | `32–64 GB` Mac'da 100% oflayn kod yozish va tahlil | **Ha (`30–65 tok/s`, RAM ichida)** | `~9–20 GB` Unified RAM · `$0` | **Haqiqiy lokal coder kerak bo'lsa eng to'g'ri tanlov.** |
| ❌ [**kimi-k3-in-c**](../reviews/local-models/kimi-k3-in-c.md) | `2.78T` MoE modelni GPU'siz NVMe diskdan stream qilish eksperimenti | **Yo'q (`1 token = ~24–33s`, `500` token = `~3.5 soat` + `~50 TB` SSD o'qish)** | Min: `1.8 TB` NVMe; Yaxshi ishlashi uchun: `16× H200 (~2.25 TB VRAM)` | `⚠️ Tavsiya etilmaydi` (SSD umrini yeydi, amaliy ishlab bo'lmaydi). |
| ❌ [**MiniMax-M3.1-Flash *(Lokal)* **](../reviews/local-models/minimax-m3-1-flash.md) | Tezkor multimodal (`matn + rasm + video`, `1M` kontekst) modelni lokalda yoqish | Oddiy skriptga ishlaydi, murakkab repoda asosiy coder emas (`Terminal-Bench: 38.1%`) | `~250–285 GB` vazn; `512 GB` Mac Studio yoki `8× H100 (640 GB VRAM)` | `⚠️ Tavsiya etilmaydi` (oddiy kompyuterga sig'maydi). |
| ✅ [**Jev (TypeSafe AI)**](../reviews/external-apis/jev.md) | Serverda rasm/matn yaroqliligini tekshirish (`true/false`) va variantlardan eng mosini tanlash (`select`) | **Yo'q** *(matn/kod/rasm generatsiya qilmaydigan `System-1` qaror dvigateli)* | **`$0.042 / 1M` kirish · `$0.00` chiqish**, **`~0.30–0.35s`** (`GPT-6 Luna Medium` `~9–12s` o'rniga `~25–30x` tezroq) | **`✅ Ishlatyapman` (`#25`)** — `<80%` confidence va `3–6s` timeout fallback bilan serverda eng zo'r qaror filtri. |
| 👍 [**MiniMax M3.1 Flash API**](../reviews/external-apis/minimax-m3-1-flash-api.md) | Mahsulot backendidagi ommaviy chatbot, tarjima, `OCR`/rasm/video va SaaS avtomatizatsiyasi | Oddiy skript/avtomatizatsiyaga ishlaydi (asosiy IDE coder emas) | **`$0.15 / $0.60`** (`Cached: $0.015`), **`170+ tok/s`**, `1M` kontekst | `👍 Yaxshi variant` (mahsulot backendi uchun pullik Zero-Retention API sifatida). |
