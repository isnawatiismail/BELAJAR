import 'dart:io';

abstract class Transportasi {
  String nama;
  double tarifDasar;
  Transportasi(this.nama, this.tarifDasar);
  double hitungTarif(int jmlPenumpang);
}

class Taksi extends Transportasi {
  double jarak;
  Taksi(super.nama, super.tarifDasar, this.jarak);
  @override
  double hitungTarif(int _) => tarifDasar * jarak;
}

class Bus extends Transportasi {
  bool adaWifi;
  Bus(super.nama, super.tarifDasar, this.adaWifi);
  @override
  double hitungTarif(int j) => (tarifDasar * j) + (adaWifi ? 5000 : 0);
}

class Pesawat extends Transportasi {
  String kelas;
  Pesawat(super.nama, super.tarifDasar, this.kelas);
  @override
  double hitungTarif(int j) => tarifDasar * j * (kelas == "Bisnis" ? 1.4 : 1.0);
}


void main() {
  stdout.write("Masukkan nama pelanggan: ");
  String? nama = stdin.readLineSync();

  print("\Pilih transoportasi:\n1. Taksi\n2. Bus\n3. Pesawat");
  stdout.write("pilihan (1-3): ");
  int pilih = int.parse(stdin.readLineSync()!);

  stdout.write("jumlah penumpang:");
  int jml = int.parse(stdin.readLineSync()!);

Transportasi t;
if (pilih == 1) t = Taksi("Taksi BlueBird", 8000, 12);
else if (pilih == 2) t = Bus("Bus TransJakarta", 5000, true);
else if (pilih == 3) t = Pesawat("Garuda Indonesia", 1500000, "Bisnis");
else {
  print("Pilihan tidak valid!");
  return;
}

double total = t.hitungTarif(jml);
print("\n=== STRUK PEMESANAN ===");
print("Pelanggan : $nama");
print("Transport : ${t.nama}");
print("Penumpang : $jml");
print("Total     : Rp${total.toStringAsFixed(2)}");
}
