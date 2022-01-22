import 'package:flutter/material.dart';
import 'package:flutter_resep_makanan/shared/theme.dart';

class BottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;
  const BottomNavbar(
      {Key? key, required this.selectedIndex, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              onTap(0);
            },
            child: Column(
              children: [
                Icon(
                  Icons.home,
                  color: (selectedIndex == 0) ? kPrimaryColor : Colors.grey,
                  size: 32,
                ),
                Text(
                  'Beranda',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    color: (selectedIndex == 0) ? kPrimaryColor : Colors.grey,
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              onTap(1);
            },
            child: Column(
              children: [
                Icon(
                  Icons.favorite,
                  color: (selectedIndex == 1) ? kPrimaryColor : Colors.grey,
                  size: 32,
                ),
                Text(
                  'Favorit',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    color: (selectedIndex == 1) ? kPrimaryColor : Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
