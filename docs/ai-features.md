# Notely — AI Features Documentation

> Dokumen tunggal yang merangkum seluruh aspek AI Assistant di Notely.
> Bersumber dari: PRD.md, design.md, ARCHITECTURE-SPINE.md, epics.md

---

## 1. Product Vision — AI

AI Assistant adalah **fitur resmi Notely** yang diperhitungkan sejak architecture design, tetapi tidak boleh menghambat core workspace. AI memberikan nilai tambah pada produktivitas pengguna — bukan fitur utama, melainkan *force multiplier*.

AI tidak pernah menulis data langsung ke Firestore — semua perubahan data melalui konfirmasi user terlebih dahulu (AD-6).

---

## 2. Provider & Arsitektur

| Aspek | Detail |
|---|---|
| **Provider** | Google Gemini API |
| **Versi SDK** | `@google/generative-ai` ^0.24.1 |
| **Akses** | Hanya melalui **Cloud Functions proxy** — API key tidak pernah di client |
| **Keamanan Key** | Gemini key di **Secret Manager** (bukan environment variable Functions) |
| **Node Runtime** | Node.js 20+ (Cloud Functions) |

### Diagram Arsitektur AI

```
Client (Flutter) ─── callFunction('aiProxy') ─── Cloud Functions (Gemini proxy) ─── Gemini API
                          │                                            │
                          │                                   verifikasi membership
                          │                                   cek quota (ai_usage)
                          │                                   bangun context server-side
                          │                                   kirim prompt + Gemini key
                          │                                   return structured response
```

### Alasan Cloud Functions Proxy (AD-5)

1. Gemini API key tidak bocor ke client
2. Konteks AI dibangun **server-side sesuai membership** — privasi terjaga
3. Quota di-enforce server-side (tidak bisa di-bypass)
4. Bahasa respons bisa ditentukan server-side dari `users.aiLanguage`

---

## 3. Fase Implementasi

### Fase 1: AI Foundation (P1) — Epic 10

| Story | Deskripsi |
|---|---|
| **10.1** | `aiProxy` Cloud Function + quota 50 req/user/hari |
| **10.2** | Personal AI chat (percakapan dengan AI di personal workspace) |
| **10.3** | Summarize & rewrite note |
| **10.4** | Generate task dari note + confirmation UI |

### Fase 2: Group AI (P2) — Epic 11

| Story | Deskripsi |
|---|---|
| **11.1** | `@NotelyAI` mention di group chat — summarize + draft |
| **11.2** | AI draft → create dengan confirmation UI `[Create] [Cancel]` |

---

## 4. Capabilities Detail

### 4.1 Personal AI (P1)

Tersedia di **Personal Workspace**:

| Feature | Deskripsi |
|---|---|
| **Chat dengan AI** | Percakapan bebas konteks workspace personal |
| **Summarize Note** | Meringkas konten note menjadi poin-poin |
| **Rewrite Note** | Mengubah gaya/tone penulisan note |
| **Generate Tasks** | Membuat draft task dari konten note |

### 4.2 Group AI / @NotelyAI (P2)

Tersedia di **Group Chat**:

| Feature | Deskripsi |
|---|---|
| **Summarize chat** | Merangkum percakapan grup |
| **Answer from workspace** | Menjawab pertanyaan dari konten workspace |
| **Draft task/notes** | Membuat draft task/note dari konteks diskusi |
| **Search info** | Mencari informasi yang tersedia bagi user di workspace |

---

## 5. Data Model — AI

### `ai_usage` collection

```typescript
{
  userId: string,        // {userId}_{date}
  date: string,          // format YYYY-MM-DD
  requestCount: number,   // increment tiap request
  lastRequestAt: Timestamp
}
```

### Quota

| Parameter | Value |
|---|---|
| **Default limit** | 50 requests/user/hari |
| **Enforcement** | Server-side (Cloud Functions transaction) |
| **Configurable** | Ya — via environment/config Functions |

---

## 6. Privacy & Security Rules

### Prinsip (FR-AI3, AD-8, NFR-10)

> **AI tidak boleh membocorkan data personal ke group.**

- Konteks AI dibangun **server-side** di Cloud Functions
- Hanya data yang boleh diakses user (berdasarkan `workspace_members`) yang dikirim ke Gemini
- AI mengikuti **Security Rules yang sama** dengan akses user — tidak ada bypass
- Personal workspace → hanya konten owner
- Group workspace → hanya konten yang visible ke member

### Larangan
- ❌ Gemini dipanggil langsung dari client
- ❌ API key di-hardcode di Flutter
- ❌ AI menulis data tanpa konfirmasi

---

## 7. Confirmation Flow (AD-6)

```
User action ─── callFunction('aiProxy') ─── AI balas DRAFT
                                                    │
                                           [Create Task] [Cancel]
                                                    │
                                               Repository + Rules
                                                    │
                                               Firestore (data jadi)
```

### UI Components (design.md §22)

- **Draft card:** Hasil AI berbentuk kartu draft dengan aksi `[Create] [Cancel]`
- **Loading:** Indikator "AI sedang berpikir…" (skeleton/typing)
- **Error:** Pesan error ramah + retry

---

## 8. Language Support

| Aspek | Detail |
|---|---|
| **Default** | Bahasa Indonesia |
| **Supported** | Minimal ID & EN |
| **Storage** | `users.aiLanguage` field |
| **Group AI** | Mengikuti preference **user yang memanggil** (bukan satu bahasa untuk seluruh workspace) |
| **Implementation** | Epic 7 Story 7.3 (Settings) + Epic 10/11 (passing ke aiProxy) |

---

## 9. Google Integration (Terkait AI)

AI tidak mengakses Google API secara langsung. Google integration (Drive, Calendar) memiliki OAuth flow sendiri yang terpisah dari Gemini.

---

## 10. Arsitektur Detail (Cloud Functions)

### `aiProxy` Function Spec

```typescript
export const aiProxy = onCall(async (request) => {
  // 1. Verifikasi auth
  // 2. Verifikasi membership workspace
  // 3. Cek + increment ai_usage (transaction, 50/hari)
  // 4. Build context dari data workspace (sesuai permission user)
  // 5. Panggil Gemini API
  // 6. Return structured response (draft atau text)
});
```

### Error Handling

| Error | Response |
|---|---|
| Quota exceeded | `QuotaExceeded` — "Kamu sudah mencapai batas penggunaan AI hari ini" |
| No permission | `Unauthorized` — tidak bisa di-bypass |
| Gemini error | `AIError` — pesan ramah + retry |

---

## 11. User Stories AI

| US | Story |
|---|---|
| US-20 | Sebagai pengguna personal, saya ingin chat dengan AI, summarize/rewrite note, dan generate task dari note |
| US-21 | Sebagai member, saya ingin memanggil `@NotelyAI` di group chat untuk merangkum dan membuat draft task |
| US-22 | Sebagai pengguna, saya ingin AI yang mengubah data selalu minta konfirmasi |
| US-23 | Sebagai pengguna, saya ingin AI tidak membocorkan data personal ke group |

---

## 12. Functional Requirements AI

| FR | Deskripsi | Prioritas |
|---|---|---|
| FR-AI1 | AI personal: chat, summarize, rewrite, generate task | P1 |
| FR-AI2 | AI group via `@NotelyAI`: summarize, draft task/notes | P2 |
| FR-AI3 | AI tidak boleh membocorkan data personal ke group | P1 |
| FR-AI4 | Action yang mengubah data butuh konfirmasi user | P1 |
| FR-AI5 | AI memakai quota/usage limit per user (50/hari) | P1 |
| FR-AI6 | Bahasa respons AI mengikuti preference user (default ID) | P0 |

---

## 13. Epic & Story Traceability

| Epic | Stories | Prioritas |
|---|---|---|
| **Epic 7** — Settings | Story 7.3: AI language preference | P0 |
| **Epic 10** — Personal AI | Story 10.1: aiProxy + quota | P1 |
| | Story 10.2: Personal AI chat | P1 |
| | Story 10.3: Summarize/rewrite note | P1 |
| | Story 10.4: Generate task + confirmation | P1 |
| **Epic 11** — Group AI | Story 11.1: @NotelyAI mention + summarize/draft | P2 |
| | Story 11.2: AI draft → create (confirmation) | P2 |

---

## 14. Future AI Scope

- Advanced AI agents & multi-step automation
- AI → Calendar workflow (auto-create events)
- AI → Google Tasks sync
- AI-based search ranking
- Adaptive quota/billing

---

> *Dokumen ini adalah referensi tunggal untuk semua aspek AI di Notely.*
> *Source: PRD.md §18, design.md §22, ARCHITECTURE-SPINE.md AD-5/AD-6/AD-10, epics.md Epic 10-11*
