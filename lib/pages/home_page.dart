import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_resep_makanan/bloc/newresep/newresep_bloc.dart';
import 'package:flutter_resep_makanan/bloc/resep/resep_bloc.dart';
import 'package:flutter_resep_makanan/bloc/resepcategory/resepcategory_bloc.dart';
import 'package:flutter_resep_makanan/shared/theme.dart';
import 'package:flutter_resep_makanan/widgets/button_category.dart';
import 'package:flutter_resep_makanan/widgets/newresep_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<NewresepBloc>().add(FetchNewResep());
    context.read<ResepcategoryBloc>().add(FetchCategory());
    context.read<ResepBloc>().add(FetchResep());
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
              'Resep Makanan',
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
                              right: 24,
                              left: (e == state.newreseplist.results!.first)
                                  ? 24
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
      return BlocBuilder<ResepBloc, ResepState>(builder: (context, state) {
        if (state is ResepLoaded) {
          return Column(
            children: state.reseplist.results!
                .map((e) => NewResepCard(resep: e))
                .toList(),
          );
        } else if (state is ResepFailed) {
          return Text(state.error.toString());
        } else {
          return const CircularProgressIndicator();
        }
      });
    }

    Widget category() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
                top: 10, left: defaultMargin, right: defaultMargin, bottom: 10),
            child: Text('Kategori',
                style: blackTextStyle.copyWith(fontSize: 16, fontWeight: bold)),
          ),
          BlocBuilder<ResepcategoryBloc, ResepcategoryState>(
              builder: (context, state) {
            if (state is ResepcategoryLoaded) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: state.list.results
                          .map(
                            (e) => ButtonCattegory(
                              title: e.category,
                            ),
                          )
                          .toList()),
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          })
        ],
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
          child: ListView(
        children: [header(), newResep(), category()],
      )),
    );
  }
}
