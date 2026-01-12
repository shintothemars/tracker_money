# 💰 tracker_money - Aplikasi Pencatat Keuangan

<div align="center">
<img width="720" height="1600" alt="Screenshot_20260111-164004" src="https://github.com/user-attachments/assets/3adda7da-a853-4e8f-9b6a-be0636e604d2" />

![WhatsApp Image 2026-01-12 at 16 05 30 (1)](https://github.com/user-attachments/assets/8a325f1c-87e9-4038-b71e-fb5d53e03fd2)
![WhatsApp Image 2026-01-12 at 16 05 29](https://github.com/user-attachments/assets/0451fadc-2911-442f-8269-4a97575e5bd4)
<img width="720" height="1600" alt="Screenshot_20260111-164031" src="https://github.com/user-attachments/assets/30c312f2-cb2f-4aaf-b1ed-fe5c802dfbaa" />
![WhatsApp Image 2026-01-12 at 16 05 30](https://github.com/user-attachments/assets/efc66874-b81c-4cbf-961c-6bab0dcb150d)

![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?style=for-the-badge&logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?style=for-the-badge&logo=dart)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

**Aplikasi pencatat keuangan modern untuk mahasiswa kos-kosan dengan fitur CRUD lengkap, visualisasi pie chart, dan fitur inovatif!**

[Fitur](#-fitur-utama) • [Instalasi](#-instalasi) • [Penggunaan](#-cara-penggunaan) • [Dokumentasi](#-dokumentasi)

</div>

---

## 📖 Tentang Aplikasi

**tracker_money** (uangku) adalah aplikasi mobile untuk pencatatan keuangan pribadi yang dirancang khusus untuk mahasiswa kos-kosan. Aplikasi ini membantu Anda mengelola pemasukan dan pengeluaran dengan mudah, dilengkapi visualisasi data yang menarik dan fitur-fitur inovatif.

### 🎯 Kenapa tracker_money?

- ✅ **Mudah Digunakan** - Interface intuitif dan user-friendly
- 📊 **Visualisasi Menarik** - Pie chart animasi untuk analisis keuangan
- 💾 **Data Aman** - Tersimpan lokal di perangkat dengan SharedPreferences
- 🚀 **Fitur Lengkap** - CRUD, statistik, budget tracking, dan lebih banyak lagi
- 🎨 **Desain Modern** - UI/UX clean dengan animasi smooth

---

## ✨ Fitur Utama

### 🔄 CRUD Transaksi Lengkap
- **Create** - Tambah transaksi pemasukan/pengeluaran dengan mudah
- **Read** - Lihat semua transaksi dengan detail lengkap
- **Update** - Edit transaksi yang sudah ada (swipe left → edit)
- **Delete** - Hapus transaksi yang tidak diperlukan (swipe left → delete)
- **Data Persistence** - Data tersimpan permanen di perangkat

### 📊 Statistik & Visualisasi
- **Animated Pie Charts** - Grafik tumbuh dengan animasi smooth (1.5 detik)
- **Interactive Touch** - Sentuh bagian chart untuk highlight & detail
- **Color-coded Categories** - 10 warna untuk expense, 8 warna untuk income
- **Detailed Legend** - Emoji, nama kategori, nilai, dan persentase
- **Pull to Refresh** - Tarik ke bawah untuk update data

### 💰 Budget Tracking
- Set budget bulanan dengan mudah
- Progress bar real-time dengan color-coded status:
  - 🟢 **Hijau** (< 80%) - Aman
  - 🟠 **Orange** (80-100%) - Peringatan
  - 🔴 **Merah** (> 100%) - Melebihi Budget
- Tampilan sisa budget yang jelas

### 🚀 Fitur Inovatif

#### 📱 Share to WhatsApp
Export laporan keuangan dan share langsung ke WhatsApp dengan format profesional:
- Generate laporan otomatis dengan emoji
- Format rapi dan mudah dibaca
- Breakdown per kategori dengan persentase
- Summary total pemasukan, pengeluaran, saldo

#### 📄 Export to PDF
Generate laporan keuangan profesional dalam format PDF:
- Layout profesional dengan header & footer
- Summary cards (Income, Expense, Balance)
- Tabel kategori dengan persentase
- Daftar transaksi lengkap (max 50)
- Bisa disimpan atau dibagikan via email/cloud

#### 🔔 Smart Budget Reminder
Sistem notifikasi pintar untuk membantu Anda konsisten:
- **Daily Reminder** - Pengingat harian untuk input transaksi (custom waktu)
- **Budget Alert** - Peringatan otomatis saat mendekati/melebihi budget
  - 80%: ⚠️ Peringatan Budget
  - 90%: ⚠️ Budget Hampir Habis!
  - 100%: ⚠️ Budget Terlampaui!

---

## 🎨 Kategori Transaksi

### 💸 Pengeluaran (Expense)
- 🍔 **Makanan** - Makan, snack, minuman
- 🚗 **Transportasi** - Angkot, bensin, ojek online
- 📚 **Pendidikan** - Buku, fotokopi, pulsa internet
- 🎮 **Hiburan** - Nonton, game, hobi
- 💊 **Kesehatan** - Obat, dokter, vitamin
- 🛍️ **Belanja** - Pakaian, sepatu, aksesoris
- 📄 **Tagihan** - Kos, listrik, air
- 📌 **Lainnya** - Kategori lain

### 💰 Pemasukan (Income)
- 💰 **Gaji** - Freelance, part-time
- 💵 **Uang Saku** - Dari orang tua
- 📌 **Lainnya** - Sumber lain

---

## 🚀 Instalasi

### Prasyarat
- Flutter SDK 3.0 atau lebih baru
- Dart SDK 3.0 atau lebih baru
- Android Studio / VS Code
- Emulator atau perangkat fisik

### Langkah Instalasi

1. **Clone Repository**
   ```bash
   git clone https://github.com/shintothemars/tracker_money.git
   cd tracker_money
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Run Aplikasi**
   ```bash
   flutter run
   ```

### Build APK

Untuk membuat APK release:

```bash
# Windows
BUILD_APK.bat

# Manual
flutter build apk --release
```

APK akan tersimpan di: `build/app/outputs/flutter-apk/app-release.apk`

---

## 📱 Cara Penggunaan

### ➕ Menambah Transaksi
1. Tap tombol **+** di tengah bottom navigation
2. Pilih tipe: **Pemasukan** atau **Pengeluaran**
3. Isi form:
   - **Judul**: Nama transaksi (contoh: "Makan Siang")
   - **Jumlah**: Nominal (contoh: 25000)
   - **Kategori**: Pilih dari chip (Makanan, Transport, dll)
   - **Tanggal**: Pilih tanggal transaksi
   - **Catatan**: Opsional, tambah keterangan
4. Tap **Simpan Transaksi**
5. ✅ Data tersimpan otomatis!

### 📊 Melihat Statistik
1. Tap tab **Statistik** (icon pie chart)
2. Lihat:
   - 💰 **Summary Cards**: Total pemasukan & pengeluaran
   - 📊 **Pie Chart Pengeluaran**: Breakdown per kategori
   - 📈 **Pie Chart Pemasukan**: Breakdown per kategori
   - 📋 **Legend**: Detail kategori dengan emoji & nilai
3. **Sentuh** bagian chart untuk highlight
4. **Tarik ke bawah** untuk refresh data

### ✏️ Mengedit Transaksi
1. Di halaman **Beranda**, swipe transaksi ke kiri
2. Tap icon **Edit** (pencil)
3. Ubah data yang diinginkan
4. Tap **Simpan Transaksi**
5. ✅ Data terupdate!

### 🗑️ Menghapus Transaksi
1. Di halaman **Beranda**, swipe transaksi ke kiri
2. Tap icon **Delete** (trash)
3. ✅ Data terhapus!

### 📱 Share ke WhatsApp
1. Buka tab **Statistik**
2. Tap tombol **WhatsApp** (hijau, kanan bawah)
3. WhatsApp terbuka dengan laporan pre-filled
4. Pilih kontak atau grup
5. Kirim message

### 📄 Export ke PDF
1. Buka tab **Statistik**
2. Tap tombol **PDF** (merah, kanan bawah)
3. Tunggu loading (2-3 detik)
4. Share sheet muncul
5. Pilih aplikasi untuk save/share PDF

### 🔔 Setup Notifikasi
1. Buka **Profil** → **Budget & Notifikasi**
2. **Set Budget**:
   - Input budget limit
   - Tap **Save Budget**
3. **Daily Reminder**:
   - Toggle **Reminder Harian** ON
   - Pilih waktu reminder
4. **Budget Alert**:
   - Toggle **Alert Budget** ON
   - Alert otomatis aktif

---

## 📂 Struktur Proyek

```
lib/
├── main.dart                      # Entry point dengan auto-seed
├── models/
│   └── transaction_model.dart     # Model transaksi
├── services/
│   ├── transaction_service.dart   # CRUD service layer
│   ├── budget_service.dart        # Budget calculations
│   ├── whatsapp_service.dart      # WhatsApp sharing
│   ├── pdf_service.dart           # PDF generation
│   └── notification_service.dart  # Notifications
├── pages/
│   ├── login_page.dart            # Halaman login
│   ├── main_navigation.dart       # 3 tabs navigation
│   ├── home_page.dart             # Beranda dengan list transaksi
│   ├── statistics_page.dart       # Pie chart & statistik
│   ├── add_transaction_page.dart  # Form tambah/edit transaksi
│   ├── profile_page.dart          # Profil user
│   └── settings_page.dart         # Budget & notification settings
├── widgets/
│   ├── balance_card.dart          # Card saldo
│   ├── transaction_card.dart      # Card transaksi
│   ├── budget_indicator.dart      # Budget progress widget
│   ├── custom_button.dart         # Custom button
│   ├── custom_text_field.dart     # Custom text field
│   └── empty_state.dart           # Empty state widget
├── theme/
│   ├── app_theme.dart             # Theme configuration
│   └── app_colors.dart            # Color palette
└── utils/
    ├── currency_formatter.dart    # Format currency
    ├── date_formatter.dart        # Format date
    └── data_seeder.dart           # Sample data generator
```

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # UI & Fonts
  google_fonts: ^6.1.0
  
  # Utilities
  intl: ^0.19.0
  
  # Data Persistence
  shared_preferences: ^2.2.2
  
  # Charts
  fl_chart: ^0.66.0
  
  # Innovative Features
  url_launcher: ^6.2.2              # Share to WhatsApp
  pdf: ^3.10.7                      # PDF generation
  path_provider: ^2.1.1             # File storage
  share_plus: ^7.2.1                # Share functionality
  permission_handler: ^11.1.0       # Permission handling
```

---

## 🔧 Technical Details

### Data Storage
- **Platform**: SharedPreferences
- **Key**: `'transactions'`
- **Format**: JSON String
- **Encoding**: UTF-8

### Data Structure
```json
{
  "id": "1704123456789",
  "title": "Makan Siang",
  "amount": 25000.0,
  "type": "TransactionType.expense",
  "category": "TransactionCategory.food",
  "date": "2026-01-02T15:30:00.000",
  "note": "Warteg depan kampus"
}
```

### Architecture
- **Pattern**: Service Layer Pattern
- **State Management**: setState (simple & effective)
- **Data Persistence**: SharedPreferences (JSON)
- **File Structure**: Feature-based organization

### Performance
- ✅ Efficient JSON parsing
- ✅ Minimal rebuilds dengan setState
- ✅ Async operations untuk smooth UI
- ✅ Lazy loading ready

---

## 🐛 Troubleshooting

### Aplikasi tidak running?
```bash
flutter clean
flutter pub get
flutter run
```

### Data tidak tersimpan?
- Pastikan permission storage diizinkan
- Cek console untuk error messages
- Restart aplikasi

### Chart tidak muncul?
- Pastikan ada data transaksi
- Pull to refresh
- Restart aplikasi

### Notifikasi tidak muncul?
- Pastikan permission POST_NOTIFICATIONS diizinkan
- Cek settings notifikasi di sistem
- Test dengan tombol "Test Notifikasi"

### Reset data?
```bash
# Uninstall app atau clear app data
flutter clean
flutter run
```

---

## 📚 Dokumentasi

Dokumentasi lengkap tersedia di:

- 📄 [**README_COMPLETE.md**](README_COMPLETE.md) - Dokumentasi detail aplikasi
- 🚀 [**FITUR_INOVATIF.md**](FITUR_INOVATIF.md) - Detail fitur inovatif
- 📊 [**PRESENTASI.md**](PRESENTASI.md) - Panduan presentasi
- 🔧 [**PLATFORM_COMPATIBILITY.md**](PLATFORM_COMPATIBILITY.md) - Platform guide
- 📋 [**SUMMARY_DOKUMENTASI.md**](SUMMARY_DOKUMENTASI.md) - Summary dokumentasi

---

## 🎯 Fitur yang Sudah Diimplementasikan

- [x] CRUD lengkap dengan SharedPreferences
- [x] Pie chart animasi untuk expense & income
- [x] Touch interaction pada chart
- [x] Color-coded categories
- [x] Legend dengan detail
- [x] Auto-seed sample data
- [x] Pull to refresh
- [x] Loading states
- [x] Error handling
- [x] User feedback
- [x] Responsive design
- [x] Smooth animations
- [x] Empty states
- [x] Share to WhatsApp
- [x] Export to PDF
- [x] Budget tracking
- [x] Smart notifications (Daily reminder & Budget alert)

---

## 🎬 Screenshots

### 🏠 Beranda
- Saldo total dengan card gradient
- Transaksi terbaru dengan swipe actions
- Pull to refresh

### 📊 Statistik
- Summary cards pemasukan & pengeluaran
- Pie chart pengeluaran dengan animasi
- Pie chart pemasukan dengan animasi
- Legend interaktif
- Export buttons (WhatsApp & PDF)

### ➕ Tambah Transaksi
- Form lengkap dengan validation
- Category chips
- Date picker
- Loading state

## 📊 Project Stats

- **Total Files**: 25+ Dart files
- **Total Lines**: 5000+ lines of code
- **Dependencies**: 13 packages
- **Platforms**: Web, Android, iOS
- **APK Size**: ~47 MB

---


## 🙏 Credits

- **fl_chart** - Beautiful charts library
- **shared_preferences** - Local storage solution
- **google_fonts** - Beautiful typography
- **pdf** - PDF generation library
- **url_launcher** - Deep linking support
- **share_plus** - Native sharing functionality

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📞 Contact & Support

Jika ada pertanyaan atau masalah, silakan buat issue di repository ini.

---

<div align="center">

**Made with ❤️ for mahasiswa kos-kosan**

Selamat mengelola keuangan! 💰✨

---

⭐ **Jangan lupa beri bintang jika project ini membantu!** ⭐

</div>
