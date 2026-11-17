# `simslim` (`MobAI-App/simslim`)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/mobile/simslim.md) | [🇷🇺 Русский](../ru/mobile/simslim.md)

- **Manba:** [MobAI-App/simslim](https://github.com/MobAI-App/simslim)
- **Turkum:** `Mobile` *(iOS, tvOS, watchOS va visionOS Simulator RAM va disk optimizatori)*
- **Turi:** `Standalone Go CLI` (`brew install mobai-app/tap/simslim`)
- **Sifat bahosi:** **9.0 / 10**
- **Ishda kerak bo'lishi:** **7.5 / 10**
- **Tavsiya etilgan ko'lam:** `Global CLI (Homebrew)` — barcha lokal `iOS 18.5+` / `tvOS` simulyatorlarga xavfsiz profil bilan bir marta qo'llanadi
- **Birga ishlaydigan tizimlar:** [**agent-device**](agent-device.md) + [**xcrun simctl**](ios-simulator-device-hub.md) *(eslatma: ushbu jamoaning yopiq `MobAI Pro` / `mobai-mcp` qismi kerak emas — UI boshqaruv to'liq `agent-device` da)*
- **Ishlatilayotgan sana:** `2026-11-16` dan
- **Joriy holati:** `✅ Ishlatyapman`

---

## 1. Nima va qanday ishlaydi?

> [!IMPORTANT]
> **Oddiy tilda (Asosiy vazifasi va foydasi):** iOS Simulator ichida bekorga ishlab yotadigan `~150+` ta keraksiz Apple fon xizmatini (`Siri`, `Apple Intelligence`, `Wallpaper`) o'chirib, **RAM sarfini `2.70 GB -> 1.16 GB` (`-57%`, oynali rejimda `4.0 GB -> 0.9 GB`)** ga tushiradi va `1.5 GB+` disk keshini tozalaydi.

Toza Go tilida yozilgan ochiq manbali (`MIT`, `0` telemetriya, `0` tarmoq chaqiruvi) CLI vosita. Standart iOS yoki tvOS Simulator yoqilganda Xcode faqat sizning ilovangizni emas, balki `~180` ga yaqin fon xizmatlarini (`Siri`, `Apple Intelligence`, `Wallpaper PosterBoard`, `Spotlight`, `photoanalysisd`, `iCloud`, `HealthKit`, `Weather`, `News`) ham qo'shib ko'taradi.

`simslim` Mac operatsion tizimiga tegmasdan, faqat tanlangan `<UDID>` simulyatorning ichki `launchd_sim` bazasiga `disable` override yozadi (`iOS/tvOS 18.5+` da bu holat rebootlardan keyin ham doimiy saqlanib qoladi — fonda hech qanday daemon turishi shart emas).

---

## 2. Xalaqit bermaydimi? (Loyihalar va `agent-device` bilan moslik)

### A. AI va QA asboblarimizga ta'siri — `0%` xalaqit
- MCP serveri, avto-ishga tushuvchi skill yoki fon jarayoni yo'q — chat kontekstidan **`0 token`** oladi.
- Manba kodidagi `profiles.go` da `com.apple.gamed` (`DTServiceHub`) va `com.apple.sharingd` majburiy yoqiq (`AlwaysEnabled`) qoldirilgan (*`"Required for timely XCUITest app launches"`*) — shu sababli [**agent-device**](agent-device.md) ning ko'rinmas XCUITest runner'i (`~197 ms`) hech qanday uzilishsiz ishlaydi.

### B. Mobil va TV ilovalarga ta'siri (Nima ishlaydi va nimani saqlab qolish kerak?)
- **Hech qachon o'chirilmaydigan (100% ishlaydigan) xizmatlar:**
  - **GPS va Geolocation (`CoreLocation`, `expo-location`, `.gpx` marshrutlar):** `com.apple.locationd` ro'yxatda yo'q — real-time xarita va kuryer/taksi ilovalari 100% ishlaydi.
  - **Xarita, GPU va Video (`Mapbox`, Metal, `AVPlayer` HLS striming, `tvOS`):** GPU va media xizmatlariga tegmaydi.
  - **Lokal Token va Keychain (`expo-secure-store`, `securityd`):** Lokal `securityd` saqlanadi (faqat Apple Account / iCloud Keychain sinxronizatsiyasi o'chadi).
  - **Tarmoq (`WebSocket` / `Socket.IO`, REST API, Metro Fast Refresh):** 100% o'zgarishsiz ishlaydi.
- **⚠️ Flagsiz `simslim on` berilsa o'chib qoladigan 3 ta muhim funksiya va ularning yechimi:**
  1. **Push xabarnomalar (`FCM` / `APNs` / Notification Extension):** default rejim `com.apple.apsd` ni o'chiradi -> `--keep com.apple.apsd` bilan saqlab qolinadi.
  2. **Universal Links (`https://...` associated domains):** default rejim `web` (`com.apple.swcd`, `~50 MB`) ni o'chiradi -> `--except web` bilan saqlab qolinadi.
  3. **Rasm va Fayl tanlash (`Photo Picker`, `Document Picker Recents`):** default rejim `photos` (`~60 MB`) va `search` (`~50 MB`) ni o'chiradi -> `--except photos,search` bilan saqlab qolinadi. *(Agar Widget / Live Activity yoki In-App Purchase test qilinsa, `--except widgets,store` qo'shiladi).*

**Biz qo'llagan xavfsiz ishchi profil (`149` ta keraksiz fon xizmatini o'chirib, `push + universal-links + photos + spotlight` ni `4/4 OK` saqlaydi):**
```bash
simslim on <UDID> --except web,photos,search --keep com.apple.apsd
# Yopiq turgan simulyatorlarni yoqmasdan oldindan yengillashtirib qo'yish:
simslim on <UDID> --preserve-boot-state --except web,photos,search --keep com.apple.apsd
# Tekshirish:
simslim doctor <UDID> --requires push,universal-links,photos,spotlight
```

---

## 3. `simslim` USIZ va U BILAN nima o'zgaradi? (Jonli `iOS 26.5` Benchmark)

`Apple M1 Max (32 GB RAM)` da `iPhone 17 Pro (iOS 26.5)` simulyatorini ekranda oyna ochmasdan (`xcrun simctl boot` headless) jonli o'lchov hamda upstream GUI o'lchovlari:

| Ko'rsatkich / Holat | `simslim` USIZ (`Stock`) | `simslim` BILAN (`Slim`) | Real farq va natija |
|---|---|---|---|
| **Oynasiz (`headless`) boot jarayonlari va RAM** *(bizning xavfsiz profil)* | **`182` jarayon · `2.70 GB`** (`phys_footprint`) | **`78` jarayon · `1.16 GB`** (`149` ta xizmat o'chiq) | **`-57%` jarayon va har simulyatorda `-1.54 GB` RAM tejaldi** (`4/4` `push`, `universal-links`, `photos`, `spotlight` ishchi) |
| **To'liq GUI Simulator oynasi bilan** *(maksimal `simslim on`)* | **`258` jarayon · `4.00 GB`** | **`70` jarayon · `0.90 GB`** | **`-77.5%` (`-3.1 GB`) RAM tejaldi** |
| **`Stage 1 QA` (`Chrome` + `iOS Sim` + `Android AVD` + `Docker` birga)** | Emulyatorlarning o'zi `~7–8.5 GB` RAM yeb, `32 GB` Mac'da Swap'ni `6–9 GB` ga oshiradi | Emulyatorlar `~4.5–5 GB` atrofida qoladi; Swap sakramaydi | Metro build, backend konteynerlar va `agent-device` qizishsiz tez ishlaydi |
| **`iPhone + iPad + Apple TV (tvOS)` ni baravar yoqish** | `~8–12 GB` RAM (amalda bittasini o'chirib ikkinchisini yoqishga to'g'ri keladi) | Uchalasi birgalikda **`~3.0–3.5 GB` RAM** | Oldingi 1 ta og'ir simulyator narxida 3 ta qurilma parallel ishlaydi |
| **Idle CPU va batareya sarfi** | `spotlightknowledged`, `photoanalysisd` va ML xizmatlar fonda CPU yeydi | Fon AI va media-analiz xizmatlari o'chiq | Tinch turgan simulyator CPU sarfi `~0%` |
| **SSD disk tozalash (`simslim disk-plan` / `disk-clean`)** | `simctl erase` qilinsa o'rnatilgan ilova va login tokenlar ham o'chib ketadi | **1 ta simulyatorda `1.51 GB` xavfsiz tozalanadigan joy** (`827 MB` log + `557 MB` cache) | `--categories caches,logs,temporary --confirm` ilova (`843 MB`) va loginlarga **tegmasdan** diskni bo'shatadi |
| **Orqaga qaytarish (`Rollback`)** | — | `simslim off <UDID>` | `~17–20 soniya` ichida 100% zavod (`stock`) holatiga qaytadi |

---

## 4. Xavfsizlik va Sanitarizatsiya

- **Xavf darajasi:** `Past`
- **Tekshirilgan nuqtalar (`go.mod`, `profiles.go`, `slim.go`):**
  - Faqat 4 ta UI/CLI paketi (`bubbletea`, `lipgloss`, `go-isatty`, `urfave/cli`), `net/http` yoki tashqi telemetriya umuman yo'q.
  - Xotiradagi yangi simulyator yaratilganda yoki `simctl erase` qilinganda override zavod holatiga qaytadi — shu payt `simslim verify <UDID>` yoki `simslim on <UDID>` qayta beriladi.
  - Videolarda yonma-yon ko'rsatiladigan pullik/yopiq **`MobAI Pro` (`mobai-mcp`)** dasturini o'rnatish shart emas va tavsiya etilmaydi — UI avtomatizatsiyani bepul [**agent-device**](agent-device.md) bajaradi.

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** Barcha lokal `iOS` va `tvOS` (`18.5+`) simulyatorlarda doimiy asosiy sozlama sifatida, ayniqsa bir nechta simulyator/emulyator parallel ishlatilganda yoki SSD disk to'lganda (`disk-clean`).
- **Qachon o'chirib turish (`--except` / `simslim off`) kerak:** Siri / Speech, HealthKit, HomeKit, StoreKit (In-App Purchase) yoki Lock Screen Widget / Live Activity bevosita test qilinayotgan maxsus sessiyalarda.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-16 | Go manba kodi auditi, `brew install mobai-app/tap/simslim` (`v0.14.0`), `iPhone 17 Pro (iOS 26.5)` da jonli RAM/disk benchmark va barcha 10 ta simulyatorga xavfsiz profil qo'llash | `✅ Ishlatyapman` | Oynasiz bootda `182 -> 78` jarayon va `2.70 GB -> 1.16 GB` RAM (`-57%`) tasdiqlandi; `push`, `universal-links`, `photos`, `spotlight` va `agent-device` 100% ishchi holatda qoldi. |
