import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // PlatformException için gerekli
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart'; // QR kod tarama için kullanılan paket

// QR kod tarama sayfası, StatefulWidget sınıfından türetilmiştir
class ScanQrCode extends StatefulWidget {
  const ScanQrCode({super.key});

  @override
  State<ScanQrCode> createState() =>
      _ScanQrCodeState(); // State nesnesi oluşturulur
}

// _ScanQrCodeState sınıfı, ScanQrCode widget'ının durumunu yönetir
class _ScanQrCodeState extends State<ScanQrCode> {
  String qrResult =
      "Scanned Data Will Appear Here"; // Tarama sonucunu saklamak için değişken

  // QR kod tarama işlemini gerçekleştiren fonksiyon
  Future<void> scanQR() async {
    try {
      // QR kod tarama işlemi başlatılır
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.QR);

      if (!mounted) return; // Widget'ın hâlâ mevcut olup olmadığını kontrol et

      // Tarama sonucu güncellenir
      setState(() {
        this.qrResult = qrCode.toString(); // Tarama sonucunu qrResult'a atar
      });
    } on PlatformException {
      // Hata durumunda mesaj gösterir
      qrResult = "Fail to read QR Code"; // QR kod okunamazsa hata mesajı
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Qr Code Scanner"), // AppBar başlığı
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Dikeyde ortalama
          children: [
            SizedBox(
              height: 30, // Tarama sonucu ile üstteki öğe arasında boşluk
            ),
            // Tarama sonucunu gösteren metin
            Text(
              "$qrResult", // Tarama sonucu burada gösterilir
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 30, // Metin ile buton arasında boşluk
            ),
            // QR kod tarama butonu
            ElevatedButton(
                onPressed: scanQR,
                child: Text(
                    "Scan Code")) // Butona basıldığında scanQR fonksiyonu çağrılır
          ],
        ),
      ),
    );
  }
}
