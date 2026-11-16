# `impeccable`

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/ui-ux/impeccable.md) | [🇷🇺 Русский](../ru/ui-ux/impeccable.md)

- **Manba:** [pbakaus/impeccable](https://github.com/pbakaus/impeccable)
- **Turkum:** `UI/UX` *(Web, Mobile Web va Native iOS/Android dizayn tizimi va UX auditi)*
- **Turi:** `Skill` *(v4.8.1, lokal `mobile-routing-1+apca-contrast-1` moslashtiruvi bilan)*
- **Sifat bahosi:** **9.5 / 10**
- **Bizga kerakliligi:** **9.5 / 10**
- **Tavsiya etilgan ko'lam:** `Global (-g)`
- **Ishlatilayotgan sana:** `2026-11-09` dan
- **Joriy holati:** `✅ Ishlatyapman` *(barcha veb va mobil UI/UX ishlarida asosiy dizayn skilli)*

---

## 1. Nima va qanday ishlaydi?

Paul Bakaus tomonidan ishlab chiqilgan keng qamrovli *Design Director* skilli. Oddiy tayyor rang shablonlari o'rniga sahifaning vazifasiga qarab 4 xil rejimda ishlaydi:
- **Persuade:** Landing, marketing va narx sahifalari (kuchli vizual xarakter va konversiya).
- **Operate:** Dashboard, admin panel, xarita va ishchi web-app'lar (aniqlik, tez o'qilish va qulaylik ustuvor).
- **Read:** Hujjatlar, maqolalar va qo'llanmalar.
- **Experience:** Portfolio va media namoyishlar.

Ichida `shape`, `audit`, `polish`, `simplify`, `harden`, `adapt` kabi maxsus playbook'lar, qat'iy sifat chegarasi (`craft-floor.md` — shablon AI kartochkalari, ma'nosiz gradient matnlar va soxta bezaklarni taqiqlaydi) hamda mahsulot kontekstini `PRODUCT.md` va `DESIGN.md` da saqlash tartibi bor. Bizdagi versiyasi ham **mobil veb**, ham **native iOS / Android** ekranlariga moslashtirilgan va ichiga **`APCA` perceptual kontrast** himoyasi kiritilgan.

---

## 2. Qanchalik yaxshi va qanchalik yomon?

### Kuchli tomonlari
- Mavjud loyihaning stekini va dizayn tizimini buzmasdan ishlaydi (`Refinement` va `Redesign` chegarasini aniq ajratadi).
- Har bir o'zgarishdan keyin haqiqiy render/brauzer yoki simulyatorda o'lchamlarni tekshirishni talab qiladi.
- `ui-ux-pro-max` kabi kategoriya klishelariga tushib qolmaydi.

### Zaif tomonlari va cheklovlari
- Yo'riqnoma va reference fayllari katta bo'lgani uchun faqat kerakli playbook (`adapt.md`, `audit.md`, `craft-floor.md`) tanlab o'qilishi kerak.
- Asl (`upstream`) versiyasida kontrast faqat eski **`WCAG 2` (`4.5:1`)** nisbati bilan tekshiriladi — rangli aksent tugmalarda bu toza oq yozuvni nohaq yiqitib, xira qora yozuvga yoki kirli to'q rangga o'tkazib yuboradi (quyidagi `apca-contrast-1` lokal tahriri bilan hal qilingan).

---

## 3. Xavfsizlik, Sanitarizatsiya va Lokal Moslashtirishlar

- **Xavf darajasi:** `Past` *(lokal moslashtirilgan va tozalangan)*
- **Amalga oshirilgan sanitarizatsiya (muhim):**
  1. Lokal o'rnatmamizda tashqi `hooks` va avtomatik `live`/`generate` rejimlari o'chirib qo'yilgan (ruxsatsiz CLI agent chaqirib yubormasligi uchun).
  2. Agar `live` rejimi kelajakda qo'lda yoqilsa ham, `IMPECCABLE_LIVE_COPY_AGENT=chat` (yoki `off`) bilan cheklash qoidasi kiritilgan.

<a id="apca-contrast"></a>

### Lokal `APCA` Perceptual Kontrast tahriri (`apca-contrast-1` — Nimalarni qandayga o'zgartirdik?)

**Nega bu qoidani qo'shib ketgan yaxshi?**
`WCAG 2` (2008) oddiy yorqinlik bo'linmasiga `(L1 + 0.05) / (L2 + 0.05)` tayanadi va odam ko'zi to'q fonda och yozuvni boshqacha ko'rishini (polyarlikni) hamda shrift qalinligini hisobga olmaydi. O'rtacha yorqinlikdagi brend aksent ranglarida (`L > 0.18` — **olovrang, iOS ko'k `#007AFF`, yashil, qizil** tugma va badge'larda):
- **Olovrang yoki ko'k tugma + oq yozuv:** `WCAG 2 = 3.81–4.02` ❌ *(yiqiladi)*, lekin **`APCA = Lc 70–72` ✅** *(keragi `60`, ko'zga aniq va toza o'qiladi)*.
- **Olovrang tugma + qora yozuv:** `WCAG 2 = 4.63` ✅ *(o'tadi)*, lekin **`APCA = Lc 38` ❌** *(ko'zga kirli va xira ko'rinadi)*.

Alohida yangi skill o'rnatish (`auto-trigger` to'qnashuvi va ortiqcha kontekst) o'rniga, `impeccable` ning 6 ta ichki faylini quyidagicha yangiladik (`Eski holati -> Yangi holati`):

1. **`SKILL.md` (`metadata.local-adaptation`, 9-qator):**
   - **Eski:** `local-adaptation: mobile-routing-1`
   - **Yangi:** `local-adaptation: mobile-routing-1+apca-contrast-1`

2. **`reference/craft-floor.md` (9-qator — har bir UI tahrirdan oldin o'qiladigan asosiy qoida):**
   - **Eski:**
     ```markdown
     - **Contrast:** body and placeholder text ≥4.5:1, large text ≥3:1. On colored surfaces tint secondary text from that hue or the foreground; never gray.
     ```
   - **Yangi:**
     ```markdown
     - **Contrast:** body and placeholder text ≥4.5:1 (APCA |Lc| ≥75 body, ≥60 secondary), large text ≥3:1. On mid-tone brand fills (orange, blue, green, red buttons/badges), check both WCAG 2 and APCA: keep crisp light text when APCA |Lc| ≥60 (14px+ medium/semibold) instead of flipping to muddy dark text or dulling the brand hue just to chase WCAG 4.5:1; reject dark-on-accent pairs that pass WCAG 2 but fail APCA (|Lc| <60). On colored surfaces tint secondary text from that hue or the foreground; never gray.
     ```

3. **`reference/colorize.md` (`## Contrast and perception`, 53–63-qatorlar):**
   - **Eski:** faqat 2 ustunli `WCAG AA minimum` jadvali (`body text: 4.5:1`, `large text: 3:1`, `controls, icons, focus indicators: 3:1`).
   - **Yangi:** 3 ustunli `WCAG AA minimum` + `APCA perceptual floor` jadvali hamda aksent tugmalar qoidasi:
     ```markdown
     Verify computed foreground/background pairs with both WCAG 2 and perceptual APCA (`|Lc|`):

     | Content | WCAG AA minimum | APCA perceptual floor |
     |---|---|---|
     | body text | 4.5:1 | `\|Lc\| ≥ 75` (`≥ 60` secondary) |
     | large text / button & badge labels (`14px+` medium/semibold) | 3:1 (4.5:1 if strict legal WCAG AA applies) | `\|Lc\| ≥ 60` |
     | controls, icons, focus indicators | 3:1 | `\|Lc\| ≥ 45` |

     On mid-tone brand fills (vivid orange, iOS blue, green, red CTAs/badges), WCAG 2 luminance math favors dark text (`~4.6:1`, APCA `~38`) over crisp white text (`~3.8–4.1:1`, APCA `70+`). Unless strict legal WCAG 2 AA compliance is explicitly required, keep white text when `APCA |Lc| ≥ 60` rather than switching to low-perceptual dark text or muddying the brand color; fix pairs that fail both (`WCAG < 4.5:1` and `APCA |Lc| < 60`).
     ```

4. **`reference/audit.md` (`### 1. Accessibility`, 14-qator):**
   - **Eski:**
     ```markdown
     - **Contrast issues**: Text contrast ratios < 4.5:1, or < 3:1 for large text (or 7:1 for AAA)
     ```
   - **Yangi:**
     ```markdown
     - **Contrast issues**: Body/secondary text < 4.5:1 (`APCA |Lc| < 60`), or large text < 3:1. On mid-tone brand buttons/badges (`14px+` medium/semibold), evaluate both WCAG 2 and APCA: white text with `APCA |Lc| ≥ 60` (`WCAG ~3.5–4.4:1`) is perceptually legible (note only as an advisory if strict legal WCAG AA is required, not a P1 defect), whereas dark text on mid-tone accents with `APCA |Lc| < 60` is a real contrast failure even if `WCAG ≥ 4.5:1`
     ```

5. **`reference/audit.native.md` (`### 1. Accessibility`, 17-qator):**
   - **Eski:**
     ```markdown
     - **Contrast**: text failing contrast in either appearance, light or dark
     ```
   - **Yangi:**
     ```markdown
     - **Contrast**: text failing contrast in either appearance, light or dark (check both WCAG 2 and perceptual APCA `|Lc| ≥ 60` on mid-tone brand/system tint buttons such as iOS `#007AFF`, orange, or green fills so crisp white button labels aren't falsely flagged or flipped to muddy dark text)
     ```

6. **`reference/critique.md` (`Sam` accessibility persona, 734 va 741-qatorlar):**
   - **Eski:** `Needs adequate color contrast (4.5:1 minimum)` va `Is color contrast WCAG AA compliant (4.5:1 for text)?`
   - **Yangi:** `Needs adequate color contrast (4.5:1 body text; APCA |Lc| ≥ 60 on mid-tone accent buttons/badges)` va `Is color contrast legible across both WCAG AA (4.5:1 body) and perceptual APCA (|Lc| ≥ 60 on colored controls)?`

---

## 4. Bizga qanchalik kerak va mavjud vositalar bilan mosligi

- Expo va React Native animatsiyalari uchun [`animate-expo`](../mobile/animate-expo.md), mobil brauzer/PWA moslashtiruvi uchun esa [`mobile-native`](../mobile/mobile-native.md) bilan bir-birini to'ldiradi.
- Shu skill borligi sababli [`ui-ux-pro-max`](ui-ux-pro-max.md), [`make-interfaces-feel-better`](make-interfaces-feel-better.md) va global [`taste-skill`](../web/taste-skill.md) kabi raqobatchi UI skillarni global o'rnatishga ehtiyoj yo'q (ular `impeccable` bilan to'qnashadi).

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** Yangi interfeys loyihalash, mavjud web yoki native mobil ekranlarni chiroyliroq/tushunarliroq qilish, UX/accessibility auditi va dizayn tokenlarini tartibga solishda.
- **Qachon ishlatmaslik kerak:** Sof backend, DB yoki UI'ga aloqasi yo'q ishlarda.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-09 | `v4.8.1` (`mobile-routing-1` va hook cheklovi bilan) global o'rnatish | `✅ Ishlatyapman` | Web, mobil veb va React Native ekranlari dizayni hamda kontrast/UX auditida asosiy vosita sifatida ishlatib kelinmoqda. |
| 2026-11-16 | `apca-contrast-1` lokal perceptual kontrast qoidasini qo'shish va `skillshare sync -g` | `✅ Ishlatyapman` | `SKILL.md`, `craft-floor.md`, `colorize.md`, `audit.md`, `audit.native.md` va `critique.md` fayllariga `WCAG 2 + APCA (\|Lc\| ≥ 60)` ikki tomonlama tekshiruvi kiritildi (rangli brend tugmalarda oq yozuv buzilishining oldi olindi). |
