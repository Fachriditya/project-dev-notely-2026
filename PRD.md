# Notely — Product Requirements Document (PRD)

> **Status:** Draft — menunggu approval sebelum implementasi.
> **Platform:** Mobile (Android utama), Flutter + Dart.
> **Backend/BaaS:** Firebase (Auth, Firestore, Storage, Cloud Messaging).
> **Prinsip:** Simple → Useful → Consistent → Maintainable.

---

## 1. Product Overview

**Notely** adalah aplikasi mobile *personal productivity + collaborative workspace*. Setiap pengguna memiliki **Personal Workspace** privat untuk mengelola catatan, tugas, folder, dan database sederhana, serta dapat membuat atau bergabung dengan **Group Workspace** untuk berkolaborasi dengan orang lain.

Notely terinspirasi konsep aplikasi productivity seperti Notion, tetapi **bukan clone Notion**. Notely punya identitas dan scope sendiri: fokus pada workspace pribadi + kelompok yang ringan, mobile-first, terhubung ekosistem Google, dengan AI assistant sebagai fitur pendukung.

## 2. Product Vision

> **Satu workspace untuk mengatur informasi pribadi dan berkolaborasi dengan kelompok tanpa harus berpindah-pindah aplikasi.**

Contoh nyata — seorang mahasiswa punya:

```
My Workspace
📁 Kuliah
   📁 AI
      📝 Catatan AI
      📋 Tugas AI
      📊 Dataset
📁 Personal
   📝 Personal Notes
   📋 Personal Tasks
```

lalu punya group workspace:

```
Circle Coding
📁 Projects
   📁 Project Alpha
      📝 Planning
      📋 Tasks
      📊 Project Database
📁 Resources
   📄 References
   📁 Files
💬 Group Chat
```

## 3. Problem Statement

Mahasiswa, study group, dan tim kecil saat ini berpindah-pindah antara aplikasi catatan, task manager, spreadsheet, chat, dan drive. Akibatnya:

- Konteks kerja terpecah ke banyak aplikasi.
- Kolaborasi tim kecil membutuhkan alat yang terlalu berat (enterprise).
- Data pribadi dan data kelompok bercampur tanpa batas yang jelas.
- Tidak ada satu tempat yang menghubungkan catatan, tugas, tabel, file, chat, dan kalender.

Notely menyelesaikan ini dengan **satu workspace mobile** yang memisahkan ruang pribadi vs kelompok secara eksplisit, cukup kuat untuk produktivitas, cukup ringan untuk mahasiswa dan tim kecil.

## 4. Target Users

Target awal (MVP):

- University students
- Small teams
- Study groups
- Coding teams
- Project groups
- Individu yang butuh productivity workspace

**Bukan** target MVP: enterprise collaboration platform.

## 5. User Personas

### Persona 1 — Ditya (Mahasiswa, ketua tim coding)
- **Profil:** Mahasiswa yang memimpin kelompok tugas & proyek coding.
- **Kebutuhan:** Mengelola catatan kuliah pribadi, lalu membagi tugas proyek ke anggota kelompok, memantau progress lewat tabel, berdiskusi di chat.
- **Pain point:** Data kuliah pribadi tercampur dengan data kelompok; sulit merangkum diskusi menjadi task.

### Persona 2 — Farrelas (Anggota tim, admin)
- **Profil:** Anggota yang dipercaya mengelola konten dan mengatur isi workspace.
- **Kebutuhan:** Membuat/mengedit konten, mengelola tasks dan notes, membantu mengundang member.
- **Pain point:** Perlu hak lebih dari member biasa tapi tidak perlu kontrol penuh.

### Persona 3 — Shana / Keisha / Cindy (Member)
- **Profil:** Anggota yang fokus mengerjakan task yang ditugaskan.
- **Kebutuhan:** Melihat konten, mengubah status task miliknya, ikut chat.
- **Pain point:** Ingin yang simpel — tidak ingin tersesat di fitur kompleks.

### Persona 4 — Individu (pengguna personal)
- **Profil:** Menggunakan Notely hanya untuk diri sendiri.
- **Kebutuhan:** Catatan, task, tabel, dan file pribadi yang rapi dan privat.

## 6. Goals

1. Memberikan workspace pribadi privat untuk catatan/tugas/tabel/file.
2. Memberikan workspace kelompok dengan folder, notes, tasks, database, files, dan realtime chat.
3. Permission sederhana (Owner / Admin / Member) yang mudah dipahami.
4. Realtime group chat berbasis Firebase.
5. Integrasi Google (Drive & Calendar sebagai P1) tanpa menggantikan Google Workspace.
6. AI assistant (Gemini) yang memahami konteks workspace dan menghormati privasi.
7. Desain mobile-first, light + dark mode, minimal-modern-professional.

## 7. Non-Goals

Notely **bukan**:

- Full Notion clone (tidak ada full editor, formula, relation kompleks, automation, scripting).
- Slack/Discord clone (tidak ada voice/video call, threads kompleks, reaksi kompleks, E2E).
- Google Drive / Docs / Sheets / Calendar clone (tidak membuat editor/spreadsheet/video sendiri).
- Trello clone / full project management platform.
- CRM, ERP, atau enterprise admin platform.
- Offline-first app (Notely adalah **online-first**).

## 8. User Stories

Format: `US-XX — Sebagai <role>, saya ingin <aksi>, sehingga <manfaat>.`

**Autentikasi & Workspace**
- US-01 — Sebagai pengguna, saya ingin sign in dengan Google, sehingga saya bisa masuk dengan akun yang sudah saya punya.
- US-02 — Sebagai pengguna baru, saya ingin otomatis mendapat Personal Workspace, sehingga saya langsung bisa mulai.
- US-03 — Sebagai pengguna, saya ingin membuat Group Workspace, sehingga saya bisa berkolaborasi.
- US-04 — Sebagai Owner/Admin, saya ingin mengundang member via email invitation dan/atau invite link/code, sehingga tim saya bisa bergabung.
- US-05 — Sebagai pengguna, saya ingin menerima undangan workspace (email/link/code) dan bergabung/menolak, sehingga saya punya kendali.
- US-06 — Sebagai Owner, saya ingin mengelola role member, sehingga kontrol akses jelas.

**Folder & Navigasi**
- US-07 — Sebagai pengguna, saya ingin membuat folder & subfolder, sehingga konten saya terstruktur.
- US-08 — Sebagai pengguna, saya ingin melihat daftar workspace & konten lewat navigasi mobile, sehingga saya tidak tersesat.

**Notes**
- US-09 — Sebagai pengguna, saya ingin membuat/membaca/mengedit/menghapus note (title, text, basic formatting, checklist, attachment), sehingga saya bisa mencatat.
- US-10 — Sebagai pengguna, saya ingin pin & archive note, sehingga note penting menonjol dan note lama tidak menghilang.
- US-11 — Sebagai pengguna, saya ingin attach file (Notely/Google) ke note, sehingga konteks lengkap.

**Tasks**
- US-12 — Sebagai pengguna, saya ingin membuat task dengan title, description, status, priority, assignee, deadline, sehingga pekerjaan terdefinisi.
- US-13 — Sebagai member, saya ingin mengubah status task yang ditugaskan ke saya, sehingga progress terupdate.
- US-14 — Sebagai Owner/Admin, saya ingin assign task ke member tertentu di group workspace, sehingga pembagian kerja jelas.

**Database/Table**
- US-15 — Sebagai pengguna, saya ingin membuat database dengan property (Title, Text, Person, Status, Priority, Date, Checkbox), sehingga data terstruktur.
- US-16 — Sebagai pengguna, saya ingin melihat database sebagai Table View (wajib) dan Board View (opsional), sehingga data mudah dibaca.
- US-17 — Sebagai pengguna, saya ingin membuka row sebagai detail dan mengeditnya, sehingga data akurat.

**Group Chat**
- US-18 — Sebagai member, saya ingin mengirim pesan realtime di group chat, sehingga diskusi lancar.
- US-19 — Sebagai member, saya ingin melihat sender & timestamp & indikator unread, sehingga saya tahu konteks pesan.

**AI Assistant**
- US-20 — Sebagai pengguna personal, saya ingin chat dengan AI, summarize/rewrite note, dan generate task dari note, sehingga saya produktif.
- US-21 — Sebagai member, saya ingin memanggil `@NotelyAI` di group chat untuk merangkum percakapan dan membuat draft task, sehingga diskusi jadi actionable.
- US-22 — Sebagai pengguna, saya ingin AI yang mengubah data selalu minta konfirmasi, sehingga tidak ada perubahan tak disengaja.
- US-23 — Sebagai pengguna, saya ingin AI tidak membocorkan data personal ke group, sehingga privasi terjaga.

**Google Ecosystem**
- US-24 — Sebagai pengguna, saya ingin connect Google Drive, browse/search file, dan attach file ke Note/Page (reference), sehingga file Google terhubung tanpa duplikasi.
- US-25 — Sebagai pengguna, saya ingin melihat/membuat event Google Calendar dan mengaitkannya ke task, sehingga jadwal sinkron.
- US-26 — Sebagai pengguna, saya ingin open/attach Google Docs & Sheets (P2), sehingga dokumen terhubung.

**File & Search & Notifikasi**
- US-27 — Sebagai pengguna, saya ingin upload file ke Notely (Firebase Storage) dan mereferensikan file Google, sehingga file terkelola.
- US-28 — Sebagai pengguna, saya ingin global search (notes, tasks, pages, databases, files, workspaces), sehingga saya cepat menemukan.
- US-29 — Sebagai pengguna, saya ingin notifikasi (invitation, task assignment/deadline, chat message, mention, reminder), sehingga saya tidak ketinggalan.

## 9. User Flows

### Flow 1 — Onboarding & Personal Workspace
1. Buka Notely → "Sign in with Google".
2. Firebase Auth membuat/mereturn user → Firestore membuat doc `users` + `workspaces` (type=personal).
3. Landing di Home personal workspace.

### Flow 2 — Buat Group Workspace & Undang Member
1. Create → New Workspace → isi nama → submit.
2. Workspace dibuat, user jadi Owner (doc `workspace_members`).
3. Owner/Admin undang member (email invitation atau invite link/code) → notifikasi/invitation. Invite link/code punya expiration.
4. Member menerima → `workspace_members` ditambah role Member.

### Flow 3 — Buat Note
1. Create → New Note → pilih lokasi (Personal/Group workspace, folder opsional).
2. Isi title + text → simpan → doc `notes` dibuat.
3. Note muncul di folder/daftar.

### Flow 4 — Buat Task & Assign
1. Create → New Task → isi field + assignee (group) → simpan.
2. Doc `tasks` dibuat → notifikasi ke assignee.
3. Assignee mengubah status (Todo → In Progress → Done).

### Flow 5 — Database + Board
1. Create → New Database → definisikan properties.
2. Tambah rows → isi cells.
3. Pilih Table View / Board View (group by Status).

### Flow 6 — Group Chat + AI
1. Buka Chat workspace → kirim pesan realtime.
2. Ketik `@NotelyAI <perintah>`.
3. AI (Cloud Function) membaca konteks workspace → menghasilkan respons/draft.
4. Jika draft mengubah data (mis. task), tampilkan UI konfirmasi `[Create] [Cancel]`.

### Flow 7 — Google Calendar (P1) + Google Meet (P2)
1. Dari task/detail, "Add to Calendar".
2. Cloud Function/OAuth membuat event Google Calendar (opsional conferenceData → Meet link).
3. Event terkait task tersimpan (reference) → user bisa `[Join Meeting]`.

## 10. Functional Requirements

**Autentikasi (FR-A)**
- FR-A1: Sign in via Google (Firebase Authentication + Google Sign-In).
- FR-A2: Session persistent antar pembukaan aplikasi.
- FR-A3: Profil (name, email, photo, user ID) tersimpan di Firestore.

**Workspace (FR-W)**
- FR-W1: Setiap user otomatis punya satu Personal Workspace (private).
- FR-W2: User dapat membuat Group Workspace.
- FR-W3: User dapat bergabung ke Group Workspace via email invitation atau invite link/code (dengan expiration).
- FR-W4: Workspace punya members dengan role Owner/Admin/Member.
- FR-W5: Owner dapat mengubah workspace, meng-archive, dan menghapus workspace; Admin tidak bisa menghapus/meng-archive workspace.

**Folder & Page (FR-F)**
- FR-F1: Folder & subfolder di personal dan group workspace (kedalaman maks. 3 level untuk MVP).
- FR-F2: Page adalah dokumen terstruktur (title + icon + rich content + opsional child pages + links ke Notes/Tasks/Database + attachments); tersedia di Personal & Group Workspace. Editor Page MVP tetap sederhana.

**Notes (FR-N)**
- FR-N1: CRUD note (title, text, basic formatting, checklist sederhana, attachment).
- FR-N2: Search, pin, archive note.
- FR-N3: Note personal private; note group hanya untuk member.

**Tasks (FR-T)**
- FR-T1: Task punya title, description, status (Todo/In Progress/Done), priority (Low/Medium/High), assignee, deadline, createdAt, updatedAt.
- FR-T2: Di group, task bisa diassign ke member.
- FR-T3: Member hanya bisa mengubah status task yang diassign ke dirinya (untuk role Member).

**Database (FR-DB)**
- FR-DB1: Database punya daftar property bertipe: Title, Text, Person, Status, Priority, Date, Checkbox.
- FR-DB2: Setiap row bisa dibuka sebagai detail & diedit.
- FR-DB3: Table View wajib; Board View opsional (group by Status).
- FR-DB4: Tidak ada formula, rollup, relation kompleks, automation, scripting (MVP).

**Group Chat (FR-C)**
- FR-C1: Satu chat per group workspace, realtime (Firestore).
- FR-C2: Pesan punya sender, timestamp, dan indikator unread.

**AI (FR-AI)**
- FR-AI1: AI di personal workspace: chat, summarize note, rewrite note, generate task dari note (P1).
- FR-AI2: AI di group via mention `@NotelyAI`: merangkum, menjawab dari konteks workspace, membuat draft task/notes (P2).
- FR-AI3: AI tidak boleh membocorkan data personal ke group (mengikuti permission & Security Rules).
- FR-AI4: Action yang mengubah data (mis. buat task) membutuhkan konfirmasi user.
- FR-AI5: AI memakai quota/usage limit per user untuk mencegah pemakaian tak terkontrol (MVP: daily limit / basic quota).
- FR-AI6: Bahasa respons AI mengikuti preference user; default Bahasa Indonesia (minimal ID + EN).

**Google (FR-G)**
- FR-G1 (P1): Google Drive — connect, browse, search, open, attach reference ke Note/Page, upload jika memungkinkan.
- FR-G2 (P1): Google Calendar — view, create, edit, delete event; kaitkan ke task/workspace.
- FR-G3 (P2): Google Docs/Sheets — open, attach, create jika API memungkinkan.
- FR-G4 (P2): Google Meet workflow — link conference dibuat via Calendar event.
- FR-G5 (P2): Google Tasks — sinkronisasi jika memungkinkan.
- FR-G6 (Future): Gmail.

**File (FR-FL)**
- FR-FL1: Bedakan Notely File (Firebase Storage) vs Google File (Google Drive, reference).
- FR-FL2: Keduanya bisa direferensikan dari Note/Page/Workspace.
- FR-FL3: Limit upload Notely File = 10 MB per file (MVP); file lebih besar via Google Drive.

**Search (FR-S)**
- FR-S1: Global search di notes, tasks, pages, databases, files, workspaces (MVP: title + basic substring pada text; prioritas title; tidak membangun search engine sendiri).

**Notifikasi (FR-NOT)**
- FR-NOT1: Notifikasi untuk invitation, task assignment/deadline, chat message, mention, reminder kalender (via FCM).

## 11. Non-Functional Requirements

- NFR-01 **Platform:** Flutter + Dart, target Android (arsitektur siap perluas iOS/web).
- NFR-02 **Online-first:** membutuhkan koneksi; tidak ada offline sync pada MVP.
- NFR-03 **Realtime:** group chat realtime via Firestore listeners.
- NFR-04 **Keamanan:** Firebase Security Rules — personal hanya owner, group hanya member authorized; tidak ada `allow read, write: if true`.
- NFR-05 **Performa:** query Firestore dioptimalkan (indexes, pagination, listener lifecycle); target list lancar.
- NFR-06 **Skalabilitas arsitektur:** feature-based organization, tidak over-engineered.
- NFR-07 **Accessibility:** contrast cukup, touch target nyaman, bukan warna sebagai satu-satunya indikator, responsive.
- NFR-08 **Theming:** Light + Dark mode, user bisa pindah mode.
- NFR-09 **Konsistensi:** komponen & design token konsisten di kedua mode.
- NFR-10 **Privacy AI:** AI mengikuti permission user; tidak bypass Security Rules.

## 12. Workspace Model

### A. Personal Workspace
- Otomatis dibuat saat onboarding, 1 per user.
- Berisi: Notes, Pages, Tasks, Databases, Files, Folders.
- Privat — hanya owner yang bisa akses, kecuali dibagikan eksplisit (mekanisme sharing dirancang kemudian / Future Scope).

### B. Group Workspace
- Dibuat oleh user (jadi Owner) atau digabung via invitation.
- Berisi: Overview, Folders, Pages, Notes, Tasks, Databases, Files, Group Chat, Members.
- Akses diatur role (lihat §22).

## 13. Folder & Page Model

- Folder & subfolder di Personal + Group workspace.
- Struktur pohon sederhana: `parentId` nullable, kedalaman maks. 3 level (MVP).
- Konten yang bisa masuk folder: Note, Task, Database, Page.
- **Tidak** membangun filesystem engine kompleks (tanpa move-semantics penuh, tanpa drag-drop antar workspace yang rumit).

### Page vs Note

**Note** = catatan cepat & ringan (*quick capture*): ide, catatan kuliah, reminder, dokumentasi singkat. Struktur: title + content + attachments.

**Page** = dokumen terstruktur & container utama dalam workspace: project overview, dokumentasi teknis, meeting summary, research. Struktur: title + icon + rich content + (opsional) child pages + links ke Notes/Tasks/Database + attachments.

Page tersedia di Personal **dan** Group Workspace. Editor Page MVP tetap sederhana (bukan block-based editor penuh) agar mudah dikembangkan kemudian.

## 14. Notes

- CRUD + search + pin + archive + attach files.
- Editor MVP: title, text, basic formatting (bold/italic/heading/list), checklist sederhana, attachment.
- **Personal Notes:** privat. **Shared Notes:** di group workspace.
- Tidak membuat full Notion editor (tanpa block-based editor, embeds, database-in-note).

## 15. Tasks

Field task:
- `title` (wajib)
- `description`
- `status`: Todo | In Progress | Done
- `priority`: Low | Medium | High
- `assigneeId` (nullable). Di Personal Workspace assignee **tidak diperlukan** — task otomatis milik user (`assigneeId = null`). Di Group Workspace, assignee = workspace member.
- `deadline`
- `createdAt`, `updatedAt`

Contoh tampilan:

```
Task               Assignee      Status
Create Proposal    Ditya         In Progress
Find Dataset       Farrelas      Todo
Create PPT         Shana         Todo
```

## 16. Database / Table

- Database punya schema = daftar property.
- Property MVP: Title, Text, Person, Status, Priority, Date, Checkbox.
- Setiap row dibuka jadi detail.
- Table View wajib; Board View opsional (group by Status). Calendar View = future.

**Tidak** termasuk: formula, rollup, relation kompleks, automation, scripting.

## 17. Group Chat

- Satu chat per group workspace, realtime (Firestore).
- Pesan: `senderId`, `text`, `timestamp`, indikator unread.
- Mendukung mention `@NotelyAI`.

**Tidak** termasuk: voice/video call, complex threads, advanced moderation, complex reactions, E2E messaging.

## 18. AI Assistant

- Provider: **Gemini API**, dipanggil via **Cloud Function** (bukan langsung dari client, agar API key aman).
- AI adalah **fitur resmi Notely** dan diperhitungkan sejak architecture design, tetapi tidak boleh menghambat core workspace.

### Fase Implementasi

**Fase 1 (P1) — AI Foundation:**
- Integrasi arsitektur Gemini + AI service abstraction.
- Personal AI chat dasar, summarize note, rewrite note, generate task dari note.
- Basic AI context (dari konten yang boleh diakses user).

**Fase 2 (P2) — Group AI:**
- `@NotelyAI` di group chat: merangkum percakapan, menjawab dari konteks workspace, membuat draft task/notes, mencari info yang tersedia bagi user.
- AI → Task workflow, AI → Calendar workflow.

### Kuota / Usage Limit
- AI memakai quota sederhana per user (mis. daily request limit / basic per-user quota) untuk mencegah pemakaian tak terkontrol.
- Usage disimpan sederhana; tidak ada sistem billing/subscription kompleks pada MVP. Gunakan free tier Gemini terlebih dahulu jika mencukupi.

### Bahasa
- Bahasa respons AI mengikuti **preference user**; default **Bahasa Indonesia** (minimal Bahasa Indonesia & English).
- AI di Group Workspace mengikuti preference user yang memanggil AI, bukan memaksa satu bahasa untuk seluruh workspace.

### Privacy & Confirmation
- **Privacy:** konteks AI dibangun server-side sesuai membership user; data personal tidak bocor ke group.
- **Confirmation:** perubahan data oleh AI butuh konfirmasi user.

Contoh group:

```
Ditya: @NotelyAI buat task dari percakapan ini.
AI:
  Task Draft — Title: Cari Dataset, Assignee: Farrelas, Deadline: 4 September
  [Create Task] [Cancel]
```

## 19. Google Ecosystem

Notely **menghubungkan** konten Notely ke Google, bukan menggantikan Google Workspace.

| Layanan | Fungsi | Prioritas |
|---|---|---|
| Google Sign-In | Authentication | P0 |
| Google Drive | Connect, browse, search, open, attach reference, upload jika memungkinkan | P1 |
| Google Calendar | View/create/edit/delete event; kaitkan ke task/workspace | P1 |
| Google Docs | Open, attach, create jika API memungkinkan | P2 |
| Google Sheets | Open, attach, create jika memungkinkan | P2 |
| Google Tasks | Task sync satu arah (Notely → Google) | P2 |
| Google Meet | Link conference via Calendar event | P2 |
| Gmail | — | Future |

- **Google Calendar (P1):** view/create/edit/delete event + kaitkan ke task/workspace.
- **Google Meet (P2):** link conference dibuat via Google Calendar event (conference link) — tidak membuat video conferencing system sendiri.

OAuth scopes & API config didokumentasikan (lihat §33 Technical Risks).

## 20. File System

- **Notely File** → Firebase Storage (file disimpan di Notely).
- **Google File** → Google Drive (asli di Drive; Notely menyimpan reference/metadata).

Keduanya bisa direferensikan dari Notes/Pages/Workspace.

- **Limit upload MVP:** 10 MB per file (dapat dinaikkan kemudian). File lebih besar → gunakan Google Drive sebagai alternatif.

## 21. Authentication

- Firebase Authentication + Google Sign-In.
- Profil: name, email, photo URL, user ID.
- Session persistent.

## 22. Roles & Permissions

| Kemampuan | Owner | Admin | Member |
|---|---|---|---|
| Kelola/ubah workspace | ✅ | ❌ | ❌ |
| Undang member | ✅ | ✅ (jika permission diberikan) | ❌ |
| Hapus member / atur role | ✅ | ❌ | ❌ |
| Buat content | ✅ | ✅ | ✅ (jika workspace mengizinkan) |
| Edit content | ✅ | ✅ | ✅ (konten yang boleh diedit) |
| Hapus content | ✅ | ✅ | ❌ |
| Kelola tasks/notes/databases | ✅ | ✅ | ❌ |
| Buat task | ✅ | ✅ | ✅ |
| Ubah task | ✅ | ✅ | ✅ (task miliknya: ubah status) |
| Gunakan group chat | ✅ | ✅ | ✅ |
| Hapus workspace | ✅ | ❌ | ❌ |

Aturan sederhana tambahan (dipakai di Security Rules):
- `canMembersCreate` (boolean workspace setting) — izin member membuat content. Ini **satu toggle per workspace** (bukan per tipe konten) agar permission tetap sederhana di MVP.
- Member hanya mengedit/ubah status task yang `assigneeId == uid`.
- Personal workspace: hanya owner.

### Workspace Lifecycle
- State: `active` | `archived` | `deleted`.
- **Archive** = soft state (workspace dapat dipulihkan / restore). **Delete** = permanent setelah konfirmasi eksplisit.
- Permanent deletion menghapus data workspace (members, folders, pages, notes, tasks, databases, database_rows, messages, metadata). Lifecycle data ditangani backend/Cloud Function — **bukan** cascading deletion dari client.

### Member Keluar / Di-remove
- Data milik workspace tetap milik workspace.
- Task yang di-assign ke member yang keluar menjadi **Unassigned** (tidak dihapus); Owner/Admin dapat meng-assign ulang.
- Notes/Pages/content buatan member tetap di workspace (shared content tidak dihapus hanya karena creator keluar).
- Chat history tetap tersimpan; member yang keluar kehilangan akses workspace.

## 23. Navigation

### Bottom Navigation (5 item)
```
🏠 Home   🔍 Search   ➕ Create   💬 Inbox   👤 Profile
```

### Workspace Navigation (drawer/sidebar, mobile-friendly)
```
NOTELY
MY WORKSPACE
  📄 Pages   📝 Notes   📋 Tasks   📊 Databases   📁 Files

WORKSPACES
  👥 Circle Coding
     📌 Overview  📁 Folders  📄 Pages  📝 Notes  📋 Tasks  📊 Databases  📁 Files  💬 Chat
  👥 Project Alpha
     ...
  ＋ Create Workspace
```

### Create Menu (central)
```
➕ Create
  📝 New Note   📋 New Task   📊 New Database   📁 New Folder   📄 New Page   👥 New Workspace
```
Lokasi content: Personal Workspace atau Group Workspace (pilih saat create).

### Home
```
Good morning, Ditya 👋
Upcoming Tasks — Submit Proposal (Tomorrow)
Recent — Project Notes, Shopping List
Workspaces — Circle Coding, Project Alpha
```

## 24. Notification & Inbox

Jenis notifikasi (via FCM):
- Workspace invitation
- Task assignment
- Task deadline
- Chat message
- Mention
- Calendar-related reminder

**Inbox** = notification/activity center (bagian dari MVP, sesuai bottom navigation). Kategori minimal:
- Workspace invitation
- Task assignment
- Mention
- Important system notification
- Upcoming deadline

Tidak perlu notification center kompleks.

## 25. Firebase Architecture

| Layanan | Penggunaan |
|---|---|
| Firebase Authentication | User auth + Google Sign-In |
| Cloud Firestore | Data aplikasi (realtime listeners) |
| Firebase Storage | Upload file Notely |
| Firebase Cloud Messaging | Push notification |
| Cloud Functions | Proxy Gemini AI + logika server (mis. Google OAuth server-side, invitation) |

### Koleksi Firestore (top-level, untuk queryability)
- `users` — profil user
- `workspaces` — workspace (personal/group)
- `workspace_members` — keanggotaan + role (composite id `{workspaceId}_{userId}`)
- `folders` — folder & subfolder (`parentId`)
- `pages` — konten page
- `notes` — catatan
- `tasks` — task
- `databases` — metadata database + schema properties
- `database_rows` — baris data
- `messages` — pesan group chat (`workspaceId`)
- `notifications` — notifikasi per user
- `files` — metadata file (Notely/Google reference)
- `ai_usage` — pencatatan penggunaan AI per user (quota/limit)
- `invitations` — undangan workspace (email / invite link-code + expiration)
- `users/{userId}/fcm_tokens` — subcollection device token FCM (multi-device push)

## 26. Data Model

Catatan: `id` = document ID; timestamps pakai `Timestamp` Firestore.

**users** `{userId}`
```
name, email, photoUrl, aiLanguage: 'id'|'en', createdAt, personalWorkspaceId
```

**workspaces** `{workspaceId}`
```
name, type: 'personal'|'group', icon, ownerId, status: 'active'|'archived'|'deleted', settings: { canMembersCreate: bool }, createdAt, updatedAt
```

**workspace_members** `{workspaceId}_{userId}`
```
workspaceId, userId, role: 'owner'|'admin'|'member', joinedAt, invitedBy, lastReadAt
```

**folders** `{folderId}`
```
workspaceId, parentId (nullable), name, order, createdAt, updatedAt, createdBy
```

**pages** `{pageId}`
```
workspaceId, folderId (nullable), title, content, icon, createdAt, updatedAt, createdBy
```

**notes** `{noteId}`
```
workspaceId, folderId (nullable), title, text, formatting (JSON), checklist (array), pinned, archived, attachments (array of fileId), createdAt, updatedAt, createdBy
```

**tasks** `{taskId}`
```
workspaceId, folderId (nullable), title, description, status, priority, assigneeId (nullable), deadline (nullable), createdAt, updatedAt, createdBy
```

**databases** `{databaseId}`
```
workspaceId, folderId (nullable), title, icon, properties: [{ id, name, type }], createdAt, updatedAt
```

**database_rows** `{rowId}`
```
databaseId, workspaceId, cells: { <propertyId>: <value> }, order, createdAt, updatedAt, createdBy
```

**messages** `{messageId}`
```
workspaceId, senderId, senderName, senderPhotoUrl, text, type: 'text'|'ai', timestamp, mentions (array)
```

**notifications** `{notificationId}`
```
userId, type, title, body, data (map ref), read, createdAt
```

**files** `{fileId}`
```
workspaceId, ownerId, name, mimeType, size, source: 'notely'|'google', storageRef (nullable), googleFileId (nullable), googleDriveLink (nullable), createdAt, createdBy
```

**ai_usage** `{userId}_{date}`
```
userId, date, requestCount, lastRequestAt
```

**invitations** `{invitationId}`
```
workspaceId, email (nullable), code, createdBy, expiresAt, status: 'pending'|'accepted'|'revoked', createdAt
```

**users/{userId}/fcm_tokens** `{tokenId}`
```
token, platform, lastActiveAt
```

## 27. Security Rules Requirements

Prinsip:
- Personal content (`workspaceId` → workspace type personal) hanya `ownerId == request.auth.uid`.
- Group content hanya anggota authorized workspace dengan role sesuai.
- Role dicek via `workspace_members`.
- Member tidak boleh akses data workspace lain.
- **Dilarang** `allow read, write: if true;` pada final implementation.

Ringkasan aturan per koleksi (akan dijabarkan saat implementasi):
- `users`: user hanya baca/tulis doc miliknya.
- `workspaces` (personal): owner only. `workspaces` (group): baca anggota; tulis owner/admin (per setting).
- `workspace_members`: tulis terbatas owner/admin (invite/role); baca anggota.
- `notes/pages/tasks/databases/database_rows/folders/files`: personal → owner; group → anggota (write sesuai role & `canMembersCreate`; member hanya update task miliknya).
- `messages`: baca/tulis anggota workspace.
- `notifications`: owner user only.

## 28. MVP Scope

MVP = P0 (wajib) + P1 (penting). P2 = extended.

## 29. P0 / P1 / P2 Priorities

**P0 — CORE MVP (wajib)**
- Authentication (Google Sign-In)
- Personal Workspace
- Group Workspace
- Workspace invitation (email + invite link/code)
- Members & Roles (Owner/Admin/Member)
- Folders
- Pages
- Notes
- Tasks
- Basic Database/Table
- Realtime Group Chat
- Inbox
- Firebase Firestore
- Basic Security Rules
- Light Mode
- Dark Mode

**P1 — PRODUCTIVITY + AI FOUNDATION**
- Firebase Storage
- File attachment (limit 10 MB/file)
- Search
- Notifications (FCM)
- Google Drive
- Google Calendar
- Gemini AI foundation
- Personal AI (chat, summarize, generate task)
- AI usage quota

**P2 — ADVANCED COLLABORATION**
- Google Docs
- Google Sheets
- Google Tasks sync (satu arah)
- Google Meet workflow (via Calendar)
- Group AI (`@NotelyAI`)
- AI context-aware group chat
- AI → Task
- AI → Calendar

**FUTURE**
- Gmail integration
- Two-way Google Tasks sync
- Advanced AI agents & automation
- Billing/subscription
- Advanced database relations
- Advanced permissions
- Enterprise features
- iOS & Web support penuh
- Offline support / local cache

> AI & Google ecosystem diperhitungkan sejak architecture design, tetapi implementasi bertahap tidak boleh mengorbankan core MVP.

## 30. Future Scope

- Calendar View untuk database.
- Mekanisme berbagi konten personal secara eksplisit (shared link / per-item share).
- Gmail integration.
- Offline support / local cache.
- Advanced editor (block-based).
- Formula / rollup / relation untuk database.
- Voice/video call & threads & reaksi untuk chat.
- Public/embed page.
- Two-way Google Tasks sync.
- Advanced AI (agent actions multi-step) & automation.
- Billing/subscription (termasuk Gemini quota yang lebih granular).
- Advanced permissions & enterprise features.
- iOS & Web support penuh.
- Template workspace.
- Integrasi pihak ketiga lain (Slack, GitHub, dsb).

> Ide fitur baru di luar requirement → masuk ke sini, **tidak** diimplementasikan tanpa approval.

## 31. Acceptance Criteria

Dokumentasi dianggap selesai bila:
- Tidak ada konflik antar requirement.
- Personal vs Group Workspace jelas dibedakan.
- Permission jelas (Owner/Admin/Member).
- Folder/Page structure jelas.
- Page vs Note jelas dibedakan.
- Notes, Tasks, Database/Table jelas.
- Group Chat jelas.
- AI Personal & AI Group jelas.
- Google integration jelas.
- Firebase architecture jelas.
- Workspace lifecycle (active/archived/deleted) jelas.
- Inbox jelas.
- Light Mode & Dark Mode jelas.
- Color palette jelas.
- Navigation jelas.
- MVP scope & Future scope jelas.
- Tidak ada fitur besar yang muncul tanpa alasan.

## 32. Definition of Done

Untuk tahap dokumentasi ini:
- PRD.md & design.md dibuat dan saling konsisten.
- Seluruh requirement terpetakan ke PRD; seluruh komponen UI terpetakan ke design.
- Ambigu/konflik ditandai (Resolved Decisions / Technical Risks).
- Dokumen direview dan menunggu approval sebelum coding.

## 33. Technical Risks

1. **API key Gemini & biaya** — key tidak boleh di-hardcode di client (Cloud Function proxy); biaya dikontrol via quota per user.
2. **Full-text search di Firestore** — Firestore tidak punya FTS native. Solusi MVP: pencarian title + basic substring (prioritas title) + index; FTS (Algolia dll.) = future.
3. **Google OAuth scopes** — Drive/Calendar/Docs membutuhkan scope sensitif & verifikasi Google. Mitigasi: documentasikan scope, mulai dari scope minimal.
4. **Google Meet link** — `conferenceData` (Meet link otomatis) hanya untuk akun Google Workspace; akun Gmail personal tidak selalu bisa. Mitigasi: fallback ke event kalender biasa.
5. **Firestore Security Rules + role** — kompleksitas role di rules. Mitigasi: role 3 level, rules per koleksi, uji menyeluruh.
6. **Realtime chat biaya/batas** — listener chat bisa mahal. Mitigasi: pagination, batasi listener, unread via counter.
7. **AI privacy** — risiko kebocoran data personal ke group. Mitigasi: context dibangun server-side sesuai membership, rules enforced.
8. **Folder nesting** — risiko over-engineering. Mitigasi: batasi kedalaman 3 level, tanpa engine kompleks.
9. **Workspace deletion** — permanent delete menghapus banyak koleksi. Mitigasi: archive (soft) dulu; delete via Cloud Function, bukan cascading dari client.

## 34. Resolved Decisions (sebelumnya Open Questions)

1. **Invitation:** email invitation + invite link/code (keduanya MVP); link/code punya expiration.
2. **`canMembersCreate`:** satu toggle per workspace (bukan per tipe konten).
3. **Google Tasks sync:** satu arah (Notely → Google); two-way = future scope.
4. **Gemini billing:** quota/usage limit sederhana per user; gunakan free tier dulu.
5. **Archive workspace:** ya — state `active`/`archived`/`deleted`; archive = soft, delete = permanent + konfirmasi.
6. **File upload limit:** 10 MB per file (MVP).
7. **Search MVP:** title + basic substring (prioritas title); tidak membangun search engine sendiri.
8. **Bahasa AI:** mengikuti preference user; default Bahasa Indonesia (minimal ID + EN).

---
