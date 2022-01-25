import 'package:flutter/material.dart';
import 'package:flutter_resep_makanan/bloc/resepdetail/resepdetail_bloc.dart';
import 'package:flutter_resep_makanan/models/resep.dart';
import 'package:flutter_resep_makanan/services/sql_service.dart';
import 'package:flutter_resep_makanan/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_resep_makanan/widgets/tabbar_detail.dart';
import 'package:shimmer/shimmer.dart';

class ResepDetail extends StatefulWidget {
  final Resep resep;
  const ResepDetail({Key? key, required this.resep}) : super(key: key);

  @override
  State<ResepDetail> createState() => _ResepDetailState();
}

class _ResepDetailState extends State<ResepDetail> {
  int selectedIndex = 0;
  bool isFavorite = false;
  Resep? resepFavoriteList;

  void _refreshResepFavorite() async {
    final data = await SQLHelper.getItem(widget.resep.key);

    if (data.title != '') {
      setState(() {
        resepFavoriteList = Resep(
            key: data.key,
            title: data.title,
            thumb: data.thumb,
            times: data.times);
      });
      isFavorite = resepFavoriteList != null ? true : false;
    }
  }

  @override
  void initState() {
    _refreshResepFavorite();
    context.read<ResepdetailBloc>().add(FetchResepDetail(widget.resep.key));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget imageResep() {
      return BlocBuilder<ResepdetailBloc, ResepdetailState>(
        builder: (context, state) {
          if (state is ResepdetailLoaded) {
            return SafeArea(
              child: Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage((state.resep.results!.thumb != null)
                            ? state.resep.results!.thumb.toString()
                            : widget.resep.thumb),
                        fit: BoxFit.cover)),
              ),
            );
          } else {
            return SafeArea(
                child: Shimmer.fromColors(
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/default-image.png'),
                              fit: BoxFit.fill)),
                    ),
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100));
          }
        },
      );
    }

    Widget tabbar() {
      return Container(
        margin: const EdgeInsets.only(top: 6),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TabbarDetail(
                selectedIndex: selectedIndex,
                title: const ["Deskripsi", "Bahan-bahan", "Langkah"],
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                }),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<ResepdetailBloc, ResepdetailState>(
                builder: (context, state) {
              if (state is ResepdetailLoaded) {
                String kalimatbaru = "";
                String ambilkalimat = state.resep.results!.desc!.substring(0,state.resep.results!.desc!.length-1);
                var kalimat = state.resep.results!.desc?.split(".");
                // for (int a = 0; a <= kalimat!.length-1; a++) {
                //   print(kalimat[a].substring(0,1));
                //   if (kalimat[a].substring(0,1) != " ") {
                //     if (a == 0) {
                //       kalimatbaru += "\t\t\t" + kalimat[a].trimLeft();
                //     }else{
                //       kalimatbaru += "\n\t\t\t" + kalimat[a].trimLeft();
                //     }
                    
                //   } else {
                //     kalimatbaru += kalimat[a];
                //   }
                // }
                kalimatbaru = state.resep.results!.desc.toString();

                if (selectedIndex == 0) {
                  return Text(
                    kalimatbaru,
                    style: blackTextStyle.copyWith(fontSize: 14),
                    textAlign: TextAlign.justify,
                  );
                } else if (selectedIndex == 1) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: state.resep.results!.ingredient!
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                e,
                                style: blackTextStyle.copyWith(fontSize: 14),
                              ),
                            ))
                        .toList(),
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: state.resep.results!.step!
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                e,
                                style: blackTextStyle.copyWith(fontSize: 14),
                              ),
                            ))
                        .toList(),
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            })
          ],
        ),
      );
    }

    Future<void> _addItem() async {
      await SQLHelper.createItem(Resep(
          key: widget.resep.key,
          title: widget.resep.title,
          thumb: widget.resep.thumb,
          times: widget.resep.times));
    }

    void _deleteItem(String key) async {
      await SQLHelper.deleteItem(key);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Berhasil menghapus dari Favorit!'),
      ));
    }

    Widget detail() {
      return SafeArea(
        child: ListView(
          children: [
            Container(
              height: 100,
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset('assets/back_arrow.png'),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 180),
              padding:
                  EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 26),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(38.2),
                      topRight: Radius.circular(38.2)),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 90,
                        child: Text(
                          widget.resep.title,
                          style: blackTextStyle.copyWith(
                              fontWeight: bold, fontSize: 20),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isFavorite) {
                              _deleteItem(widget.resep.key);
                              isFavorite = false;
                            } else {
                              _addItem();
                              isFavorite = true;
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(
                            (isFavorite)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: 30,
                            color: (isFavorite) ? Colors.pink : Colors.grey,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  tabbar()
                ],
              ),
            )
          ],
        ),
      );
    }

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
          imageResep(),
          detail(),
        ],
      ),
    );
  }
}
