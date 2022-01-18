import 'package:flutter/material.dart';
import 'package:flutter_resep_makanan/pages/resep_by_category.dart';
import 'package:flutter_resep_makanan/shared/theme.dart';

class ButtonCattegory extends StatelessWidget {
  final String title;
  final String titlekey;
  const ButtonCattegory({Key? key, required this.title, required this.titlekey})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ResepByCategory(
                      titlekey: titlekey, title: title,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0),
              blurRadius: 1.0,
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Container(
                margin: const EdgeInsets.only(bottom: 4, top: 8),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: kPrimaryColor,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Center(
                    child: SizedBox(
                        height: 36,
                        child: Image(
                            image: AssetImage(getImageFromTitle(title)))))),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                title,
                style: blackTextStyle.copyWith(fontSize: 13),
              ),
            )
          ],
        ),
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
        return "assets/default-iamge.png";
    }
  }
}
