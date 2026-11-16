# 1. Mobil va TV Oynasiz QA + Maestro E2E Avto-Testlar

**🇺🇿 O'zbekcha** | [🇬🇧 English](en/01-mobile-tv-headless-qa.md) | [🇷🇺 Русский](ru/01-mobile-tv-headless-qa.md)

⬅️ [Practices Mundarijasiga qaytish](README.md)

- **Birlashtiriladigan vositalar:** [**`simslim`**](../reviews/mobile/simslim.md) + [**`avdslim`**](../reviews/mobile/avdslim.md) + [**`agent-device`**](../reviews/mobile/agent-device.md) + [**`adb`**](../reviews/mobile/adb.md) + [**`xcrun simctl`**](../reviews/mobile/ios-simulator-device-hub.md) + [**`cross-platform-qa`**](../reviews/mobile/cross-platform-qa.md)
- **Qo'llaniladigan loyihalar:** `iOS`, `Android`, `tvOS (Apple TV)`, `Android TV`, `Expo / React Native`, `Swift / Kotlin`.

---

## 1. Nima uchun bularni birgalikda ishlatish kerak? (Umumiy foydasi)

Odatiy mobil dasturlashda 3 ta katta muammo bor:
1. iOS Simulator (`~4 GB`) va Android Emulator (`~4.5–8.5 GB`) birga yoqilsa **`8–12 GB` RAM** yeb, Mac'ni Swap'ga tiqadi.
2. Ekranda ochiq turgan simulyator oynalari va `Maestro` / `Device Hub` oynalari ish joyini to'sib qo'yadi.
3. Har safar yangi fiycha qo'shilganda eski oqimlarni (Login, Xarita, To'lov) qo'lda bosib tekshirish vaqt oladi.

**Bizning bog'lama nima beradi:**
- **RAM `~2x` kam sarflanadi:** `simslim` (iOS `1.16 GB`) + `avdslim` (Android `2.64 GB`, native Apple Metal GPU) bilan ikkala emulyator jami **`3.80 GB` RAM** oladi (`~3.3–8.7 GB` tejaladi).
- **100% ko'rinmas (`headless`) ishlaydi:** Ekranda birorta ham oyna ochilmaydi, kursor qimirlamaydi.
- **Alohida Java yoki Maestro CLI o'rnatmasdan E2E avto-test:** `agent-device` ichidagi tayyor `--maestro` va `.ad` dvijogi orqali saqlangan ssenariylar soniyalar ichida fonda qayta yurgiziladi.

### 🍏 A. Bizda o'rnatilgan `simslim` (iOS / tvOS Simulator optimizatori): USIZ vs U BILAN

| Ko'rsatkich | ❌ `simslim` USIZ (Odatiy iOS 26.5 Simulator) | ✅ `simslim` BILAN (Bizdagi xavfsiz profil) | Farqi |
|---|---|---|---|
| **Oynasiz (`simctl boot`) RAM** | `2,704 MB` (`~2.70 GB`) | **`1,164 MB` (`~1.16 GB`)** | **`-1.54 GB` (`-57%`)** |
| **Oynali (`Simulator.app` GUI) RAM** | `~4.0 GB` | **`~0.9 GB`** | **`-3.1 GB` (`-77.5%`)** |
| **Fon jarayonlari (`launchctl`)** | `182` ta (`Siri`, `Apple Intelligence`, `Wallpaper`, `GameCenter`...) | **`78` ta** *(faqat ilova va QA uchun zarur servislar)* | **`-104` ta (`-57%`)** |
| **SSD disk tozalash (`disk-clean`)** | `simctl erase` ilova va loginlarni o'chirib yuboradi | **Ilova va loginlarga tegmay `~1.51 GB` log/keshni tozalaydi** | **`+1.51 GB` / simulyator** |
| **Push, Deep Link, Photo Picker, GPS** | Ishlaydi | **`100% ishlaydi`** (`--except web,photos,search --keep com.apple.apsd`) | **Yo'qotish yo'q (`4/4 OK`)** |

### 🤖 B. Bizda o'rnatilgan `avdslim` (Android AVD RAM va Metal GPU optimizatori): USIZ vs U BILAN

| Ko'rsatkich | ❌ `avdslim` USIZ (Odatiy API 35 AVD) | ✅ `avdslim` BILAN (Metal GPU + Golden Snapshot) | Farqi |
|---|---|---|---|
| **Haqiqiy RAM (`Footprint`)** | `4,413 MB` (`~4.41 GB`; Studio standart AVD'da `~8.5 GB`) | **`2,640 MB` (`~2.64 GB`)** | **`-1.77 GB` (`-40.2%`, Studio'dan `-69%`)** |
| **Grafika (`OpenGL / GPU`)** | `SwiftShader LLVM` *(sekin dasturiy CPU emulyatsiya)* | **Native `Apple M4 Pro GPU` (`Metal host`)** | **Tez xarita (Mapbox/Maps) va `0%` CPU GPU yuki** |
| **Oynasiz (`-no-window`) yonish vaqti** | `22.81s` *(sovuq boot)* | **`13.79s`** *(tayyor `avdslim_clean` Golden Snapshot)* | **`1.65x` tezroq boot** |
| **GPS (`location_mode`) va Google Maps** | Ishlaydi | **`location_mode=3` (High Accuracy) + Maps saqlangan** (`defaults` himoyasi) | **GPS va `agent-device` 100% ishlaydi** |

---

## 2. Qanday birgalikda ishlatiladi? (Qadam-ba-qadam)

### A. Bir martalik tayyorlov (`simslim` + `avdslim`)

Yangi simulyator yoki AVD yaratilganda **faqat 1 marta** yengillashtiriladi (GPS, Push va Universal Links buzilmaydigan xavfsiz profillar bilan):

```bash
# 1. iOS / tvOS Simulator (Push, Universal Links, Photo Picker va Spotlight yoqiq qoladi):
simslim on <IOS_UDID> --preserve-boot-state --except web,photos,search --keep com.apple.apsd
simslim doctor <IOS_UDID> --requires push,universal-links,photos,spotlight

# 2. Android AVD (GPS location_mode=3 va Google Maps doimiy himoyalanadi):
mkdir -p "$HOME/Library/Application Support/avdslim"
printf "%s\n" "--skip=location --keep=com.google.android.apps.maps" > "$HOME/Library/Application Support/avdslim/defaults"
ANDROID_HOME=~/Library/Android/sdk avdslim tune-avd <AVD_NAME>
ANDROID_HOME=~/Library/Android/sdk avdslim bake <AVD_NAME> --headless
```

### B. Kundalik `Stage 1` (Lokal oynasiz tekshiruv)

Kod yozilayotganda USB telefonga tegmasdan, fonda tekshirish:

```bash
# iOS (oynasiz fonda, ~197ms javob):
xcrun simctl boot <IOS_UDID> 2>/dev/null || true
agent-device open <BUNDLE_ID> --platform ios --udid <IOS_UDID> --foreground
agent-device press @e5 --settle
agent-device fill @e8 "Toshkent, O'zbekiston" --settle
agent-device close

# Android (Golden Snapshot + Metal GPU bilan fonda, ~888ms javob):
ANDROID_HOME=~/Library/Android/sdk avdslim start <AVD_NAME> --headless --no-slim
~/Library/Android/sdk/platform-tools/adb -s emulator-5554 reverse tcp:8081 tcp:8081
agent-device open <PACKAGE_NAME> --platform android --serial emulator-5554 --foreground
agent-device press @e5 --settle
agent-device close
ANDROID_HOME=~/Library/Android/sdk avdslim stop emulator-5554 -f
```

---

## 3. Qo'shimcha nimalar qilish mumkin? (Pro-amaliyotlar)

### 1) Maestro (`.yaml`) E2E regressiya testlarini Java'siz va oynasiz yurgizish
Alohida `Maestro` CLI o'rnatish shart emas — loyiha ichida `e2e/login-and-order.yaml` yozib qo'yib, uni `agent-device` orqali to'g'ridan-to'g'ri fonda yurgizish mumkin:

```yaml
# e2e/smoke.yaml
appId: com.example.app
---
- launchApp
- tapOn: "Kirish"
- inputText: "901234567"
- tapOn: "Davom etish"
- assertVisible: "Asosiy ekran"
```

```bash
# Bitta simulyatorda tekshirish:
agent-device replay ./e2e/smoke.yaml --maestro --platform ios --udid <IOS_UDID>

# Ham iOS, ham Android'da baravar (parallel) E2E papkasini yurgizish:
agent-device test ./e2e --maestro --device <IOS_UDID>,emulator-5554 --shard-all 2
```

### 2) O'zini-o'zi davolovchi (Self-Healing) `.ad` skriptlar (`--save-script`)
Agar dizayn o'zgarib eski E2E skript to'xtab qolsa, qo'lda skriptni qayta yozish o'rniga AI agentga `--save-script` bilan yurgizish buyuriladi:
- Agent to'xtagan qadamda ekranning yangi `@ref` daraxtini ko'radi, to'g'ri tugmani bosadi va avtomatik ravishda tuzatilgan `<stem>.healed.ad` faylini chiqarib beradi.

### 3) Video-isbot va `contact-sheet` (Ko'rinmas testdan vizual hisobot olish)
Fonda o'tgan testning videosini va faqat ekran o'zgargan soniyalardagi kadrlar jadvalini (`contact-sheet.png`) 1 buyruqda olish:

```bash
agent-device record start ./proof.mp4
# ... amallar ...
agent-device record stop
agent-device record contact-sheet ./proof.mp4 --out ./proof-frames.png
```

### 4) SSD disk to'lganda ilovalarni o'chirmasdan simulyatorni tozalash
`xcrun simctl erase` qilsangiz o'rnatilgan ilova va login tokenlar o'chib ketadi. Uning o'rniga `simslim disk-clean` ishlating (bitta simulyatordan `~1.5 GB` log va keshni ilovaga tegmasdan tozalaydi):

```bash
simslim disk-plan <IOS_UDID>
simslim disk-clean --categories caches,logs,temporary --confirm <IOS_UDID>
```
