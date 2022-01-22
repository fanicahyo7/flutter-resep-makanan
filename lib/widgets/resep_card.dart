import 'package:flutter/material.dart';
import 'package:flutter_resep_makanan/models/resep.dart';
import 'package:flutter_resep_makanan/shared/theme.dart';

class ResepCard extends StatelessWidget {
  final Resep resep;
  final double height;
  final double width;

  const ResepCard({Key? key, required this.resep, required this.height, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: height,
            width: width,
            margin: const EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8)),
              image: DecorationImage(
                  image: NetworkImage(resep.thumb), fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                resep.title,
                style: blackTextStyle.copyWith(fontSize: 14, fontWeight: bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
