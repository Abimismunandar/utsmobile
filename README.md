# UTS Flutter: 3 Halaman (Login, Dashboard, Profil)

Proyek ini mengimplementasikan 3 halaman sesuai spesifikasi:
- Halaman Login: judul “Selamat Datang”, deskripsi singkat, gambar/logo dummy, TextField email/username dan password dengan ikon, tombol Login.
- Halaman Dashboard: AppBar dengan judul dan ikon notifikasi, header sapaan “Halo, {nama}”, banner gambar di atas, Grid menu 3 item (Profil, Data, Pengaturan).
- Halaman Profil: avatar, teks nama, NIM/ID, email, Row kecil Prodi – Semester, tombol kembali.

File utama: [lib/main.dart](lib/main.dart)
- Titik awal aplikasi: [dart.main()](lib/main.dart:3)
- Root widget: [dart.MyApp()](lib/main.dart:8) → home: Login
- Login page: [dart.LoginPage()](lib/main.dart:25)
- Dashboard: [dart.DashboardPage()](lib/main.dart:113)
- Profil: [dart.ProfilePage()](lib/main.dart:248)

Fitur yang dipenuhi:
- Text, Gambar (FlutterLogo sebagai dummy), Icon, Column dan Row, Navigator (pushReplacement, push, pop).

## Cara Menjalankan

Prasyarat:
- Flutter SDK terinstal (minimal sesuai `environment` pada pubspec).
- Pastikan perangkat/emulator/Chrome terdeteksi.

Langkah umum:
1. Install dependency
   ```
   flutter pub get
   ```
2. Menjalankan di perangkat/emulator (pilih salah satu):
   - Android (emulator/perangkat):
     ```
     flutter run
     ```
   - Web (Chrome):
     ```
     flutter config --enable-web
     flutter run -d chrome
     ```
   - Windows:
     ```
     flutter run -d windows
     ```
   - iOS/macOS (hanya di macOS):
     ```
     flutter run -d ios
     flutter run -d macos
     ```

Catatan aset:
- Tidak membutuhkan aset lokal tambahan karena memakai FlutterLogo sebagai gambar/banner. Tidak perlu mengubah [pubspec.yaml](pubspec.yaml).

## Alur Penggunaan

- Login:
  - Isi Email/Username dan Password, lalu tekan tombol Login.
  - Jika Email/Username dikosongkan, aplikasi akan menggunakan nama default “Andi” dan email `andi@example.com`.
  - Navigasi ke Dashboard menggunakan [dart.Navigator.pushReplacement()](lib/main.dart:43).
- Dashboard:
  - AppBar memiliki ikon notifikasi.
  - Banner gambar dummy di bagian atas.
  - Grid menu 3 item:
    - Profil (ikon person): akan membuka halaman Profil menggunakan [dart.Navigator.push()](lib/main.dart:176).
    - Data (ikon list): menampilkan SnackBar.
    - Pengaturan (ikon settings): menampilkan SnackBar.
- Profil:
  - Menampilkan avatar dummy, nama, NIM/ID, dan email.
  - Baris info Prodi – Semester dalam [dart.Row](lib/main.dart:290).
  - Tombol “Kembali ke Dashboard” menggunakan [dart.Navigator.pop()](lib/main.dart:303).

## Troubleshooting “Layar Putih/Blank”

Jika saat dijalankan hanya tampil layar putih, coba langkah berikut:
1. Bersihkan build dan ambil ulang dependency:
   ```
   flutter clean
   flutter pub get
   ```
2. Untuk Web:
   - Jalankan:
     ```
     flutter run -d chrome
     ```
   - Buka DevTools (F12) dan cek Console untuk error.
3. Pastikan titik masuk aplikasi benar:
   - Fungsi [dart.main()](lib/main.dart:3) memanggil `runApp(const MyApp());`
   - `home` di [dart.MyApp.build()](lib/main.dart:12) mengarah ke [dart.LoginPage()](lib/main.dart:25).
4. Pastikan device terdeteksi:
   ```
   flutter devices
   ```
   Jika kosong, jalankan emulator atau sambungkan perangkat/aktifkan Chrome (web).
5. Jika masih blank:
   - Coba nonaktifkan cache hot-reload dengan hot-restart (Shift+R di terminal flutter run) atau hentikan dan jalankan ulang.
   - Pastikan versi Flutter stabil dan lulus `flutter doctor`.
   - Tutup tab Chrome lama yang masih menayangkan instance sebelumnya.

## Struktur Utama Kode

- [lib/main.dart](lib/main.dart)
  - [dart.MyApp()](lib/main.dart:8): MaterialApp (Material 3), tema, dan `home: LoginPage`.
  - [dart.LoginPage()](lib/main.dart:25): UI Login (Text, FlutterLogo, TextField + Icon, Button).
  - [dart.DashboardPage()](lib/main.dart:113): AppBar + banner + Grid menu 3 item.
  - [dart.ProfilePage()](lib/main.dart:248): Avatar + detail profil + Row info Prodi–Semester + tombol kembali.

Aplikasi siap dijalankan tanpa konfigurasi aset tambahan.

## Screenshots

Berikut tangkapan layar aplikasi (Login, Dashboard, Profil). Simpan file gambar ke folder `docs/screenshots` agar tautan berikut tampil:

- Login
  ![WhatsApp Image 2025-11-05 at 23 08 39](https://github.com/user-attachments/assets/a1d826ea-5d2c-46ef-af23-6629a1de0b1a)


- Dashboard
  ![WhatsApp Image 2025-11-05 at 23 09 45](https://github.com/user-attachments/assets/12086c01-e2d9-4943-9b14-2b6217b716f4)


- Profil
  ![WhatsApp Image 2025-11-05 at 23 10 03](https://github.com/user-attachments/assets/b18c6c93-e3e2-436c-8f17-392df8347687)



