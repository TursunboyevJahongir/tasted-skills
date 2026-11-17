# `agent-device` (`callstack/agent-device`)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/mobile/agent-device.md) | [🇷🇺 Русский](../ru/mobile/agent-device.md)

- **Manba:** [callstack/agent-device](https://github.com/callstack/agent-device) · [agent-device.dev](https://agent-device.dev/docs/agent-setup)
- **Turkum:** `Mobile` *(iOS, Android, tvOS va Android TV ilovalarni fonda UI daraxti orqali boshqarish)*
- **Turi:** `CLI + Skill` *(MCP serversiz toza CLI rejimida o'rnatilgan)*
- **Sifat bahosi:** **9.5 / 10**
- **Ishda kerak bo'lishi:** **9.5 / 10**
- **Tavsiya etilgan ko'lam:** `Global CLI (npm i -g agent-device) + Sanitarizatsiya qilingan Global Skill (-g)`
- **Tekshirilgan sana:** `2026-11-16`
- **Joriy holati:** `✅ Ishlatyapman` *(mobil va TV UI avtomatizatsiyasida asosiy vosita)*

---

## 1. Nima va qanday ishlaydi?

> [!IMPORTANT]
> **Oddiy tilda (Asosiy vazifasi va foydasi):** Ekranda bitta ham simulyator oynasini ochmasdan, orqa fonda `iOS/tvOS` (`~0.2s`) va `Android/TV` (`~0.9s`, o'zbekcha/kirillcha UTF-8 yozuv bilan) ilovalarni o'zi bosib tekshiradi. MCP serverlarga nisbatan **har xabarda `~7,500` tokenni bo'shatadi**, ekran o'qishda **tokenni `~27x` gacha tejaydi** va Java'siz Maestro `.yaml` E2E testlarni yurgizadi.

Callstack (React Native asosiy jamoasi) tomonidan yaratilgan open-source (`MIT`, `0` tashqi npm dependency) mobil va TV UI avtomatizatsiya qatlami (`T3 Code` ichida ham rasman shu vosita ishlatiladi).

Har bir qadamda og'ir skrinshot yoki 10–40 KB xom XML (`uiautomator dump`) o'qish o'rniga:
1. **iOS va tvOS'da:** Mahalliy keshlangan XCUITest runner orqali **ekranda birorta ham Simulator yoki `Device Hub` oynasi ochmasdan 100% ko'rinmas fonda** `@e1`, `@e2` accessibility reflarini o'qiydi va bosadi.
2. **Android va Android TV'da:** Yengil `snapshot-helper` (`BoundedUiAutomationConnection`) va `ime-helper` orqali jonli animatsiya/xarita ekranlarida qotmasdan UI daraxtini oladi hamda o'zbekcha (`o'`, `g'`, `‘`), kirillcha va probelli matnlarni toza UTF-8 da yozadi.
3. **`--settle` va `diff` javoblari:** Bosish yoki skrolldan keyin animatsiya tinchishini o'zi kutadi va butun ekranni emas, faqat o'zgargan qatorlarni (`+12 -16`) qaytaradi.
4. **O'rnatilgan Maestro (`.yaml`) E2E va Self-Healing (`.ad`) dvijogi:** Alohida Java (`JDK`) yoki `Maestro` CLI o'rnatmasdan, `agent-device replay flow.yaml --maestro` va `agent-device test ./e2e --maestro` orqali Maestro `.yaml` avto-testlarni yurgizadi; `--save-script` bilan sinib qolgan skriptlarni o'zi davolab (`<stem>.healed.ad`), `record contact-sheet` bilan video-kadrlar jadvalini chiqaradi.
5. **Git-worktree izolyatsiyasi:** Parallel ishlayotgan bir nechta AI agentlar bitta simulyator sessiyasini bir-biridan tortib olmaydi.

---

## 2. Jonli Benchmark: Nega aynan shuni tanladik?

iOS 26.5 Simulator va jonli vektor xarita ishlab turgan real Android planshetda o'tkazilgan o'lchovlar:

| Ko'rsatkich | Xom `adb` + `Device Hub` | `mobile-mcp` | **`agent-device` (CLI)** |
|---|---|---|---|
| **Doimiy kontekst yuki (har chatda)** | `0 token` | `~7 580 token` *(34 MCP tool)* | **`0 token`** *(faqat skill ~55 token)* |
| **iOS Simulator (ekranda oynasiz, fonda)** | `WINDOW_NOT_FOUND` *(oyna ochiq bo'lishi shart)* | `7 277 ms` (`~652 token`) | **`197 ms` (`~141 token`)** |
| **Android (jonli xarita ekrani snapshot)** | `4 033 ms` (`~2 723 token` XML) | `5 788 ms` (`~309 token`) | **`888 ms` (`~100 token` — 27x ixcham)** |
| **Skroll / Bosishdan keyingi javob** | To'liq qayta o'qish shart | To'liq qayta o'qish shart | **`diff` (`~26–238 token`)** |

### Zaif tomonlari va xarajati
- **Birinchi ishga tushirishda kesh yig'ish:** Yangi Xcode/iOS versiyasida birinchi marta `open` qilinganda Apple XCUITest runner'ni bir marta kompilyatsiya qiladi (`~15–20s`, `agent-device doctor` buni oldindan qizdirib qo'yadi); Android'da birinchi ulanishda kichik helper APK o'rnatadi (`~12s`), keyingi barcha so'rovlar `197–888 ms` da ishlaydi.
- Node.js `>= 22.12` talab qiladi.

---

## 3. Xavfsizlik va O'rnatishdan oldin tozalash (Sanitarizatsiya)

- **Xavf darajasi:** `Past` *(toza `MIT` kod, telemetriya va tashqi npm bog'liqliklarsiz)*
- **Qo'llangan sanitarizatsiya va himoya qoidalari:**
  1. **MCP server sifatida EMAS, faqat CLI + Skill sifatida o'rnatish:** Doimiy MCP tool sxemasi kontekstni band qilmasligi uchun global CLI (`npm i -g agent-device`) va `PATH`-xavfsiz `/opt/homebrew/bin/agent-device` wrapper ishlatildi.
  2. **`agent-desktop` bilan to'qnashuvni kesish:** Asl `SKILL.md` tavsifidagi `macOS`, `HarmonyOS`, `Vega OS` va `Limrun` qismlari olib tashlandi — **Web (`Google Chrome`) va macOS desktop** to'liq [**`agent-desktop`**](../developer-tools/agent-desktop.md) da qoldi, `agent-device` esa faqat **Mobil va TV (`iOS`, `Android`, `tvOS`, `Android TV`)** uchun cheklandi.
  3. **Majburiy `--udid` / `--serial` intizomi:** USB ulangan real telefon/planshetga adashib tegib ketmaslik uchun 1-bosqichda faqat lokal simulyator/emulyator ko'rsatiladi.

---

## 4. Oldindan bor vositalar nima bo'ldi? (Aniq rol taqsimoti)

Oldindan ishlatib kelayotgan vositalarimizning **birortasi ham o'chirilmadi** — `agent-device` kapot ostida baribir `adb` va `xcrun simctl` ga tayanganligi hamda Web'ni boshqarmasligi sababli, ularning har biriga aniq vazifa berildi:

| Oldingi vosita | Hozirgi holati | Vazifasi qanday o'zgardi? |
|---|---|---|
| [**`agent-desktop`**](../developer-tools/agent-desktop.md) | `✅ Qoldi (Asosiy — Web/Desktop)` | **Google Chrome (Web)** va **macOS desktop** oynalarida 100% asosiy vosita bo'lib qoldi. Mobil va TV UI ishlari `agent-device` ga o'tdi. |
| [**`adb`**](adb.md) | `✅ Qoldi (Transport + Port/Log)` | `agent-device` Android'da ichidan baribir `adb` ni chaqiradi. Bundan tashqari **`adb reverse`** (Metro/lokal backend port ulash), **`adb logcat`** (crash loglar), APK o'rnatish va **`emu kill`** `adb` ning o'zida qoldi — faqat sekin `uiautomator dump` + koordinatali `input tap` o'rnini `agent-device` oldi. |
| [**`xcrun simctl` + `devicectl`**](ios-simulator-device-hub.md) | `✅ Qoldi (Boot + Real iPhone)` | Simulyatorni oynasiz fonda yoqish/yopish (`simctl boot/shutdown`) va real iPhone'ga build o'rnatish (`devicectl`) uchun kerak. **`Device Hub` oynasi** esa endi har safar ochilmaydi — faqat zaxira (`fallback`) bo'lib turadi. |
| [**`cross-platform-qa`**](cross-platform-qa.md) | `✅ Yangilandi` | 2-bosqichli qoida saqlanib qoldi va ichidagi mobil/TV UI qismi `agent-device` ga ulandi. |

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** React Native / Expo, Swift/UIKit/SwiftUI, Kotlin/Jetpack Compose hamda Apple TV (`tvOS`) va Android TV ilovalarida UI oqimlarini ko'rinmas fonda tekshirishda.
- **Qachon ishlatmaslik kerak:** Veb brauzer (`Google Chrome`) va macOS desktop oynalarida (u yerda `agent-desktop` ishlatiladi).

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-16 | Manba kodi auditi, iOS Simulator va real Android planshetda jonli benchmark, sanitarizatsiya va global o'rnatish | `✅ Ishlatyapman` | `0.21.37` global CLI + tozalangan `agent-device` skilli barcha 5 ta AI muhitiga ulandi va `cross-platform-qa` yangilandi (iOS `197 ms` oynasiz, Android `888 ms` / `~100 token`). |
