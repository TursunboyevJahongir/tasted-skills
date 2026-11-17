# `avdslim` (`kdbhalala/avdslim`)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/mobile/avdslim.md) | [🇷🇺 Русский](../ru/mobile/avdslim.md)

- **Manba:** [kdbhalala/avdslim](https://github.com/kdbhalala/avdslim)
- **Turkum:** `Mobile` *(Android Emulator RAM, Metal GPU va Golden Snapshot optimizatori)*
- **Turi:** `Standalone Go CLI` (`0` tashqi bog'liqlik, `100%` Go stdlib)
- **Sifat bahosi:** **9.0 / 10**
- **Ishda kerak bo'lishi:** **7.5 / 10**
- **Tavsiya etilgan ko'lam:** `Global CLI (/opt/homebrew/bin/avdslim)` — barcha lokal Android AVD'larga `tune-avd` + `bake --headless` va GPS himoyalangan `defaults` bilan qo'llanadi (`install-shim` shart emas)
- **Birga ishlaydigan tizimlar:** [**`agent-device`**](agent-device.md) + [**`adb`**](adb.md) + [**`simslim`**](simslim.md) + [**`cross-platform-qa`**](cross-platform-qa.md)
- **Ishlatilayotgan sana:** `2026-11-16` dan
- **Joriy holati:** `✅ Ishlatyapman`

---

## 1. Nima va qanday ishlaydi?

> [!IMPORTANT]
> **Oddiy tilda (Asosiy vazifasi va foydasi):** Android Emulator kompyuterni qotirmasligi uchun grafikani sekin CPU'dan **Apple Metal GPU**'ga o'tkazadi va **RAM sarfini `4.41 GB -> 2.64 GB` (Studio standart `8.5 GB` idan `-69%`)** gacha tushirib, yoqilishini `14` soniyaga tezlatadi.

[**`simslim`**](simslim.md) (iOS) g'oyasidan ilhomlanib yozilgan Android Virtual Device (`AVD`) optimizatori (`MIT`, `go.mod` atigi `45 bayt` — `0` tashqi kutubxona, `0` tarmoq chaqiruvi). Android emulyatorlar macOS va Linux'da nima uchun `4.5 GB – 8.5 GB` RAM yeyishining 4 ta tub sababini hal qiladi:

1. **`Lavapipe / SwiftShader` tuzog'ini yo'qotadi (`-gpu host`):** Android Studio ko'pincha `hw.gpu.mode=auto` / `hw.gpu.enabled=no` qoldirib, grafikani CPU dasturiy renderiga (`SwiftShader LLVM` / `lavapipe`) tushirib qo'yadi. `avdslim tune-avd` buni native **Apple Silicon Metal GPU (`host`)** rejimiga o'tkazadi.
2. **QEMU `-lowram` va `1536 MB` chegarasi:** QEMU'ning yashirin 4 GB minimal chegarasini chetlab o'tib, Android yadrosini yengil `-lowram` rejimida ishga tushiradi (`config.ini.bak` zaxirasi saqlanadi).
3. **22–45+ ta fon paketni o'chiradi (`pm disable-user --user 0`):** Google Assistant, Wellbeing, PrintSpooler, LiveWallpaper, Dialer/MMS kabi keraksiz jarayonlarni to'xtatib, `FCM Push`, `Firebase Auth`, `WebView`, `Maps SDK` va `localhost` soketlarni 100% ishchi qoldiradi.
4. **`avdslim_clean` Golden Snapshot (`bake`):** Emulyatorni bir marta toza holatda yoqib, barcha optimizatsiyalarni qo'llab, buzilmas (`-no-snapshot-save`) snapshot saqlaydi.

---

## 2. Xalaqit bermaydimi? (Muhim `location_mode` topilmasi va himoyasi)

Manba kodini (`internal/adb/client.go`, `internal/config/tuner.go`, `internal/shim/shim.go`) tekshirganda quyidagilar tasdiqlandi:

- **Jismoniy USB telefonlarga tegmaydi:** Kod faqat `emulator-*` prefiksli qurilmalarni filtrlaydi — USB orqali ulangan real Android telefon yoki planshetga hech qachon buyruq yubormaydi.
- **`agent-device` va `adb` bilan 100% mos:** `adb reverse`, `logcat` va `agent-device` ning UI daraxti o'qish / UTF-8 matn kiritish mexanizmlari to'liq ishlaydi.
- **⚠️ GPS va Xarita ilovalari uchun bitta muhim qoida (`--skip=location`):**
  - `internal/adb/client.go:49` da default `avdslim on` Android ichida **`location_mode = 0` (GPS'ni o'chirish)** hamda `com.google.android.apps.maps` ni o'chirishi aniqlandi.
  - Real-time GPS va xarita ilovalari buzilmasligi uchun `~/Library/Application Support/avdslim/defaults` (Linux'da `~/.config/avdslim/defaults`) fayliga bir marta quyidagi qoida yozib qo'yildi:
    ```text
    --skip=location --keep=com.google.android.apps.maps
    ```
  - Natijada barcha `start`, `bake` va `on` buyruqlarida **`location_mode = 3` (High Accuracy GPS)** doimiy yoqiq qoladi. *(Ovoz yoki kamera emulyatsiyasi kerak bo'lsa: `avdslim enable audio <AVD>` yoki `avdslim enable camera <AVD>`).*
- **SDK faylini o'zgartirmaslik:** `avdslim install-shim` Android SDK ichidagi `emulator` faylini shell-wrapper bilan almashtiradi — biz uni o'rnatmasdan, toza `avdslim start <AVD> --headless` CLI usulini tanladik.

---

## 3. `avdslim` USIZ va U BILAN nima o'zgaradi? (Jonli `API 35` Headless Benchmark)

`Apple M1 Max (32 GB RAM)` da `Android 15 (API 35, arm64)` telefon AVD'sida `-no-window` fon rejimida o'lchangan natijalar:

| Ko'rsatkich / Holat | `avdslim` USIZ (Oldingi holat) | `avdslim` BILAN (`v1.0.16` + Golden Snapshot) | Real farq va natija |
|---|---|---|---|
| **Activity Monitor xotirasi (`phys_footprint`)** | **`4 413 MB` (`4.41 GB`)** *(standart Studio Pixel AVD'da `~8.5 GB`)* | **`2 640 MB` (`2.64 GB`)** | **`-1 773 MB` (`-40.2%` RAM tejaldi; standart 8.5 GB AVD'ga nisbatan `-69%`)** |
| **Fizik band RAM (`Resident RSS`)** | **`4 029 MB` (`4.03 GB`)** | **`2 544 MB` (`2.54 GB`)** | **`-1 485 MB` (`-36.9%`) haqiqiy fizik xotira bo'shadi** |
| **GPU render drayveri** | `SwiftShader LLVM` *(CPU orqali sekin dasturiy render)* | **`host` (Apple Silicon Metal GPU)** | Vektor xaritalar (`Mapbox`) va UI animatsiyalar CPU yukisiz silliq ishlaydi |
| **Ishga tushish (`Boot`) va snapshot barqarorligi** | `default_boot` buzilgan (`Error -5: goldfish_pipe`), cold boot **`22.81 s`** | Toza `avdslim_clean` Golden Snapshot (**`13.79 s`** to'liq start, `-no-snapshot-save` bilan hech qachon buzilmaydi) | Har safar toza holatdan xatosiz va tez yonadi |
| **Fon tizim paketlari (`Bloat`)** | Barchasi yoqiq | **`22` ta keraksiz paket o'chiq** (`Google Play` obrazida `45+` ta) | Fon jarayonlar (`max_cached_processes=4`) va kesh shishishi cheklandi |
| **GPS (`location_mode`), Push va `agent-device`** | Ishlaydi | **`location_mode = 3`**, o'rnatilgan APK saqlangan, `agent-device` 100% ishchi | Loyihalarga **0% xalaqit** |

### `simslim` (iOS) + `avdslim` (Android) birgalikdagi natija (`Stage 1 QA`)
Bir vaqtda ham iOS Simulator, ham Android Emulator ko'rinmas fonda yoqilganda umumiy RAM sarfi **`7.11 GB` (`2.70 + 4.41 GB`) dan `3.80 GB` (`1.16 + 2.64 GB`) ga tushdi** — har sessiyada **`~3.31 GB` RAM** (GUI/standart AVD'larga nisbatan `~8.7 GB` gacha) tejaladi.

---

## 4. Xavfsizlik va Sanitarizatsiya

- **Xavf darajasi:** `Past`
- **Tekshirilgan nuqtalar:**
  - `go.mod` da `0` ta tashqi kutubxona; SHA-256 checksum tekshirilgan; telemetriya va internetga chiqish `0`.
  - Yangi AVD ochayotganda **`Google APIs` (4 KB page size)** obrazini tanlash kerak (`Google Play` va `16 KB Page Size / ps16k` obrazlarida QEMU majburiy `4096 MB` RAM chegarasini qo'yadi).
  - Orqaga qaytarish: `avdslim off` barcha o'chirilgan paket va sozlamalarni tiklaydi, `avdslim unbake <AVD>` snapshotni o'chiradi, `config.ini.bak` esa dastlabki AVD konfiguratsiyasini saqlaydi.

---

## 5. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-16 | Go manba kodi auditi, `v1.0.16` o'rnatish, `defaults` (`--skip=location --keep=com.google.android.apps.maps`), 4 ta AVD `tune-avd` va `API 35` telefon + planshet AVD'lariga headless Golden Snapshot (`bake`) yig'ish | `✅ Ishlatyapman` | `4 413 MB -> 2 640 MB` (`-40.2%` Footprint) va `SwiftShader -> Apple Metal GPU` o'tishi tasdiqlandi; `cross-platform-qa` oqimiga ulandi. |
