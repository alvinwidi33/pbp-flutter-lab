1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
  Bisa, tetapi strukturnya bisa tidak sesuai yang diharapkan. Contohnya, kita mengimplementasi data berupa boolean, tetapi dianggap string
2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
  - Drawer : untuk menampilkan menu
  - AppBar : display toolbar widgets, seperti title dan actions
  - Container : Widget kenyamanan yang menggabungkan lukisan umum, penentuan posisi, dan widget ukuran.
  - Column : Display children dalam format vertikal
3. Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.
  - dependency http ke proyek digunakan untuk bertukar data melalui HTTP request, seperti GET, POST, PUT, dan lain-lain.
  - Membuat model respons dari data yang berasal dari web service tersebut.
  - Membuat http request ke web service.
  - Mengkonversikan objek yang didapatkan dari web service ke model
  - Menampilkan data yang telah dikonversi
5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
  - Membuat tombol hamburger dan navigatornya
  - Membuat model mywatchlist
  - mengimpor json mywacthlist
  - membuat detail json
  - Mengaktifkan flutter pub add http
  - merun flutter menggunakan flutter run
