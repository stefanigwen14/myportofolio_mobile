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
     * [Tugas 8](https://github.com/stefanigwen14/myportofolio_mobile#tugas-8)

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

### Tugas 8

**1. Jelaskan perbedaan antara Navigator.push(), Navigator.pushReplacement(), dan Navigator.pop(). Metode apa yang digunakan untuk membuka formulir dari kartu aksi Jelaskan juga bagaimana opsi Home di drawer membawa pengguna kembali ke halaman utama.** 

Suatu aplikasi Flutter memiliki suatu stack untuk halaman yang dikelola oleh navigator. Navigator.push() menambah halaman baru ke stack di atas halaman sekarang sehingga ketika di-back akan kembali ke halaman sebelumnya, Navigator.pushReplacement() mengganti halaman sekarang dengan halaman baru sehingga ketika di-back tidak bisa kembali ke halaman yang diganti, sementara Navigator.pop() menutup halaman paling atas, yakni aksi back itu sendiri. Metode yang digunakan untuk membuka formulir dari kartu aksi adalah Navigator.push() sehingga ketika di-back (jika dibuka dari halaman utama, tempat kartu aksi berada) akan kembali ke halaman utama. Opsi Home di drawer menggunakan Navigator.pushReplacement() sehingga akan mengganti halaman apapun yang sedang aktif dengan Home langsung, dan tidak bisa back ke halaman sebelumnya.
    
**2. Bagaimana susunan Scaffold, AppBar, dan Drawer membantu menjaga struktur halaman tetap konsisten? Berikan satu contoh penggunaan warna tema portofolio di lebih dari satu halaman.**

Pada setiap halaman, susunannya adalah Scaffold yang isinya dimulai dengan AppBar dan Drawer sehingga struktur halaman tersebut tetap konsisten. Drawer dipanggil dari widget pada left_drawer.dart karena semua halaman pasti memiliki left drawer dengan konten yang sama sehingga widget tersebut dipisahkan dalam satu file tersendiri dan dipanggil di setiap Scaffold halaman di bawah AppBar supaya reusable dan konsisten. Contoh penggunaan warna tema portofolio di lebih dari satu halaman adalah di main.dart saya mendefinikan 0xFFDDBEBE sebagai primary color di color scheme dan saya panggil warna tersebut melalui Theme.of(context).colorScheme.primary sebagai background color dari AppBar di setiap halaman supaya tetap konsisten.

**3. Mengapa tata letak tersebut dipilih untuk formulir? Jelaskan peran widget pengatur jarak dan widget penggulir ketika ruang layar terbatas.**

Tata letak formulir dipilih berupa Column dengan childrennya berupa padding (widget pengatur jarak) untuk mengatur jarak di dalam widget itu sendiri antara border dan isi. Widget penggulir (scroll) berupa SingleChildScrollView dipilih supaya Column bisa discroll seandainya ruang layar terbatas.

**4. Apa peran GlobalKey<FormState>, validator, dan validate() saat tombol Simpan ditekan? Berikan satu contoh nilai yang ditolak oleh validasi dan jelaskan mengapa memilih jenis input atau papan ketik saja belum cukup.**

GlobalKey<FormState> berperan sebagai penanda dari widget Form yang akan di-save oleh tombol Simpan supaya statenya tetap bisa diakses di luar form. Validator merupakan fungsi di setiap field yang berfungsi untuk memvalidasi apakah masukan valid dan mengembalikan String berupa pesan error apabila memenuhi kondisi tidak valid, null kalau valid. validate() dipanggil lewat key dan akan menjalankan semua validator di dalam Form.
Contoh: Pada field "Pengirim" di form testimonial saya, saya menambahkan fungsi validator yang akan me-return nama pengirim tidak boleh kosong (jika kosong) atau nama pengirim tidak boleh lebih dari 30 karakter. Hal ini dikarenakan untuk jenis input yang sama (TextField) bisa memiliki aturan validasi berbeda-beda, khusus field Pengirim saya memiliki aturan maks 30 karakter (berbeda dengan Pesan), sehingga perlu dibuat fungsi validator.

- **AI Disclosure**:
  Untuk tugas 8 ini, saya dibantu oleh [Claude (lihat log chat di sini)](https://claude.ai/share/f80bb015-ddd0-42b0-91b1-036b86a686ff) untuk bagian validasi input link URL gambar untuk form testimonial. Saya melakukan prompting dengan memberikan ide implementasi awal saya dan Claude memberitahu apa yang harus saya perbaiki. Claude membantu membuat RegExp untuk memastikan format link tautan gambar yang diupload harus valid. Response Claude masih memberikan terlalu banyak opsi dan response awal terlalu "general" untuk implementasi yang ingin saya pakai, jadi saya prompting ulang sehingga response sesuai dengan yang saya inginkan. 
