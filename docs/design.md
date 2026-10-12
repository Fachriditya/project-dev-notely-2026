# Notely — Design System Documentation

> **Status:** Draft — konsisten dengan `PRD.md`, menunggu approval.
> **Bahasa desain:** Minimal • Modern • Clean • Productivity • Professional • Calm • Mobile-first.

---

## 1. Design Philosophy

Notely dirancang agar terasa **tenang dan fokus**. Konten adalah bintang; krom UI harus mundur ke belakang. Satu accent color (Indigo `#6366F1`) di atas palet neutral, whitespace lapang, tipografi hierarkis, dan komponen yang konsisten di Light & Dark mode.

Desain harus terasa seperti alat produktivitas yang *polished*, bukan demo Firebase generik.

## 2. Brand Identity

- **Nama:** Notely.
- **Karakter:** minimal, modern, profesional, bersahabat.
- **Voice:** tenang, jelas, produktif — bukan playful berlebihan, bukan korporat kaku.
- **Logo/mark:** ikon catatan/nodus sederhana, monokrom atau accent pada interaksi (dipilih saat implementasi).

## 3. Design Principles

1. **Konten di atas krom** — kurangi dekorasi; utamakan keterbacaan.
2. **Satu accent, banyak neutral** — warna fungsional hanya untuk status/aksi.
3. **Konsistensi** — satu sistem token untuk Light & Dark.
4. **Whitespace adalah struktur** — spacing terukur, bukan isian acak.
5. **State yang bermakna** — hover/pressed/disabled/empty/loading/error selalu jelas.
6. **Mobile-first** — target sentuh nyaman, layout responsif.
7. **Accessible by default** — contrast cukup, bukan hanya warna.

## 4. Color Palette

Semua warna didefinisikan sebagai **design token** (single source of truth) yang di-map otomatis ke tema.

### Primitive Tokens

| Token | Light | Dark |
|---|---|---|
| `bg/primary` | `#FFFFFF` | `#0B0B0F` |
| `bg/secondary` | `#F7F7F8` | `#111116` |
| `bg/surface` | `#FFFFFF` | `#18181D` |
| `border` | `#E5E7EB` | `#29292F` |
| `text/primary` | `#111111` | `#F5F5F5` |
| `text/secondary` | `#6B7280` | `#A1A1AA` |
| `text/muted` | `#9CA3AF` | `#71717A` |
| `accent` (primary) | `#6366F1` | `#818CF8` (brightened untuk contrast) |
| `accent/on` | `#FFFFFF` | `#0B0B0F` |

### Status Tokens

| Token | Light | Dark |
|---|---|---|
| `success` | `#22C55E` | `#4ADE80` |
| `success/bg` | `rgba(34,197,94,.10)` | `rgba(34,197,94,.15)` |
| `warning` | `#F59E0B` | `#FBBF24` |
| `warning/bg` | `rgba(245,158,11,.10)` | `rgba(245,158,11,.15)` |
| `danger` | `#EF4444` | `#F87171` |
| `danger/bg` | `rgba(239,68,68,.10)` | `rgba(239,68,68,.15)` |
| `info` | `#3B82F6` | `#60A5FA` |
| `info/bg` | `rgba(59,130,246,.10)` | `rgba(59,130,246,.15)` |

Status juga diberi varian surface (tint 10–15%) untuk badge, agar **bukan warna sebagai satu-satunya indikator** (selalu sertakan ikon/teks).

## 5. Light Mode

- Background utama putih, surface sekunder `#F7F7F8`.
- Text primary `#111111` di atas putih (contrast ≈ 19:1).
- Accent indigo untuk aksi utama & seleksi.
- Border tipis `#E5E7EB` untuk pemisah kartu/baris.

## 6. Dark Mode

- Background utama `#0B0B0F` (bukan pure black `#000000`), surface `#18181D`.
- Text primary `#F5F5F5`.
- Accent di-brighten ke `#818CF8` agar tetap memenuhi WCAG AA (contrast ≥ 4.5:1 untuk text kecil).
- Border `#29292F`; elevation diganti kontras surface, bukan hanya shadow.

## 7. Typography

**Font family:** Inter (primary), fallback Roboto → system sans. Sumber: Google Fonts / bundled asset.

### Scale (mobile)

| Style | Size | Weight | Line height | Penggunaan |
|---|---|---|---|---|
| Display | 32 | 700 | 40 | Header besar (opsional) |
| Heading 1 | 24 | 700 | 32 | Judul layar |
| Heading 2 | 20 | 600 | 28 | Judul section |
| Heading 3 | 16 | 600 | 24 | Judul kartu |
| Body | 15 | 400 | 22 | Teks utama |
| Body Medium | 15 | 500 | 22 | Teks penting |
| Caption | 13 | 400 | 18 | Meta, timestamp |
| Caption Medium | 13 | 600 | 18 | Label, badge |
| Small | 11 | 500 | 16 | Microcopy, uppercase label |

Catatan: size spasi 4px; gunakan token, jangan hardcode.

## 8. Spacing System

Skala 4px basis (space = 4):

| Token | px |
|---|---|
| `space/1` | 4 |
| `space/2` | 8 |
| `space/3` | 12 |
| `space/4` | 16 |
| `space/5` | 20 |
| `space/6` | 24 |
| `space/8` | 32 |
| `space/10` | 40 |
| `space/12` | 48 |

Padding standar layar: `space/4` (16). Gap antar kartu: `space/3` (12).

## 9. Border Radius

| Token | px | Penggunaan |
|---|---|---|
| `radius/sm` | 8 | chip, input kecil, badge |
| `radius/md` | 12 | tombol, kartu, input |
| `radius/lg` | 16 | kartu besar, bottom sheet, dialog |
| `radius/full` | 999 | avatar, pill, chip round |

## 10. Shadows

Gunakan shadow ringan, hanya Light mode (Dark mode pakai kontras surface + border).

| Token | Elevation | Penggunaan |
|---|---|---|
| `shadow/sm` | 0 1 2 rgba(17,17,17,.06) | kartu |
| `shadow/md` | 0 2 8 rgba(17,17,17,.08) | kartu hover, dialog |
| `shadow/lg` | 0 8 24 rgba(17,17,17,.12) | bottom sheet, FAB menu |

## 11. Icons

- Set: konsisten (mis. Lucide / Material Symbols, outline style).
- Ukuran: 16 (inline), 20 (standar), 24 (nav/aksi besar).
- Icon button minimal touch target 44×44.
- Ikon status selalu disertai teks/badge (bukan hanya warna).

## 12. Buttons

| Varian | Tampilan | Penggunaan |
|---|---|---|
| Primary | bg accent, text `accent/on`, radius 12 | aksi utama |
| Secondary | bg `bg/secondary`, text primary, border `border` | aksi sekunder |
| Ghost | transparan, text accent | aksi ringan |
| Destructive | text `danger` (ghost) / bg `danger` (solid) | hapus |

- Tinggi minimum 44px; padding horizontal 16px.
- State: default, pressed (scale/opacity), disabled (opacity 40%), loading (spinner).
- Satu primary button per layar (hirarki jelas).

## 13. Inputs

- Text field: radius 12, border `border`, focus border `accent` (2px), label di atas / floating.
- Tinggi minimum 44px; padding 12–16px.
- Search bar: field dengan leading ikon search, radius full atau 12, placeholder jelas.
- State: default, focus, error (border `danger` + pesan), disabled.
- Password/secure & auto-correct dikonfigurasi sesuai field.

## 14. Cards

- Surface `bg/surface`, radius 12–16, border `border`, shadow `sm`.
- Struktur: title (Heading 3), subtitle/caption, trailing action.
- Interaksi: tap → press state; card bisa berisi checkbox (note), status badge (task), dsb.

## 15. Notes & Pages

### Note (quick capture)
- **Note card:** title (Body Medium), cuplikan text (Caption, muted), ikon pin, badge archived, thumbnail attachment.
- **Editor:** title besar (Heading 1), text body; toolbar basic formatting (bold/italic/heading/list/checklist) + tombol attachment.
- Checklist: checkbox di depan item; item selesai = text muted + strikethrough.

### Page (dokumen terstruktur)
- **Page card:** ikon + title (Heading 3) + cuplikan content (Caption, muted).
- **Editor:** title besar + icon picker; rich content sederhana (heading/list/formatting), child pages (opsional), links ke Notes/Tasks/Database, attachments.
- Page tersedia di Personal & Group Workspace. Editor Page MVP tetap sederhana (bukan block-based penuh).

## 16. Tasks

- **Task row:** checkbox status di kiri, title, badge priority (ikon+label), assignee avatar, deadline (caption, merah jika lewat).
- **Status:** Todo (default), In Progress (info), Done (success + strikethrough).
- **Priority:** Low (muted), Medium (warning), High (danger) — selalu dengan ikon/label.
- **Detail:** title, description, status selector, priority selector, assignee picker (group), deadline date picker.
- **Assignee:** hanya ditampilkan di Group Workspace; di Personal Workspace field assignee disembunyikan (task otomatis milik user).

## 17. Tables

- Tabel datar dengan header (caption medium, muted), baris berpisah border tipis.
- Kolom property ditampilkan sebagai header; sel bisa teks, badge (status/priority), avatar (person), checkbox, date.
- Kolom pertama = title row; klik baris → buka row detail.
- Scroll horizontal jika kolom melebihi lebar layar; kolom title bisa di-sticky (opsional).

## 18. Database Views

- **Table View (wajib):** lihat §17.
- **Board View (opsional):** kolom = status (Todo/In Progress/Done), card = row (title + badge/avatar). Drag antar kolom (opsional MVP) atau ubah status via menu.
- **Calendar View:** future (tidak diimplementasi MVP).
- View switcher: segmented control / chips di header database.

## 19. Workspace UI

- **Workspace card (Home):** ikon, nama, jumlah member (group), badge role.
- **Overview (group):** ringkasan — member, recent, upcoming tasks, quick links.
- **Members screen:** daftar member dengan avatar + role badge; Owner/Admin melihat aksi invite (email/link/code) & ubah role.
- **Lifecycle:** state `active`/`archived`/`deleted`. Workspace archived ditampilkan di section terpisah ("Archived") dengan aksi restore; delete membutuhkan konfirmasi destruktif.

## 20. Folder UI

- **Folder tree/list:** item folder dengan ikon 📁, nama, chevron; tap → masuk; breadcrumb untuk naik level.
- Breadcrumb: `Workspace / Folder / Subfolder` (truncate tengah jika panjang).
- Menu konteks (long-press/⋮): rename, move, delete (dengan konfirmasi).

## 21. Chat UI

- **Message list:** bubble (sender sendiri = accent surface kanan; orang lain = `bg/secondary` kiri), sender name (group), timestamp caption.
- **Composer:** input teks + tombol kirim; mention `@` memunculkan daftar member + `@NotelyAI`.
- **Unread:** indikator unread per workspace (dot/badge) & divider "pesan baru".
- **AI message:** dibedakan (label `NotelyAI`, avatar/ikon khusus, gaya kartu).

## 22. AI UI

- **Personal AI (P1):** chat dengan identitas AI jelas; tombol Summarize/Rewrite di note; Generate Tasks di note.
- **Draft card (group, P2):** hasil AI berbentuk kartu draft (mis. Task Draft) dengan `[Create] [Cancel]` — perubahan data butuh konfirmasi.
- **Language:** AI mengikuti preference user (default Bahasa Indonesia; minimal ID + EN).
- **Loading:** indikator "AI sedang berpikir…" (skeleton/typing).
- **Error:** pesan error ramah + retry.

## 23. File UI

- **File list:** ikon mime, nama, ukuran, sumber (badge "Notely" / "Google Drive").
- **Attach:** bottom sheet pilih sumber (Notely upload / Google Drive picker).
- **Google file:** ditampilkan dengan badge Google; aksi open/download.

## 24. Google Integration UI

- **Connect state:** tombol "Connect Google Drive/Calendar" + status connected.
- **Drive picker (P1):** daftar file/folder + search bar + breadcrumb (browse).
- **Calendar (P1):** daftar event (tanggal, judul); aksi create/edit/delete; kaitkan event ke task/workspace.
- **Google Meet (P2):** link conference muncul via Google Calendar event; tombol `[Join Meeting]` untuk event ber-Meet. Tidak membuat video conferencing sendiri.

## 25. Bottom Navigation & Inbox

- 5 item: Home, Search, Create, Inbox, Profile.
- Ikon outline; item aktif = filled + accent; label kecil.
- **Create** = tombol tengah (bisa elevated/emphasized) yang membuka Create menu.
- Tinggi bar ~56–64px + safe area; selalu di atas.

**Inbox** (tab ke-4) = notification/activity center (MVP):
- Item: ikon kategori + title + body singkat + timestamp (relatif).
- Kategori minimal: workspace invitation, task assignment, mention, system notification, upcoming deadline.
- Badge unread (dot/count) di ikon Inbox.
- Unread vs read state dibedakan (bg surface vs muted); tap → arahkan ke konten terkait.

## 26. Sidebar / Drawer

- Drawer kiri (mobile) berisi:
  - Header "NOTELY" (brand).
  - Section "MY WORKSPACE": Pages, Notes, Tasks, Databases, Files.
  - Section "WORKSPACES": daftar group (ikon, nama) → sub-item Overview/Folders/Pages/Notes/Tasks/Databases/Files/Chat.
  - "＋ Create Workspace".
- Item aktif = accent background 10% + text accent + indikator kiri.
- Akses lewat hamburger/avatar di top bar.

## 27. Search

- Layar/top search bar global; hasil dikelompokkan: Notes, Tasks, Pages, Databases, Files, Workspaces.
- Hasil = kartu ringkas (title + snippet + type icon).
- State: empty (ajakan), loading (skeleton), no-result ("Tidak ditemukan").

## 28. Dialog

- Alert dialog: title, body, aksi (1–2 tombol). Radius 16, shadow md, overlay scrim.
- Konfirmasi destruktif: tombol destruktif merah + batal.
- Dialog dipakai untuk konfirmasi penting (hapus, keluar workspace, konfirmasi AI action).

## 29. Bottom Sheet

- Untuk pilihan kontekstual: Create menu, attach sumber, pilih lokasi content, pilih status/priority/assignee.
- Radius atas 16, handle bar, dapat di-scroll; dismiss swipe/tap scrim.

## 30. Empty States

- Ikon netral + judul + deskripsi singkat + CTA (tombol).
- Contoh: "Belum ada notes — Buat note pertama".
- Tidak pernah halaman kosong tanpa arahan.

## 31. Loading States

- Skeleton (shimmer) untuk list/kartu saat fetch pertama.
- Spinner untuk aksi (tombol submit).
- Indikator typing untuk AI.

## 32. Error States

- Pesan error jelas + aksi retry.
- Error koneksi, permission, dan API dipisah pesannya.
- Jangan tampilkan stack trace ke user.

## 33. Accessibility

- Contrast text ≥ 4.5:1 (body), ≥ 3:1 (large text/UI).
- Touch target ≥ 44×44px.
- Warna bukan satu-satunya indikator (selalu ikon/teks untuk status).
- Teks scalable (support font scaling).
- Dark mode tetap usable (contrast diuji ulang).
- Focus/state terlihat untuk keyboard & screen reader (semantic labels).

## 34. Responsive Rules

- Mobile-first (lebar < 600px): single column, bottom nav, drawer.
- Tablet/landscape (600–900px): dua kolom (drawer tetap / rail), list + detail side-by-side.
- Layar besar (> 900px): rail/sidebar persistent, 3 kolom untuk chat/database (future web).

## 35. Example Wireframes / Screen Descriptions

### 35.1 Home
```
┌──────────────────────────┐
│ ☰  Good morning, Ditya 👋  ⚙ │
├──────────────────────────┤
│ UPCOMING TASKS            │
│ [✓] Submit Proposal  • Tom. │
│ [✓] Cari Dataset    • Jum.  │
│ RECENT                    │
│ [📝 Project Notes]         │
│ [📝 Shopping List]         │
│ WORKSPACES                │
│ [👥 Circle Coding  3 memb]  │
│ [👥 Project Alpha  5 memb]  │
├──────────────────────────┤
│ 🏠   🔍   ➕   💬   👤      │
└──────────────────────────┘
```

### 35.2 Workspace / Folder
```
┌──────────────────────────┐
│ ← Circle Coding / Projects │
│ [📁 Project Alpha]         │
│ [📝 Planning]              │
│ [📋 Tasks]                 │
│ [📊 Project Database]      │
├──────────────────────────┤
│ 🏠   🔍   ➕   💬   👤      │
└──────────────────────────┘
```

### 35.3 Create Menu (bottom sheet)
```
┌──────────────────────────┐
│       ───── (handle)      │
│ ➕ Create                 │
│ 📝 New Note               │
│ 📋 New Task               │
│ 📊 New Database           │
│ 📁 New Folder             │
│ 📄 New Page               │
│ 👥 New Workspace          │
└──────────────────────────┘
```

### 35.4 Task Detail
```
┌──────────────────────────┐
│ ← Task                    │
│ Title: Cari Dataset       │
│ Status: [In Progress ▾]    │
│ Priority: [● High ▾]       │
│ Assignee: [👤 Farrelas ▾]  │
│ Deadline: 4 Sep            │
│ Description: ...           │
│ [Add to Calendar]          │
└──────────────────────────┘
```

### 35.5 Database — Table View
```
┌──────────────────────────┐
│ ← Project Tasks [Table|Board] │
│ Task | Assignee | Status | ... │
│ Proposal | Ditya | In Prog |   │
│ Dataset  | Farrelas | Todo |   │
│ PPT      | Shana | Todo |      │
└──────────────────────────┘
```

### 35.6 Group Chat + AI
```
┌──────────────────────────┐
│ ← Circle Coding 💬        │
│ Ditya: @NotelyAI buat task │
│ 🤖 NotelyAI:              │
│  Task Draft — Cari Dataset │
│  Assignee: Farrelas        │
│  Deadline: 4 Sep           │
│  [Create Task] [Cancel]    │
│ [_________________ ➤]      │
└──────────────────────────┘
```

### 35.7 Profile / Settings
```
┌──────────────────────────┐
│ 👤 Ditya (Owner)          │
│ ditya@notely.app          │
│ ─────────────────         │
│ Appearance: [Light|Dark]   │
│ Connected: Google Drive ✓  │
│            Google Cal ✓    │
│ Sign out                  │
└──────────────────────────┘
```

### 35.8 Inbox
```
┌──────────────────────────┐
│ ← Inbox                   │
│ [All] [Mentions]          │
│ 🔔 Ditya assigned you     │
│    "Cari Dataset" · 5m    │
│ 👥 Invited to Circle      │
│    Coding · 20m           │
│ 💬 Farrelas mentioned you │
│    · 1h                   │
│ 📅 Deadline: Submit PPT   │
│    · Tomorrow             │
└──────────────────────────┘
```

### 35.9 Search
```
┌──────────────────────────┐
│ 🔍 Search…                │
│ NOTES                     │
│  [📝 Project Notes]        │
│  [📝 Shopping List]        │
│ TASKS                     │
│  [📋 Submit Proposal]      │
│ DATABASES                 │
│  [📊 Project Database]     │
└──────────────────────────┘
```

### 35.10 Members
```
┌──────────────────────────┐
│ ← Members        [Invite] │
│ 👤 Ditya      [Owner]     │
│ 👤 Farrelas   [Admin]     │
│ 👤 Shana      [Member]    │
│ 👤 Keisha     [Member]    │
│ 👤 Cindy      [Member]    │
└──────────────────────────┘
```

### 35.11 Files
```
┌──────────────────────────┐
│ ← Files          [Upload] │
│ 📄 References.pdf · 2.1MB │
│    [Notely]               │
│ 📊 Dataset.csv · 8.0MB    │
│    [Google Drive]         │
│ 📄 Slides.pptx · 4.3MB    │
│    [Notely]               │
└──────────────────────────┘
```

### 35.12 Google Drive Picker
```
┌──────────────────────────┐
│ ← My Drive    🔍          │
│ 📁 Projects               │
│ 📁 Kuliah                 │
│ 📄 Proposal.docx          │
│ 📊 Data.xlsx              │
│ [Cancel]      [Attach]    │
└──────────────────────────┘
```

### 35.13 Google Calendar
```
┌──────────────────────────┐
│ ← Calendar       [+ Event]│
│ 📅 4 Sep — Submit Proposal│
│ 📅 6 Sep — Meeting        │
│    [Join Meeting]         │
│ 📅 8 Sep — Review         │
└──────────────────────────┘
```

---
