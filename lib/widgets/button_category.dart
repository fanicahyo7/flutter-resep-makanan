import 'package:flutter/material.dart';
import 'package:flutter_resep_makanan/shared/theme.dart';

class ButtonCattegory extends StatelessWidget {
  final String title;
  const ButtonCattegory({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      child: Column(
        children: <Widget>[
          Container(
              margin: const EdgeInsets.only(bottom: 4),
              height: 50,
              width: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: kPrimaryColor),
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
      ),
    );
  }

  String getImageFromTitle(String genre) {
    switch (genre) {
      case "Dessert":
        return "assets/cake-slice.png";
      case "Masakan Hari Raya":
        return "assets/ketupat.png";
      case "Masakan Tradisional":
        return "assets/market.png";
      case "Menu Makan Malam":
        return "assets/dinner.png";
      case "Menu Makan Siang":
        return "assets/lunch-time.png";
      case "Resep Ayam":
        return "assets/chicken-leg.png";
      case "Resep Daging":
        return "assets/meat.png";
      case "Resep Sayuran":
        return "assets/vegetable.png";
      case "Resep Seafood":
        return "assets/shrimp.png";
      case "Sarapan":
        return "assets/Breakfast.png";
      default:
        return "";
    }
  }
}
