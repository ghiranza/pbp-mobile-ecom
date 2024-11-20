# vbucks_store

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Jawaban Tugas²

<details>
    <summary>TUGAS 7</summary>

checklist Tugas 7:
1. Membuat sebuah program Flutter baru dengan tema E-Commerce yang sesuai dengan tugas-tugas sebelumnya.
=> Setelah men-download Flutter dan menjalankan seluruh perintah pada website-nya, saya membuat folder lokal untuk menyimpan proyek Flutter saya.
   Lalu, saya membuka terminal pada directory folder lokal tersebut dan menjalankan "flutter create vbucks_store", di mana 'vbucks_store' merupakan nama app saya.

2. Membuat tiga tombol sederhana dengan ikon dan teks untuk:
   - Melihat daftar produk (Lihat Daftar Produk)
   - Menambah produk (Tambah Produk)
   - Logout (Logout)
=> Berikut potongan kode yang membuat tiga tombol yang diinginkan:
```python
GridView.count(
  primary: true,
  padding: const EdgeInsets.all(20),
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
  crossAxisCount: 3,
  shrinkWrap: true,
  children: [
    ItemCard(items[0], Colors.blue), // Tombol Lihat Daftar Produk
    ItemCard(items[1], Colors.green), // Tombol Tambah Produk
    ItemCard(items[2], Colors.red), // Tombol Logout
  ],
);
```
=> dan berikut potongan kode untuk pemberian ikon dan teks pada tombol:
```python
final List<ItemHomepage> items = [
  ItemHomepage("Lihat Daftar V-Bucks", Icons.list),
  ItemHomepage("Tambah V-Bucks", Icons.add),
  ItemHomepage("Logout", Icons.logout),
];
```

3. Mengimplementasikan warna-warna yang berbeda untuk setiap tombol (Lihat Daftar Produk, Tambah Produk, dan Logout).
=> Saya telah memberikan warna berbeda untuk tiap tombol dengan potongan kdoe berikut:
```python
GridView.count(
...
  children: [
    ItemCard(items[0], Colors.blue), // Tombol Lihat Daftar Produk
    ItemCard(items[1], Colors.green), // Tombol Tambah Produk
    ItemCard(items[2], Colors.red), // Tombol Logout
  ],
);
```
=> di mana tombol Lihat Daftar Produk berwarna biru, Tambah Produk berwarna hijau, dan Logout berwarna merah.

4. Memunculkan Snackbar dengan tulisan:
   - "Kamu telah menekan tombol Lihat Daftar Produk" ketika tombol Lihat Daftar Produk ditekan.
   - "Kamu telah menekan tombol Tambah Produk" ketika tombol Tambah Produk ditekan.
   - "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.
=> Berikut potongan kode yang menampilkan tulisan-tulisan tersebut:
```python
class ItemCard extends StatelessWidget {
  ...

  @override
  Widget build(BuildContext context) {
    ...
                content: Text("Kamu telah menekan tombol ${item.name}!")));
...
```

pertanyaan Tugas 7:
1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, lalu jelaskan perbedaan dari keduanya!
=> **Stateless Widget**: widget yang tidak memiliki state, berarti tidak dapat berubah setelah dibuat
                         (jika widget dibuat, maka tampilannya akan tetap sama, kecuali app di rebuild)
   **Stateful Widget**: widget yang dapat berubah-ubah selama aplikasi berjalan
                        (tampilan dapat diperbarui jika data atau properti yang mendasarinya berubah)

2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya!
=> - Scaffold: menyediakan struktur dasar halaman
   - AppBar: menampilkan judul halaman di bagian atas aplikasi
   - Padding: memberikan jarak antar beberapa widget
   - Column: menyusun widget anak secara vertikal, dan Row: menyusun widget anak secara horizontal
   - Card: menyediakan tampilan kotak dengan bayangan
   - Text: menampilkan/memberikan teks pada layar
   - GridView: menampilkan ItemCard dalam bentuk grid dengan jumlah kolom tertentu
   - Icon: menampilkan ikon, seperti ikon "mood", "add", dan "logout".
   - Material: widget dasar untuk elemen visual yang membutuhkan efek material (bayangan dan warna)
   - InkWell: menambahkan efek interaktif

3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut!
=> digunakan dalam StatefulWidget untuk memberitahu framework bahwa ada perubahan yang terjadi dalam state dari widget, sehingga 
   framework dapat merender ulang tampilan dengan state yang baru.
   Variabel yang terdampak dengan fungsi tersebut termasuk nilai yang dikendalikan oleh input pengguna, status login, data yang diubah secara dinamis, dan lainnya.

4. Jelaskan perbedaan antara const dengan final!
=> const bersifat compile-time constant (harus diketahui saat kompilasi), sedangkan final adalah variabel yang nilainya diinisialisasi hanya sekali
   namun dapat diatur saat runtime.

</details>



<details>
    <summary>TUGAS 8</summary>

1.  Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?
=> keyword const digunakan untuk mendefinisikan nilai atau widget yang sifatnya konstan dan tidak berubah. Kegunaan menggunakan const adalah dapat menghemat memori dan meningkatkan performa, karena Flutter hanya perlu menyimpan satu instance dari widget tersebut dan tidak perlu merender ulang ketika aplikasi di-rebuild. Const sebaiknya digunakan pada widget statis (misal: teks atau ikon yang tidak berubah, serta nilai tetap seperti warna atau padding yang konstan). Sedangkan const sebaiknya tidak digunakan untuk widget dinamis yang bergantung pada perubahan status atau input pengguna.

2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
=> Column menyusun widget secara vertikal dari atas ke bawah, sedangkan row menyusun widget secara horizontal dari kiri ke kanan. Column cocok digunakan ketika ingin menempatkan elemen dalam susunan vertikal (form input dan daftar elemen), sedangkan row lebih cocok untuk elemen horizontal (baris item dan tombol tindakan).
Berikut contoh implementasinya dalam kode saya:
```
Column(
  children: [
    Text('Item 1'),
    Text('Item 2'),
    Text('Item 3'),
  ],
);

Row(
  children: [
    Icon(Icons.star),
    Text('Starred Item'),
  ],
);
```

3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
=> elemen input yang saya gunakan 'TextFormField' untuk input VBucks, Description, dan VBucks Price. Elemen input Flutter lainnya yang tidak saya gunakan adalah checkbox, radio button, dropdownbutton, slider, dan switch. Saya tidak menggunakan elemen input tersebut karena dalam tugas ini form baru hanya membutuhkan teks dan angka untuk atribut item-item VBucks.

4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
=> saya menggunakan properti _theme_ di 'MaterialApp' [main.dart], berikut kode nya:
```
theme: ThemeData(
  primarySwatch: Colors.blue,
  textTheme: TextTheme(
    bodyText1: TextStyle(fontSize: 18, color: Colors.black),
  ),
),
```
tema diatur dengan menggunakan 'ThemeData'

5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
=> pada aplikasi saya, navigasi diterapkan dengan Navigator.push dan Navigator.pushReplacement. Berikut contohnya:
- Drawer menggunakan Navigator.pushReplacement untuk membuka halaman utama (MyHomePage) dan halaman form (VBucksEntryFormPage) [left_drawer.dart].
- Ketika ItemCard untuk “Tambah VBucks” ditekan, aplikasi menggunakan Navigator.push untuk membuka halaman VBucksEntryFormPage [vbucks_cart.dart].

</details>

<details>
    <summary>TUGAS 9</summary>

checklist Tugas 9:
1. Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik
=> proyek tugas Django saya telah berjalan dengan baik

2. Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter 
=> 

pertanyaan Tugas 9:
1. Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?
=> membuat model untuk data JSON penting karena membantu kita mengorganisir data dengan lebih terstruktur dan memudahkan proses parsing data dari atau ke JSON. Dengan adanya model, kita dapat memetakan setiap atribut JSON ke dalam variabel yang sesuai di aplikasi kita. Tanpa model, kita akan kesulitan membaca data secara langsung, karena data JSON biasanya berupa string mentah yang perlu diurai secara manual. Jika kita tidak membuat model, aplikasi masih bisa berjalan, tetapi akan lebih rentan terhadap error parsing, terutama jika format JSON berubah atau menjadi kompleks.

2. Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini.
=> berkomunikasi dengan server melalui protokol HTTP. Dalam tugas ini, library http membantu mengirimkan request seperti GET, POST, PUT, atau DELETE ke server Django. Misalnya, saat mengambil data dari server, kita menggunakan http.get, dan saat mengirim data, kita menggunakan http.post. Library ini mempermudah proses pengiriman dan penerimaan data, serta menangani response dari server, termasuk parsing data JSON.

3. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
=> menangani session pada aplikasi yang membutuhkan autentikasi. Ini memungkinkan aplikasi menyimpan dan mengelola cookie dari server sehingga status login pengguna dapat dipertahankan di berbagai komponen aplikasi. Instance CookieRequest perlu dibagikan ke seluruh komponen agar data session pengguna dapat digunakan secara konsisten di semua bagian aplikasi, misalnya untuk memeriksa apakah pengguna sudah login atau untuk mengakses API yang memerlukan autentikasi.

4. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
=> 
- input di Flutter: user mengisi form atau memberikan input di aplikasi Flutter.
- pengiriman ke Server: input ini dikemas menjadi JSON menggunakan http.post atau CookieRequest dan dikirim ke server Django.
- proses di Django: django memproses data tersebut, menyimpannya ke database jika valid, atau mengembalikan error jika ada masalah.
- response ke Flutter: server mengirimkan response (misalnya data yang telah disimpan atau status sukses/gagal).
- menampilkan di Flutter: data yang diterima dari server diproses (di-mapping ke model) dan ditampilkan di aplikasi Flutter.

5. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
=>
- login: user memasukkan datanya Flutter. Data ini dikirim ke endpoint login Django menggunakan POST. Django meverifikasi kredensial dengan mencocokkannya di database. Jika valid, Django mengembalikan token/session yang disimpan di aplikasi untuk autentikasi selanjutnya. Setelah itu, menu utama di Flutter dapat diakses.
- Register: user mengisi form registrasi di Flutter. Data dikirim ke endpoint register Django. Django memproses data tersebut, membuat akun baru, dan mengembalikan respons sukses atau error jika data tidak valid.
- Logout: Flutter mengirim request ke endpoint logout Django, yang akan menghapus session/token pengguna. Setelah logout, pengguna diarahkan kembali ke halaman login.

</details>