import 'package:flutter/material.dart';
import 'package:flutter_resep_makanan/models/resep.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Resep> mResep ;
    return Scaffold(
      body: Stack(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 50, left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Resep Makanan',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Temukan Resep Makanan Terbaikmu Disini',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [],
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // children: mResep.map((e) => (Text(e.judul))).toList(),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
