# 📱 Build APK Release - uangku Money Tracker

## 🚀 Cara Build APK Release

### 1. Build APK Release
```bash
flutter build apk --release
```

**Lokasi APK:**
```
build/app/outputs/flutter-apk/app-release.apk
```

### 2. Build APK Split (Lebih Kecil)
```bash
flutter build apk --split-per-abi
```

**Lokasi APK:**
```
build/app/outputs/flutter-apk/app-armeabi-v7a-release.apk
build/app/outputs/flutter-apk/app-arm64-v8a-release.apk
build/app/outputs/flutter-apk/app-x86_64-release.apk
```

### 3. Build App Bundle (Untuk Play Store)
```bash
flutter build appbundle --release
```

**Lokasi AAB:**
```
build/app/outputs/bundle/release/app-release.aab
```

## 📦 Informasi APK

### Nama Aplikasi
**uangku** - Money Tracker untuk Anak Kos

### Versi
- **Version**: 1.0.0
- **Build Number**: 1

### Fitur Utama
✅ CRUD Lengkap dengan SharedPreferences
✅ Pie Chart Animasi untuk Statistik
✅ Edit Foto Profil dengan Emoji
✅ 3 Halaman: Beranda, Statistik, Profil
✅ Auto-seed Sample Data
✅ Pull to Refresh
✅ Dark Gradient UI

### Ukuran APK (Estimasi)
- **Universal APK**: ~15-20 MB
- **Split APK (arm64-v8a)**: ~10-12 MB

## 🔧 Konfigurasi Build

### File: `android/app/build.gradle`

```gradle
android {
    compileSdkVersion 34
    
    defaultConfig {
        applicationId "com.example.tracker_money"
        minSdkVersion 21
        targetSdkVersion 34
        versionCode 1
        versionName "1.0.0"
    }
    
    buildTypes {
        release {
            signingConfig signingConfigs.debug
            minifyEnabled true
            shrinkResources true
        }
    }
}
```

## 📝 Checklist Sebelum Release

- [x] Semua fitur berfungsi dengan baik
- [x] CRUD SharedPreferences working
- [x] Pie chart dengan animasi
- [x] Edit foto profil
- [x] Tidak ada overflow error
- [x] UI/UX responsive
- [x] Sample data auto-seed
- [x] Build APK berhasil

## 🎯 Cara Install APK

### Di Android Device:

1. **Transfer APK** ke HP Android
2. **Buka File Manager**
3. **Tap** file `app-release.apk`
4. **Izinkan** install dari sumber tidak dikenal (jika diminta)
5. **Tap Install**
6. **Buka** aplikasi uangku
7. ✅ **Selesai!**

### Via ADB:

```bash
adb install build/app/outputs/flutter-apk/app-release.apk
```

## 📊 Fitur yang Tersedia di APK

### 1. Halaman Beranda
- Lihat saldo total
- Lihat transaksi terbaru
- Swipe untuk edit/delete
- Pull to refresh

### 2. Halaman Statistik
- Pie chart pengeluaran
- Pie chart pemasukan
- Interactive touch
- Legend lengkap
- Summary cards

### 3. Halaman Profil
- Edit foto profil (16 emoji)
- Settings menu
- Logout

### 4. Tambah Transaksi
- Form lengkap
- Pilih kategori
- Date picker
- Save to SharedPreferences

## 🔐 Permissions

Aplikasi ini **TIDAK** memerlukan permission khusus:
- ✅ Tidak perlu akses internet
- ✅ Tidak perlu akses kamera
- ✅ Tidak perlu akses lokasi
- ✅ Hanya menggunakan SharedPreferences (local storage)

## 📱 Minimum Requirements

- **Android**: 5.0 (Lollipop) atau lebih tinggi
- **SDK**: API Level 21+
- **RAM**: 1 GB minimum
- **Storage**: 50 MB free space

## 🎨 App Info

### Package Name
`com.example.tracker_money`

### App Name
`uangku`

### Icon
Default Flutter icon (bisa diganti nanti)

### Orientation
Portrait only

## 🚀 Next Steps (Opsional)

### 1. Ganti App Icon
```bash
# Install flutter_launcher_icons
flutter pub add flutter_launcher_icons

# Tambahkan config di pubspec.yaml
# Generate icons
flutter pub run flutter_launcher_icons
```

### 2. Ganti Package Name
```bash
# Install change_app_package_name
flutter pub add change_app_package_name

# Ganti package name
flutter pub run change_app_package_name:main com.yourcompany.uangku
```

### 3. Sign APK (Untuk Production)
```bash
# Generate keystore
keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload

# Build signed APK
flutter build apk --release
```

## 📝 Release Notes v1.0.0

### ✨ Fitur Baru
- ✅ CRUD lengkap dengan SharedPreferences
- ✅ Pie chart animasi untuk statistik
- ✅ Edit foto profil dengan 16 pilihan emoji
- ✅ Auto-seed 20 transaksi sample
- ✅ Pull to refresh di semua halaman
- ✅ Smooth animations & transitions

### 🐛 Bug Fixes
- ✅ Fixed bottom navigation overflow
- ✅ Fixed CurrencyFormatter method
- ✅ Fixed locale initialization
- ✅ Fixed fold type inference

### 🎨 UI/UX
- ✅ Modern gradient design
- ✅ Responsive layout
- ✅ Color-coded categories
- ✅ Interactive pie charts
- ✅ Smooth animations

## 📞 Support

Untuk bantuan atau pertanyaan:
- Email: anakkos@email.com
- Version: 1.0.0
- Build: 1

---

**Built with ❤️ using Flutter**

**Selamat menggunakan uangku!** 💰✨
