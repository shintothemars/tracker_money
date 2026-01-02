# 💰 uangku - Money Tracker App

> Aplikasi pencatat keuangan modern untuk mahasiswa kos-kosan dengan fitur CRUD lengkap dan visualisasi pie chart yang menarik!

## ✨ Fitur Utama

### 🔄 CRUD dengan SharedPreferences
- ✅ **Create** - Tambah transaksi baru (pemasukan/pengeluaran)
- ✅ **Read** - Lihat semua transaksi dengan detail
- ✅ **Update** - Edit transaksi yang sudah ada
- ✅ **Delete** - Hapus transaksi yang tidak diperlukan
- ✅ **Data Persistence** - Data tersimpan permanen di perangkat

### 📊 Visualisasi dengan Pie Chart Animasi
- 🎨 **Animated Pie Charts** - Grafik tumbuh dengan animasi smooth (1.5 detik)
- 🎯 **Interactive Touch** - Sentuh bagian chart untuk highlight & detail
- 🌈 **Color-coded Categories** - 10 warna untuk expense, 8 warna untuk income
- 📱 **Responsive Design** - Tampilan optimal di semua ukuran layar
- 🔄 **Pull to Refresh** - Tarik ke bawah untuk update data

### 🎨 UI/UX Modern
- 🏠 **3 Halaman Utama**: Beranda, Statistik, Profil
- ⚡ **Smooth Animations** - Transisi halus di semua interaksi
- 🎭 **Empty States** - Tampilan friendly saat belum ada data
- 💬 **User Feedback** - SnackBar untuk konfirmasi aksi
- 🌟 **Clean Design** - Minimalis dan mudah digunakan

## 🚀 Quick Start

### 1. Install Dependencies
```bash
flutter pub get
```

### 2. Run Aplikasi
```bash
flutter run
```

### 3. First Run
Aplikasi akan otomatis membuat 20 transaksi sample untuk demo pie chart!

## 📱 Cara Menggunakan

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

## 📂 Struktur Proyek

```
lib/
├── main.dart                      # Entry point dengan auto-seed
├── models/
│   └── transaction_model.dart     # Model transaksi
├── services/
│   └── transaction_service.dart   # ✨ CRUD service layer
├── pages/
│   ├── home_page.dart            # ✅ Updated: Integrasi SharedPreferences
│   ├── statistics_page.dart      # ✨ NEW: Pie chart dengan animasi
│   ├── add_transaction_page.dart # ✅ Updated: Save to SharedPreferences
│   ├── main_navigation.dart      # ✅ Updated: 3 tabs navigation
│   ├── login_page.dart
│   └── profile_page.dart
├── widgets/
│   ├── balance_card.dart
│   ├── transaction_card.dart
│   ├── custom_button.dart
│   ├── custom_text_field.dart
│   └── empty_state.dart
├── theme/
│   ├── app_theme.dart
│   └── app_colors.dart
└── utils/
    ├── currency_formatter.dart
    ├── date_formatter.dart
    └── data_seeder.dart          # ✨ NEW: Sample data generator
```

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

## 🎬 Animasi

### 1. Pie Chart Growth
- **Duration**: 1500ms
- **Curve**: easeInOutCubic
- **Effect**: Chart tumbuh dari 0% ke 100%

### 2. Touch Interaction
- **Radius**: 60 → 70 (saat di-touch)
- **Font Size**: 14 → 16 (saat di-touch)
- **Badge**: Emoji kategori muncul
- **Shadow**: Soft shadow untuk depth

### 3. Page Transition
- **Duration**: 300ms
- **Type**: AnimatedSwitcher
- **Effect**: Smooth fade between pages

## 🎨 Color Palette

### Expense Colors
🔴 Red • 🟠 Orange • 🟡 Yellow • 🟢 Green • 🔵 Teal • 🔵 Blue • 🟣 Purple • 🌸 Pink • 🟤 Brown • ⚫ Blue Grey

### Income Colors
💚 Emerald • 🟢 Green • 🌿 Light Green • 🔵 Cyan • 💙 Light Blue • 🔵 Blue • 💜 Indigo • 🌊 Teal

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
```

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

### Performance
- ✅ Efficient JSON parsing
- ✅ Minimal rebuilds dengan setState
- ✅ Async operations untuk smooth UI
- ✅ Lazy loading ready

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

### Reset data?
```bash
# Uninstall app
flutter clean
flutter run
```

## 📚 Dokumentasi Lengkap

- 📄 **FEATURES.md** - Dokumentasi detail semua fitur
- 🚀 **QUICKSTART_NEW.md** - Panduan quick start
- 📋 **IMPLEMENTATION_SUMMARY.md** - Summary implementasi

## 🎯 Fitur yang Sudah Diimplementasikan

- [x] CRUD lengkap dengan SharedPreferences
- [x] Pie chart animasi untuk expense
- [x] Pie chart animasi untuk income
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

## 🎉 Screenshots

### Beranda
- Saldo total dengan card gradient
- Transaksi terbaru dengan swipe actions
- Pull to refresh

### Statistik
- Summary cards pemasukan & pengeluaran
- Pie chart pengeluaran dengan animasi
- Pie chart pemasukan dengan animasi
- Legend interaktif

### Tambah Transaksi
- Form lengkap dengan validation
- Category chips
- Date picker
- Loading state

## 👨‍💻 Developer

**Antigravity AI**
- Framework: Flutter
- Language: Dart
- Architecture: Service Layer Pattern
- State Management: setState (simple & effective)

## 📝 License

MIT License - Free to use for educational purposes

## 🙏 Credits

- **fl_chart** - Beautiful charts library
- **shared_preferences** - Local storage solution
- **google_fonts** - Beautiful typography

---

**Made with ❤️ for mahasiswa kos-kosan**

Selamat mengelola keuangan! 💰✨
