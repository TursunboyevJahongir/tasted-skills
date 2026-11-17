# `adb` (Android Debug Bridge — Platform Tools)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/mobile/adb.md) | [🇷🇺 Русский](../ru/mobile/adb.md)

- **Manba:** [Android SDK Platform-Tools (adb)](https://developer.android.com/tools/adb)
- **Turkum:** `Mobile` *(Android Emulator va haqiqiy Android qurilmalarni boshqarish)*
- **Turi:** `CLI / Runtime Tool` *(rasmiy Android SDK vositasi)*
- **Sifat bahosi:** **9.5 / 10**
- **Ishda kerak bo'lishi:** **10.0 / 10**
- **Tavsiya etilgan ko'lam:** `Standalone Tool` *(global CLI sifatida o'rnatilgan + QA skillar orqali boshqariladi)*
- **Ishlatilayotgan sana:** `2026-09-07` dan
- **Joriy holati:** `✅ Ishlatyapman` *(Android emulyator va jismoniy qurilma testlarida asosiy vosita)*

---

## 1. Nima va qanday ishlaydi?

> [!IMPORTANT]
> **Oddiy tilda (Asosiy vazifasi va foydasi):** Android emulyator va haqiqiy telefonlarda lokal backend portini ulash (`adb reverse`), ilova qulaganda aniq xato qatorini (`logcat`) ko'rish va APK o'rnatish uchun asosiy ko'prik.

Google'ning rasmiy **Android Debug Bridge (`adb`)** buyruq satri vositasi. AI agentlar uchun mobil ilovalarni (React Native, Expo, Kotlin/Java, Flutter) emulyator yoki USB orqali ulangan telefonda ko'rish, bosish va tekshirish imkonini beradi.

**Nega u shart bo'ldi (texnik sabab):**
macOS'da iOS Simulator (`Device Hub` + `xcrun simctl`) ichki UI elementlarini Accessibility daraxtiga ochib beradi, lekin **Android Emulator (`qemu`)** butun ekranni bitta OpenGL/Metal yuzasi sifatida chizadi — oddiy desktop accessibility vositalari (`agent-desktop`) Android ilovaning ichki tugma va matnlarini ko'ra olmaydi. `adb` esa to'g'ridan-to'g'ri Android tizimining o'zidan UI daraxtini va boshqaruvni oladi:

- **UI daraxti va koordinatalarni olish:** `adb -s <serial> shell "uiautomator dump /sdcard/uidump.xml && cat /sdcard/uidump.xml"`
- **Bosish, surish va yozish:** `input tap <X> <Y>`, `input swipe`, `input text`, `input keyevent` (Back, Home, Enter)
- **Tezkor skrinshot olish:** `adb -s <serial> exec-out screencap -p > /tmp/android_screen.png`
- **Port yo'naltirish va loglar:** `adb reverse tcp:8081 tcp:8081` (Metro/lokal backend uchun), `adb logcat -b crash`, APK o'rnatish (`adb install -r`)
- **Fonda ko'rinmas test:** Emulyatorni `-no-window` rejimida ishga tushirib, foydalanuvchi ekraniga va sichqonchasiga umuman xalaqit bermasdan fonda to'liq UI test o'tkazish mumkin.

---

## 2. Qanchalik yaxshi va qanchalik yomon?

### Kuchli tomonlari
- **Qo'shimcha og'ir server talab qilmaydi:** Appium yoki og'ir MCP qatlamlarisiz to'g'ridan-to'g'ri tez va barqaror ishlaydi.
- **Ham emulyator, ham real qurilma uchun yagona interfeys:** Kodlash vaqtida lokal emulyatorda (`emulator-5554`), yakuniy tekshiruvda esa haqiqiy USB telefon/planshetda bir xil buyruqlar bilan ishlaydi.
- **Nol kontekst yuki:** Oddiy CLI bo'lgani uchun chat kontekstini band qilmaydi.

### Zaif tomonlari va cheklovlari
- `uiautomator dump` tez o'zgaruvchan (uzluksiz animatsiya bo'layotgan) ekranlarda ba'zan kechikishi yoki bo'sh qaytishi mumkin — bunday paytda `exec-out screencap -p` orqali vizual tekshiruv bilan birga ishlatiladi.
- `input text` probel va maxsus belgilarda ehtiyotkorlikni (`%s` yoki escape qilishni) talab qiladi.

---

## 3. Xavfsizlik va Ishlatish qoidalari (Sanitarizatsiya / Cheklovlar)

- **Xavf darajasi:** `Past–O'rta` *(rasmiy Google binar fayli, lekin ulangan haqiqiy telefonga to'liq buyruq yubora olgani uchun qat'iy intizom kerak)*
- **Agent amal qilishi shart bo'lgan xavfsizlik qoidalari:**
  1. **Har doim `-s <serial>` ni aniq ko'rsatish:** `adb devices -l` orqali emulyator (`emulator-*`) va jismoniy qurilmani ajratib olish shart. Kundalik iteratsiya paytida adashib foydalanuvchining haqiqiy telefoniga buyruq yubormaslik kerak.
  2. **Ikki bosqichli ish tartibi:** Rivojlantirish va debug faqat lokal emulyatorda; haqiqiy USB qurilmada faqat yakuniy tekshiruv (1 marta) bajariladi.
  3. **Buzuvchi buyruqlar taqiqi:** Foydalanuvchi aniq so'ramaguncha jismoniy qurilmada `pm clear`, begona ilovalarga `adb uninstall`, fayl o'chirish (`rm`) yoki tizim sozlamalarini o'zgartirish taqiqlanadi.
  4. **Tozalash:** Agent test uchun o'zi fonda yoqqan emulyatorni ish yakunida `adb -s emulator-5554 emu kill` bilan yopishi va skrinshotlarni loyiha ichiga emas, `/tmp/` ga yozishi shart.

---

## 4. Bizga qanchalik kerak va mavjud vositalar bilan mosligi

[agent-device](agent-device.md) va [agent-desktop](../developer-tools/agent-desktop.md) bilan bir-birini to'ldiradi:
- **Android va TV ichki UI oqimi (`snapshot`, `@ref`, `press`, UTF-8 `fill`):** endi [agent-device](agent-device.md) asosiy vosita (kapot ostida baribir `adb` ustida ishlaydi, lekin `uiautomator dump` dan `4.5x` tez va `27x` kam token sarflaydi);
- **Past darajadagi Android boshqaruvi (`adb reverse`, `adb logcat`, `emu kill`, APK install, fallback `screencap`):** aynan **`adb`** ning o'zi bajaradi;

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** Port ulash (`adb reverse`), crash loglarni ko'rish (`adb logcat`), APK o'rnatish, `-no-window` emulyatorni boshqarish (`emu kill`) hamda `agent-device` ga poydevor/zaxira sifatida.
- **Qachon ishlatmaslik kerak:** Oddiy UI tugma bosish va formalarni to'ldirishda (u yerda [agent-device](agent-device.md) ancha tez va toza ishlaydi) yoki sof Web/iOS vazifalarida.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-09-07 | Android SDK `platform-tools/adb` ni o'rnatish (`2026-11-15` global `PATH` va headless QA qoidasi) | `✅ Ishlatyapman` | Lokal emulyator (`-no-window`) va real Android qurilmalarda port ulash hamda `logcat` uchun faol. |
| 2026-11-16 | UI qatlamini `agent-device` ga o'tkazib, transport/log bazasi sifatida saqlash | `✅ Ishlatyapman` | O'chirilmadi: `agent-device` kapot ostida `adb` ga tayanadi; `adb` o'zi esa `reverse`, `logcat`, `install` va `emu kill` uchun asosiy vosita bo'lib qoldi. |
