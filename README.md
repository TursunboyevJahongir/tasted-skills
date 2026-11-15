# Tasted Skills & AI Tools Radar

AI coding agentlar (**Claude Code**, **Codex**, **Antigravity**) uchun tekshirilgan **skillar, pluginlar, MCP serverlar, xotira (memory) tizimlari, brauzer/desktop avtomatlashtirish vositalari va CLI'lar** katalogi.

Maqsad — YouTube/GitHub'dagi reklama va clickbait'ga ishonmasdan, har bir vositaning **haqiqiy kodi va xavfsizligini** tekshirish, **o'rnatishdan oldin qaysi xavfli/ortiqcha qismlarini olib tashlash kerakligini** yozib qo'yish hamda keyinchalik biror loyiha yoki vazifa chiqqanda kerakli vositani bir qarashda topish.

---

## Holat belgilari (Status)

| Belgi | Ma'nosi |
|---|---|
| `✅ Ishlatilyapti` | O'rnatilgan va amalda faol ishlatilmoqda (`-g` global, `-p` loyiha ichida yoki standalone). |
| `📦 Nomzod` | Kodi va xavfsizligi tekshirilgan, foydali deb topilgan — kerak paytda o'rnatishga tayyor. |
| `🧪 Sinovda (Local -p)` | Faqat bitta loyiha doirasida sinovdan o'tkazilgan yoki vaqtincha ulangan. |
| `⚠️ Globalga emas` | Tor vazifada kuchli, lekin global o'rnatilsa mavjud ishlarga xalaqit beradi. |
| `⏭️ Ishlatilmagan` | Ko'rib chiqilgan va o'tkazib yuborilgan (bizda kuchliroq muqobili bor yoki foydasi kam). |
| `⛔ Rad etilgan` | Xavfsizlik muammosi, zararli hook/skript yoki jiddiy ziddiyat sababli rad etilgan. |

*(Batafsil tahlil, xavfsizlik/sanitarizatsiya ro'yxati va qilingan ishlar tarixini ko'rish uchun resurs ustiga bosing.)*

---

## Katalog (Yo'nalishlar bo'yicha)

### 🌐 Web (Veb-ilovalar, Landing va Frontend)

| Resurs | Asl manba | Turi | Sifat | Keraklilik | Holati | Tekshirilgan sana | Qisqacha xulosa va sanitarizatsiya eslatmasi |
|---|---|---|---|---|---|---|---|
| [**`taste-skill` v2.5** (`design-taste-frontend`)](reviews/web/taste-skill.md) | [Leonxlnx/taste-skill](https://github.com/Leonxlnx/taste-skill) | Landing Kit + Stop Hook | **8.0/10** | **4.0/10** | `⚠️ Globalga emas` | `2026-11-15` | Noldan promo/landing sayt qurishda kuchli, lekin web-app'larga begona `system.css` qo'shadi. O'rnatilsa `Stop` hook (600s) kesib tashlanishi va faqat `-p` rejimda ishlatilishi shart. |

---

### 📱 Mobile va Mobile Web (PWA, iOS, Android, Expo)

| Resurs | Asl manba | Turi | Sifat | Keraklilik | Holati | Tekshirilgan sana | Qisqacha xulosa va sanitarizatsiya eslatmasi |
|---|---|---|---|---|---|---|---|
| [**`mobile-native`**](reviews/mobile/mobile-native.md) | [emilkowalski/skills](https://github.com/emilkowalski/skills/tree/main/skills/mobile-native) | Skill | **8.5/10** | **7.5/10** | `📦 Nomzod` | `2026-11-15` | Mobil veb va PWA'ni native ilovadek sezdiradigan 11 ta aniq CSS/meta yechim (`dvh/svh`, `hover: hover`, `16px` input, `safe-area`, `overscroll`). O'rnatishdan oldin `Initial Response` salomlashuv bo'limi olib tashlanadi. |

---

### 🎨 UI/UX va Dizayn

| Resurs | Asl manba | Turi | Sifat | Keraklilik | Holati | Tekshirilgan sana | Qisqacha xulosa va sanitarizatsiya eslatmasi |
|---|---|---|---|---|---|---|---|
| [**`ui-ux-pro-max`**](reviews/ui-ux/ui-ux-pro-max.md) | [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) | Skill + CSV/Python | **7.0/10** | **3.5/10** | `⏭️ Ishlatilmagan` | `2026-11-15` | Tez MVP uchun tayyor CSV rang/shrift bazasi, lekin mavjud `impeccable` + `make-interfaces-feel-better` tizimidan kuchsizroq va auto-trigger'i ular bilan to'qnashadi. |

---

### 🏗️ Arxitektura, Rejalashtirish va Review

| Resurs | Asl manba | Turi | Sifat | Keraklilik | Holati | Tekshirilgan sana | Qisqacha xulosa va sanitarizatsiya eslatmasi |
|---|---|---|---|---|---|---|---|
| [**`elephant-goldfish-model`** (EGM)](reviews/architecture/elephant-goldfish-model.md) | [google/elephant-goldfish-model](https://github.com/google/elephant-goldfish-model) | Plugin (7 skill + 10 agent) | **9.0/10** | **8.0/10** | `📦 Nomzod` | `2026-11-15` | Katta arxitektura hujjatini 5 bosqichda toza (`fresh-context`) Goldfish subagentlar bilan tekshiradi + `egm-drift-report` (hujjat va real kod farqini topadi). To'liq plugin sifatida o'rnatiladi, manual chaqiruv (`disable-model-invocation: true`) saqlanadi. |

---

### ⚙️ Backend, Ma'lumotlar Bazasi va Infratuzilma

*Hozircha yangi tekshirilgan resurs qo'shilmagan — ORM, DB, API, Cloud, Observability yo'nalishidagi skill/MCP/CLI'lar `reviews/backend/` ichiga yozib boriladi.*

---

### 🛠️ Dasturchi Vositalari, Xotira (Memory) va Avtomatlashtirish

*Hozircha yangi tekshirilgan resurs qo'shilmagan — agent xotira tizimlari (masalan `claude-mem`), brauzer/desktop boshqaruv vositalari (`agent-desktop` va b.), MCP serverlar va CLI'lar `reviews/developer-tools/` ichiga yozib boriladi.*

---

## Global `tasted-skills` Skilli (Codex, Claude Code va Antigravity uchun)

Ushbu repozitoriy o'z ichida global agent skillini ham saqlaydi: [`skills/tasted-skills/SKILL.md`](skills/tasted-skills/SKILL.md).

U barcha agentlarga 3 ta imkoniyat beradi:
1. **Vazifaga mos vosita topish:** *"Shu loyiha / vazifa uchun bizda qanday tekshirilgan skill yoki tool bor?"* deb so'ralganda katalogni o'qib, eng mosini va qanday ko'lamda (`-g` yoki `-p`) o'rnatish kerakligini aytadi.
2. **Yangi video / GitHub / saytni chuqur audit qilish:** Reklama emas, asl kod va skriptlarni ochib, [xavfsizlik va sanitarizatsiya chek-listi](skills/tasted-skills/references/audit-checklist.md) asosida tekshiradi va [standart shablon](reviews/TEMPLATE.md) bo'yicha katalogga qo'shadi.
3. **Tozalab o'rnatish va holatni yuritish:** O'rnatishdan oldin xavfli hook, ortiqcha skript yoki keng auto-trigger'larni kesib tashlaydi va ishlatilgan/ishlatilmaganlik tarixini yangilab boradi.

### `skillshare` orqali barcha agentlarga ulash

Lokal klondan to'g'ridan-to'g'ri ulash (tahrirlar darhol barcha agentlarga tushadi):

```bash
git clone git@github.com:TursunboyevJahongir/tasted-skills.git ~/Projects/tasted-skills
skillshare link ~/Projects/tasted-skills/skills/tasted-skills --name tasted-skills --enable -g
skillshare sync -g
```

Yoki GitHub'dan to'g'ridan-to'g'ri o'rnatish:

```bash
skillshare install TursunboyevJahongir/tasted-skills -s tasted-skills -g
skillshare sync -g
```

---

## Repo tuzilmasi

```text
tasted-skills/
├── README.md                                   # Yo'nalishlar bo'yicha guruhlangan asosiy katalog
├── reviews/
│   ├── TEMPLATE.md                             # Yangi tahlillar uchun standart shablon
│   ├── web/                                    # Web, frontend va landing vositalari
│   ├── mobile/                                 # Mobile web, PWA, iOS/Android, Expo
│   ├── ui-ux/                                  # UI/UX, dizayn tizimlari, animatsiya
│   ├── architecture/                           # Arxitektura, rejalashtirish va code/spec review
│   ├── backend/                                # Backend, DB, infra, observability
│   └── developer-tools/                        # Memory, browser/desktop automation, MCP, CLI
└── skills/
    └── tasted-skills/
        ├── SKILL.md                            # Global skill (Claude, Codex, Antigravity)
        └── references/
            └── audit-checklist.md              # Xavfsizlik, sanitarizatsiya va moslik mezoni
```
