import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_resep_makanan/bloc/newresep/newresep_bloc.dart';
import 'package:flutter_resep_makanan/bloc/resep/resep_bloc.dart';
import 'package:flutter_resep_makanan/bloc/resepcategory/resepcategory_bloc.dart';
import 'package:flutter_resep_makanan/pages/resep_detail.dart';
import 'package:flutter_resep_makanan/pages/searc_page.dart';
import 'package:flutter_resep_makanan/shared/theme.dart';
import 'package:flutter_resep_makanan/widgets/button_category.dart';
import 'package:flutter_resep_makanan/widgets/newresep_card.dart';
import 'package:flutter_resep_makanan/widgets/resep_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 30, left: 24, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'COOKPATH',
              style:
                  blackTextStyle.copyWith(fontWeight: semibold, fontSize: 30),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Temukan Resep Makanan Terbaikmu Disini',
              style: greyTextStyle.copyWith(fontWeight: light, fontSize: 14),
            ),
          ],
        ),
      );
    }

    Widget newResep() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.only(left: 24),
              child: Text(
                'Resep Baru',
                style: blackTextStyle.copyWith(fontSize: 16, fontWeight: bold),
              )),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<NewresepBloc, NewresepState>(builder: (context, state) {
            if (state is NewResepLoaded) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: state.newreseplist.results!
                      .map((e) => Padding(
                            padding: EdgeInsets.only(
                              right: defaultMargin,
                              left: (e == state.newreseplist.results!.first)
                                  ? defaultMargin
                                  : 0,
                            ),
                            child: NewResepCard(resep: e),
                          ))
                      .toList(),
                ),
              );
            } else if (state is NewResepFailed) {
              return Text(state.error.toString());
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
        ],
      );
    }

    Widget resepList() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.only(left: 24, top: 20),
              child: Text(
                'Daftar Resep Masakan',
                style: blackTextStyle.copyWith(fontSize: 16, fontWeight: bold),
              )),
          BlocBuilder<ResepBloc, ResepState>(builder: (context, state) {
            if (state is ResepLoaded) {
              return Column(
                children: state.reseplist.results!
                    .map((e) => Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 10, horizontal: defaultMargin),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResepDetail(
                                          resep: e,
                                        )));
                          },
                          child: ResepCard(
                            resep: e,
                            height: 80,
                            width: 80,
                          ),
                        )))
                    .toList(),
              );
            } else if (state is ResepFailed) {
              return Text(state.error.toString());
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
          const SizedBox(
            height: 60,
          ),
        ],
      );
    }

    Widget category() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
                top: 15, bottom: 10, right: defaultMargin, left: defaultMargin),
            child: Text('Kategori',
                style: blackTextStyle.copyWith(fontSize: 16, fontWeight: bold)),
          ),
          BlocBuilder<ResepcategoryBloc, ResepcategoryState>(
              builder: (context, state) {
            if (state is ResepcategoryLoaded) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: state.list.results
                        .map(
                          (e) => Container(
                            margin: EdgeInsets.only(
                                right: (e == state.list.results.last) ? 24 : 10,
                                left: (e == state.list.results.first)
                                    ? defaultMargin
                                    : 0),
                            child: ButtonCattegory(
                              title: e.category,
                              titlekey: e.key,
                            ),
                          ),
                        )
                        .toList()),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          })
        ],
      );
    }

    Widget search() {
      return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(21))),
        margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 20),
        child: TextField(
            controller: searchController,
            onEditingComplete: () {
              if (searchController.text != '') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchPage(
                              stringkey: searchController.text,
                            )));
                FocusManager.instance.primaryFocus!.unfocus();
              }
            },
            style: blackTextStyle.copyWith(fontSize: 10),
            decoration: InputDecoration(
                hintText: 'Cari Resep Makanan',
                hintStyle: greyTextStyle.copyWith(fontSize: 10),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(21)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                    borderSide: BorderSide(color: kPrimaryColor)))),
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
            color: Colors.grey[100],
          )),
          SafeArea(
              child: ListView(
            children: [
              header(),
              search(),
              newResep(),
              category(),
              resepList(),
            ],
          )),
        ],
      ),
    );
  }
}
