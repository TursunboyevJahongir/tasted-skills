# `agent-desktop`

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/developer-tools/agent-desktop.md) | [🇷🇺 Русский](../ru/developer-tools/agent-desktop.md)

- **Manba:** [agent-browser.dev/desktop](https://agent-browser.dev/desktop)
- **Turkum:** `Developer Tools` *(Desktop GUI, Web brauzer va iOS Simulator avtomatlashtirish)*
- **Turi:** `CLI + Global Skilllar` (`agent-desktop`, `agent-desktop-macos`, `agent-desktop-ffi`)
- **Sifat bahosi:** **9.5 / 10**
- **Bizga kerakliligi:** **10.0 / 10**
- **Tavsiya etilgan ko'lam:** `Global (-g) + Standalone CLI`
- **Tekshirilgan sana:** `2026-11-15`
- **Joriy holati:** `✅ Ishlatilyapti` *(macOS'da desktop, Chrome va iOS Simulator testlarida asosiy vosita)*

---

## 1. Nima va qanday ishlaydi?

Operatsion tizimning o'z **Accessibility (`AX`) daraxti** orqali desktop dasturlarni o'qiydigan va boshqaradigan tezkor CLI vosita. Har bir buyruq aniq JSON (`ok`, `data`, `error`) qaytaradi.

Asosiy ishlash zanjiri (`observe → act → verify`):
1. `agent-desktop snapshot --app "Google Chrome" --skeleton -i --compact` — oynaning ixcham elementlar xaritasini oladi;
2. `agent-desktop snapshot --root @<id>:e<N> --compact` — faqat kerakli qismni chuqurroq o'qiydi (kontekstni to'ldirib yubormaydi);
3. `agent-desktop click @<id>:e<N>` yoki `set-value @<id>:e<N> "<matn>"` — elementga to'g'ridan-to'g'ri semantik amal yuboradi.

**Eng katta ustunligi (`Headless` rejim):** Odatiy rejimda u foydalanuvchining sichqonchasini qimirlatmaydi, klaviaturani tortib olmaydi va oynani oldinga chiqarmaydi (fokus o'g'irlamasdan fonda ishlaydi).

---

## 2. Qanchalik yaxshi va qanchalik yomon?

### Kuchli tomonlari
- **Login bo'lgan real Chrome bilan ishlaydi:** Playwright kabi har safar yangi bo'sh profil ochmasdan, foydalanuvchining ochiq turgan `Google Chrome` oynasini fonda tekshira oladi.
- **iOS Simulator (`Device Hub`) bilan ishlaydi:** Xcode `Device Hub` ichidagi React Native / UIKit elementlarini ham `AX` daraxti orqali bosib va to'ldirib tekshira oladi.
- **Aqlli xato va qayta urinish nazorati:** Har bir amalda `disposition.delivery` va `retry: safe` qaytadi — tugmani ikki marta bosib yuborish xavfini oldini oladi.

### Zaif tomonlari va cheklovlari
- OpenGL/Metal yuzasida chiziladigan oynalarning (masalan, Android Emulator ichki ekrani yoki `<canvas>`/WebGL sahnalar) ichki elementlarini ko'ra olmaydi — Android uchun `adb`, network/console/CPU throttling uchun esa Chrome DevTools / Playwright ishlatiladi.
- macOS'da tizim sozlamalaridan Accessibility (va skrinshot kerak bo'lsa Screen Recording) ruxsati berilgan bo'lishi shart.

---

## 3. Xavfsizlik va Ishlatish qoidalari (Cheklovlar)

- **Xavf darajasi:** `O'rta` *(ochiq turgan haqiqiy dasturlar va brauzer sessiyasini boshqara olgani uchun ehtiyotkorlik talab etiladi)*
- **Amal qilinishi shart bo'lgan qoidalar:**
  1. **`--headed` rejimni o'zboshimchalik bilan yoqmaslik:** Foydalanuvchi ruxsat bermaguncha kursorni tortib oladigan `--headed` flagini ishlatmaslik; `headless` xato bersa, yashirincha `--headed` ga o'tib ketmaslik.
  2. **Faqat ruxsat etilgan oyna (`--app`):** Begona messenjer, pochta yoki tizim sozlamalariga tegmasdan, faqat vazifaga tegishli `--app` oynasi bilan ishlash.
  3. **To'liq daraxt o'rniga `--skeleton` va `--compact`:** Katta sahifalarda kontekst shishib ketmasligi uchun har doim bo'laklab (`--root`) o'qish.

---

## 4. Bizga qanchalik kerak va mavjud vositalar bilan mosligi

- **Web va iOS Simulator:** `agent-desktop` asosiy fonda tekshiruvchi vosita.
- **Android:** `adb` bilan to'ldiriladi (chunki Android Emulator `AX` daraxtini ochmaydi).
- C/Python/Node/Swift dasturlar ichidan CLI chaqirmasdan to'g'ridan-to'g'ri ulash uchun yonida `agent-desktop-ffi` skilli ham o'rnatilgan.

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** Lokal veb-ilovalarni Chrome'da tekshirish, macOS desktop dasturlarni avtomatlashtirish va Xcode `Device Hub` orqali iOS Simulator UI oqimlarini sinashda.
- **Qachon ishlatmaslik kerak:** Android Emulator ichki ekranida (`adb` kerak) yoki chuqur HTTP/WebSocket trafik va CPU throttling o'lchovlarida (Chrome DevTools kerak).

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-15 | Lokal o'rnatish va amaliy QA oqimiga ulash | `✅ Ishlatilyapti` | CLI hamda `agent-desktop`, `agent-desktop-macos`, `agent-desktop-ffi` skillari global o'rnatilgan; Web va iOS Simulator tekshiruvlarida doimiy ishlatilmoqda. |

