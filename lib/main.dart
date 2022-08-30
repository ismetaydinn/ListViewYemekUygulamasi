import 'package:flutter/material.dart';
import 'package:flutter_listview_project/detay_sayfa.dart';
import 'package:flutter_listview_project/yemekler.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  Future<List<Yemekler>> yemekleriGetir() async{
    var yemekListesi = <Yemekler>[];

    var y1 = Yemekler(yemek_id: 1, yemek_ad: "Köfte", yemek_resim_adi: "kofte.png", yemek_fiyat: 15.99);
    var y2 = Yemekler(yemek_id: 2, yemek_ad: "Ayran", yemek_resim_adi: "ayran.png", yemek_fiyat: 2.0);
    var y3 = Yemekler(yemek_id: 3, yemek_ad: "Fanta", yemek_resim_adi: "fanta.png", yemek_fiyat: 3.0);
    var y4 = Yemekler(yemek_id: 4, yemek_ad: "Makarna", yemek_resim_adi: "makarna.png", yemek_fiyat: 14.99);
    var y5 = Yemekler(yemek_id: 5, yemek_ad: "Kadayıf", yemek_resim_adi: "kadayif.png", yemek_fiyat: 8.50);
    var y6 = Yemekler(yemek_id: 6, yemek_ad: "Baklava", yemek_resim_adi: "baklava.png", yemek_fiyat: 15.99);

    yemekListesi.add(y1);
    yemekListesi.add(y2);
    yemekListesi.add(y3);
    yemekListesi.add(y4);
    yemekListesi.add(y5);
    yemekListesi.add(y6);

    return yemekListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yemekler"),
      ),
      body: FutureBuilder<List<Yemekler>>(
        future: yemekleriGetir(),
        builder: (context, snapshot){
          if(snapshot.hasData){

            var yemekler = snapshot.data;

            return ListView.builder(
              itemCount: yemekler!.length,
              itemBuilder: (context, indeks){
                var yemek = yemekler[indeks];

                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(yemek: yemek)));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(width: 150, height: 150, child: Image.asset("resimler/${yemek.yemek_resim_adi}")),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(yemek.yemek_ad, style: const TextStyle(fontSize: 25.0),),
                            const SizedBox(height: 50,),
                            Text("${yemek.yemek_fiyat} ₺", style: const TextStyle(fontSize: 20.0, color: Colors.blue),),
                          ],
                        ),
                        const Spacer(),
                        const Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ),
                );
              },
            );
          }else{
            return const Center();
          }
        },
      ),
    );
  }
}
