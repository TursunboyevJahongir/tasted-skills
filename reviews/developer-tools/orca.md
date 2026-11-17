# `Orca` (`stablyai/orca`) + Multi-Agent Orchestration

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/developer-tools/orca.md) | [🇷🇺 Русский](../ru/developer-tools/orca.md)

- **Manba:** [stablyai/orca](https://github.com/stablyai/orca) · [orca.dev](https://orca.dev)
- **Turkum:** `Developer Tools` *(Multi-Agent Orkestratsiya, Mobil Boshqaruv va Cross-AI Code Review)*
- **Turi:** `Desktop App + CLI (orca orchestration) + Mobile App (iOS / Android)`
- **Sifat bahosi:** **9.5 / 10**
- **Ishda kerak bo'lishi:** **9.5 / 10**
- **Tavsiya etilgan ko'lam:** `Standalone Desktop App (/Applications/Orca.app) + Global orchestration Skill`
- **Ishlatilayotgan sana:** `2026-11-16` dan
- **Joriy holati:** `✅ Ishlatyapman` *(T3 Code o'rniga asosiy multi-agent ish muhiti sifatida o'tdik)*

---

## 1. Nima va qanday ishlaydi?

> [!IMPORTANT]
> **Oddiy tilda (Asosiy vazifasi va foydasi):** Asosiy ko'p-agentli ish muhitimiz: bitta promptda *"Codex yozsin, Claude rejasini tekshirsin, Argon natijani test qilsin"* deyilsa, asosiy agentning o'zi boshqa AI'larni Chat UI ichida jonli kartalar bilan ishga tushirib, xulosani bitta joyga yig'adi. Kompyuter blokda (`Lock Screen`) tursa ham uxlamaydi (`caffeinate`) va telefondagi **`Orca IDE`** ilovasidan uzilmay ishlaydi (`841 MB` RAM).

**Orca (`stablyai/orca`)** — `Codex`, `Claude Code`, `Antigravity (Gemini / Argon)` va boshqa 25+ CLI coding agentlarni bitta oynada (Chat UI yoki Terminal rejimida), alohida Git worktree'larda hamda telefon orqali boshqaradigan open-source (`MIT`) orkestrator.

**Bizda qanday ishlaydi (2 ta muhim mexanizm):**
1. **Bitta promptdan bir nechta AI'ni zanjir qilib ishlatish (`orca orchestration worker-start`):**
   - Asosiy agentga (masalan, `Codex` `GPT-6.1-Sol High`) bitta prompt berilganda, u o'zi `orca orchestration worker-start --worktree current --agent claude` va `--agent antigravity` orqali yordamchi subagentlarni parallel yoki ketma-ket ishga tushiradi va o'z navbatini tugatadi (`0` polling).
   - Har bir chaqirilgan subagent Chat UI ichida alohida kliklanadigan karta (`Started worker ↗`, `Update from worker ↗`) bo'lib ko'rinadi; subagent ishini tugatib `worker_done` qilganda (yoki limitga tushib `escalation` berganda) `Orca` avtomatik ravishda asosiy agentni uyg'otadi va natijalarni bitta suhbatga yig'ib beradi.
   - Bundan tashqari, global `task-context`, `claude-opus`, `antigravity-claude` va `argon` CLI skilllarimiz ham `Orca` ichida to'liq ishlaydi.
2. **Telefon ilovasi (`Orca IDE`) va kompyuter blokda (`Lock Screen`) ishlashi:**
   - Rasmiy iOS ([App Store](https://apps.apple.com/us/app/orca-ide/id6766130217)) va Android ([Google Play](https://play.google.com/store/apps/details?id=dev.orca.app)) ilovasi QR-kod yoki pairing kodi orqali ulanadi (`LAN / Tailscale` yoki `E2EE Orca Relay` + `APNs`/`FCM` Push xabarnomalari).
   - Ichki `Keep computer awake: On` rejimi (`/usr/bin/caffeinate -i -s -w <pid>`) tufayli kompyuter ekran blokda (`Lock Screen`) turganda ham sessiyalar uxlamaydi va telefon aloqasi uzilib qolmaydi.

---

## 2. Qanchalik yaxshi va qanchalik yomon? (`T3 Code` bilan jonli solishtirish)

| Mezon | **`Orca` (`stablyai/orca` v1.4.261)** | [**T3 Code**](t3-code.md) *(olib tashlandi)* |
|---|---|---|
| **Bitta promptdan boshqa AI'larni chaqirish** | ✅ **Ichki `orca orchestration` DAG:** Chat UI ichida jonli subagent kartalari (`Claude`, `Codex`, `Antigravity`), avtomatik uyg'otish (`worker_done`) va xato/limitni (`escalation`) ushlash | ⚠️ Faqat tashqi CLI subagent skriptlari orqali (UI'da ichki subagent kartalari yo'q) |
| **Telefon ilovasi barqarorligi** | ✅ Rasmiy App Store / Play Store ilovasi (`LAN` + `E2EE Relay` + Push notifications) | ❌ Beta — ekran o'chganda yoki tarmoq almashganda tez-tez uzilib qoladi |
| **Kompyuter blokda (`Lock Screen`) ishlashi** | ✅ Ichki `caffeinate -i -s` (`Keep computer awake: On · Active`) + alohida fon terminal daemoni | ❌ Bloklanganda ulanish uziladi |
| **Kvota va limitlarni jonli ko'rsatish** | ✅ Pastki status barda `✴️ Claude`, `🌀 Codex` va `⛰️ Antigravity (Gemini)` foizlarini jonli ko'rsatadi | ⚠️ Qo'lda tekshirish kerak |
| **Resurs sarfi (`12 repo + 3 agent`)** | ✅ **`841 MB` RAM**, tinch holatda **`0.2%` CPU** | `~1.1–1.4 GB` RAM + `~3.87 GB` disk kesh (`~/.t3`) |

### Zaif tomonlari va ehtiyot choralari
- Sukut bo'yicha `PostHog` telemetriyasi yoqilgan holda keladi (`Settings -> Privacy & Telemetry` dan o'chirish shart).
- Bir nechta AI subagent parallel ishlatilganda har bir provayderning o'z obuna kvotasi sarflanadi.

---

## 3. Xavfsizlik va Sanitarizatsiya (O'rnatishda qilingan sozlamalar)

- **Xavf darajasi:** `Past` *(MIT open-source, lokal ishlaydi, `skillshare audit` dan `0` ogohlantirish bilan o'tdi)*
- **Qo'llanilgan majburiy sozlamalar:**
  1. **Telemetriyani o'chirish (`telemetry.optedIn = false`):** O'rnatiboq `PostHog` analitikasi bazadan o'chirildi.
  2. **Blok rejimda uxlamaslik (`computerAwakeMode = "on"`):** `Keep computer awake: On` yoqilib, `/usr/bin/caffeinate -i -s -w <pid>` faol ekani tekshirildi.
  3. **Koordinator ruxsatlari (`orchestrationCoordinatorApprovalsEnabled = true`):** `Settings -> Orchestration` ichida *"Let coordinators approve worker permission prompts"* yoqildi (subagentlar ruxsat so'rab osilib qolmasligi uchun).
  4. **`orchestration` skillini chegaralash (`LOCAL-COMPATIBILITY`):** Global `orchestration` skilli faqat `Orca` ichida (`ORCA_PANE_KEY` / `ORCA_WORKTREE_ID` mavjud bo'lganda) yoki foydalanuvchi `Orca` worker so'raganda ishlaydigan qilindi; `orca-cli` skilli esa `agent-desktop` bilan auto-trigger to'qnashuvi chiqarmasligi uchun global o'rnatilmadi.

---

## 4. Bizga qanchalik kerak va mavjud vositalar bilan mosligi

- `Codex`, `Claude Code` va `Antigravity` status hooklari (`orca agent hooks on`) hamda `orchestration` skilli mavjud `task-context`, `grill-me`, `ponytail`, `agent-desktop` va `agent-device` oqimimiz bilan 100% mos ishlaydi.
- Oldin ishlatilgan [**T3 Code**](t3-code.md) to'liq o'chirilib (`~3.87 GB` disk joyi bo'shatildi), barcha 12 ta asosiy repozitoriy `Orca` ga ko'chirildi.

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** Kundalik barcha kod yozish va arxitektura ishlarida, bitta prompt orqali bir nechta AI'ni (*"Codex yozsin -> Claude/Argon tekshirsin"*) zanjir qilib ishlatishda hamda kompyuter oldida bo'lmaganda telefondan (`Orca IDE`) jarayonni boshqarishda.
- **Qachon ishlatmaslik kerak:** Oddiy 1 qatorli savol-javobda subagent (`worker-start`) ochish shart emas — bitta asosiy chatning o'zi yetarli.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-16 | `stablyai/orca` (`v1.4.261`) o'rnatish, `PostHog` ni o'chirish, `caffeinate` + `Mobile` + `Codex/Claude/Antigravity` ni ulash va jonli multi-agent test (`run_33e8e230b9fe`) | `✅ Ishlatyapman` | `T3 Code` to'liq o'chirildi va uning o'rniga `Orca` asosiy multi-agent orchestrator sifatida qoldi. |

