import 'package:flutter/material.dart';
import 'package:flutter_resep_makanan/models/resep.dart';
import 'package:flutter_resep_makanan/shared/theme.dart';

class ResepCard extends StatelessWidget {
  final Resep resep;

  const ResepCard({Key? key, required this.resep}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          color: kWhiteColor, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8)),
                image: DecorationImage(
                    image: NetworkImage(resep.thumb), fit: BoxFit.cover)),
          ),
          Expanded(
            child: Text(
              resep.title,
              style: blackTextStyle.copyWith(fontSize: 14, fontWeight: bold),
            ),
          )
        ],
      ),
    );
  }
}
