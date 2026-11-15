# `agent-device` (`callstack/agent-device`)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/mobile/agent-device.md) | [🇷🇺 Русский](../ru/mobile/agent-device.md)

- **Manba:** [callstack/agent-device](https://github.com/callstack/agent-device) · [agent-device.dev](https://agent-device.dev/docs/agent-setup)
- **Turkum:** `Mobile` *(iOS, Android, tvOS va Android TV ilovalarni fonda UI daraxti orqali boshqarish)*
- **Turi:** `CLI + Skill` *(MCP serversiz toza CLI rejimida o'rnatilgan)*
- **Sifat bahosi:** **9.5 / 10**
- **Bizga kerakliligi:** **9.5 / 10**
- **Tavsiya etilgan ko'lam:** `Global CLI (npm i -g agent-device) + Sanitarizatsiya qilingan Global Skill (-g)`
- **Tekshirilgan sana:** `2026-11-16`
- **Joriy holati:** `✅ Ishlatilyapti` *(mobil va TV UI avtomatizatsiyasida asosiy vosita)*

---

## 1. Nima va qanday ishlaydi?

Callstack (React Native asosiy jamoasi) tomonidan yaratilgan open-source (`MIT`, `0` tashqi npm dependency) mobil va TV UI avtomatizatsiya qatlami (`T3 Code` ichida ham rasman shu vosita ishlatiladi).

Har bir qadamda og'ir skrinshot yoki 10–40 KB xom XML (`uiautomator dump`) o'qish o'rniga:
1. **iOS va tvOS'da:** Mahalliy keshlangan XCUITest runner orqali **ekranda birorta ham Simulator yoki `Device Hub` oynasi ochmasdan 100% ko'rinmas fonda** `@e1`, `@e2` accessibility reflarini o'qiydi va bosadi.
2. **Android va Android TV'da:** Yengil `snapshot-helper` (`BoundedUiAutomationConnection`) va `ime-helper` orqali jonli animatsiya/xarita ekranlarida qotmasdan UI daraxtini oladi hamda o'zbekcha (`o'`, `g'`, `‘`), kirillcha va probelli matnlarni toza UTF-8 da yozadi.
3. **`--settle` va `diff` javoblari:** Bosish yoki skrolldan keyin animatsiya tinchishini o'zi kutadi va butun ekranni emas, faqat o'zgargan qatorlarni (`+12 -16`) qaytaradi.
4. **Git-worktree izolyatsiyasi:** Parallel ishlayotgan bir nechta AI agentlar bitta simulyator sessiyasini bir-biridan tortib olmaydi.

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

## 4. Bizga qanchalik kerak va mavjud vositalar bilan mosligi

- [**`agent-desktop`**](../developer-tools/agent-desktop.md) (Web + macOS Desktop) + **`agent-device`** (iOS + Android + tvOS + Android TV UI) + [**`adb`**](adb.md) / [**`xcrun simctl`**](ios-simulator-device-hub.md) (port reverse, crash logcat, headless AVD boot) — uchalasi [**`cross-platform-qa`**](cross-platform-qa.md) tizimini ideal darajada yakunlaydi.

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** React Native / Expo, Swift/UIKit/SwiftUI, Kotlin/Jetpack Compose hamda Apple TV (`tvOS`) va Android TV ilovalarida UI oqimlarini ko'rinmas fonda tekshirishda.
- **Qachon ishlatmaslik kerak:** Veb brauzer (`Google Chrome`) va macOS desktop oynalarida (u yerda `agent-desktop` ishlatiladi).

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-16 | Manba kodi auditi, iOS Simulator va real Android planshetda jonli benchmark, sanitarizatsiya va global o'rnatish | `✅ Ishlatilyapti` | `0.21.37` global CLI + tozalangan `agent-device` skilli barcha 5 ta AI muhitiga ulandi va `cross-platform-qa` yangilandi (iOS `197 ms` oynasiz, Android `888 ms` / `~100 token`). |
