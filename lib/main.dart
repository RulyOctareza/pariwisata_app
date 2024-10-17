import 'package:flutter/material.dart';
import 'package:pariwisata_app/category_screen.dart';
import 'package:pariwisata_app/detail_screem.dart';
import 'package:pariwisata_app/places.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Pariwisata',
      //KITA SET THEME-NYA SECARA UMUM AGAR KETIKA MELAKUKAN PERUBAHAN, CUKUP PADA SETTING DIBAWAH AKAN MEMBERIKAN EFEK KE SEMUA PAGE YANG ADA
      theme: ThemeData(
          primaryColor: Colors.pinkAccent, //WARNA UTAMA KITA GUNAKAN pinkAccent
          hintColor: Colors.pink, //SECONDARY COLORNYA KITA SET KE PINK
          canvasColor: const Color.fromRGBO(255, 254, 229,
              1), //WARNA BACKGROUND CANVASNYA PAKAI RGBO DIMANA CODE DIATAS AKAN MENGHASILKAN WARNA KUNING

          //SET JUGA KONFIGURASI UNTUK TEXT-NYA
          textTheme: ThemeData.light().textTheme.copyWith(
                titleLarge: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20), //TITLE KITA GUNAKAN BOLD DAN SIZE 20
                titleMedium: const TextStyle(
                    fontWeight: FontWeight.bold), //SUBHEADNYA CUKUP BOLD SAJA
              )),

      //SET ROUTING YANG AKAN MENGATUR ALUR APLIKASI
      routes: {
        '/': (ctx) =>
            const CategoryScreen(), //DIMANA ROOT ROUTINGNYA AKAN ME-LOAD CategoryScreen
        '/places': (ctx) => const PlacesScreen(),
        '/detail': (ctx) => const DetailScreen()
        // TANDA / BERARTI SECARA DEFAULT KETIKA APLIKASI DI-LOAD MAKA ROUTE TERSEBUT AKAN DIJALANKAN
      },
    );
  }
}
