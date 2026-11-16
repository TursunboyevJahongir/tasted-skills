# `ARTEMIS` (`google/artemis`)

**🇺🇿 O'zbekcha** | [🇬🇧 English](../en/mobile/artemis.md) | [🇷🇺 Русский](../ru/mobile/artemis.md)

- **Manba:** [google/artemis](https://github.com/google/artemis)
- **Turkum:** `Mobile` *(Avtonom Android UI testlash freymvorki, CLI/SDK va MCP server)*
- **Turi:** `Standalone Python CLI / SDK + MCP Server`
- **Sifat bahosi:** **8.5 / 10**
- **Bizga kerakliligi:** **2.5 / 10** *(faqat Android uchun, sekin va alohida pullik LLM API kalit talab qiladi)*
- **Tavsiya etilgan ko'lam:** `Faqat alohida CLI/SDK (uv run artemis)` — global MCP qilib o'rnatilmasin
- **O'rniga ishlatiladigan tizim (Alternativa):** [**`agent-device`**](agent-device.md) *(`$0` qo'shimcha API xarajati, `iOS + Android + tvOS + Android TV`, `197–888 ms` tezlik)* + [**`adb`**](adb.md)
- **Tekshirilgan sana:** `2026-11-16`
- **Joriy holati:** `👍 Yaxshi variant`

---

## 1. Nima va qanday ishlaydi?

Google tomonidan ochiq manbaga chiqarilgan (`Apache-2.0`, Python `3.12+`) tabiiy tildagi topshiriqlarni Android telefon yoki emulyatorda avtonom bajaruvchi multi-agent tizim (`AndroidWorld` benchmarkida `99%+` natija ko'rsatgan).

Ichida 2 xil ishlash profili va 4 xil interfeys (`Web UI localhost:8000`, `CLI`, `MCP Server`, `Python SDK`) bor:
- **`Flash` profili (`~3–5 s / qadam`):** Bitta model ekranni kuzatib bosqichma-bosqich harakat qiladigan tezkor sikl.
- **`Pro` profili (`~15–40 s / qadam`):** `LangGraph` ustiga qurilgan `Planner -> Operator -> Explorer -> Checker` zanjiri, oldindan tekshiruv (`Safety Net`: XML + piksel/OCR) va yakuniy hisobot bilan 100+ qadamli murakkab testlarni bajaradi.

---

## 2. Qanchalik yaxshi va qanchalik yomon?

### Kuchli tomonlari
- **Accessibility daraxtisiz ekranlarni ham ko'ra oladi:** Oddiy UI daraxti (`Accessibility Helper` / `UIAutomator2`) ishlamaydigan custom `Canvas`, Flutter yoki o'yin interfeyslarida **OCR va multimodal ko'rish (`Pixel Vision`)** orqali elementlarni topa oladi.
- **Mustaqil uzoq muddatli QA / `pytest` integratsiyasi:** Dasturchi ishtirokisiz tungi regressiya yoki ko'p ilovali (`Google Maps -> Chrome -> Ilova`) uzun Android test stsenariylarini `ArtemisClient` Python SDK orqali CI'ga ulash qulay.

### Zaif tomonlari va yashirin xarajati (Pullik API / tezlik / platforma)
- **💸 Ishlatish PULLIK ("Bepul open-source" reklamasi chalg'ituvchi):**
  - Video va reklamalarda *"Free & open-source"* deyilsa ham, faqat `Apache-2.0` kodi bepul — **tizimni ishlatish alohida pullik API kalit talab qiladi**.
  - Mavjud `Claude Pro/Max`, `ChatGPT` yoki `Antigravity` obunasi bilan o'z-o'zidan ishlamaydi: `.env` fayliga **alohida per-token hisoblanadigan pullik API kalit** (`GEMINI_API_KEY`, `OPENAI_API_KEY`, `ANTHROPIC_API_KEY`, `OPEN_ROUTER_API_KEY` yoki `XAI_API_KEY`, kengaytirilgan OCR uchun esa pullik Google Cloud Vision `OCR_API_KEY`) ulash shart.
  - Har bir qadamda telefon ekranidan skrinshot (qimmat multimodal tasvir tokenlari) va UI daraxtini olib, ichki agentlar (`Planner`, `Operator`, `Explorer`, `Checker`, `Video Analyzer`) orqali tashqi LLM API'ga o'nlab pullik so'rov yuboradi — uzun `Pro` testlar API balansini tez yeydi.
- **Faqat Android (`iOS` va `tvOS` yo'q):** `README.md` roadmap'ida `iOS Platform Expansion` hali bajarilmagan `[ ]` reja holatida turibdi — iPhone, iPad va Apple TV ilovalarini test qila olmaydi.
- **Kundalik kodlash uchun `4x–45x` sekin:** Har bitta bosish `Flash` da `3 000–5 000 ms`, `Pro` da `15 000–40 000 ms` oladi ([`agent-device`](agent-device.md) da Android **`888 ms`**, iOS **`197 ms`**).
- **Kontekst va muhit og'irligi:** MCP sifatida ulansa `5` ta eager tool (`mobile_run_task` va b.) + tavsiya etilgan `mcp_server/rules.md` (`13.6 KB` / `~3 400 token`) kontekstni band qiladi; `LangGraph + LangChain + OpenCV + FastAPI` to'plami esa `~1 GB+` Python `.venv` hosil qiladi.

---

## 3. Xavfsizlik va O'rnatishdan oldin tozalash (Sanitarizatsiya)

- **Xavf darajasi:** `O'rta` *(pullik API xarajati, `posthog` bog'liqligi va qurilmaga avto-APK o'rnatish sabab)*
- **Tekshirilgan nuqtalar (`pyproject.toml`, `.env.example`, `mcp_server/`):**
  - `pyproject.toml:66` qatorida `posthog>=3.5.0` telemetriya paketi mavjud.
  - Default `.env` sozlamasida birinchi vazifadayoq ulangan telefonga avtomatik `Artemis Accessibility Helper` APK o'rnatadi (`ARTEMIS_HELPER_AUTO_INSTALL=true`) va telefon ekranini doimiy yoqiq ushlab turadi (`ARTEMIS_KEEP_DEVICE_AWAKE=true`).
  - `uv run artemis mcp --install all` buyrug'i barcha AI IDE'lar (`Antigravity`, `Claude Code`, `Codex`, `Cursor`) global sozlamalariga MCP server va `rules.md` yozib chiqadi.
- **Agar alohida Android loyihada ishlatilsa majburiy qoidalar:**
  1. `artemis mcp --install all` ni **ishlatmaslik** — global MCP va global `rules.md` ulamasdan, faqat kerak paytda CLI (`uv run artemis run ...`) yoki `pytest` SDK orqali yurgizish.
  2. `.env` ga ulangan pullik API kalitga qat'iy oylik/kunlik to'lov limiti (`spending cap`) qo'yish (`--profile flash` ni asosiy rejimda qoldirish).
  3. Shaxsiy yoki umumiy test telefonida `.env` ichiga `ARTEMIS_HELPER_AUTO_INSTALL=false` va `ARTEMIS_KEEP_DEVICE_AWAKE=false` yozish.

---

## 4. Bizga qanchalik kerak va mavjud vositalar bilan mosligi (Alternativa)

- **Kundalik ishda to'liq va bepul alternativamiz — [**`agent-device`**](agent-device.md) (`9.5/10`, `#8` faol global vosita):**
  - **Narx:** `agent-device` **`$0` qo'shimcha API kalit** so'raydi — o'zingiz ishlatib turgan AI coding agent `@e1` reflarni `~100 token` ichida to'g'ridan-to'g'ri o'qiydi va bosadi.
  - **Qamrov va tezlik:** Ham `iOS`, ham `Android`, ham `tvOS` / `Android TV` da oynasiz fonda `197–888 ms` da ishlaydi (`0` MCP shishishi, `0` telemetriya).

---

## 5. Qaysi yo'nalish va vazifalarda foydali?

- **Qachon ishlatish kerak:** Faqat accessibility daraxti bo'lmagan murakkab Android `Canvas` / o'yin ekranlarini vizual (OCR + piksel) tekshirishda yoki CI/CD ichida alohida API byudjeti ajratilgan 100+ qadamli avtonom Android regressiya testlarida.
- **Qachon ishlatmaslik kerak:** Kundalik Web/iOS/Android/TV dasturlashda, iOS/tvOS loyihalarida hamda qo'shimcha per-token API to'lovisiz ishlash talab qilinganda.

---

## 6. Holat va Qilingan ishlar tarixi

| Sana | Amal | Holat | Izoh |
|---|---|---|---|
| 2026-11-16 | Instagram Reel (`DehEdBbgQFZ`) hamda `google/artemis` (`pyproject.toml`, `.env.example`, `mcp_server/`) birlamchi kod auditi | `👍 Yaxshi variant` | Kuchli avtonom Android QA tizimi (`8.5/10`), biroq ishlashi uchun **alohida pullik LLM API kalit** talab qilishi, iOS yo'qligi va sekinligi (`3–40s`) sabab o'rnatilmadi; kundalik asosiy vositamiz — bepul va tezkor [**`agent-device`**](agent-device.md). |
