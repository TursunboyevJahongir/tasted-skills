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

<table width="100%">
  <thead>
    <tr>
      <th align="center" width="5%">#</th>
      <th align="left" width="18%">Nomi</th>
      <th align="left" width="24%">Asosiy vazifasi</th>
      <th align="left" width="16%">Turi</th>
      <th align="center" width="9%">Baho</th>
      <th align="center" width="14%">Holati</th>
      <th align="center" width="14%">Sana</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="center"><strong>1</strong></td>
      <td><a href="reviews/architecture/grill-me.md"><strong><code>grill-me</code></strong></a></td>
      <td><strong>Reja, Qarorlar va Chuqur Debug</strong></td>
      <td>Skilllar to'plami</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Faol</code></td>
      <td align="center"><code>2026&#8209;05&#8209;23</code>&nbsp;dan</td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Kod yozishdan oldin qarorlar daraxti (<code>grilling</code> + <code>grill-with-docs</code> + <code>domain-modeling</code>) bo'ylab talabni pishitadi + <code>mattpocock/skills</code> dan on-demand <strong><code>diagnosing-bugs</code></strong> va <strong><code>improve-codebase-architecture</code></strong>.</td>
    </tr>
    <tr>
      <td align="center"><strong>2</strong></td>
      <td><a href="reviews/architecture/graphify.md"><strong><code>graphify</code></strong></a></td>
      <td><strong>Kod bazasi xaritasi (Knowledge Graph)</strong></td>
      <td>Skill + Python CLI</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Faol</code></td>
      <td align="center"><code>2026&#8209;07&#8209;28</code>&nbsp;dan</td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Kod (lokal AST, <code>0</code> token) va hujjatlardan doimiy bilim grafigi (<code>graph.json</code> + HTML) qurib, katta repoda modullar va fayllar aloqasini soniyada topib beradi.</td>
    </tr>
    <tr>
      <td align="center"><strong>3</strong></td>
      <td><a href="reviews/architecture/ponytail.md"><strong><code>ponytail</code></strong></a></td>
      <td><strong>Minimal va toza kod (YAGNI)</strong></td>
      <td>Skill</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Faol</code></td>
      <td align="center"><code>2026&#8209;11&#8209;15</code>&nbsp;dan</td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Har bir kod yozishda asosiy qoida: vazifani to'liq hal qiladigan eng kichik o'zgarish, ortiqcha abstraksiyasiz kod va bir o'qishda tushunarli qisqa javob.</td>
    </tr>
    <tr>
      <td align="center"><strong>4</strong></td>
      <td><a href="reviews/architecture/karpathy-guidelines.md"><strong><code>karpathy-guidelines</code></strong></a></td>
      <td><strong>Jarrohlik aniqligida tahrir (<code>Surgical</code>)</strong></td>
      <td>Skill</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Faol</code></td>
      <td align="center"><code>2026&#8209;11&#8209;15</code>&nbsp;dan</td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Taxminlarni oldindan ochiq aytish, soddalik va mavjud kodning qo'shni qismlariga tegmasdan faqat kerakli joyni aniq o'zgartirish.</td>
    </tr>
    <tr>
      <td align="center"><strong>5</strong></td>
      <td><a href="reviews/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a></td>
      <td><strong>Asosiy UI/UX dizayn va audit</strong></td>
      <td>Skill</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Faol</code></td>
      <td align="center"><code>2026&#8209;11&#8209;09</code>&nbsp;dan</td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Web, mobil veb va native iOS/Android ekranlarni loyihalash, UX/kontrast/tipografiya auditi va tozalash (<code>polish</code>, <code>clarify</code>, <code>harden</code>). <strong>💡 Tavsiya:</strong> rangli aksent tugmalarda <code>WCAG 2</code> (<code>4.5:1</code>) toza oq yozuvni nohaq yiqitmasligi uchun ichiga <strong><code>APCA</code> (<code>|Lc| ≥ 60</code>) perceptual kontrast</strong> qoidasini qo'shib ketgan yaxshi (<a href="reviews/ui-ux/impeccable.md#apca-contrast">nimalar o'zgartirilgani</a>).</td>
    </tr>
    <tr>
      <td align="center"><strong>6</strong></td>
      <td><a href="reviews/architecture/elephant-goldfish-model.md"><strong><code>elephant-goldfish-model</code></strong></a></td>
      <td><strong>Mustaqil Arxitektura va Kod Review</strong></td>
      <td>Plugin (7 skill + 10 agent)</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Faol</code></td>
      <td align="center"><code>2026&#8209;11&#8209;15</code>&nbsp;dan</td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Xotirali me'mor (<em>Elephant</em>) + xotirasiz tanqidchi subagentlar (<em>Goldfish</em>): <code>egm-drift-report</code> va 5 bosqichli <code>egm-review</code> yashirin xatolarni va hujjat-kod uzilishlarini topadi.</td>
    </tr>
    <tr>
      <td align="center"><strong>7</strong></td>
      <td><a href="reviews/developer-tools/agent-desktop.md"><strong><code>agent-desktop</code></strong></a></td>
      <td><strong>Web (<code>Chrome</code>) va Desktop UI test</strong></td>
      <td>CLI + Skill</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Faol</code></td>
      <td align="center"><code>2026&#8209;11&#8209;15</code>&nbsp;dan</td>
    </tr>
    <tr>
      <td colspan="7" width="2000"><a href="https://agent-browser.dev/desktop">agent-browser.dev/desktop</a> — macOS Accessibility (<code>AX</code>) orqali Chrome va desktop dasturlarni kursorni qimirlatmasdan fonda boshqaradi (<code>iOS Device Hub</code> uchun ham fallback).</td>
    </tr>
    <tr>
      <td align="center"><strong>8</strong></td>
      <td><a href="reviews/mobile/agent-device.md"><strong><code>agent-device</code></strong></a></td>
      <td><strong>Mobil va TV (<code>iOS</code> / <code>Android</code> / <code>tvOS</code>) UI test</strong></td>
      <td>CLI + Skill</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Faol</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code>&nbsp;dan</td>
    </tr>
    <tr>
      <td colspan="7" width="2000"><a href="https://agent-device.dev">agent-device.dev</a> — Callstack'ning 0-dependency CLI'i: oynasiz fonda iOS/tvOS Simulator (<code>~197ms</code>) va <code>-no-window</code> Android/TV Emulator (<code>~888ms</code>, 27x kam token, UTF-8 input) UI'ini <code>@ref</code> va <code>--settle</code> diff bilan boshqaradi (<code>0</code> MCP shishishi).</td>
    </tr>
    <tr>
      <td align="center"><strong>9</strong></td>
      <td><a href="reviews/mobile/cross-platform-qa.md"><strong><code>cross-platform-qa</code></strong></a></td>
      <td><strong>2-bosqichli Web / Mobil / TV QA</strong></td>
      <td>Skill</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Faol</code></td>
      <td align="center"><code>2026&#8209;11&#8209;15</code>&nbsp;dan</td>
    </tr>
    <tr>
      <td colspan="7" width="2000">1-bosqichda lokal kompyuterda (<code>agent-desktop</code> Web + <code>agent-device</code> headless iOS/Android/TV + <code>adb</code>) tekshirish, 2-bosqichda "Done" oldidan real qurilmada yakuniy sinash.</td>
    </tr>
    <tr>
      <td align="center"><strong>10</strong></td>
      <td><a href="reviews/backend/sentry.md"><strong><code>sentry</code></strong></a></td>
      <td><strong>Full-Stack Xatolar va Trace tahlili</strong></td>
      <td>Self-Hosted + Skill / MCP</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Faol</code></td>
      <td align="center"><code>2026&#8209;07&#8209;08</code>&nbsp;dan</td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Backend, Web va Mobil xatolar (<code>Issue Grouping</code>, <code>dSYM</code>/<code>ProGuard</code>, <code>Source Maps</code>), <code>Breadcrumbs</code>, <code>Session Replay</code> va <code>v8+</code> OTel-trace'larni AI orqali tahlil qilish.</td>
    </tr>
    <tr>
      <td align="center"><strong>11</strong></td>
      <td><a href="reviews/developer-tools/skillshare.md"><strong><code>skillshare</code></strong></a></td>
      <td><strong>Skill sinxronlash va Xavfsizlik (<code>audit</code>)</strong></td>
      <td>CLI + Skill</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Faol</code></td>
      <td align="center"><code>2026&#8209;05&#8209;30</code>&nbsp;dan</td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Barcha AI agentlar (<code>Codex</code>, <code>Claude</code>, <code>Antigravity</code>) o'rtasida skill/pluginlarni bitta manbadan sinxronlash va o'rnatilgan <strong>skill-check (<code>skillshare audit</code>)</strong> orqali tekshirish.</td>
    </tr>
    <tr>
      <td align="center"><strong>12</strong></td>
      <td><a href="reviews/mobile/animate-expo.md"><strong><code>animate-expo</code></strong></a></td>
      <td><strong>Expo / React Native 60/120fps animatsiya</strong></td>
      <td>Skill</td>
      <td align="center"><strong>9.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Faol</code></td>
      <td align="center"><code>2026&#8209;11&#8209;09</code>&nbsp;dan</td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Expo va React Native ilovalarda <code>Reanimated</code>, <code>Gesture Handler</code>, <code>expo-haptics</code> orqali UI oqimida qotmaydigan animatsiya va jestlar (<code>LOCAL-COMPATIBILITY.md</code> himoyasi bilan).</td>
    </tr>
    <tr>
      <td align="center"><strong>13</strong></td>
      <td><a href="reviews/developer-tools/t3-code.md"><strong><code>T3 Code</code></strong> + CLI Subagent</a></td>
      <td><strong>Multi-Agent kod va review</strong></td>
      <td>Desktop App + CLI + Skill</td>
      <td align="center"><strong>9.0/10</strong></td>
      <td align="center"><code>✅&nbsp;Faol</code></td>
      <td align="center"><code>2026&#8209;10&#8209;23</code>&nbsp;dan</td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Bir nechta AI'ni birga ishlatish: <code>task-context</code> + CLI subagentlar (<code>argon</code>, <code>antigravity-claude</code>, <code>claude-opus</code>, <code>antigravity-consult</code>) hamda Orca muhitida <strong><code>orchestration</code></strong> (<code>worker-start</code> DAG) orqali mustaqil kod yozish va review.</td>
    </tr>
    <tr>
      <td align="center"><strong>14</strong></td>
      <td><a href="reviews/mobile/adb.md"><strong><code>adb</code></strong></a></td>
      <td><strong>Android port (<code>reverse</code>) va <code>logcat</code></strong></td>
      <td>CLI</td>
      <td align="center"><strong>9.0/10</strong></td>
      <td align="center"><code>✅&nbsp;Faol</code></td>
      <td align="center"><code>2026&#8209;09&#8209;07</code>&nbsp;dan</td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Android emulyator (<code>-no-window</code>) va real telefonlarda port ulash (<code>reverse</code>), <code>logcat</code>, APK o'rnatish va past darajadagi boshqaruv (<code>-s &lt;serial&gt;</code> majburiy).</td>
    </tr>
    <tr>
      <td align="center"><strong>15</strong></td>
      <td><a href="reviews/mobile/ios-simulator-device-hub.md"><strong><code>xcrun simctl</code> + <code>Device Hub</code></strong></a></td>
      <td><strong>iOS headless boot va <code>devicectl</code></strong></td>
      <td>Xcode CLI + App</td>
      <td align="center"><strong>9.0/10</strong></td>
      <td align="center"><code>✅&nbsp;Faol</code></td>
      <td align="center"><code>2026&#8209;10&#8209;20</code>&nbsp;dan</td>
    </tr>
    <tr>
      <td colspan="7" width="2000">iOS Simulator'ni oynasiz fonda yoqish/yopish (<code>simctl boot/shutdown</code>), real iPhone'ga build o'rnatish (<code>devicectl</code>) hamda <code>Device Hub</code> zaxirasi (<code>fallback</code>).</td>
    </tr>
    <tr>
      <td align="center"><strong>16</strong></td>
      <td><a href="reviews/mobile/simslim.md"><strong><code>simslim</code></strong></a></td>
      <td><strong>iOS / tvOS Simulator RAM va Disk optimizatori</strong></td>
      <td>Standalone Go CLI</td>
      <td align="center"><strong>9.0/10</strong></td>
      <td align="center"><code>✅&nbsp;Faol</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code>&nbsp;dan</td>
    </tr>
    <tr>
      <td colspan="7" width="2000"><code>iOS</code>/<code>tvOS</code> Simulator ichidagi <code>~149–180</code> ta keraksiz fon servisini (<code>Siri</code>, <code>Apple Intelligence</code>, <code>Wallpaper</code>) o'chiradi: jonli oynasiz bootda <code>182 -&gt; 78</code> jarayon va <strong><code>2.70 GB -&gt; 1.16 GB</code> RAM (<code>-57%</code>)</strong>, GUI da <code>4.0 GB -&gt; 0.9 GB</code> (<code>-77.5%</code>), ustiga ilovalarga tegmay <code>1.5 GB+</code> kesh/log tozalaydi (<code>--except web,photos,search --keep com.apple.apsd</code> bilan <code>agent-device</code> va <code>push</code> 100% ishlaydi).</td>
    </tr>
    <tr>
      <td align="center"><strong>17</strong></td>
      <td><a href="reviews/mobile/avdslim.md"><strong><code>avdslim</code></strong></a></td>
      <td><strong>Android AVD RAM va Metal GPU optimizatori</strong></td>
      <td>Standalone Go CLI</td>
      <td align="center"><strong>9.0/10</strong></td>
      <td align="center"><code>✅&nbsp;Faol</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code>&nbsp;dan</td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Android Emulator (<code>AVD</code>) RAM va GPU optimizatori: CPU <code>SwiftShader</code> ni native <strong>Apple Metal GPU (<code>host</code>)</strong> ga o'tkazib, <code>-lowram</code> (<code>1536 MB</code>) va Golden Snapshot bilan xotirani <strong><code>4.41 GB -&gt; 2.64 GB</code> (<code>-40.2%</code>, Studio 8.5 GB AVD'dan <code>-69%</code>)</strong> ga tushiradi (<code>defaults</code> da <code>--skip=location --keep=com.google.android.apps.maps</code> bilan GPS va <code>agent-device</code> 100% ishlaydi).</td>
    </tr>
    <tr>
      <td align="center"><strong>18</strong></td>
      <td><a href="reviews/backend/security-audit-skill.md"><strong><code>security-audit</code></strong></a></td>
      <td><strong>6-bosqichli Manba Kodi Xavfsizlik Auditi</strong></td>
      <td>Skill</td>
      <td align="center"><strong>9.0/10</strong></td>
      <td align="center"><code>✅&nbsp;Faol</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code>&nbsp;dan</td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Cloudflare'ning 6 bosqichli <em>adversarial</em> manba kodi xavfsizligi auditi (<code>Hunter</code> + mustaqil <code>Verifier</code> subagentlar + 0-dep Node JSON tekshirgich): Docker ko'tarmasdan Backend, Web, <strong>Mobil (<code>deep-link</code>/<code>WebView</code>/<code>IPC</code>)</strong>, CLI va CI/CD zaifliklarini topadi (<code>quick</code>/<code>scoped</code> profil himoyasi bilan).</td>
    </tr>
    <tr>
      <td align="center"><strong>19</strong></td>
      <td><a href="reviews/mobile/mobile-native.md"><strong><code>mobile-native</code></strong></a> + <code>web-to-native-mobile</code></td>
      <td><strong>Mobil Web / PWA va Web->App ko'chirish</strong></td>
      <td>Skilllar to'plami</td>
      <td align="center"><strong>8.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Faol</code></td>
      <td align="center"><code>2026&#8209;11&#8209;15</code>&nbsp;dan</td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Mobil veb va PWA'ni native sezdiradigan 11 ta CSS/meta yechim (<code>dvh/svh</code>, <code>safe-area</code>, <code>16px</code> input, <code>overscroll-behavior</code>, hover gating) + veb funksiyani native ilovaga ko'chirish qarorlari (<code>web-to-native-mobile</code>) va UI xabarlari tinish belgilari qoidasi (<code>ui-message-punctuation</code>).</td>
    </tr>
    <tr>
      <td align="center"><strong>20</strong></td>
      <td><a href="reviews/developer-tools/assetdiet.md"><strong><code>AssetDiet</code></strong></a></td>
      <td><strong>Lokal Rasm / SVG / Video / 3D siqish</strong></td>
      <td>CLI + <a href="skills/asset-diet/SKILL.md"><code>asset-diet</code></a></td>
      <td align="center"><strong>7.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Faol</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code>&nbsp;dan</td>
    </tr>
    <tr>
      <td colspan="7" width="2000">100% lokal rasm/SVG/video/3D siqish (<code>Sharp</code>, <code>SVGO</code>, <code>FFmpeg</code>) + rollback. Doimiy 16-tool MCP o'rniga ushbu repodagi yengil <a href="skills/asset-diet/SKILL.md"><code>asset-diet</code></a> skilli orqali faqat kerak paytda <code>npx assetdiet-mcp@0.1.4</code> CLI chaqiriladi.</td>
    </tr>
    <tr>
      <td align="center"><strong>21</strong></td>
      <td><a href="practices/06-video-figma-and-db-workflows.md"><strong><code>watch</code> + <code>video-analyzer</code></strong></a></td>
      <td><strong>Video, Reel va QA Bug-Video tahlili</strong></td>
      <td>Skill + CLI (<code>yt-dlp</code> + <code>ffmpeg</code>)</td>
      <td align="center"><strong>9.0/10</strong></td>
      <td align="center"><code>✅&nbsp;Faol</code></td>
      <td align="center"><code>2026&#8209;10&#8209;25</code>&nbsp;dan</td>
    </tr>
    <tr>
      <td colspan="7" width="2000">YouTube, Instagram Reels, Loom va mijoz yuborgan bug-videolarni <code>Whisper</code> transkripsiya hamda <code>scene-change</code> (yoki <code>5fps</code>) kadrlar bilan kadr-ba-kadr tahlil qilish.</td>
    </tr>
    <tr>
      <td align="center"><strong>22</strong></td>
      <td><a href="practices/06-video-figma-and-db-workflows.md"><strong><code>figma</code> skilllar to'plami</strong></a></td>
      <td><strong>Ikki tomonlama <code>Figma &lt;-&gt; Kod</code> ko'prigi</strong></td>
      <td>6 ta Skill + MCP</td>
      <td align="center"><strong>9.0/10</strong></td>
      <td align="center"><code>✅&nbsp;Faol</code></td>
      <td align="center"><code>2026&#8209;10&#8209;20</code>&nbsp;dan</td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Figma maketdan 1:1 kod yozish (<code>figma-implement-design</code>) hamda <strong>tayyor yozilgan koddan Figma'ga ekran va Design System chizish</strong> (<code>figma-generate-design</code>, <code>figma-generate-library</code>, <code>figma-use</code>).</td>
    </tr>
    <tr>
      <td align="center"><strong>23</strong></td>
      <td><a href="practices/03-web-and-mobile-ui-polish.md"><strong><code>client-performance-gate</code></strong></a></td>
      <td><strong>Web / Mobile Web / WebOS tezlik va <code>recovery</code></strong></td>
      <td>Skill</td>
      <td align="center"><strong>9.0/10</strong></td>
      <td align="center"><code>✅&nbsp;Faol</code></td>
      <td align="center"><code>2026&#8209;11&#8209;10</code>&nbsp;dan</td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Mijoz Web, Mobile Web va WebOS TV ilovalarida <code>1x/6x CPU × fast/constrained/offline</code> 4-profil matritsasi, <code>≤200ms</code> javob va internet/CPU qaytishi bilan sahifani yangilamasdan avto-tiklanish (<code>recovery</code>) tekshiruvi <em>(Admin panellarga qo'llanmaydi)</em>.</td>
    </tr>
    <tr>
      <td align="center"><strong>24</strong></td>
      <td><a href="practices/06-video-figma-and-db-workflows.md"><strong><code>drizzle-relations-v2</code></strong></a></td>
      <td><strong>Drizzle ORM <code>v2</code> sxema va relyatsiya</strong></td>
      <td>Skill</td>
      <td align="center"><strong>8.5/10</strong></td>
      <td align="center"><code>✅&nbsp;Faol</code></td>
      <td align="center"><code>2026&#8209;11&#8209;05</code>&nbsp;dan</td>
    </tr>
    <tr>
      <td colspan="7" width="2000">Backendda Drizzle ORM yozishda eski <code>v1 relations()</code> xatolarini oldini olib, to'g'ri <code>v2 defineRelations</code> va obyekt-asosli <code>where</code> filterlarini qo'llaydi.</td>
    </tr>
  </tbody>
</table>

---

## Yo'nalishlar bo'yicha

### 🧠 Lokal modellar

<table width="100%">
  <thead>
    <tr>
      <th align="left" width="22%">Nomi</th>
      <th align="left" width="27%">Turi</th>
      <th align="center" width="10%">Sifat</th>
      <th align="center" width="11%">Keraklilik</th>
      <th align="center" width="16%">Holati</th>
      <th align="center" width="14%">Sana</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="reviews/local-models/kimi-k3-in-c.md"><strong><code>kimi-k3-in-c</code></strong></a></td>
      <td>C99 CLI Engine (<code>2.78T</code> MoE)</td>
      <td align="center"><strong>8.5/10</strong></td>
      <td align="center"><strong>1.0/10</strong></td>
      <td align="center"><code>⛔&nbsp;Rad&nbsp;etildi</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000"><strong>Yo'nalishi:</strong> <code>2.78T</code> (<code>~104B</code> aktiv) <code>Kimi K3</code> MoE modelini GPU'siz C99 da NVMe diskdan stream qilib o'qish eksperimenti. <strong>Kod yozishga ishlaydimi:</strong> Modelning o'zi kuchli coder/reasoning model, <strong>lekin bu disk-stream usulida kod yozishga yaramaydi</strong> (<code>1 token = ~24–33s</code>, <code>500</code> token = <code>~3.5 soat</code> + <code>~50 TB</code> SSD o'qish). <strong>Talab:</strong> Min: <code>GPU: 0, RAM: 8–16 GB, SSD: ≥1.8 TB NVMe</code>; Yaxshi ishlashi uchun: <code>16× H200 (~2.25 TB VRAM)</code>. <strong>Lokal alternativa kerak bo'lsa:</strong> <code>32–64 GB</code> Mac'da RAMga sig'adigan <code>Ollama</code> / <code>MLX</code> (<code>Qwen3-Coder</code>, <code>30–65 tok/s</code>). 📊 <a href="https://github.com/FareedKhan-dev/kimi-k3-in-c">GitHub Benchmark</a> · <a href="https://artificialanalysis.ai/leaderboards/models">Artificial Analysis</a></td>
    </tr>
    <tr>
      <td><a href="reviews/local-models/minimax-m3-1-flash.md"><strong><code>MiniMax-M3.1-Flash</code></strong> <em>(Lokal)</em></a></td>
      <td>Open-Weight <code>428B</code> MoE (<code>~23B</code> aktiv)</td>
      <td align="center"><strong>8.0/10</strong></td>
      <td align="center"><strong>1.0/10</strong></td>
      <td align="center"><code>⛔&nbsp;Rad&nbsp;etildi</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000"><strong>Yo'nalishi:</strong> Tezkor multimodal (<code>matn + rasm + video</code>, <code>1M</code> kontekst) model — suhbat, <code>OCR</code>/rasm/video tahlili va ofis avtomatizatsiyasi (<code>Automation-Bench: 62.8%</code>) uchun mo'ljallangan. <strong>Kod yozishga ishlaydimi:</strong> Oddiy skript va UI/avtomatizatsiyaga ishlaydi, lekin murakkab repozitoriy va terminal dasturlashda asosiy coder emas (<code>Terminal-Bench 4.0: 38.1%</code>). <strong>Talab:</strong> Og'irligi <code>~250–285 GB</code> — oddiy kompyuterga sig'maydi (<code>Min: 512 GB Mac Studio</code>, yaxshi ishlashi uchun: <code>8× H100 / 640 GB VRAM</code>). <strong>Alternativa:</strong> Lokalda <code>Ollama</code> / <code>MLX</code> (<code>Qwen3-Coder</code>); aynan shu model kerak bo'lsa — <a href="reviews/external-apis/minimax-m3-1-flash-api.md">🔌 <code>MiniMax M3.1 Flash API</code></a>. 📊 <a href="https://huggingface.co/MiniMaxAI/MiniMax-M3.1-Flash">HuggingFace</a> · <a href="https://openrouter.ai/minimax/minimax-m3.1-flash">OpenRouter Stats</a></td>
    </tr>
  </tbody>
</table>

### 🔌 Tashqi API'lar

<table width="100%">
  <thead>
    <tr>
      <th align="left" width="22%">Nomi</th>
      <th align="left" width="27%">Turi</th>
      <th align="center" width="10%">Sifat</th>
      <th align="center" width="11%">Keraklilik</th>
      <th align="center" width="16%">Holati</th>
      <th align="center" width="14%">Sana</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="reviews/external-apis/minimax-m3-1-flash-api.md"><strong><code>MiniMax M3.1 Flash API</code></strong></a></td>
      <td>Cloud Multimodal API (<code>MiniMax</code> / <code>OpenRouter</code>)</td>
      <td align="center"><strong>8.0/10</strong></td>
      <td align="center"><strong>5.0/10</strong></td>
      <td align="center"><code>👍&nbsp;Yaxshi&nbsp;variant</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000"><strong>Yo'nalishi:</strong> Mahsulot backendidagi ommaviy chatbot, tarjima, <code>OCR</code>/rasm/video tahlili va SaaS avtomatizatsiyasi uchun juda arzon (<code>$0.15 / $0.60</code>, <code>Cached: $0.015</code>) va tez (<code>170+ tok/s</code>, <code>1M</code> kontekst) multimodal API. <strong>Kod yozishga ishlaydimi:</strong> Oddiy skript va yordamchi avtomatizatsiyaga ishlaydi, lekin murakkab loyiha arxitekturasi uchun emas (<code>Terminal-Bench 4.0: 38.1%</code>). <em>(Pullik Zero-Retention API kalit bilan ishlating; <code>:free</code> ga yopiq kod bermang).</em> 📊 <a href="https://openrouter.ai/minimax/minimax-m3.1-flash">OpenRouter Stats</a> · <a href="https://huggingface.co/MiniMaxAI/MiniMax-M3.1-Flash">HuggingFace Benchmarks</a> · <a href="https://artificialanalysis.ai/leaderboards/models">Artificial Analysis</a></td>
    </tr>
  </tbody>
</table>

### 🌐 Web

<table width="100%">
  <thead>
    <tr>
      <th align="left" width="22%">Nomi</th>
      <th align="left" width="27%">Turi</th>
      <th align="center" width="10%">Sifat</th>
      <th align="center" width="11%">Keraklilik</th>
      <th align="center" width="16%">Holati</th>
      <th align="center" width="14%">Sana</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="reviews/web/taste-skill.md"><strong><code>taste-skill</code> v2.5</strong></a></td>
      <td>Landing Kit + Hook</td>
      <td align="center"><strong>8.0/10</strong></td>
      <td align="center"><strong>4.0/10</strong></td>
      <td align="center"><code>👍&nbsp;Yaxshi&nbsp;variant</code></td>
      <td align="center"><code>2026&#8209;11&#8209;15</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Noldan promo-landing qurishda kuchli; o'rnatilsa <code>Stop</code> hook (600s) kesib tashlanishi va faqat <code>-p</code> da ishlatilishi shart.</td>
    </tr>
    <tr>
      <td><a href="reviews/web/vercel-ui-sdk.md"><strong><code>vercel-labs/ui</code></strong></a></td>
      <td><code>@ui-sdk/*</code> Library + Skill (<code>Beta</code>)</td>
      <td align="center"><strong>8.0/10</strong></td>
      <td align="center"><strong>2.0/10</strong></td>
      <td align="center"><code>⛔&nbsp;Rad&nbsp;etildi</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Vercel Labs'ning Public Beta bosqichidagi headless UI kutubxonasi va <code>ui-sdk</code> skilli: <em>"skrinshotsiz 2x tez boshqaruv"</em> (<code>createAgent</code>) faqat <code>@ui-sdk/*</code> da qayta yozilgan saytlardagina ishlaydi (oddiy <code>&lt;button&gt;</code>/<code>&lt;input&gt;</code> va <code>Shadcn</code>/<code>Radix</code> ni ko'rmaydi, <code>Expo</code> da ishlamaydi). <strong>O'rniga:</strong> mavjud UI stekimiz + <a href="reviews/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> + <a href="reviews/developer-tools/agent-desktop.md"><strong><code>agent-desktop</code></strong></a>.</td>
    </tr>
  </tbody>
</table>

### 📱 Mobile

<table width="100%">
  <thead>
    <tr>
      <th align="left" width="22%">Nomi</th>
      <th align="left" width="27%">Turi</th>
      <th align="center" width="10%">Sifat</th>
      <th align="center" width="11%">Keraklilik</th>
      <th align="center" width="16%">Holati</th>
      <th align="center" width="14%">Sana</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="reviews/mobile/swiftui-agent-skill.md"><strong><code>swiftui-agent-skill</code></strong></a></td>
      <td>Skill (<code>twostraws</code> / <code>AvdLee</code> / <code>apple-design</code>)</td>
      <td align="center"><strong>8.5/10</strong></td>
      <td align="center"><strong>3.0/10</strong></td>
      <td align="center"><code>👍&nbsp;Yaxshi&nbsp;variant</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Sof SwiftUI va Apple HIG qoidalari; asosiy stekimiz Expo / React Native bo'lgani uchun faqat sof SwiftUI moduli (Widget / Live Activity) yozilganda <code>-p</code> da olinadi. <strong>O'rniga:</strong> <a href="reviews/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> (<code>reference/ios.md</code>) + <a href="reviews/mobile/animate-expo.md"><strong><code>animate-expo</code></strong></a>.</td>
    </tr>
    <tr>
      <td><a href="reviews/mobile/artemis.md"><strong><code>ARTEMIS</code></strong></a></td>
      <td>Python CLI / SDK + MCP (<code>google/artemis</code>)</td>
      <td align="center"><strong>8.5/10</strong></td>
      <td align="center"><strong>2.5/10</strong></td>
      <td align="center"><code>👍&nbsp;Yaxshi&nbsp;variant</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Google'ning avtonom Android QA tizimi (OCR + piksel ko'rish bilan <code>Canvas</code>/o'yin ekranlarida kuchli), lekin <strong>ishlatish pullik</strong> (<code>.env</code> ga alohida per-token pullik LLM API kalit shart), faqat Android (<code>iOS</code>/<code>tvOS</code> yo'q) va har qadami <code>3–40s</code> oladi. <strong>O'rniga:</strong> <a href="reviews/mobile/agent-device.md"><strong><code>agent-device</code></strong></a> (<code>$0</code> qo'shimcha API xarajati, <code>iOS + Android + TV</code>, <code>197–888 ms</code>).</td>
    </tr>
    <tr>
      <td><a href="reviews/mobile/mobile-mcp.md"><strong><code>mobile-mcp</code></strong></a></td>
      <td>MCP Server (34 tool)</td>
      <td align="center"><strong>7.0/10</strong></td>
      <td align="center"><strong>2.0/10</strong></td>
      <td align="center"><code>⛔&nbsp;Rad&nbsp;etildi</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Jonli sinovda rad etildi: har bitta xabarda <code>~7,580</code> token MCP sxema shishishi, <code>agent-device</code> dan <code>6.5x–37x</code> sekin (<code>7.3s</code> iOS, <code>5.8s</code> Android), <code>Scarf</code> + <code>PostHog</code> telemetriyasi va <code>mobilenext.ai</code> cloud reklamalari bor. <strong>O'rniga:</strong> <a href="reviews/mobile/agent-device.md"><strong><code>agent-device</code></strong></a> + <a href="reviews/mobile/adb.md"><strong><code>adb</code></strong></a>.</td>
    </tr>
  </tbody>
</table>

### 🎨 UI/UX

<table width="100%">
  <thead>
    <tr>
      <th align="left" width="22%">Nomi</th>
      <th align="left" width="27%">Turi</th>
      <th align="center" width="10%">Sifat</th>
      <th align="center" width="11%">Keraklilik</th>
      <th align="center" width="16%">Holati</th>
      <th align="center" width="14%">Sana</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="reviews/ui-ux/animate.md"><strong><code>animate</code></strong></a></td>
      <td>Skill (2 fayl)</td>
      <td align="center"><strong>8.5/10</strong></td>
      <td align="center"><strong>3.0/10</strong></td>
      <td align="center"><code>⛔&nbsp;Rad&nbsp;etildi</code></td>
      <td align="center"><code>2026&#8209;11&#8209;15</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Emil Kowalski'ning veb-animatsiya skilli; <code>auto-trigger</code> va qoidalari mavjud tizim bilan to'qnashadi. <strong>O'rniga:</strong> <a href="reviews/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> (<code>animate</code>) + <a href="reviews/mobile/animate-expo.md"><strong><code>animate-expo</code></strong></a>.</td>
    </tr>
    <tr>
      <td><a href="reviews/ui-ux/unslop.md"><strong><code>unslop</code></strong></a></td>
      <td>Skill + Playwright skriptlar</td>
      <td align="center"><strong>8.5/10</strong></td>
      <td align="center"><strong>2.5/10</strong></td>
      <td align="center"><code>⛔&nbsp;Rad&nbsp;etildi</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000"><code>@heydamir</code>ning AI/vibecoded veb-ekranlarni 9 bosqichda tozalash skilli (<code>CC-BY-4.0</code>); faqat Web uchun va <code>auto-trigger</code>i mavjud tizim bilan urishadi. <strong>O'rniga:</strong> <a href="reviews/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> (<code>craft-floor</code> + <code>polish</code> / <code>quieter</code> / <code>clarify</code>).</td>
    </tr>
    <tr>
      <td><a href="reviews/ui-ux/break-ui.md"><strong><code>break-ui</code></strong></a></td>
      <td>Skill (2 fayl)</td>
      <td align="center"><strong>8.0/10</strong></td>
      <td align="center"><strong>3.0/10</strong></td>
      <td align="center"><code>⛔&nbsp;Rad&nbsp;etildi</code></td>
      <td align="center"><code>2026&#8209;11&#8209;15</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Worst-case data stress-test; repoga vaqtinchalik fixture/toggle qo'shadi va tuzatmay to'xtaydi. <strong>O'rniga:</strong> <a href="reviews/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> (<code>harden</code>).</td>
    </tr>
    <tr>
      <td><a href="reviews/ui-ux/make-interfaces-feel-better.md"><strong><code>make-interfaces-feel-better</code></strong></a></td>
      <td>Skill (6 fayl)</td>
      <td align="center"><strong>7.5/10</strong></td>
      <td align="center"><strong>2.5/10</strong></td>
      <td align="center"><code>⛔&nbsp;Rad&nbsp;etildi</code></td>
      <td align="center"><code>2026&#8209;10&#8209;31 → 2026&#8209;11&#8209;15</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Sinab ko'rilib olib tashlandi (<code>auto-trigger</code> to'qnashuvi va uzun hisobot jadvallari sabab). <strong>O'rniga:</strong> <a href="reviews/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> + <a href="reviews/mobile/animate-expo.md"><strong><code>animate-expo</code></strong></a>.</td>
    </tr>
    <tr>
      <td><a href="reviews/ui-ux/ui-ux-pro-max.md"><strong><code>ui-ux-pro-max</code></strong></a></td>
      <td>Skill + CSV/Python</td>
      <td align="center"><strong>7.0/10</strong></td>
      <td align="center"><strong>3.5/10</strong></td>
      <td align="center"><code>⛔&nbsp;Rad&nbsp;etildi</code></td>
      <td align="center"><code>2026&#8209;11&#8209;15</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000"><code>impeccable</code> dan kuchsizroq va auto-trigger'i u bilan urishadi. <strong>O'rniga:</strong> <a href="reviews/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a>.</td>
    </tr>
  </tbody>
</table>

### 🏗️ Arxitektura va Review

<table width="100%">
  <thead>
    <tr>
      <th align="left" width="22%">Nomi</th>
      <th align="left" width="27%">Turi</th>
      <th align="center" width="10%">Sifat</th>
      <th align="center" width="11%">Keraklilik</th>
      <th align="center" width="16%">Holati</th>
      <th align="center" width="14%">Sana</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="reviews/architecture/addy-agent-skills.md"><strong><code>addy-agent-skills</code></strong></a></td>
      <td>Plugin (25 skill + 9 command)</td>
      <td align="center"><strong>8.0/10</strong></td>
      <td align="center"><strong>2.5/10</strong></td>
      <td align="center"><code>⛔&nbsp;Rad&nbsp;etildi</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Addy Osmani'ning to'liq SDLC konveyeri (<code>/spec -&gt; /ship</code>); majburiy TDD va <code>doubt-driven</code> to'xtashlari kundalik ishda ortiqcha sikl. <strong>O'rniga:</strong> <a href="reviews/architecture/grill-me.md"><strong><code>grill-me</code></strong></a> + <a href="reviews/architecture/ponytail.md"><strong><code>ponytail</code></strong></a> + <a href="reviews/architecture/elephant-goldfish-model.md"><strong><code>elephant-goldfish-model</code></strong></a>.</td>
    </tr>
    <tr>
      <td><a href="reviews/architecture/agency-agents.md"><strong><code>agency-agents</code></strong></a></td>
      <td>283 persona prompt + installer</td>
      <td align="center"><strong>6.5/10</strong></td>
      <td align="center"><strong>2.5/10</strong></td>
      <td align="center"><code>⛔&nbsp;Rad&nbsp;etildi</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">18 bo'limdagi 283 ta <code>.md</code> rol-prompt (<code>~18.5K</code> token frontmatter shishishi va shablon copy-paste qoldiqlari bor). <strong>O'rniga:</strong> <a href="reviews/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a>, <a href="reviews/architecture/ponytail.md"><strong><code>ponytail</code></strong></a>, <a href="reviews/architecture/elephant-goldfish-model.md"><strong><code>elephant-goldfish-model</code></strong></a>, <a href="reviews/mobile/cross-platform-qa.md"><strong><code>cross-platform-qa</code></strong></a>.</td>
    </tr>
    <tr>
      <td><a href="reviews/architecture/superpowers.md"><strong><code>superpowers</code></strong></a></td>
      <td>Plugin (14 skill + hook)</td>
      <td align="center"><strong>6.5/10</strong></td>
      <td align="center"><strong>2.0/10</strong></td>
      <td align="center"><code>⛔&nbsp;Rad&nbsp;etildi</code></td>
      <td align="center"><code>2026&#8209;04&#8209;04 → 2026&#8209;09&#8209;01</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Sinab ko'rilib o'chirib tashlandi: ortiqcha o'ylanish (<code>SessionStart</code> hook), keraksiz <code>brainstorming</code> savollari (muqobili: <code>grill-me</code>), sekinlashtiruvchi subagent looplari va Web/Mobile/Backend uchun 2x ortiqcha ish bo'ladigan majburiy TDD.</td>
    </tr>
  </tbody>
</table>

### ⚙️ Backend

<table width="100%">
  <thead>
    <tr>
      <th align="left" width="22%">Nomi</th>
      <th align="left" width="27%">Turi</th>
      <th align="center" width="10%">Sifat</th>
      <th align="center" width="11%">Keraklilik</th>
      <th align="center" width="16%">Holati</th>
      <th align="center" width="14%">Sana</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="reviews/backend/opentelemetry.md"><strong><code>opentelemetry</code></strong></a></td>
      <td>Standard + Collector (<code>SigNoz</code> / <code>Grafana</code>)</td>
      <td align="center"><strong>9.0/10</strong></td>
      <td align="center"><strong>4.0/10</strong></td>
      <td align="center"><code>👍&nbsp;Yaxshi&nbsp;variant</code></td>
      <td align="center"><code>2026&#8209;11&#8209;15</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Servislararo <code>Traces + Metrics + Logs</code> va server/DB yuklamasi uchun kuchli standart (<code>Collector + SigNoz/Grafana</code> talab qiladi). <strong>O'rniga:</strong> <a href="reviews/backend/sentry.md"><strong><code>sentry</code></strong></a> (xato, replay va bazaviy trace'larni bitta joyda yopadi).</td>
    </tr>
    <tr>
      <td><a href="reviews/backend/shannon.md"><strong><code>Shannon</code></strong></a></td>
      <td>Standalone CLI + <a href="skills/hacker-test/SKILL.md"><code>hacker-test</code></a></td>
      <td align="center"><strong>8.5/10</strong></td>
      <td align="center"><strong>6.5/10</strong></td>
      <td align="center"><code>👍&nbsp;Yaxshi&nbsp;variant</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Avtonom White-Box AI pentester (Auth bypass, IDOR, Injection, XSS, SSRF). Og'ir pluginini o'rnatmasdan, ushbu repodagi yengil <a href="skills/hacker-test/SKILL.md"><code>hacker-test</code></a> skilli orqali faqat lokal/staging'da <code>npx</code> bilan chaqiriladi (production taqiqlangan).</td>
    </tr>
  </tbody>
</table>

### 🛠️ Developer Tools va Memory

<table width="100%">
  <thead>
    <tr>
      <th align="left" width="22%">Nomi</th>
      <th align="left" width="27%">Turi</th>
      <th align="center" width="10%">Sifat</th>
      <th align="center" width="11%">Keraklilik</th>
      <th align="center" width="16%">Holati</th>
      <th align="center" width="14%">Sana</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="reviews/developer-tools/skillspector.md"><strong><code>SkillSpector</code></strong></a></td>
      <td>Python CLI + MCP + Skill</td>
      <td align="center"><strong>9.0/10</strong></td>
      <td align="center"><strong>3.5/10</strong></td>
      <td align="center"><code>⛔&nbsp;Rad&nbsp;etildi</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">NVIDIA'ning AI skill va MCP xavfsizlik skaneri (<code>AST + YARA + OSV + LLM</code>). Kundalik ishda ortiqcha sikl bo'lgani uchun o'rnatmadik — <strong>O'rniga:</strong> <a href="reviews/developer-tools/skillshare.md"><strong><code>skillshare</code></strong></a> (<code>skillshare audit</code> skill-check) + <strong>AI agent orqali kodni bevosita tekshirtirish</strong>.</td>
    </tr>
    <tr>
      <td><a href="reviews/developer-tools/caveman.md"><strong><code>caveman</code></strong></a></td>
      <td>Skill <em>(+ ixtiyoriy CLI/Proxy)</em></td>
      <td align="center"><strong>8.0/10</strong></td>
      <td align="center"><strong>3.5/10</strong></td>
      <td align="center"><code>👍&nbsp;Yaxshi&nbsp;variant</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000"><code>ASD-STE100</code> asosidagi o'ta qisqa terminal javob rejimi (<code>SKILL.md</code>); o'rnatilsa <code>@caveman-ai/cli</code> telemetriyasi va <code>plugin.json</code> hooklarisiz faqat tozalangan yolg'iz <code>SKILL.md</code> (<code>disable-model-invocation: true</code>) olinishi shart. <strong>O'rniga:</strong> <a href="reviews/architecture/ponytail.md"><strong><code>ponytail</code></strong></a> (ham javobni qisqartiradi, ham ortiqcha kod/diff hajmini kesadi).</td>
    </tr>
    <tr>
      <td><a href="reviews/developer-tools/humanizer-stop-slop.md"><strong><code>humanizer</code> + <code>stop-slop</code></strong></a></td>
      <td>Skill (<code>Markdown</code>)</td>
      <td align="center"><strong>7.5/10</strong></td>
      <td align="center"><strong>2.0/10</strong></td>
      <td align="center"><code>⛔&nbsp;Rad&nbsp;etildi</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Uzun maqola va esselardan AI yozuv shtamplarini tozalaydi (<code>humanizer</code> <code>~32 KB</code>); kod va mahsulot UI'i uchun emas. <strong>O'rniga:</strong> <a href="reviews/architecture/ponytail.md"><strong><code>ponytail</code></strong></a> + <a href="reviews/ui-ux/impeccable.md"><strong><code>impeccable</code></strong></a> (<code>clarify</code>).</td>
    </tr>
    <tr>
      <td><a href="reviews/developer-tools/claude-code-setup.md"><strong><code>claude-code-setup</code></strong></a></td>
      <td>Plugin (Recommender Skill)</td>
      <td align="center"><strong>7.5/10</strong></td>
      <td align="center"><strong>2.0/10</strong></td>
      <td align="center"><code>⛔&nbsp;Rad&nbsp;etildi</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Anthropic'ning yangi repo uchun boshlang'ich Claude Code sozlamalarini tavsiya qiluvchi read-only plagini. <strong>O'rniga:</strong> <a href="reviews/developer-tools/skillshare.md"><strong><code>skillshare</code></strong></a>.</td>
    </tr>
    <tr>
      <td><a href="reviews/developer-tools/omniroute.md"><strong><code>OmniRoute</code></strong></a></td>
      <td>Local Proxy + 44 Admin Skill</td>
      <td align="center"><strong>7.5/10</strong></td>
      <td align="center"><strong>2.0/10</strong></td>
      <td align="center"><code>⛔&nbsp;Rad&nbsp;etildi</code></td>
      <td align="center"><code>2026&#8209;11&#8209;16</code></td>
    </tr>
    <tr>
      <td colspan="6" width="2000">Lokal LLM reverse-proxy (<code>localhost:20128</code>); ichidagi 44 ta skill kodlash uchun emas, uzoq sessiyalarni uzadi (<code>#7287</code>), limitda kuchsiz modelga tushiradi va TLS-stealth (<code>wreq-js</code>) pullik obunalarda ToS ban xavfini tug'diradi. <strong>O'rniga:</strong> <a href="reviews/developer-tools/t3-code.md"><strong><code>T3 Code</code></strong></a> + <a href="reviews/architecture/ponytail.md"><strong><code>ponytail</code></strong></a>.</td>
    </tr>
  </tbody>
</table>

---

<details>
<summary>Global <code>tasted-skills</code>, <code>hacker-test</code> va <code>asset-diet</code> skillarini ulash</summary>

```bash
skillshare install TursunboyevJahongir/tasted-skills -s tasted-skills -s hacker-test -s asset-diet -g && skillshare sync -g
```

</details>
