# 🌸 myportofolio_mobile by Gwen 🌸

Nama: Stefani Gwen Rolanda Tumbelaka

NPM: 2506594263

Kelas: PBP C

Project **My Portofolio Mobile** merupakan project aplikasi portofolio pribadi (versi mobile dari [My Portofolio](https://github.com/stefanigwen14/myportofolio)) menggunakan framework Flutter sebagai bagian dari penilaian Tutorial dan Tugas Individu untuk mata kuliah [Pemrograman Berbasis Platform (CSGE602022) Gasal 2026/2027, Fakultas Ilmu Komputer, Universitas Indonesia](https://pbp.cs.ui.ac.id/). Project ini pun bertujuan sebagai wadah untuk mempresentasikan diri saya melalui konten terkait riwayat serta apa yang bisa saya tawarkan pada audiens dengan elemen visual yang menyesuaikan kesukaan dan karakteristik diri saya.

## 📝 Daftar Isi
- ⚙️ [Instruksi Setup](https://github.com/stefanigwen14/myportofolio_mobile#%EF%B8%8F-instruksi-setup)
- 📲 [Penjelasan Fitur](https://github.com/stefanigwen14/myportofolio_mobile#-penjelasan-fitur)
- ❓ [Pertanyaan Refleksi & AI Disclosure](https://github.com/stefanigwen14/myportofolio_mobile#-pertanyaan-refleksi--ai-disclosure)
     * [Tugas 7](https://github.com/stefanigwen14/myportofolio_mobile#tugas-7)

## ⚙️ Instruksi Setup
1. Lakukan instalasi [Flutter SDK (lihat panduan instalasi di sini)](https://flutter.dev/docs/get-started/install)
2. Lakukan cloning terhadap repository ini serta ganti current directory ke clone lokal tersebut
   ```
   git clone https://github.com/stefanigwen14/myportofolio_mobile.git
   cd myportofolio_mobile
   ```
3. Lakukan instalasi dependencies
   ```
   flutter pub get
   ```
4. Jalankan aplikasi Flutter
   ```
   flutter run
   ```

## 📲 Penjelasan Fitur
Bagian ini akan diperbarui seiring waktu pengembangan. Untuk sekarang, fitur yang sudah tersedia adalah:
1. **Main Menu** - menu utama yang berisi informasi profil singkat mengenai saya serta tombol navigasi ke berbagai menu, seperti Project, Experience, Education, dan Testimonial.

## ❓ Pertanyaan Refleksi & AI Disclosure
### Tugas 7
1. **Jelaskan apa yang dimaksud dengan widget tree pada Flutter dan bagaimana hubungan induk-anak (parent-child) bekerja antar-widget!**

    Widget tree merupakan struktur hierarkis dari widget yang ada dalam UI aplikasi, di mana widget-widget tersebut bisa memiliki hubungan parent-child. Hubungan parent-child antar-widget bekerja dengan prinsip "Constraints go down. Sizes go up. Parent sets position" yang berarti parent bisa membatasi child sementara child menentukan ukurannya sendiri lalu posisinya diatur oleh parent. Parent-child widget juga memiliki mekanisme aliran data seperti setiap widget child memiliki BuildContext yang bisa memanggil dari parentnya.

2. **Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya masing-masing!**

   - MyApp: berfungsi sebagai root widget dalam widget tree aplikasi, digunakan dalam mengatur Theme (color scheme, font family) sehingga widget di bawahnya tinggal memanggil melalui BuildContext, serta sebagai titik masuk aplikasi (main() menjalankan MyApp() langsung yang memiliki atribut MyHomePage() sebagai page utama)
   - MyHomePage: berfungsi sebagai page utama aplikasi secara keseluruhan yang menampung struktur visual dasar halaman (AppBar, Body, SnackBar)
   - AppBar: berfungsi sebagai header bar yang berada di bagian atas halaman aplikasi (teks "MyPortfolio")
   - InfoCard: Widget untuk menampung informasi title dan content
   - ItemCard: Widget yang berfungsi sebagai tombol dan memiliki feedback dari SnackBar
   - SnackBar: berfungsi untuk menampilkan teks di bawah layar sebagai feedback dari memencet tombol

3. **Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini umumnya digunakan sebagai root widget pada aplikasi Flutter!**

    MaterialApp merupakan widget yang membungkus komponen UI dengan standar desain Material Design (Google). MaterialApp berfungsi sebagai titik awal pemanggilan fungsi main(), pengaturan tema untuk keseluruhan aplikasi, routing, lokalisasi, serta konfigurasi global sehingga digunakan sebagai root widget pada aplikasi Flutter supaya child widget dari root widget MaterialApp ini tinggal memanggil dari MaterialApp (menjaga konsistensi).

4. **Jelaskan perbedaan antara StatelessWidget dan StatefulWidget! Kapan kita sebaiknya memilih StatelessWidget dan kapan harus menggunakan StatefulWidget!**

    StatelessWidget merupakan jenis widget yang bersifat statis selama aplikasi dijalankan (tidak dapat berubah) sehingga cocok digunakan untuk hal seperti teks, AppBar, dsb yang tidak akan pernah berubah tempilannya, sementara StatefulWidget merupakan jenis widget yang bersifat dinamis selama aplikasi dijalankan (memiliki berbagai state) serta dapat menyimpan data sehingga cocok digunakan untuk komponen widget dalam suatu form.

5. **Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di dalam metode build?**

    BuildContext merupakan penunjuk lokasi spesifik dari suatu widget di dalam widget tree yang memungkinkan suatu widget untuk berinteraksi dengan widget-widget yang ada di atasnya dalam widget tree, sehingga berperan penting dalam menghubungkan widget-widget yang ada dalam widget tree. Penggunaan BuildContext dalam build seringkali dipakai dalam hal seperti Class.of(context) seperti ketika dalam method build milik MyHomePage (menu.dart) me-return Scaffold yang memiliki AppBar yang memiliki atribut background color mengambil dari warna primary dari color scheme milik class Theme milik MyApp (main.dart) yang berada di atas MyHomePage dalam widget tree dengan Theme.of(context).colorScheme.primary (context merupakan suatu BuildContext yang didefinisikan sebagai parameter fungsi build).

6. **Jelaskan konsep hot reload di Flutter dan apa perbedaannya dengan hot restart! Kapan kita tidak bisa hanya mengandalkan hot reload dan harus melakukan hot restart atau full restart?**
   
    Hot reload mempertahankan state aplikasi sebelum dilakukan hot reload tersebut dijalankan sembari memperbarui UInya, dalam artian hot reload hanya menjalankan ulang fungsi build(), sehingga cocok digunakan apabila hanya mengubah bagian UI yang ada dalam fungsi build(). Hot restart menghancurkan state aplikasi dan memuat ulang aplikasi dari awal, dalam artian hot restart menjalankan ulang keseluruhan fungsi main(), sehingga lebih cocok digunakan dibandingkan hot reload apabila terjadi perubahan dalam inisialisasi global/static variables, dependencies, atau struktur kelas (yang berada di luar build()). 



- **AI Disclosure:**

  Untuk tugas 7 ini, saya dibantu oleh [Gemini (lihat log chat di sini)](https://share.gemini.google/0V1baKg0IDKF). Gemini membantu saya dalam memahami hal yang sudah ada pada kode saya tetapi belum saya pahami dari Tutorial 8 (seperti cara kerja GridView), memperjelas apa yang sudah saya baca dari dokumentasi tetapi belum paham (cara mengganti font utama aplikasi dari Google Fonts dan format hex code warna), serta memberitahu apa yang harus dilakukan untuk menambahkan outline border dan shadow untuk AppBar. Strategi prompting yang saya gunakan adalah dengan menanyakan langsung hal yang masih saya bingungkan dari Tutorial/Dokumentasi lalu Gemini akan memberikan penjelasan, setelah penjelasan diberikan dan masih belum berhasil (salah satu kekurangan AI adalah jawaban kurang oke jika kurang konteks), saya harus memberi konteks tambahan dari sepotong kode saya serta apa yang muncul di IDE saya ketika error, ketika masih tidak bisa saya meminta Gemini untuk memberikan implementasi alternatif hal tersebut sampai berhasil.
