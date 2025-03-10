import 'package:flutter/material.dart';
import 'package:pariwisata_app/dummy_data.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //TERIMA DATA DARI ARGUMEN, KARENA ARGUMEN YANG AKAN DIKIRIMKAN DATANYA HANYA SEBUAH STRING BIASA MAKA DARI .arguments LANGSUNG AKAN BERISI DATA TERSEBUT
    final id = ModalRoute.of(context)?.settings.arguments as String;

    //KEMUDIAN MENCARI DATA PLACE DARI DATA DUMMY BERDASARKAN ID MENGGUNAKAN FIRSTWHERE()
    final selectedPlace =
        PLACES_DUMMY_DATA.firstWhere((place) => place.id == id);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Informasi"),
      ),
      //KITA GUNAKAN SingleChildScrollView() AGAR HALAMAN BISA DI SCROLL
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //BAGIAN PERTAMA ADALAH FUNGSI UNTUK ME-LOAD GAMBAR
            Stack(
              children: <Widget>[
                //DIMANA PADA SISI BAWAH KANAN DAN KIRIM AKAN DIBUAT MELENGKUNG
                //MENGGUNAKAN BORDERRADIUS
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  //LOAD GAMBARNYA DARI INTERNET
                  child: Image.network(
                    selectedPlace.image,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                //BAGIAN INI AKAN MENAMPILKAN NAMA TEMPAT WISATA
                //KITA GUNAKAN POSITIONED KARENA AKAN MENAMPILKAN TEKSNYA DI DALAM GAMBAR
                //AGAR LEBIH MUDAH DI ATUR POSISINYA
                Positioned(
                  bottom: 20, //JARAKNYA 20 DARI BAWAH
                  right: 15, //DAN 15 DARI KANAN
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //KEMUDIAN KITA TAMPILKAN NAMA TEMPAT WISATANYA
                        Text(
                          selectedPlace.name,
                          style: const TextStyle(
                              fontSize: 26, color: Colors.white),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        //DIBAWAH TEKSNYA KITA TAMPILKAN NAMA PENULISNYA / INFORMATORNYA
                        Text(
                          "Author: ${selectedPlace.author}",
                          style:
                              const TextStyle(fontSize: 15, color: Colors.grey),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            //BUAT JARAK DENGAN SIZEDBOX
            const SizedBox(
              height: 4,
            ),
            //BUAT CARD LAGI UNTUK MENAMPILKAN HARGA TIKET MASUK
            Card(
              margin: const EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  const Icon(
                    Icons.money_off,
                    size: 40,
                  ),
                  Text(
                    "Tiket Masuk: Rp ${selectedPlace.price}",
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
            ),
            //BUAT CARD LAGI UNTUK MENAMPILKAN DESCRIPTION
            Card(
              margin: const EdgeInsets.all(10),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(selectedPlace.description),
              ),
            )
          ],
        ),
      ),
    );
  }
}
