void main() {
  // simulasi input user
  var pilihan = 3;
  var angka1 = 5;
  var angka2 = 4;

  print("Pilih operasi (1-4): $pilihan");
  print("Masukkan angka pertama: $angka1");
  print("Masukkan angka kedua: $angka2");

  switch (pilihan) {
    case 1:
      print("Output: Hasil penjumlahan = ${angka1 + angka2}");
      break;
    case 2:
      print("Output: Hasil pengurangan = ${angka1 - angka2}");
      break;
    case 3:
      print("Output: Hasil perkalian = ${angka1 * angka2}");
      break;
    case 4:
      if (angka2 == 0) {
        print("Output: Error! Pembagian dengan nol tidak bisa dilakukan.");
      } else {
        print(
          "Output: Hasil pembagian = ${(angka1 / angka2).toStringAsFixed(2)}",
        );
      }
      break;
  }
}
