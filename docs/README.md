# Notely — Dokumentasi

## Daftar Dokumen

| Dokumen | Deskripsi |
|---|---|
| [`PRD.md`](./PRD.md) | Product Requirements Document — visi, user stories, requirements, data model |
| [`design.md`](./design.md) | Design System & Wireframes — color tokens, typography, spacing, 13 wireframes |
| [`ai-features.md`](./ai-features.md) | AI Features — arsitektur, capabilities, privacy, quota, traceability |
| [`firestore.rules`](./firestore.rules) | Firebase Security Rules |
| [`firestore.indexes.json`](./firestore.indexes.json) | Firestore composite indexes |
| [`storage.rules`](./storage.rules) | Firebase Storage rules |
| [`firebase.json`](./firebase.json) | Firebase project configuration |

## Setup Firebase

### Prasyarat
- Firebase CLI terinstall
- FlutterFire CLI terinstall
- Akses ke Firebase project `notely-dev` dan `notely-prod`

### Generate Firebase Options

```bash
flutterfire configure --project=notely-dev --platforms=android,ios --out=lib/firebase_options_dev.dart
flutterfire configure --project=notely-prod --platforms=android,ios --out=lib/firebase_options_prod.dart
```

### Emulator Suite (dev)

```bash
firebase emulators:start
```

Host emulator: `10.0.2.2` (Android emulator) — overridable via `--dart-define=EMULATOR_HOST=localhost`.

## Architecture Planning

Dokumentasi perencanaan arsitektur (output BMad Method) ada di:
- `_bmad-output/planning-artifacts/` — architecture spine, epics, IR reports
- `_bmad-output/specs/` — SPEC
- `_bmad-output/implementation-artifacts/` — story implementation docs

> Catatan: Folder `_bmad-output/` tidak masuk git — hanya untuk referensi lokal.
