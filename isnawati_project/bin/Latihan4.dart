import 'dart:io';

void main() {
  int uang = 0;
  int sisauang = 0;

  // Input uang pertama
  while (true) {
    stdout.write("Masukkan jumlah uang Anda: ");
    try {
      uang = int.parse(stdin.readLineSync()!);
      sisauang = uang;
      break;
    } catch (e) {
      print("Input tidak valid! Masukkan angka.");
    }
  }

  // Data menu`
  Map<int, Map<String, int>> makanan = {
    1: {"Nasi Goreng": 20000},
    2: {"Mie Goreng": 15000},
    3: {"Ayam Geprek": 25000},
    4: {"Ayam Bakar": 30000},
    5: {"Sate Ayam": 20000},
  };

  Map<int, Map<String, int>> minuman = {
    1: {"Es Teh": 5000},
    2: {"Es Jeruk": 7000},
    3: {"Jus Alpukat": 10000},
    4: {"Jus Mangga": 10000},
    5: {"Air Mineral": 5000},
  };

  // Keranjang belanja
  List<Map<String, dynamic>> keranjang = [];

  bool lanjut = true;

  while (lanjut) {
    print("\n=== MENU UTAMA ===");
    print("1. Makanan");
    print("2. Minuman");
    print("3. Selesai & Cetak Struk");

    stdout.write("Pilih menu: ");
    int? pilihan;
    try {
      pilihan = int.parse(stdin.readLineSync()!);
    } catch (e) {
      print("Masukkan angka yang valid!");
      continue;
    }

    if (pilihan == 1) {
      print("\n--- Menu Makanan ---");
      makanan.forEach((key, value) {
        value.forEach((nama, harga) {
          print("$key. $nama - Rp $harga");
        });
      });

      stdout.write("Pilih makanan: ");
      int? pilihMakan = int.tryParse(stdin.readLineSync()!);

      if (makanan.containsKey(pilihMakan)) {
        var item = makanan[pilihMakan]!;
        var nama = item.keys.first;
        var harga = item.values.first;

        // Jumlah pesanan
        stdout.write("Berapa banyak $nama yang ingin dibeli? ");
        int? jumlah = int.tryParse(stdin.readLineSync()!);

        if (jumlah == null || jumlah <= 0) {
          print("Jumlah tidak valid.");
          continue;
        }

        int totalHarga = harga * jumlah;

        if (sisauang >= totalHarga) {
          sisauang -= totalHarga;
          keranjang.add({
            "nama": nama,
            "jumlah": jumlah,
            "harga": harga,
            "total": totalHarga
          });
          print("✅ Anda memesan $nama x$jumlah (Total Rp $totalHarga).");
          print("Sisa uang: Rp $sisauang");
        } else {
          print("❌ Uang Anda tidak cukup untuk membeli $nama x$jumlah!");
        }
      } else {
        print("Pilihan makanan tidak tersedia.");
      }

    } else if (pilihan == 2) {
      print("\n--- Menu Minuman ---");
      minuman.forEach((key, value) {
        value.forEach((nama, harga) {
          print("$key. $nama - Rp $harga");
        });
      });

      stdout.write("Pilih minuman: ");
      int? pilihMinum = int.tryParse(stdin.readLineSync()!);

      if (minuman.containsKey(pilihMinum)) {
        var item = minuman[pilihMinum]!;
        var nama = item.keys.first;
        var harga = item.values.first;

        // Jumlah pesanan
        stdout.write("Berapa banyak $nama yang ingin dibeli? ");
        int? jumlah = int.tryParse(stdin.readLineSync()!);

        if (jumlah == null || jumlah <= 0) {
          print("Jumlah tidak valid.");
          continue;
        }

        int totalHarga = harga * jumlah;

        if (sisauang >= totalHarga) {
          sisauang -= totalHarga;
          keranjang.add({
            "nama": nama,
            "jumlah": jumlah,
            "harga": harga,
            "total": totalHarga
          });
          print("✅ Anda memesan $nama x$jumlah (Total Rp $totalHarga).");
          print("Sisa uang: Rp $sisauang");
        } else {
          print("❌ Uang Anda tidak cukup untuk membeli $nama x$jumlah!");
        }
      } else {
        print("Pilihan minuman tidak tersedia.");
      }

    } else if (pilihan == 3) {
      print("\n===== STRUK BELANJA =====");
if (keranjang.isEmpty) {
  print("Anda tidak membeli apa pun.");
} else {
  int totalBelanja = 0;
  for (var item in keranjang) {
    print("${item['nama']} x${item['jumlah']} dartRp ${item['harga']} = Rp ${item['total']}");
    totalBelanja += item['total'] as int; // <-- perbaikan
  }
  print("-----------------------------");
  print("Total Belanja : Rp $totalBelanja");
  print("Uang Awal     : Rp $uang");
  print("Sisa Uang     : Rp $sisauang");
}
print("Terima kasih telah berbelanja!");

      lanjut = false;
    } else {
      print("Pilihan tidak valid, silakan pilih 1, 2, atau 3.");
    }
  }
}