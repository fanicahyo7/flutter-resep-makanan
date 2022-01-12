import 'package:flutter/material.dart';
import 'package:flutter_resep_makanan/models/resep.dart';
import 'package:flutter_resep_makanan/shared/theme.dart';

class NewResepCard extends StatelessWidget {
  final Resep resep;

  const NewResepCard({Key? key, required this.resep}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: 209,
      width: 231,
      decoration: BoxDecoration(
          color: kWhiteColor, borderRadius: BorderRadius.circular(14)),
      child: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(14),
                    topLeft: Radius.circular(14)),
                image: DecorationImage(
                    image: NetworkImage(resep.thumb), fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
              child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Text(
              resep.title,
              style: blackTextStyle.copyWith(fontWeight: bold),
            ),
          ))
        ],
      ),
    );
  }
}
