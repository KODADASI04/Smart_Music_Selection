import 'package:flutter/material.dart';

class Datas extends StatefulWidget {
  const Datas({super.key});

  @override
  State<Datas> createState() => _DatasState();
}

class _DatasState extends State<Datas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verileriniz"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: const [
            StresSatiri(),
            KalpAtisiSatiri(),
            HavaDurumuSatiri(),
            GunDilimiSatiri(),
            YaptigiEtkinlikSatiri(),
          ],
        ),
      ),
    );
  }
}

//STRES SATIRI BİTTİ
class StresSatiri extends StatelessWidget {
  const StresSatiri({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'images/fear.png',
              height: 55,
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 10, //aldığımız verinin yüzdesi, 10 eklememiz lazım
                    ),
                    Image.asset(
                      'images/caret-down.png',
                      width: 25,
                    )
                  ],
                ),
                Container(
                  width: 110,
                  height: 20,
                  margin: const EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.green, Colors.red],
                      ),
                      border: Border.all(color: Colors.black, width: 5),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class KalpAtisiSatiri extends StatelessWidget {
  const KalpAtisiSatiri({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'images/heart-rate.png',
              height: 55,
            ),
            const SizedBox(
              width: 73,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "70", //kalp atış sayısı, şöyle bir problem var 3 haneli olursa ikonların yeri kayıyor bir daha bakmam lazım
                          style: TextStyle(
                              fontFamily: 'LilitaOne',
                              fontSize: 5,
                              color: Color.fromARGB(255, 6, 119, 15)),
                        ),
                        SizedBox(
                          width: 32,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class HavaDurumuSatiri extends StatelessWidget {
  const HavaDurumuSatiri({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'images/weather.png',
            height: 80,
          ),
          const SizedBox(
            width: 60,
          ),
          Image.asset(
            "images/snow.png",
            height: 80,
          ),
          const SizedBox(
            width: 0,
          )
        ],
      ),
    );
  }
}

class GunDilimiSatiri extends StatelessWidget {
  const GunDilimiSatiri({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [Expanded(child: Image.asset('images/weather.png'))],
      ),
    );
  }
}

class YaptigiEtkinlikSatiri extends StatelessWidget {
  const YaptigiEtkinlikSatiri({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [Expanded(child: Image.asset('images/fear.png'))],
      ),
    );
  }
}
