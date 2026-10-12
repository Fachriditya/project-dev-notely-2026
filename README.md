# Notely

Aplikasi mobile **personal + collaborative workspace** (Flutter + Firebase).
Satu workspace untuk catatan, tugas, tabel, file, dan chat kelompok — memisahkan
ruang **Personal** vs **Group** secara eksplisit.

> Dokumentasi lengkap ada di [`docs/`](./docs/):
> - [`docs/PRD.md`](./docs/PRD.md) — Product Requirements Document
> - [`docs/design.md`](./docs/design.md) — Design System & Wireframes
> - [`docs/ai-features.md`](./docs/ai-features.md) — AI Features Documentation
> - [`docs/README.md`](./docs/README.md) — Panduan setup & development

---

## Prasyarat

| Alat | Versi | Catatan |
| --- | --- | --- |
| Flutter | 3.47.2 (stable) | `flutter --version` |
| Dart | 3.13.2 | bundled dengan Flutter |
| Java | 17+ | untuk build Android |
| Android SDK | — | untuk `flutter run` di emulator Android |
| Firebase CLI | terbaru | untuk deploy rules/emulator |
| FlutterFire CLI | terbaru | untuk generate `firebase_options_*.dart` |

## Setup pertama kali

```bash
flutter pub get
```

Untuk konfigurasi Firebase lengkap, lihat [`docs/README.md`](./docs/README.md).

## Menjalankan aplikasi

```bash
# Dev flavor (Firebase Emulator Suite)
flutter run -t lib/app/main.dart --dart-define=FLAVOR=dev

# Prod flavor
flutter run -t lib/app/main.dart --dart-define=FLAVOR=prod
```

> Entrypoint ada di `lib/app/main.dart`.

## Struktur (feature-first, 3 layer)

```text
lib/
  app/            # composition root: main, app, bootstrap, router, theme, di, env
  core/           # shared: errors, widgets, utils, network
  features/       # satu folder per fitur: <feature>/{presentation,domain,data}
```

Arsitektur mengikuti `ARCHITECTURE-SPINE.md` (AD-1..AD-10):
`presentation -> domain <- data`, Firestore sebagai single source of truth, akses
Firestore hanya lewat repository, dan **tanpa** `allow read, write: if true`.

## Verifikasi

```bash
flutter analyze
flutter test
```

---

> Repo: https://github.com/Fachriditya/project-dev-notely-2026
