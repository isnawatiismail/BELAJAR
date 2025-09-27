void main() {
  // Data karyawan
  String nama = "Isnawati Ismail";
  int jamKerja = 21; // jam kerja dalam seminggu
  double upahPerJam = 75000; // upah per jam
  bool statusTetap = true; // true = tetap, false = kontrak

  // Hitung gaji kotor
  double gajiKotor = jamKerja * upahPerJam;

  // Tentukan persentase pajak berdasarkan status
  double persenPajak = statusTetap ? 0.10 : 0.05;

  // Hitung pajak dan gaji bersih
  double pajak = gajiKotor * persenPajak;
  double gajiBersih = gajiKotor - pajak;

  // Tampilkan hasil (gunakan toInt untuk menghilangkan .0)
  print("=== Aplikasi Penghitung Gaji Karyawan Sederhana ===");
  print("Nama Karyawan : $nama");
  print("Status        : ${statusTetap ? 'Tetap' : 'Kontrak'}");
  print("Jam Kerja     : $jamKerja jam");
  print("Upah per Jam  : Rp ${upahPerJam.toInt()}");
  print("Gaji Kotor    : Rp ${gajiKotor.toInt()}");
  print("Pajak         : Rp ${pajak.toInt()}");
  print("Gaji Bersih   : Rp ${gajiBersih.toInt()}");
}
