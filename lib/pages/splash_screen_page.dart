// Mengimpor pustaka kontrol waktu dan timer asinkron bawaan bahasa Dart
import 'dart:async';
// Mengimpor pustaka antarmuka Material Design utama Flutter
import 'package:flutter/material.dart';
// Mengimpor halaman navigasi utama (MainNavigationPage) sebagai tujuan perpindahan layar
import 'main_navigation_page.dart';

// Komponen/Widget SplashScreenPage turunan StatefulWidget: Mengelola status timer hitung mundur
class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

// Kelas pengelola state, timer asinkron, dan logika navigasi Splash Screen
class _SplashScreenPageState extends State<SplashScreenPage> {
  // Deklarasi variabel durasi hitung mundur dalam satuan detik (Nilai awal: 5 detik)
  int _durasiDetik = 10;
  // Deklarasi variabel objek timer asinkron
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Memulai fungsi penghitung waktu mundur otomatis saat layar splash screen terbuka
    _mulaiHitungMundur();
  }

  // Fungsi logika hitung mundur & navigasi otomatis
  void _mulaiHitungMundur() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_durasiDetik > 1) {
        setState(() {
          _durasiDetik--; // Kurangi hitungan mundur per detik
        });
      } else {
        _timer?.cancel(); // Hentikan timer

        // Safety check sebelum navigasi
        if (!mounted) return;

        // Berpindah ke halaman utama tanpa bisa kembali ke splash screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainNavigationPage()),
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Bersihkan memori timer saat widget ditutup
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A), // Latar Biru Navy
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Bagian 1: Logo Toko
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Icon(
                Icons.point_of_sale_rounded,
                size: 72,
                color: Color(0xFF1E3A8A),
              ),
            ),
            const SizedBox(height: 24),

            // Bagian 2: Nama & Tagline
            const Text(
              'SmartKasir',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Aplikasi Kasir Point of Sale Digital',
              style: TextStyle(
                fontSize: 13,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 36),

            // Bagian 3: Loading & Teks Hitung Mundur
            const SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(
                color: Colors.amber,
                strokeWidth: 3,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'Memuat data toko ($_durasiDetik detik)...',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'Versi 1.0.0 Modul Pertemuan 10',
              style: TextStyle(fontSize: 11, color: Colors.blue.shade200),
            ),
          ],
        ),
      ),
    );
  }
}