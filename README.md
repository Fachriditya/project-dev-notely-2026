# Notely

Aplikasi mobile **personal + collaborative workspace** (Flutter + Firebase).
Satu workspace untuk catatan, tugas, tabel, file, dan chat kelompok — memisahkan
ruang **Personal** vs **Group** secara eksplisit.

> Dokumentasi produk & desain: `PRD.md`, `design.md`.
> Arsitektur & spec: `_bmad-output/`.

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
# 1. Aktifkan dependency
flutter pub get

# 2. (WAJIB) Generate Firebase client options untuk project nyata
#    Saat ini lib/firebase_options_{dev,prod}.dart adalah STUB placeholder.
#    Setelah project Firebase `notely-dev` dan `notely-prod` tersedia:
dart pub global activate flutterfire_cli
flutterfire configure --project=notely-dev --platforms=android,ios --out=lib/firebase_options_dev.dart
flutterfire configure --project=notely-prod --platforms=android,ios --out=lib/firebase_options_prod.dart

# 3. Login Firebase & set project alias (opsional, untuk deploy)
firebase login
firebase use notely-dev
```

## Menjalankan aplikasi

```bash
# Dev flavor (Firebase Emulator Suite — Firestore 8080, Auth 9099, Storage 9199, Functions 5001)
flutter run -t lib/app/main.dart --dart-define=FLAVOR=dev

# Prod flavor (project notely-prod)
flutter run -t lib/app/main.dart --dart-define=FLAVOR=prod
```

> Entrypoint ada di `lib/app/main.dart` (bukan `lib/main.dart`), sehingga
> perintah `flutter run` memakai `-t lib/app/main.dart`.

### Emulator Suite (dev)

```bash
# Jalankan emulator dari root proyek (lihat firebase.json)
firebase emulators:start
```

Host emulator dari app: `10.0.2.2` (Android emulator) — overridable via
`--dart-define=EMULATOR_HOST=localhost` untuk desktop/web.

## Verifikasi

```bash
flutter analyze
flutter test
```

## Struktur (feature-first, 3 layer)

```text
lib/
  app/            # composition root: main, app, bootstrap, router, theme, di, env
  core/           # shared: errors, widgets, utils, network
  features/       # satu folder per fitur: <feature>/{presentation,domain,data}
  firebase_options_dev.dart
  firebase_options_prod.dart
```

Arsitektur mengikuti `ARCHITECTURE-SPINE.md` (AD-1…AD-10):
`presentation → domain ← data`, Firestore sebagai single source of truth, akses
Firestore hanya lewat repository, dan **tanpa** `allow read, write: if true`.

## Catatan keamanan

- Gemini API key & OAuth secret/refresh token **hanya** di Cloud Functions
  (Secret Manager) — tidak pernah di client.
- File `firebase_options_*.dart` berisi konfigurasi client-safe (bukan rahasia),
  tetapi nilai saat ini adalah placeholder dan harus di-regenerate sebelum dipakai.
