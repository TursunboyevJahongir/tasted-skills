# 🧩 Amaliy Qo'llanmalar va Vositalar Bog'lamasi (Practices)

**🇺🇿 O'zbekcha** | [🇬🇧 English](en/README.md) | [🇷🇺 Русский](ru/README.md)

⬅️ [Asosiy katalogga qaytish (`README.md`)](../README.md)

Ushbu bo'limda alohida skill va CLI vositalarni **bir-biri bilan qanday ulab ishlatish**, har bir bog'lama **qanday amaliy foyda berishi** hamda ularning ichidagi **qo'shimcha yashirin imkoniyatlar** (masalan, alohida dastur o'rnatmasdan E2E avto-test yurgizish, RAM/disk tejash yoki ikkita AI agentni bir-biriga tekshirtirish) jamlangan.

---

## 📖 Mundarija (Yo'nalishlar va Bog'lamalar)

| # | Qo'llanma (Practice) | Birlashtirilgan vositalar (`Nima + Nima`) | Asosiy foydasi va qo'shimcha imkoniyatlari |
|---|---|---|---|
| **1** | [**Mobil va TV Oynasiz QA + Maestro E2E Avto-Testlar**](01-mobile-tv-headless-qa.md) | [**`simslim`**](../reviews/mobile/simslim.md) + [**`avdslim`**](../reviews/mobile/avdslim.md) + [**`agent-device`**](../reviews/mobile/agent-device.md) + [**`adb`**](../reviews/mobile/adb.md) + [**`xcrun simctl`**](../reviews/mobile/ios-simulator-device-hub.md) + [**`cross-platform-qa`**](../reviews/mobile/cross-platform-qa.md) | iOS (`1.16 GB`) va Android (`2.64 GB`, Metal GPU) emulyatorlarni ekranda oyna ochmasdan yurgizish (`~3.3 GB` RAM tejash), o'zbekcha UTF-8 kiritish hamda **Java/Maestro o'rnatmasdan `.yaml` / `.ad` E2E ssenariylarni (`--maestro`) va o'zini-o'zi tuzatuvchi (`healed.ad`) testlarni** fonda aylantirish. |
| **2** | [**Rejadan Toza Kod va Mustaqil Review'gacha**](02-spec-to-surgical-code.md) | [**`graphify`**](../reviews/architecture/graphify.md) + [**`grill-me`**](../reviews/architecture/grill-me.md) + [**`ponytail`**](../reviews/architecture/ponytail.md) + [**`karpathy-guidelines`**](../reviews/architecture/karpathy-guidelines.md) + [**`T3 Code`**](../reviews/developer-tools/t3-code.md) + [**`elephant-goldfish-model`**](../reviews/architecture/elephant-goldfish-model.md) | Katta repoda `0` token AST xarita bilan joyni topish, kod yozishdan oldin qarorlarni pishitish, eng kichik YAGNI diff yozish va boshqa AI modelga (*"Codex yozsin, Claude/Argon tekshirsin"*) xotirasiz mustaqil audit qildirish. |
| **3** | [**Web, Mobile Web va Native UI Dizayn + Tekshiruv**](03-web-and-mobile-ui-polish.md) | [**`impeccable`**](../reviews/ui-ux/impeccable.md) + [**`mobile-native`**](../reviews/mobile/mobile-native.md) + [**`animate-expo`**](../reviews/mobile/animate-expo.md) + [**`asset-diet`**](../reviews/developer-tools/assetdiet.md) + [**`agent-desktop`**](../reviews/developer-tools/agent-desktop.md) | "AI-slop" dizayndan qochish, mobil vebni native sezdirish (`dvh`, `safe-area`, `16px`), Expo'da `60/120fps` UI-thread animatsiya yozish, rasm/videolarni lokal siqish va Chrome'ni kursorni qimirlatmasdan fonda tekshirish. |
| **4** | [**Yangi Skill Sanitarizatsiyasi, Pentest va Xatolar Monitoringi**](04-skill-and-security-hygiene.md) | [**`tasted-skills`**](../skills/tasted-skills/SKILL.md) + [**`skillshare`**](../reviews/developer-tools/skillshare.md) + [**`Shannon` (`hacker-test`)**](../reviews/backend/shannon.md) + [**`sentry`**](../reviews/backend/sentry.md) | Begona skill/pluginlarni o'rnatishdan oldin xavfli hook va telemetriyadan tozalash (`skillshare audit`), lokal/staging API'larni avtonom White-Box pentestdan o'tkazish va production xatolarni `sentry` trace'lari bilan tutish. |

---

## 💡 Asosiy tamoyil: Nega vositalarni bunday zanjirda ishlatamiz?

1. **Doimiy kontekst (`MCP`) shishishidan qochish:** Og'ir MCP serverlarni (`~7,500+` token) doimiy ulab qo'yish o'rniga, `0 token` oladigan CLI vositalar (`agent-device`, `agent-desktop`, `simslim`, `avdslim`) va yengil on-demand skillar (`asset-diet`, `hacker-test`) ishlatiladi.
2. **Kompyuter resurslarini (`RAM`, `GPU`, `SSD`) tejash:** `simslim` + `avdslim` + oynasiz (`headless`) rejim tufayli bir vaqtda Web + iOS + Android testlari yurgizilganda ham Mac qotmaydi va ekraningizdagi oynalar fokusni o'g'irlamaydi.
3. **Alohida pullik API kalit talab qilmaslik:** Ichida yashirin pullik LLM chaqiradigan qatlamlar (`ARTEMIS`, `Caveman Auto`) o'rniga, mavjud coding agentning o'zi tez va bepul CLI daraxtlar (`@e1` ref) bilan ishlaydi.
