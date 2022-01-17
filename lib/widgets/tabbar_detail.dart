import 'package:flutter/material.dart';
import 'package:flutter_resep_makanan/shared/theme.dart';

class TabbarDetail extends StatelessWidget {
  final int selectedIndex;
  final List<String> title;
  final Function(int) onTap;
  const TabbarDetail(
      {Key? key,
      required this.selectedIndex,
      required this.title,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: 58,
      child: Stack(
        children: [
          Container(
            color: kGreyColor,
            margin: const EdgeInsets.only(top: 48),
            height: 1,
          ),
          Row(
              children: title
                  .map((e) => Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                onTap(title.indexOf(e));
                              },
                              child: Text(
                                e,
                                style: (title.indexOf(e) == selectedIndex)
                                    ? blackTextStyle.copyWith(fontWeight: bold)
                                    : greyTextStyle,
                              ),
                            ),
                            Container(
                              height: 3,
                              width: 40,
                              margin: const EdgeInsets.only(top: 13),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1.5),
                                  color: (title.indexOf(e) == selectedIndex)
                                      ? kBlackColor
                                      : Colors.transparent),
                            )
                          ],
                        ),
                      ))
                  .toList())
        ],
      ),
    );
  }
}
