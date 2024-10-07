import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart'; // QR kod oluşturmak için kullanılan paket

// QR kod oluşturma sayfası, StatefulWidget sınıfından türetilmiştir
class GenerateQrCode extends StatefulWidget {
  const GenerateQrCode({super.key});

  @override
  State<GenerateQrCode> createState() =>
      _GenerateQrCodeState(); // State nesnesi oluşturulur
}

// _GenerateQrCodeState sınıfı, GenerateQrCode widget'ının durumunu yönetir
class _GenerateQrCodeState extends State<GenerateQrCode> {
  // Kullanıcının girdiği veriyi tutan bir TextEditingController nesnesi
  TextEditingController urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generate Qr Code"), // AppBar başlığı
      ),
      body: Center(
        child: SingleChildScrollView(
          // İçerik kaydırılabilir hale getirildi
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Dikeyde ortalama
            children: [
              // Eğer kullanıcı veri girmişse QR kodu göster
              if (urlController.text.isNotEmpty)
                QrImageView(
                  data:
                      urlController.text, // QR kodun içeriği (kullanıcı girişi)
                  size: 200, // QR kod boyutu
                ),
              SizedBox(
                height: 10, // QR kod ile TextField arasında boşluk
              ),
              // Kullanıcının veri gireceği metin kutusu
              Container(
                padding:
                    EdgeInsets.only(left: 10, right: 10), // Kenarlardan boşluk
                child: TextField(
                  controller: urlController, // TextField'e bağlı controller
                  decoration: InputDecoration(
                      hintText: "Enter your data", // Kullanıcıya yönlendirme
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              15)), // Kenar stilini ayarla
                      labelText: "Enter your data"), // TextField etiketi
                ),
              ),
              SizedBox(
                height: 10, // TextField ile buton arasındaki boşluk
              ),
              // QR kodu oluşturma butonu
              ElevatedButton(
                  onPressed: () {
                    setState(() {}); // Ekranı yeniden çizerek QR kodu günceller
                  },
                  child: Text("Generate Qr Code")), // Buton metni
            ],
          ),
        ),
      ),
    );
  }
}
