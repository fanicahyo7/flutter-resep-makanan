import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_resep_makanan/bloc/resepcategorylist/resepcategorylist_bloc.dart';
import 'package:flutter_resep_makanan/shared/theme.dart';
import 'package:flutter_resep_makanan/widgets/resep_card.dart';

class ResepByCategory extends StatefulWidget {
  final String titlekey;
  final String title;

  const ResepByCategory({Key? key, required this.titlekey, required this.title})
      : super(key: key);

  @override
  State<ResepByCategory> createState() => _ResepByCategoryState();
}

class _ResepByCategoryState extends State<ResepByCategory> {
  @override
  void initState() {
    context
        .read<ResepcategorylistBloc>()
        .add(FetchResepByCategory(widget.titlekey));
    super.initState();
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
                      horizontal: defaultMargin, vertical: defaultMargin),
                  child: Text(
                    widget.title,
                    style:
                        blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                  ),
                ),
                BlocBuilder<ResepcategorylistBloc, ResepcategorylistState>(
                  builder: (context, state) {
                    if (state is ResepcategoryListLoaded) {
                      return Column(
                        children: state.list.results!
                            .map((e) => Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: defaultMargin),
                                child: ResepCard(
                                  resep: e,
                                  height: 90,
                                  width: 90,
                                )))
                            .toList(),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
