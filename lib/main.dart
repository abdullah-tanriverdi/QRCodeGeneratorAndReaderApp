import 'package:flutter/material.dart';
import 'package:qrcodeapp/generate_qr_code.dart'; // QR kod oluşturma ekranı
import 'package:qrcodeapp/scan_qr_code.dart'; // QR kod tarama ekranı

// Uygulamanın başlangıç noktası
void main() {
  runApp(const MyApp()); // MyApp widget'ı çalıştırılır
}

// MyApp widget'ı, StatelessWidget sınıfından türetilir ve uygulamanın kök widget'ıdır
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Uygulamanın kullanıcı arayüzünü oluşturan yapı
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR CODE SCANNER AND GENERATOR', // Uygulamanın başlık metni
      debugShowCheckedModeBanner: false, // Debug modundaki etiketi kaldırır
      home: HomePage(), // Ana sayfa olarak HomePage widget'ı yüklenir
    );
  }
}

// HomePage, StatefulWidget sınıfından türetilmiştir
// Bu sayfa, QR kod tarayıcı ve oluşturucu seçeneklerini içerir
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() =>
      _HomePageState(); // State nesnesi oluşturulur
}

// HomePage widget'ının durumu (State) burada tanımlanır
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR CODE SCANNER AND GENERATOR"), // AppBar başlığı
        backgroundColor: Colors.lightBlueAccent, // AppBar arka plan rengi
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Dikeyde ortalanmış bir düzen
          children: [
            ElevatedButton(
                // QR kod tarayıcı ekranına yönlendirme
                onPressed: () {
                  setState(() {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ScanQrCode()));
                  });
                },
                child: Text("Scan Qr Code")), // Buton metni
            SizedBox(
              height: 40, // Butonlar arası boşluk
            ),
            ElevatedButton(
                // QR kod oluşturucu ekranına yönlendirme
                onPressed: () {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => GenerateQrCode()));
                  });
                },
                child: Text("Generate Qr Code")) // Buton metni (Oluşturma)
          ],
        ),
      ),
    );
  }
}
