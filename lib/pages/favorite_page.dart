import 'package:flutter/material.dart';
import 'package:flutter_resep_makanan/models/resep.dart';
import 'package:flutter_resep_makanan/services/sql_service.dart';
import 'package:flutter_resep_makanan/shared/theme.dart';
import 'package:flutter_resep_makanan/widgets/resep_card.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<Resep> _resepFavoriteList = [];

  void _refreshResepFavorite() async {
    _resepFavoriteList = [];
    final data = await SQLHelper.getItems();
    setState(() {
      _resepFavoriteList = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshResepFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: kPrimaryColor,
          ),
          SafeArea(
              child: Container(
            color: Colors.grey[50],
          )),
          SafeArea(
              child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: defaultMargin, vertical: 20),
                child: Text(
                  'Resep Favorite',
                  style:
                      blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                ),
              ),
              Column(
                children: _resepFavoriteList
                    .map((e) => Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: defaultMargin, vertical: 10),
                          child: ResepCard(
                            resep: e,
                            height: 80,
                            width: 80,
                          ),
                        ))
                    .toList(),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
