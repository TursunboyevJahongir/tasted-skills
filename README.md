# Sinab ko'rilgan va ishlatilayotgan AI Skill hamda Tool'lar

**🇺🇿 O'zbekcha** | [🇬🇧 English](README.en.md) | [🇷🇺 Русский](README.ru.md)

<details>
<summary>Holat belgilari</summary>

- `✅ Faol` — doimiy ishlatilyapti
- `👍 Yaxshi variant` — tekshirilgan, kerakli vaziyatda ishlatishga arziydi
- `⛔ Rad etildi` — bizga kerak emas, ziddiyatli yoki xavfli

</details>

> [!TIP]
> **🛡️ Xavfsizlik qoidamiz (sizga ham tavsiya):** Hech qachon begona skill, plugin yoki MCP serverni faqat `README` yoki yulduzlariga qarab o'rnatmang. Biz har bitta nomzodni o'rnatishdan oldin **o'zimizning AI coding agentga birlamchi kodini (`SKILL.md`, skriptlar, hooklar, tarmoq/env murojaatlari) o'qitib tekshirtiramiz** hamda [**`skillshare`**](reviews/developer-tools/skillshare.md) ichidagi tayyor skill-check (`skillshare audit`) dan o'tkazamiz. Sizga ham har qanday yangi skillni o'rnatishdan avval AI agentingizga tekshirtirib olishni tavsiya qilamiz.

📖 [Qaysi skill va tool'larni bir-biri bilan birga qanday ishlatish, qo'shimcha imkoniyatlari va **⚖️ Barcha Skill/Tool'lar Solishtiruvi** →](practices/README.md)

## ⭐ Eng keraklilari (Ishlatilish ustuvorligi bo'yicha)

<h4><a href="reviews/architecture/grill-me.md">grill-me</a></h4>

<p>Reja, Qarorlar va Chuqur Debug</p>

<p>Baho: 9.5/10 · ✅ Faol · Skilllar to'plami<br>Sana: 2026-05-23 dan</p>

<details>
<summary>Batafsil</summary>

<p>Kod yozishdan oldin qarorlar daraxti (<code>grilling</code> + <code>grill-with-docs</code> + <code>domain-modeling</code>) bo'ylab talabni pishitadi + <code>mattpocock/skills</code> dan on-demand <strong><code>diagnosing-bugs</code></strong> va <strong><code>improve-codebase-architecture</code></strong>.</p>

</details>

<hr>

<h4><a href="reviews/architecture/graphify.md">graphify</a></h4>

<p>Kod bazasi xaritasi (Knowledge Graph)</p>

<p>Baho: 9.5/10 · ✅ Faol · Skill + Python CLI<br>Sana: 2026-07-28 dan</p>

<details>
<summary>Batafsil</summary>

<p>Kod (lokal AST, <code>0</code> token) va hujjatlardan doimiy bilim grafigi (<code>graph.json</code> + HTML) qurib, katta repoda modullar va fayllar aloqasini soniyada topib beradi.</p>

</details>

<hr>

<h4><a href="reviews/architecture/ponytail.md">ponytail</a></h4>

<p>Minimal va toza kod (YAGNI)</p>

<p>Baho: 9.5/10 · ✅ Faol · Skill<br>Sana: 2026-11-15 dan</p>

<details>
<summary>Batafsil</summary>

<p>Har bir kod yozishda asosiy qoida: vazifani to'liq hal qiladigan eng kichik o'zgarish, ortiqcha abstraksiyasiz kod va bir o'qishda tushunarli qisqa javob.</p>

</details>

<hr>

<h4><a href="reviews/architecture/karpathy-guidelines.md">karpathy-guidelines</a></h4>

<p>Jarrohlik aniqligida tahrir (Surgical)</p>

<p>Baho: 9.5/10 · ✅ Faol · Skill<br>Sana: 2026-11-15 dan</p>

<details>
<summary>Batafsil</summary>

<p>Taxminlarni oldindan ochiq aytish, soddalik va mavjud kodning qo'shni qismlariga tegmasdan faqat kerakli joyni aniq o'zgartirish.</p>

</details>

<hr>

<h4><a href="reviews/ui-ux/impeccable.md">impeccable</a></h4>

<p>Asosiy UI/UX dizayn va audit</p>

<p>Baho: 9.5/10 · ✅ Faol · Skill<br>Sana: 2026-11-09 dan</p>

<details>
<summary>Batafsil</summary>

<p>Web, mobil veb va native iOS/Android ekranlarni loyihalash, UX/kontrast/tipografiya auditi va tozalash (<code>polish</code>, <code>clarify</code>, <code>harden</code>). <strong>💡 Tavsiya:</strong> rangli aksent tugmalarda <code>WCAG 2</code> (<code>4.5:1</code>) toza oq yozuvni nohaq yiqitmasligi uchun ichiga <strong><code>APCA</code> (<code>|Lc| ≥ 60</code>) perceptual kontrast</strong> qoidasini qo'shib ketgan yaxshi (<a href="reviews/ui-ux/impeccable.md#apca-contrast">nimalar o'zgartirilgani</a>).</p>

</details>

<hr>

<h4><a href="reviews/architecture/elephant-goldfish-model.md">elephant-goldfish-model</a></h4>

<p>Mustaqil Arxitektura va Kod Review</p>

<p>Baho: 9.5/10 · ✅ Faol · Plugin (7 skill + 10 agent)<br>Sana: 2026-11-15 dan</p>

<details>
<summary>Batafsil</summary>

<p>Xotirali me'mor (<em>Elephant</em>) + xotirasiz tanqidchi subagentlar (<em>Goldfish</em>): <code>egm-drift-report</code> va 5 bosqichli <code>egm-review</code> yashirin xatolarni va hujjat-kod uzilishlarini topadi.</p>

</details>

<hr>

<h4><a href="reviews/developer-tools/agent-desktop.md">agent-desktop</a></h4>

<p>Web (Chrome) va Desktop UI test</p>

<p>Baho: 9.5/10 · ✅ Faol · CLI + Skill<br>Sana: 2026-11-15 dan</p>

<details>
<summary>Batafsil</summary>

<p><a href="https://agent-browser.dev/desktop">agent-browser.dev/desktop</a> — macOS Accessibility (<code>AX</code>) orqali Chrome va desktop dasturlarni kursorni qimirlatmasdan fonda boshqaradi (<code>iOS Device Hub</code> uchun ham fallback).</p>

</details>

<hr>

<h4><a href="reviews/mobile/agent-device.md">agent-device</a></h4>

<p>Mobil va TV (iOS / Android / tvOS) UI test</p>

<p>Baho: 9.5/10 · ✅ Faol · CLI + Skill<br>Sana: 2026-11-16 dan</p>

<details>
<summary>Batafsil</summary>

<p><a href="https://agent-device.dev">agent-device.dev</a> — Callstack'ning 0-dependency CLI'i: oynasiz fonda iOS/tvOS Simulator (<code>~197ms</code>) va <code>-no-window</code> Android/TV Emulator (<code>~888ms</code>, 27x kam token, UTF-8 input) UI'ini <code>@ref</code> va <code>--settle</code> diff bilan boshqaradi (<code>0</code> MCP shishishi).</p>

</details>

<hr>

<h4><a href="reviews/mobile/cross-platform-qa.md">cross-platform-qa</a></h4>

<p>2-bosqichli Web / Mobil / TV QA</p>

<p>Baho: 9.5/10 · ✅ Faol · Skill<br>Sana: 2026-11-15 dan</p>

<details>
<summary>Batafsil</summary>

<p>1-bosqichda lokal kompyuterda (<code>agent-desktop</code> Web + <code>agent-device</code> headless iOS/Android/TV + <code>adb</code>) tekshirish, 2-bosqichda "Done" oldidan real qurilmada yakuniy sinash.</p>

</details>

<hr>

<h4><a href="reviews/backend/sentry.md">sentry</a></h4>

<p>Full-Stack Xatolar va Trace tahlili</p>

<p>Baho: 9.5/10 · ✅ Faol · Self-Hosted + Skill / MCP<br>Sana: 2026-07-08 dan</p>

<details>
<summary>Batafsil</summary>

<p>Backend, Web va Mobil xatolar (<code>Issue Grouping</code>, <code>dSYM</code>/<code>ProGuard</code>, <code>Source Maps</code>), <code>Breadcrumbs</code>, <code>Session Replay</code> va <code>v8+</code> OTel-trace'larni AI orqali tahlil qilish.</p>

</details>

<hr>

<h4><a href="reviews/developer-tools/skillshare.md">skillshare</a></h4>

<p>Skill sinxronlash va Xavfsizlik (audit)</p>

<p>Baho: 9.5/10 · ✅ Faol · CLI + Skill<br>Sana: 2026-05-30 dan</p>

<details>
<summary>Batafsil</summary>

<p>Barcha AI agentlar (<code>Codex</code>, <code>Claude</code>, <code>Antigravity</code>) o'rtasida skill/pluginlarni bitta manbadan sinxronlash va o'rnatilgan <strong>skill-check (<code>skillshare audit</code>)</strong> orqali tekshirish.</p>

</details>

<hr>

<h4><a href="reviews/mobile/animate-expo.md">animate-expo</a></h4>

<p>Expo / React Native 60/120fps animatsiya</p>

<p>Baho: 9.5/10 · ✅ Faol · Skill<br>Sana: 2026-11-09 dan</p>

<details>
<summary>Batafsil</summary>

<p>Expo va React Native ilovalarda <code>Reanimated</code>, <code>Gesture Handler</code>, <code>expo-haptics</code> orqali UI oqimida qotmaydigan animatsiya va jestlar (<code>LOCAL-COMPATIBILITY.md</code> himoyasi bilan).</p>

</details>

<hr>

<h4><a href="reviews/developer-tools/t3-code.md">T3 Code + CLI Subagent</a></h4>

<p>Multi-Agent kod va review</p>

<p>Baho: 9.0/10 · ✅ Faol · Desktop App + CLI + Skill<br>Sana: 2026-10-23 dan</p>

<details>
<summary>Batafsil</summary>

<p>Bir nechta AI'ni birga ishlatish: <code>task-context</code> + CLI subagentlar (<code>argon</code>, <code>antigravity-claude</code>, <code>claude-opus</code>, <code>antigravity-consult</code>) hamda Orca muhitida <strong><code>orchestration</code></strong> (<code>worker-start</code> DAG) orqali mustaqil kod yozish va review.</p>

</details>

<hr>

<h4><a href="reviews/mobile/adb.md">adb</a></h4>

<p>Android port (reverse) va logcat</p>

<p>Baho: 9.0/10 · ✅ Faol · CLI<br>Sana: 2026-09-07 dan</p>

<details>
<summary>Batafsil</summary>

<p>Android emulyator (<code>-no-window</code>) va real telefonlarda port ulash (<code>reverse</code>), <code>logcat</code>, APK o'rnatish va past darajadagi boshqaruv (<code>-s &lt;serial&gt;</code> majburiy).</p>

</details>

<hr>

<h4><a href="reviews/mobile/ios-simulator-device-hub.md">xcrun simctl + Device Hub</a></h4>

<p>iOS headless boot va devicectl</p>

<p>Baho: 9.0/10 · ✅ Faol · Xcode CLI + App<br>Sana: 2026-10-20 dan</p>

<details>
<summary>Batafsil</summary>

<p>iOS Simulator'ni oynasiz fonda yoqish/yopish (<code>simctl boot/shutdown</code>), real iPhone'ga build o'rnatish (<code>devicectl</code>) hamda <code>Device Hub</code> zaxirasi (<code>fallback</code>).</p>

</details>

<hr>

<h4><a href="reviews/mobile/simslim.md">simslim</a></h4>

<p>iOS / tvOS Simulator RAM va Disk optimizatori</p>

<p>Baho: 9.0/10 · ✅ Faol · Standalone Go CLI<br>Sana: 2026-11-16 dan</p>

<details>
<summary>Batafsil</summary>

<p><code>iOS</code>/<code>tvOS</code> Simulator ichidagi <code>~149–180</code> ta keraksiz fon servisini (<code>Siri</code>, <code>Apple Intelligence</code>, <code>Wallpaper</code>) o'chiradi: jonli oynasiz bootda <code>182 -&gt; 78</code> jarayon va <strong><code>2.70 GB -&gt; 1.16 GB</code> RAM (<code>-57%</code>)</strong>, GUI da <code>4.0 GB -&gt; 0.9 GB</code> (<code>-77.5%</code>), ustiga ilovalarga tegmay <code>1.5 GB+</code> kesh/log tozalaydi (<code>--except web,photos,search --keep com.apple.apsd</code> bilan <code>agent-device</code> va <code>push</code> 100% ishlaydi).</p>

</details>

<hr>

<h4><a href="reviews/mobile/avdslim.md">avdslim</a></h4>

<p>Android AVD RAM va Metal GPU optimizatori</p>

<p>Baho: 9.0/10 · ✅ Faol · Standalone Go CLI<br>Sana: 2026-11-16 dan</p>

<details>
<summary>Batafsil</summary>

<p>Android Emulator (<code>AVD</code>) RAM va GPU optimizatori: CPU <code>SwiftShader</code> ni native <strong>Apple Metal GPU (<code>host</code>)</strong> ga o'tkazib, <code>-lowram</code> (<code>1536 MB</code>) va Golden Snapshot bilan xotirani <strong><code>4.41 GB -&gt; 2.64 GB</code> (<code>-40.2%</code>, Studio 8.5 GB AVD'dan <code>-69%</code>)</strong> ga tushiradi (<code>defaults</code> da <code>--skip=location --keep=com.google.android.apps.maps</code> bilan GPS va <code>agent-device</code> 100% ishlaydi).</p>

</details>

<hr>

<h4><a href="reviews/backend/security-audit-skill.md">security-audit</a></h4>

<p>6-bosqichli Manba Kodi Xavfsizlik Auditi</p>

<p>Baho: 9.0/10 · ✅ Faol · Skill<br>Sana: 2026-11-16 dan</p>

<details>
<summary>Batafsil</summary>

<p>Cloudflare'ning 6 bosqichli <em>adversarial</em> manba kodi xavfsizligi auditi (<code>Hunter</code> + mustaqil <code>Verifier</code> subagentlar + 0-dep Node JSON tekshirgich): Docker ko'tarmasdan Backend, Web, <strong>Mobil (<code>deep-link</code>/<code>WebView</code>/<code>IPC</code>)</strong>, CLI va CI/CD zaifliklarini topadi (<code>quick</code>/<code>scoped</code> profil himoyasi bilan).</p>

</details>

<hr>

<h4><a href="reviews/mobile/mobile-native.md">mobile-native</a> + web-to-native-mobile</h4>

<p>Mobil Web / PWA va Web->App ko'chirish</p>

<p>Baho: 8.5/10 · ✅ Faol · Skilllar to'plami<br>Sana: 2026-11-15 dan</p>

<details>
<summary>Batafsil</summary>

<p>Mobil veb va PWA'ni native sezdiradigan 11 ta CSS/meta yechim (<code>dvh/svh</code>, <code>safe-area</code>, <code>16px</code> input, <code>overscroll-behavior</code>, hover gating) + veb funksiyani native ilovaga ko'chirish qarorlari (<code>web-to-native-mobile</code>) va UI xabarlari tinish belgilari qoidasi (<code>ui-message-punctuation</code>).</p>

</details>

<hr>

<h4><a href="reviews/developer-tools/assetdiet.md">AssetDiet</a></h4>

<p>Lokal Rasm / SVG / Video / 3D siqish</p>

<p>Baho: 7.5/10 · ✅ Faol · CLI + <a href="skills/asset-diet/SKILL.md">asset-diet</a><br>Sana: 2026-11-16 dan</p>

<details>
<summary>Batafsil</summary>

<p>100% lokal rasm/SVG/video/3D siqish (<code>Sharp</code>, <code>SVGO</code>, <code>FFmpeg</code>) + rollback. Doimiy 16-tool MCP o'rniga ushbu repodagi yengil <a href="skills/asset-diet/SKILL.md"><code>asset-diet</code></a> skilli orqali faqat kerak paytda <code>npx assetdiet-mcp@0.1.4</code> CLI chaqiriladi.</p>

</details>

<hr>

<h4><a href="practices/06-video-figma-and-db-workflows.md">watch + video-analyzer</a></h4>

<p>Video, Reel va QA Bug-Video tahlili</p>

<p>Baho: 9.0/10 · ✅ Faol · Skill + CLI (yt-dlp + ffmpeg)<br>Sana: 2026-10-25 dan</p>

<details>
<summary>Batafsil</summary>

<p>YouTube, Instagram Reels, Loom va mijoz yuborgan bug-videolarni <code>Whisper</code> transkripsiya hamda <code>scene-change</code> (yoki <code>5fps</code>) kadrlar bilan kadr-ba-kadr tahlil qilish.</p>

</details>

<hr>

<h4><a href="practices/06-video-figma-and-db-workflows.md">figma skilllar to'plami</a></h4>

<p>Ikki tomonlama Figma &lt;-&gt; Kod ko'prigi</p>

<p>Baho: 9.0/10 · ✅ Faol · 6 ta Skill + MCP<br>Sana: 2026-10-20 dan</p>

<details>
<summary>Batafsil</summary>

<p>Figma maketdan 1:1 kod yozish (<code>figma-implement-design</code>) hamda <strong>tayyor yozilgan koddan Figma'ga ekran va Design System chizish</strong> (<code>figma-generate-design</code>, <code>figma-generate-library</code>, <code>figma-use</code>).</p>

</details>

<hr>

<h4><a href="practices/03-web-and-mobile-ui-polish.md">client-performance-gate</a></h4>

<p>Web / Mobile Web / WebOS tezlik va recovery</p>

<p>Baho: 9.0/10 · ✅ Faol · Skill<br>Sana: 2026-11-10 dan</p>

<details>
<summary>Batafsil</summary>

<p>Mijoz Web, Mobile Web va WebOS TV ilovalarida <code>1x/6x CPU × fast/constrained/offline</code> 4-profil matritsasi, <code>≤200ms</code> javob va internet/CPU qaytishi bilan sahifani yangilamasdan avto-tiklanish (<code>recovery</code>) tekshiruvi <em>(Admin panellarga qo'llanmaydi)</em>.</p>

</details>

<hr>

<h4><a href="practices/06-video-figma-and-db-workflows.md">drizzle-relations-v2</a></h4>

<p>Drizzle ORM v2 sxema va relyatsiya</p>

<p>Baho: 8.5/10 · ✅ Faol · Skill<br>Sana: 2026-11-05 dan</p>

<details>
<summary>Batafsil</summary>

<p>Backendda Drizzle ORM yozishda eski <code>v1 relations()</code> xatolarini oldini olib, to'g'ri <code>v2 defineRelations</code> va obyekt-asosli <code>where</code> filterlarini qo'llaydi.</p>

</details>

<hr>

## Yo'nalishlar bo'yicha

### 🧠 Lokal modellar

<h4><a href="reviews/local-models/kimi-k3-in-c.md">kimi-k3-in-c</a></h4>

<p>Yo&#x27;nalishi: 2.78T (~104B aktiv) Kimi K3 MoE modelini GPU&#x27;siz C99 da NVMe diskdan stream qilib o&#x27;qish eksperimenti.</p>

<p>Sifat: 8.5/10 · Keraklilik: 1.0/10 · ⛔ Rad etildi · C99 CLI Engine (2.78T MoE)<br>Sana: 2026-11-16</p>

<details>
<summary>Batafsil</summary>

<p><strong>Yo'nalishi:</strong> <code>2.78T</code> (<code>~104B</code> aktiv) <code>Kimi K3</code> MoE modelini GPU'siz C99 da NVMe diskdan stream qilib o'qish eksperimenti. <strong>Kod yozishga ishlaydimi:</strong> Modelning o'zi kuchli coder/reasoning model, <strong>lekin bu disk-stream usulida kod yozishga yaramaydi</strong> (<code>1 token = ~24–33s</code>, <code>500</code> token = <code>~3.5 soat</code> + <code>~50 TB</code> SSD o'qish). <strong>Talab:</strong> Min: <code>GPU: 0, RAM: 8–16 GB, SSD: ≥1.8 TB NVMe</code>; Yaxshi ishlashi uchun: <code>16× H200 (~2.25 TB VRAM)</code>. <strong>Lokal alternativa kerak bo'lsa:</strong> <code>32–64 GB</code> Mac'da RAMga sig'adigan <code>Ollama</code> / <code>MLX</code> (<code>Qwen3-Coder</code>, <code>30–65 tok/s</code>). 📊 <a href="https://github.com/FareedKhan-dev/kimi-k3-in-c">GitHub Benchmark</a> · <a href="https://artificialanalysis.ai/leaderboards/models">Artificial Analysis</a></p>

</details>

<hr>

<h4><a href="reviews/local-models/minimax-m3-1-flash.md">MiniMax-M3.1-Flash <em>(Lokal)</em></a></h4>

<p>Yo&#x27;nalishi: Tezkor multimodal (matn + rasm + video, 1M kontekst) model — suhbat, OCR/rasm/video tahlili va ofis avtomatizatsiyasi (Automation-Bench: 62.8%) uchun mo&#x27;ljallangan.</p>

<p>Sifat: 8.0/10 · Keraklilik: 1.0/10 · ⛔ Rad etildi · Open-Weight 428B MoE (~23B aktiv)<br>Sana: 2026-11-16</p>

<details>
<summary>Batafsil</summary>

<p><strong>Yo'nalishi:</strong> Tezkor multimodal (<code>matn + rasm + video</code>, <code>1M</code> kontekst) model — suhbat, <code>OCR</code>/rasm/video tahlili va ofis avtomatizatsiyasi (<code>Automation-Bench: 62.8%</code>) uchun mo'ljallangan. <strong>Kod yozishga ishlaydimi:</strong> Oddiy skript va UI/avtomatizatsiyaga ishlaydi, lekin murakkab repozitoriy va terminal dasturlashda asosiy coder emas (<code>Terminal-Bench 4.0: 38.1%</code>). <strong>Talab:</strong> Og'irligi <code>~250–285 GB</code> — oddiy kompyuterga sig'maydi (<code>Min: 512 GB Mac Studio</code>, yaxshi ishlashi uchun: <code>8× H100 / 640 GB VRAM</code>). <strong>Alternativa:</strong> Lokalda <code>Ollama</code> / <code>MLX</code> (<code>Qwen3-Coder</code>); aynan shu model kerak bo'lsa — <a href="reviews/external-apis/minimax-m3-1-flash-api.md">🔌 <code>MiniMax M3.1 Flash API</code></a>. 📊 <a href="https://huggingface.co/MiniMaxAI/MiniMax-M3.1-Flash">HuggingFace</a> · <a href="https://openrouter.ai/minimax/minimax-m3.1-flash">OpenRouter Stats</a></p>

</details>

<hr>

### 🔌 Tashqi API'lar

<h4><a href="reviews/external-apis/minimax-m3-1-flash-api.md">MiniMax M3.1 Flash API</a></h4>

<p>Yo&#x27;nalishi: Mahsulot backendidagi ommaviy chatbot, tarjima, OCR/rasm/video tahlili va SaaS avtomatizatsiyasi uchun juda arzon ($0.15 / $0.60, Cached: $0.015) va tez (170+ tok/s, 1M kontekst) multimodal API.</p>

<p>Sifat: 8.0/10 · Keraklilik: 5.0/10 · 👍 Yaxshi variant · Cloud Multimodal API (MiniMax / OpenRouter)<br>Sana: 2026-11-16</p>

<details>
<summary>Batafsil</summary>

<p><strong>Yo'nalishi:</strong> Mahsulot backendidagi ommaviy chatbot, tarjima, <code>OCR</code>/rasm/video tahlili va SaaS avtomatizatsiyasi uchun juda arzon (<code>$0.15 / $0.60</code>, <code>Cached: $0.015</code>) va tez (<code>170+ tok/s</code>, <code>1M</code> kontekst) multimodal API. <strong>Kod yozishga ishlaydimi:</strong> Oddiy skript va yordamchi avtomatizatsiyaga ishlaydi, lekin murakkab loyiha arxitekturasi uchun emas (<code>Terminal-Bench 4.0: 38.1%</code>). <em>(Pullik Zero-Retention API kalit bilan ishlating; <code>:free</code> ga yopiq kod bermang).</em> 📊 <a href="https://openrouter.ai/minimax/minimax-m3.1-flash">OpenRouter Stats</a> · <a href="https://huggingface.co/MiniMaxAI/MiniMax-M3.1-Flash">HuggingFace Benchmarks</a> · <a href="https://artificialanalysis.ai/leaderboards/models">Artificial Analysis</a></p>

</details>

<hr>

### 🌐 Web

<h4><a href="reviews/web/taste-skill.md">taste-skill v2.5</a></h4>

<p>Noldan promo-landing qurishda kuchli; o&#x27;rnatilsa Stop hook (600s) kesib tashlanishi va faqat -p da ishlatilishi shart.</p>

<p>Sifat: 8.0/10 · Keraklilik: 4.0/10 · 👍 Yaxshi variant · Landing Kit + Hook<br>Sana: 2026-11-15</p>

<details>
<summary>Batafsil</summary>

<p>Noldan promo-landing qurishda kuchli; o'rnatilsa <code>Stop</code> hook (600s) kesib tashlanishi va faqat <code>-p</code> da ishlatilishi shart.</p>

</details>

<hr>

<h4><a href="reviews/web/vercel-ui-sdk.md">vercel-labs/ui</a></h4>

<p>Vercel Labs&#x27;ning Public Beta bosqichidagi headless UI kutubxonasi va ui-sdk skilli: &quot;skrinshotsiz 2x tez boshqaruv&quot; (createAgent) faqat @ui-sdk/* da qayta yozilgan saytlardagina ishlaydi (oddiy &lt;button&gt;/&lt;input&gt; va Shadcn/Radix ni ko&#x27;rmaydi, Expo da ishlamaydi).</p>

<p>Sifat: 8.0/10 · Keraklilik: 2.0/10 · ⛔ Rad etildi · @ui-sdk/* Library + Skill (Beta)<br>Sana: 2026-11-16</p>

<details>
<summary>Batafsil</summary>

<p>Vercel Labs'ning Public Beta bosqichidagi headless UI kutubxonasi va <code>ui-sdk</code> skilli: <em>"skrinshotsiz 2x tez boshqaruv"</em> (<code>createAgent</code>) faqat <code>@ui-sdk/*</code> da qayta yozilgan saytlardagina ishlaydi (oddiy <code>&lt;button&gt;</code>/<code>&lt;input&gt;</code> va <code>Shadcn</code>/<code>Radix</code> ni ko'rmaydi, <code>Expo</code> da ishlamaydi). <strong>O'rniga:</strong> mavjud UI stekimiz + <a href="reviews/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> + <a href="reviews/developer-tools/agent-desktop.md"><strong><code>agent-desktop</code></strong></a>.</p>

</details>

<hr>

### 📱 Mobile

<h4><a href="reviews/mobile/swiftui-agent-skill.md">swiftui-agent-skill</a></h4>

<p>Sof SwiftUI va Apple HIG qoidalari; asosiy stekimiz Expo / React Native bo&#x27;lgani uchun faqat sof SwiftUI moduli (Widget / Live Activity) yozilganda -p da olinadi.</p>

<p>Sifat: 8.5/10 · Keraklilik: 3.0/10 · 👍 Yaxshi variant · Skill (twostraws / AvdLee / apple-design)<br>Sana: 2026-11-16</p>

<details>
<summary>Batafsil</summary>

<p>Sof SwiftUI va Apple HIG qoidalari; asosiy stekimiz Expo / React Native bo'lgani uchun faqat sof SwiftUI moduli (Widget / Live Activity) yozilganda <code>-p</code> da olinadi. <strong>O'rniga:</strong> <a href="reviews/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> (<code>reference/ios.md</code>) + <a href="reviews/mobile/animate-expo.md"><strong><code>animate-expo</code></strong></a>.</p>

</details>

<hr>

<h4><a href="reviews/mobile/artemis.md">ARTEMIS</a></h4>

<p>Google&#x27;ning avtonom Android QA tizimi (OCR + piksel ko&#x27;rish bilan Canvas/o&#x27;yin ekranlarida kuchli), lekin ishlatish pullik (.env ga alohida per-token pullik LLM API kalit shart), faqat Android (iOS/tvOS yo&#x27;q) va har qadami 3–40s oladi.</p>

<p>Sifat: 8.5/10 · Keraklilik: 2.5/10 · 👍 Yaxshi variant · Python CLI / SDK + MCP (google/artemis)<br>Sana: 2026-11-16</p>

<details>
<summary>Batafsil</summary>

<p>Google'ning avtonom Android QA tizimi (OCR + piksel ko'rish bilan <code>Canvas</code>/o'yin ekranlarida kuchli), lekin <strong>ishlatish pullik</strong> (<code>.env</code> ga alohida per-token pullik LLM API kalit shart), faqat Android (<code>iOS</code>/<code>tvOS</code> yo'q) va har qadami <code>3–40s</code> oladi. <strong>O'rniga:</strong> <a href="reviews/mobile/agent-device.md"><strong><code>agent-device</code></strong></a> (<code>$0</code> qo'shimcha API xarajati, <code>iOS + Android + TV</code>, <code>197–888 ms</code>).</p>

</details>

<hr>

<h4><a href="reviews/mobile/mobile-mcp.md">mobile-mcp</a></h4>

<p>Jonli sinovda rad etildi: har bitta xabarda ~7,580 token MCP sxema shishishi, agent-device dan 6.5x–37x sekin (7.3s iOS, 5.8s Android), Scarf + PostHog telemetriyasi va mobilenext.ai cloud reklamalari bor.</p>

<p>Sifat: 7.0/10 · Keraklilik: 2.0/10 · ⛔ Rad etildi · MCP Server (34 tool)<br>Sana: 2026-11-16</p>

<details>
<summary>Batafsil</summary>

<p>Jonli sinovda rad etildi: har bitta xabarda <code>~7,580</code> token MCP sxema shishishi, <code>agent-device</code> dan <code>6.5x–37x</code> sekin (<code>7.3s</code> iOS, <code>5.8s</code> Android), <code>Scarf</code> + <code>PostHog</code> telemetriyasi va <code>mobilenext.ai</code> cloud reklamalari bor. <strong>O'rniga:</strong> <a href="reviews/mobile/agent-device.md"><strong><code>agent-device</code></strong></a> + <a href="reviews/mobile/adb.md"><strong><code>adb</code></strong></a>.</p>

</details>

<hr>

### 🎨 UI/UX

<h4><a href="reviews/ui-ux/animate.md">animate</a></h4>

<p>Emil Kowalski&#x27;ning veb-animatsiya skilli; auto-trigger va qoidalari mavjud tizim bilan to&#x27;qnashadi.</p>

<p>Sifat: 8.5/10 · Keraklilik: 3.0/10 · ⛔ Rad etildi · Skill (2 fayl)<br>Sana: 2026-11-15</p>

<details>
<summary>Batafsil</summary>

<p>Emil Kowalski'ning veb-animatsiya skilli; <code>auto-trigger</code> va qoidalari mavjud tizim bilan to'qnashadi. <strong>O'rniga:</strong> <a href="reviews/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> (<code>animate</code>) + <a href="reviews/mobile/animate-expo.md"><strong><code>animate-expo</code></strong></a>.</p>

</details>

<hr>

<h4><a href="reviews/ui-ux/unslop.md">unslop</a></h4>

<p>@heydamirning AI/vibecoded veb-ekranlarni 9 bosqichda tozalash skilli (CC-BY-4.0); faqat Web uchun va auto-triggeri mavjud tizim bilan urishadi.</p>

<p>Sifat: 8.5/10 · Keraklilik: 2.5/10 · ⛔ Rad etildi · Skill + Playwright skriptlar<br>Sana: 2026-11-16</p>

<details>
<summary>Batafsil</summary>

<p><code>@heydamir</code>ning AI/vibecoded veb-ekranlarni 9 bosqichda tozalash skilli (<code>CC-BY-4.0</code>); faqat Web uchun va <code>auto-trigger</code>i mavjud tizim bilan urishadi. <strong>O'rniga:</strong> <a href="reviews/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> (<code>craft-floor</code> + <code>polish</code> / <code>quieter</code> / <code>clarify</code>).</p>

</details>

<hr>

<h4><a href="reviews/ui-ux/break-ui.md">break-ui</a></h4>

<p>Worst-case data stress-test; repoga vaqtinchalik fixture/toggle qo&#x27;shadi va tuzatmay to&#x27;xtaydi.</p>

<p>Sifat: 8.0/10 · Keraklilik: 3.0/10 · ⛔ Rad etildi · Skill (2 fayl)<br>Sana: 2026-11-15</p>

<details>
<summary>Batafsil</summary>

<p>Worst-case data stress-test; repoga vaqtinchalik fixture/toggle qo'shadi va tuzatmay to'xtaydi. <strong>O'rniga:</strong> <a href="reviews/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> (<code>harden</code>).</p>

</details>

<hr>

<h4><a href="reviews/ui-ux/make-interfaces-feel-better.md">make-interfaces-feel-better</a></h4>

<p>Sinab ko&#x27;rilib olib tashlandi (auto-trigger to&#x27;qnashuvi va uzun hisobot jadvallari sabab).</p>

<p>Sifat: 7.5/10 · Keraklilik: 2.5/10 · ⛔ Rad etildi · Skill (6 fayl)<br>Sana: 2026-10-31 → 2026-11-15</p>

<details>
<summary>Batafsil</summary>

<p>Sinab ko'rilib olib tashlandi (<code>auto-trigger</code> to'qnashuvi va uzun hisobot jadvallari sabab). <strong>O'rniga:</strong> <a href="reviews/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> + <a href="reviews/mobile/animate-expo.md"><strong><code>animate-expo</code></strong></a>.</p>

</details>

<hr>

<h4><a href="reviews/ui-ux/ui-ux-pro-max.md">ui-ux-pro-max</a></h4>

<p>impeccable dan kuchsizroq va auto-trigger&#x27;i u bilan urishadi.</p>

<p>Sifat: 7.0/10 · Keraklilik: 3.5/10 · ⛔ Rad etildi · Skill + CSV/Python<br>Sana: 2026-11-15</p>

<details>
<summary>Batafsil</summary>

<p><code>impeccable</code> dan kuchsizroq va auto-trigger'i u bilan urishadi. <strong>O'rniga:</strong> <a href="reviews/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a>.</p>

</details>

<hr>

### 🏗️ Arxitektura va Review

<h4><a href="reviews/architecture/addy-agent-skills.md">addy-agent-skills</a></h4>

<p>Addy Osmani&#x27;ning to&#x27;liq SDLC konveyeri (/spec -&gt; /ship); majburiy TDD va doubt-driven to&#x27;xtashlari kundalik ishda ortiqcha sikl.</p>

<p>Sifat: 8.0/10 · Keraklilik: 2.5/10 · ⛔ Rad etildi · Plugin (25 skill + 9 command)<br>Sana: 2026-11-16</p>

<details>
<summary>Batafsil</summary>

<p>Addy Osmani'ning to'liq SDLC konveyeri (<code>/spec -&gt; /ship</code>); majburiy TDD va <code>doubt-driven</code> to'xtashlari kundalik ishda ortiqcha sikl. <strong>O'rniga:</strong> <a href="reviews/architecture/grill-me.md"><strong><code>grill-me</code></strong></a> + <a href="reviews/architecture/ponytail.md"><strong><code>ponytail</code></strong></a> + <a href="reviews/architecture/elephant-goldfish-model.md"><strong><code>elephant-goldfish-model</code></strong></a>.</p>

</details>

<hr>

<h4><a href="reviews/architecture/agency-agents.md">agency-agents</a></h4>

<p>18 bo&#x27;limdagi 283 ta .md rol-prompt (~18.5K token frontmatter shishishi va shablon copy-paste qoldiqlari bor).</p>

<p>Sifat: 6.5/10 · Keraklilik: 2.5/10 · ⛔ Rad etildi · 283 persona prompt + installer<br>Sana: 2026-11-16</p>

<details>
<summary>Batafsil</summary>

<p>18 bo'limdagi 283 ta <code>.md</code> rol-prompt (<code>~18.5K</code> token frontmatter shishishi va shablon copy-paste qoldiqlari bor). <strong>O'rniga:</strong> <a href="reviews/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a>, <a href="reviews/architecture/ponytail.md"><strong><code>ponytail</code></strong></a>, <a href="reviews/architecture/elephant-goldfish-model.md"><strong><code>elephant-goldfish-model</code></strong></a>, <a href="reviews/mobile/cross-platform-qa.md"><strong><code>cross-platform-qa</code></strong></a>.</p>

</details>

<hr>

<h4><a href="reviews/architecture/superpowers.md">superpowers</a></h4>

<p>Sinab ko&#x27;rilib o&#x27;chirib tashlandi: ortiqcha o&#x27;ylanish (SessionStart hook), keraksiz brainstorming savollari (muqobili: grill-me), sekinlashtiruvchi subagent looplari va Web/Mobile/Backend uchun 2x ortiqcha ish bo&#x27;ladigan majburiy TDD.</p>

<p>Sifat: 6.5/10 · Keraklilik: 2.0/10 · ⛔ Rad etildi · Plugin (14 skill + hook)<br>Sana: 2026-04-04 → 2026-09-01</p>

<details>
<summary>Batafsil</summary>

<p>Sinab ko'rilib o'chirib tashlandi: ortiqcha o'ylanish (<code>SessionStart</code> hook), keraksiz <code>brainstorming</code> savollari (muqobili: <code>grill-me</code>), sekinlashtiruvchi subagent looplari va Web/Mobile/Backend uchun 2x ortiqcha ish bo'ladigan majburiy TDD.</p>

</details>

<hr>

### ⚙️ Backend

<h4><a href="reviews/backend/opentelemetry.md">opentelemetry</a></h4>

<p>Servislararo Traces + Metrics + Logs va server/DB yuklamasi uchun kuchli standart (Collector + SigNoz/Grafana talab qiladi).</p>

<p>Sifat: 9.0/10 · Keraklilik: 4.0/10 · 👍 Yaxshi variant · Standard + Collector (SigNoz / Grafana)<br>Sana: 2026-11-15</p>

<details>
<summary>Batafsil</summary>

<p>Servislararo <code>Traces + Metrics + Logs</code> va server/DB yuklamasi uchun kuchli standart (<code>Collector + SigNoz/Grafana</code> talab qiladi). <strong>O'rniga:</strong> <a href="reviews/backend/sentry.md"><strong><code>sentry</code></strong></a> (xato, replay va bazaviy trace'larni bitta joyda yopadi).</p>

</details>

<hr>

<h4><a href="reviews/backend/shannon.md">Shannon</a></h4>

<p>Avtonom White-Box AI pentester (Auth bypass, IDOR, Injection, XSS, SSRF).</p>

<p>Sifat: 8.5/10 · Keraklilik: 6.5/10 · 👍 Yaxshi variant · Standalone CLI + <a href="skills/hacker-test/SKILL.md">hacker-test</a><br>Sana: 2026-11-16</p>

<details>
<summary>Batafsil</summary>

<p>Avtonom White-Box AI pentester (Auth bypass, IDOR, Injection, XSS, SSRF). Og'ir pluginini o'rnatmasdan, ushbu repodagi yengil <a href="skills/hacker-test/SKILL.md"><code>hacker-test</code></a> skilli orqali faqat lokal/staging'da <code>npx</code> bilan chaqiriladi (production taqiqlangan).</p>

</details>

<hr>

### 🛠️ Developer Tools va Memory

<h4><a href="reviews/developer-tools/skillspector.md">SkillSpector</a></h4>

<p>NVIDIA&#x27;ning AI skill va MCP xavfsizlik skaneri (AST + YARA + OSV + LLM).</p>

<p>Sifat: 9.0/10 · Keraklilik: 3.5/10 · ⛔ Rad etildi · Python CLI + MCP + Skill<br>Sana: 2026-11-16</p>

<details>
<summary>Batafsil</summary>

<p>NVIDIA'ning AI skill va MCP xavfsizlik skaneri (<code>AST + YARA + OSV + LLM</code>). Kundalik ishda ortiqcha sikl bo'lgani uchun o'rnatmadik — <strong>O'rniga:</strong> <a href="reviews/developer-tools/skillshare.md"><strong><code>skillshare</code></strong></a> (<code>skillshare audit</code> skill-check) + <strong>AI agent orqali kodni bevosita tekshirtirish</strong>.</p>

</details>

<hr>

<h4><a href="reviews/developer-tools/caveman.md">caveman</a></h4>

<p>ASD-STE100 asosidagi o&#x27;ta qisqa terminal javob rejimi (SKILL.md); o&#x27;rnatilsa @caveman-ai/cli telemetriyasi va plugin.json hooklarisiz faqat tozalangan yolg&#x27;iz SKILL.md (disable-model-invocation: true) olinishi shart.</p>

<p>Sifat: 8.0/10 · Keraklilik: 3.5/10 · 👍 Yaxshi variant · Skill <em>(+ ixtiyoriy CLI/Proxy)</em><br>Sana: 2026-11-16</p>

<details>
<summary>Batafsil</summary>

<p><code>ASD-STE100</code> asosidagi o'ta qisqa terminal javob rejimi (<code>SKILL.md</code>); o'rnatilsa <code>@caveman-ai/cli</code> telemetriyasi va <code>plugin.json</code> hooklarisiz faqat tozalangan yolg'iz <code>SKILL.md</code> (<code>disable-model-invocation: true</code>) olinishi shart. <strong>O'rniga:</strong> <a href="reviews/architecture/ponytail.md"><strong><code>ponytail</code></strong></a> (ham javobni qisqartiradi, ham ortiqcha kod/diff hajmini kesadi).</p>

</details>

<hr>

<h4><a href="reviews/developer-tools/humanizer-stop-slop.md">humanizer + stop-slop</a></h4>

<p>Uzun maqola va esselardan AI yozuv shtamplarini tozalaydi (humanizer ~32 KB); kod va mahsulot UI&#x27;i uchun emas.</p>

<p>Sifat: 7.5/10 · Keraklilik: 2.0/10 · ⛔ Rad etildi · Skill (Markdown)<br>Sana: 2026-11-16</p>

<details>
<summary>Batafsil</summary>

<p>Uzun maqola va esselardan AI yozuv shtamplarini tozalaydi (<code>humanizer</code> <code>~32 KB</code>); kod va mahsulot UI'i uchun emas. <strong>O'rniga:</strong> <a href="reviews/architecture/ponytail.md"><strong><code>ponytail</code></strong></a> + <a href="reviews/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> (<code>clarify</code>).</p>

</details>

<hr>

<h4><a href="reviews/developer-tools/claude-code-setup.md">claude-code-setup</a></h4>

<p>Anthropic&#x27;ning yangi repo uchun boshlang&#x27;ich Claude Code sozlamalarini tavsiya qiluvchi read-only plagini.</p>

<p>Sifat: 7.5/10 · Keraklilik: 2.0/10 · ⛔ Rad etildi · Plugin (Recommender Skill)<br>Sana: 2026-11-16</p>

<details>
<summary>Batafsil</summary>

<p>Anthropic'ning yangi repo uchun boshlang'ich Claude Code sozlamalarini tavsiya qiluvchi read-only plagini. <strong>O'rniga:</strong> <a href="reviews/developer-tools/skillshare.md"><strong><code>skillshare</code></strong></a>.</p>

</details>

<hr>

<h4><a href="reviews/developer-tools/omniroute.md">OmniRoute</a></h4>

<p>Lokal LLM reverse-proxy (localhost:20128); ichidagi 44 ta skill kodlash uchun emas, uzoq sessiyalarni uzadi (#7287), limitda kuchsiz modelga tushiradi va TLS-stealth (wreq-js) pullik obunalarda ToS ban xavfini tug&#x27;diradi.</p>

<p>Sifat: 7.5/10 · Keraklilik: 2.0/10 · ⛔ Rad etildi · Local Proxy + 44 Admin Skill<br>Sana: 2026-11-16</p>

<details>
<summary>Batafsil</summary>

<p>Lokal LLM reverse-proxy (<code>localhost:20128</code>); ichidagi 44 ta skill kodlash uchun emas, uzoq sessiyalarni uzadi (<code>#7287</code>), limitda kuchsiz modelga tushiradi va TLS-stealth (<code>wreq-js</code>) pullik obunalarda ToS ban xavfini tug'diradi. <strong>O'rniga:</strong> <a href="reviews/developer-tools/t3-code.md"><strong><code>T3 Code</code></strong></a> + <a href="reviews/architecture/ponytail.md"><strong><code>ponytail</code></strong></a>.</p>

</details>

<hr>

<details>
<summary>Global <code>tasted-skills</code>, <code>hacker-test</code> va <code>asset-diet</code> skillarini ulash</summary>

```bash
skillshare install TursunboyevJahongir/tasted-skills -s tasted-skills -s hacker-test -s asset-diet -g && skillshare sync -g
```

</details>
