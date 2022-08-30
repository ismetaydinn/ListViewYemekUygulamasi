import 'package:flutter/material.dart';
import 'package:flutter_listview_project/yemekler.dart';

class DetaySayfa extends StatefulWidget {

  Yemekler yemek;
  DetaySayfa({required this.yemek});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.yemek.yemek_ad}"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${widget.yemek.yemek_resim_adi}"),
            Text("${widget.yemek.yemek_ad}", style: const TextStyle(fontSize: 30.0, color: Colors.black54),),
            Text("${widget.yemek.yemek_fiyat} ₺", style: const TextStyle(fontSize: 50.0, color: Colors.blue),),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                  ),
                  onPressed: (){
                    print("${widget.yemek.yemek_ad} sipariş verildi.");
                  },
                  child: Text("SİPARİŞ VER", style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
