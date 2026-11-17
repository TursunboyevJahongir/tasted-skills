# `vercel-labs/ui` (`@ui-sdk/*` + `ui-sdk` Skill)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/web/vercel-ui-sdk.md) | [🇷🇺 Русский](../ru/web/vercel-ui-sdk.md)

- **Manba:** [vercel-labs/ui](https://github.com/vercel-labs/ui)
- **Turkum:** `Web` *(Headless UI Behavior Primitives + `WebMCP` Agent Bridge — Public Beta)*
- **Turi:** `NPM Framework Library` (`@ui-sdk/*`) + `Skill` (`packages/core/skills/ui-sdk`)
- **Sifat bahosi:** **8.0 / 10** *(arxitektura va ko'p-freymvorkli headless dizayn sifatida)*
- **Ishda kerak bo'lishi:** **2.0 / 10** *(mavjud React/Shadcn/Radix veb va Expo mobil stekimizga mos emas)*
- **Tavsiya etilgan ko'lam:** `O'rnatmaslik` *(faqat kelajakda noldan maxsus `@ui-sdk/*` da veb-loyiha boshlansagina lokal `-p` da olinadi)*
- **Tekshirilgan sana:** `2026-11-16`
- 🔄 **Alternativi yaxshiroq:** [agent-desktop](../developer-tools/agent-desktop.md) + [impeccable](../ui-ux/impeccable.md)

---

## 1. Nima va qanday ishlaydi? (Video reklamasi vs Asl haqiqat)

> [!IMPORTANT]
> **Oddiy tilda (Asosiy vazifasi va foydasi):** Reklamasidagi *"skrinshotsiz 2x tez boshqaruv"* oddiy `<button>`/`<input>` yoki `Shadcn` saytlarini ko'rmaydi — faqat butun saytni `@ui-sdk/*` da qaytadan yozib chiqsangizgina ishlaydi (`Expo` esa umuman yo'q). Tayyor saytlarning hammasida bizdagi `agent-desktop` muammosiz ishlaydi.

Ijtimoiy tarmoqlardagi videolarda `vercel-labs/ui` *"interaktiv UI qurish kutubxonasi va AI agentlarga sahifani skrinshotsiz 2 baravar tez, 2 baravar arzon boshqarish imkonini beruvchi vosita"* sifatida ko'rsatiladi.

**Birlamchi kod auditi (`packages/` va `packages/core/skills/ui-sdk/`) nimani ko'rsatdi?**
1. **Bu universal brauzer avtomatizatsiyasi emas, balki alohida NPM komponent kutubxonasi (`Apache-2.0`, Public Beta):**
   - `@ui-sdk/core` ichida klaviatura navigatsiyasi, fokus, tanlash (`selection`), popup, drag-and-drop va ARIA xatti-harakatlari (`definePrimitive`, `createPopup`, `createSelection`) yozilgan; ustidan `@ui-sdk/react`, `@ui-sdk/vue`, `@ui-sdk/svelte`, `@ui-sdk/solid` va `@ui-sdk/web` adapterlari berilgan.
2. **"Skrinshotsiz 2x tez boshqaruv" (`createAgent` / `WebMCP`) cheklovi (`references/agent-ready.md` 15-qator):**
   - Ushbu ko'prik **faqat va faqat boshdan-oyoq `@ui-sdk/*` komponentlaridan terilgan sahifa ichidagina** ishlaydi!
   - `agent.snapshot()` oddiy HTML `<button>`, `<input>`, `<textarea>`, `<select>` yoki mavjud `Radix` / `Shadcn` / `MUI` komponentlarini **umuman ko'rmaydi** (*"These are invisible, so an agent can't fill or press them"*). Ya'ni bundan foydalanish uchun butun frontendni `@ui-sdk/*` ga qayta yozib chiqish talab etiladi.
3. **`ui-sdk` skilli (`SKILL.md` + 7 ta reference fayl, `~76 KB`):**
   - Faqat `node_modules/@ui-sdk/<framework>/docs/llms.txt` va `docs/core.md` (`300+ KB`) hujjatlarini o'qib `@ui-sdk` API'sida kod yozish uchungina xizmat qiladi.

---

## 2. Qanchalik yaxshi va qanchalik yomon?

### Kuchli tomonlari
- Bitta `definePrimitive` mantiqini 5 xil veb-freymvorkda (`React`, `Vue`, `Svelte`, `Solid`, `Web Components`) bir xil `createParts` API va RTL/ARIA qo'llab-quvvatlovi bilan ishlatish g'oyasi toza yozilgan.
- `data-agent-confirm`, `data-agent-secret` va `data-agent-hidden` atributlari orqali ichki in-app AI yordamchi uchun xavfsizlik chegaralari o'ylangan.

### Zaif tomonlari va xarajati
- **Mavjud loyihalarda `0%` foyda:** `@ui-sdk/*` o'rnatilmagan loyihada `ui-sdk` skilli umuman ishlamaydi; React Native / Expo mobil ilovalarni esa umuman qo'llab-quvvatlamaydi (faqat Web DOM).
- **Public Beta beqarorligi:** Rasmiy `README.md` (195-qator) da kutubxona **Vercel Public Beta Agreement** ostida ekani va API hamda xatti-harakatlari GA relizgacha o'zgarib ketishi ogohlantirilgan — production loyihalarni unga bog'lash erta.
- **Eski kontrast qoidasi:** `SKILL.md` (45-qator) faqat `WCAG 4.5:1` ni talab qiladi (`APCA` perceptual kontrastni hisobga olmaydi).

---

## 3. Xavfsizlik va O'rnatishdan oldin tozalash (Sanitarizatsiya)

- **Xavf darajasi:** `Past–O'rta`
- **Tekshirilgan nuqtalar (`skillshare audit` va manba kodi):**
  1. **`skillshare audit` da `CRITICAL` blokiga tushadi:** `references/web-components.md:47` dagi `root: {` satri statik tahlilda `prompt-injection-1 (SYSTEM: prompt override)` false-positive blokini keltirib chiqaradi (majburiy `--force` siz o'tmaydi).
  2. **Tashqi CDN skript ulash qoidasi (`SKILL.md` 21-qator):** Build qadamisiz sahifalarda tashqi `https://ui-sdk.dev/web.js` va `web.css` ni bevosita yuklashni buyuradi (qat'iy CSP siyosati bor loyihalarda tashqi runtime skript ulash tavsiya etilmaydi).
  3. Repo ichida telemetriya yoki lifecycle hooklar (`Stop`, `SessionStart`) yo'q.

---

## 4. Bizga qanchalik kerak va mavjud vositalar bilan mosligi

Bizga bu kutubxona ham, uning skilli ham kerak emas — chunki uning ikkala vazifasi mavjud stekimizda ancha universal hal qilingan:
1. **UI komponentlar va dizayn/a11y sifati:** Mavjud veb loyihalarimizdagi pishiq `React` (`Radix` / `Shadcn`) va mobil `Expo` stekimiz + [**impeccable**](../ui-ux/impeccable.md) (`craft-floor` + `APCA` kontrast + klaviatura/fokus auditi) Beta kutubxonaga o'tmasdan barqaror ishlaydi.
2. **Sahifani skrinshotsiz 2x tez boshqarish:** Bizdagi [**agent-desktop**](../developer-tools/agent-desktop.md) macOS Accessibility (`AX`) daraxti orqali **har qanday** veb-saytni (`<button>`, `<input>`, `Radix`, `Shadcn` yoki begona saytlarni ham — bitta qator `@ui-sdk` kodi yozmasdan!) fonda va skrinshotsiz millisekundlarda boshqaradi.

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** Faqat kelajakda maxsus `@ui-sdk/*` ustida yangi eksperimental veb-loyiha (yoki ichida in-app `WebMCP` yordamchisi bor veb-app) boshlansagina o'sha reponing o'ziga lokal (`-p`) o'rnatish mumkin.
- **Qachon ishlatmaslik kerak:** Global (`-g`) darajada, mavjud `React` / `Radix` / `Shadcn` veb loyihalarda hamda barcha `Expo` / `React Native` mobil ilovalarda.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh (ishlatildimi, qayerda sinab ko'rildi, nima tozalandi) |
|---|---|---|---|
| 2026-11-16 | Video demo (`@githubradar`), `vercel-labs/ui` manba kodi (`SKILL.md`, `agent-ready.md`) va `skillshare audit` tekshiruvi | 🔄 **Alternativi yaxshiroq:** [agent-desktop](../developer-tools/agent-desktop.md) | Faqat `@ui-sdk/*` da yozilgan Beta veb-ilovalar uchungina ishlashi (oddiy HTML/Shadcn'ni ko'rmasligi) sabab rad etildi. O'rniga: mavjud UI stekimiz + `impeccable` + `agent-desktop`. |

