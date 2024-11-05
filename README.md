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
  ItemHomepage("Lihat Daftar V-Bucks", Icons.mood),
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