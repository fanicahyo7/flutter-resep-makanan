import 'package:flutter/material.dart';
import 'package:flutter_resep_makanan/shared/theme.dart';

class ButtonCattegory extends StatelessWidget {
  final String title;
  const ButtonCattegory({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            margin: const EdgeInsets.only(bottom: 4),
            height: 50,
            width: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Center(
                child: SizedBox(
                    height: 36,
                    child:
                        Image(image: AssetImage(getImageFromTitle(title)))))),
        const SizedBox(
          height: 4,
        ),
        Text(
          title,
          style: blackTextStyle.copyWith(fontSize: 13),
        )
      ],
    );
  }

  String getImageFromTitle(String genre) {
    switch (genre) {
      case "Dessert":
        return "assets/ketupat.png";
      case "Masakan Hari Raya":
        return "assets/ketupat.png";

      case "Masakan Tradisional":
        return "assets/ketupat.png";

      case "Menu Makan Malam":
        return "assets/ketupat.png";

      case "Menu Makan Siang":
        return "assets/ketupat.png";

      case "Resep Ayam":
        return "assets/ketupat.png";

      case "Resep Daging":
        return "assets/ketupat.png";

      case "Resep Sayuran":
        return "assets/ketupat.png";
      case "Resep Seafood":
        return "assets/ketupat.png";
      case "Sarapan":
        return "assets/ketupat.png";

      default:
        return "";
    }
  }
}
