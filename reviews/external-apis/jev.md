# `Jev` (`TypeSafe AI` — Tezkor `Decision / Select` API)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/external-apis/jev.md) | [🇷🇺 Русский](../ru/external-apis/jev.md)

- **Manba:** [typesafe.ai](https://typesafe.ai/) · [docs.typesafe.ai](https://docs.typesafe.ai/) · `api.typesafe.ai/v1/systemone` (`jev-1.14.0`)
- **Turkum:** `Tashqi API'lar` *(Rasm va matn ustida soniyaning ulushida `true/false`, `select` va `score` qaror chiqarish)*
- **Turi:** `Cloud Decision Engine API` *(`System-1`, generativ LLM emas)*
- **Sifat bahosi:** **9.0 / 10**
- **Ishda kerak bo'lishi:** **8.0 / 10** *(bir nechta server loyihalarimizda production'da ishlaydi)*
- **Tavsiya etilgan ko'lam:** `Backend / Server Production API (Confidence < 80% va Timeout Fallback bilan)`
- **Ishlatilayotgan sana:** `2026-10` dan *(oxirgi yangilanish: `2026-11-17`)*
- **Joriy holati:** `✅ Ishlatyapman` *(media/video platformamiz va boshqa server loyihalarimizda rasm yaroqliligini tekshirish, kadrlardan eng yaxshisini tanlash va oqimni filtrlashda faol ishlatilyapti)*

---

## 1. Nima va qanday ishlaydi? (Muhim farq: bu oddiy AI model emas!)

> [!IMPORTANT]
> **Oddiy tilda (Asosiy vazifasi va foydasi):** `Jev` — gaplashadigan, matn yozadigan yoki rasm chizadigan AI model **emas**; u **qaror (`decision`) chiqarib beradigan super-tez va juda arzon dvigatel**. Unga rasm (yoki matn) va aniq savollar berasiz — u **`~0.3 soniyada`** **`true / false`** (`yaroqli / yaroqsiz`) yoki **bir nechta variantdan qaysi biri eng mosligini (`select`)** ishonch foizi (`0–100%`) bilan qaytaradi. O'zining aynan shu joyida qo'llanganda tezlik va arzonlik nisbati bo'yicha tengsiz.

`TypeSafe AI` tomonidan ishlab chiqilgan **`Jev` (`System-1` foundation model)** klassik LLM'lar kabi so'zlarni bittalab generatsiya qilmaydi. Bitta so'rovda `state` (1 yoki bir nechta rasm / matn) hamda tiplangan savollar yuboriladi va bitta forward-pass'da tayyor ehtimollik qaytadi:
- **`Noul` (`true / false`):** *"Ushbu rasm yaroqlimi?"*, *"Kadrda ko'z yumilib qolmaganmi?"*, *"Reklama yozuvi bormi?"* -> `0.00–1.00` ishonch foizi bilan.
- **`Choice` (`select` — bir nechtasidan tanlash):** *"6 ta video kadrdan eng sifatli muqova (`main`) qaysi biri?"* yoki *"Qaysi toifaga kiradi?"* -> har bir variant ehtimolligi bilan.
- **`Score` (`baho`):** Berilgan mezon bo'yicha ball qo'yish.

📊 **Rasmiy hujjat va narxlar:** [typesafe.ai](https://typesafe.ai/) · [docs.typesafe.ai](https://docs.typesafe.ai/)

---

## 2. Real Tajribamiz: Nega aynan `Jev` ni tanladik? (3 ta yo'l solishtiruvi)

Media/video platformamiz va boshqa server loyihalarimizda bizga rasm chizish yoki rasm ustida ishlash emas, balki **kelgan rasm yaroqlimi-yo'qmi tekshirish** va **bir nechta kadr ichidan eng yaxshisini tanlash (`select`)** kerak edi. Buning uchun 3 ta yo'lni jonli sinab ko'rdik:

| Mezon | 1-yo'l: **Pullik `GPT` Vision API** (`GPT-5` va h.k.) | 2-yo'l: **Serverda AI Subscription (`GPT-6 Luna` `Medium`)** | 3-yo'l: ✅ **`Jev` (`TypeSafe AI`) + Fallback** |
|---|---|---|---|
| **Ishlash tezligi (1 rasm / 6 ta savol)** | Sekin (`~4–10+ soniya`) | **Kamida `~9–12+ soniya`** *(eng tez `GPT-6 Luna Medium` da ham `p50: 9.02s–12.4s` — mijoz kutib qoladi!)* | **`~0.30 – 0.35 soniya` (`299–349 ms` p50)** — **`~25–30x` tezroq!** *(6 ta video kadrdan tanlash ham jami `~3.3s`)* |
| **Narxi (`1M` token uchun)** | **Qimmat:** Kirish `$1.25` · Chiqish `$10.00` *(rasm yuborilganda tez yig'iladi)* | Alohida token puli ketmaydi *(mavjud obunadan ishlaydi, lekin oqim limiti va navbat bor)* | **Pullik, lekin juda arzon:** Kirish **`$0.042`** · Chiqish **`$0.00` (tekin!)** *(Luna API `$0.10/$0.50` dan **`~2.4x–10x`**, bazaviy GPT'dan **`~30x–100x+` arzon**)* |
| **Sozlash qiyinligi** | Oson (oddiy prompt) | O'rtacha (server auth + navbat) | **Qiyinroq** (savollarni kalibrlash + `<80%` va `timeout` fallback yozish shart) |
| **Natija** | Oson, lekin katta oqimda qimmat va sekin | Orqa fon (background) ishlarga mos, lekin foydalanuvchi kutib turadigan joyga sekin | **Real-time tekshiruv va tanlash (`select`) uchun eng zo'r yechim** |

**Bizda serverda qaysi nuqtalarda ishlayapti:**
1. **Yuklangan rasm yaroqliligini lahzada tekshirish:** Foydalanuvchi yoki muharrir rasm yuklaganda mijozni `10+` soniya kutdirib qo'ymasdan `~0.3–1.6s` ichida dastlabki tekshiruvdan o'tkazish.
2. **Video/epizoddan olingan 6 ta kadrdan eng yaxshisini tanlash (`select`):** Bitta so'rovda ham yaroqsiz (ko'z yumilgan / buzilgan) kadrni tutadi, ham eng chiroyli asosiy kadrni (`main`) tanlab beradi (`~3.3s`).
3. **Nomzod rasmlarni arzon elakdan o'tkazish (`prefilter`):** Qimmat AI'ga yuborishdan oldin yaroqsiz rasmlarni `~349 ms` da chetga chiqarish (`~43%` kamroq katta model so'rovi).
4. **Qisqa matnli ro'yxatlarni (`EPG` / katalog) paketlab toifalash:** 14–20 qatorlik jadvalni `~0.8–1.0s` ichida toza/keraksizga ajratish.

---

## 3. Kamchiliklari va Ishlatishdagi Majburiy Xavfsizlik Qoidalari

`Jev` "o'rnatding — o'zi ishlab ketdi" deydigan vosita **emas**. Ishda pand yemaslik uchun quyidagi **3 ta himoya qoidasini** qo'yish shart:

1. **Konfiguratsiya va sinov talab qiladi (`Shadow` kalibrlash):**
   - Har bir `true/false` yoki `select` savolini aniq formulirovka qilish va jonli yoqishdan oldin real misollarda qanday holatlarda adashishini tekshirish kerak (masalan, film posteridagi oddiy yozuvni "reklama" deb yubormasligi yoki indeks tartibida adashmasligi uchun aniq kalitlar berish shart).
2. **Yoniga kuchliroq AI qo'yish shart (`Confidence < 80%` Fallback):**
   - `Jev` o'z qarorida ikkilansa — masalan, ishonch ko'rsatkichi **`80%` dan past (`< 0.80`)** chiqsa — uning javobini ko'r-ko'rona qabul qilmang. Bunday shubhali holatlarni avtomatik ravishda yonidagi kuchliroq modelga (`GPT-6 Luna` / `Codex` / GPT API) o'tkazib yuboring.
3. **Aloqa uzilishi va javob qaytmaslikka tayyor turing (`Timeout + Failover`):**
   - *"Har doim 100% connect beradi"* deb ishonib qolish xato: ba'zan tarmoq ulanmay qolishi, `429/529` qaytarishi yoki katta rasmlarda javob cho'zilishi mumkin.
   - Har bir chaqiriqqa qat'iy vaqt chegarasi (**1 rasmga `3s`, ko'p rasmga `6s` timeout**) va cheklangan parallel oqim qo'ying; agar `Jev` javob bermasa ham server to'xtab qolmasdan avtomatik zaxira AI'ga o'tib ishlashda davom etishi shart.

---

## 4. Qachon ishlatish kerak va qachon ishlatmaslik kerak?

- **✅ Aynan o'zining joyi (Juda zo'r tanlov):**
  - Mavjud rasm yoki matn ustida **`Ha / Yo'q` (`true/false`)** tekshiruvi (yaroqlilik, xavfsizlik, sifat prefilteri);
  - `2–10` ta tayyor variant ichidan **eng mos bittasini tanlash (`select`)**;
  - Katta va qimmat AI model oldidan **arzon tezkor filtr (`System-1 Gate`)** sifatida qo'yish.
- **❌ Ishlatmaslik kerak (Boshqa AI ishlating):**
  - Rasm chizish, rasmni kesish/tiniqlashtirish yoki tahrirlash;
  - Matn yozish, tarjima qilish, kod yozish yoki hujjatdan uzun `OCR` matn o'qib olish (`buning uchun MiniMax M3.1 Flash API yoki GPT-6 Luna mos`);
  - Internetdan ma'lumot qidirish va chuqur mantiqiy tahlil.

---

## 5. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-10-30 | Media platformamizda 6 ta server oqimiga (`jev-1.14.0`) integratsiya va `GPT-6 Luna` bilan benchmark | `✅ Ishlatyapman` | `~0.3s` p50 javob vaqti (`GPT-6 Luna Medium` `~9–12s` o'rniga), `<0.80` confidence va `3–6s` timeout fallback bilan production'da barqaror ishlayapti. |
| 2026-11-17 | Tajriba, narx/tezlik solishtiruvi va himoya arxitekturasi katalogga kiritildi | `✅ Ishlatyapman` | Bir nechta server loyihalarimizdagi amaliy natijalar umumlashtirildi. |
