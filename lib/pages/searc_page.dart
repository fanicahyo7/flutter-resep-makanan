import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_resep_makanan/bloc/searchresep/searchresep_bloc.dart';
import 'package:flutter_resep_makanan/shared/theme.dart';
import 'package:flutter_resep_makanan/widgets/resep_card.dart';

class SearchPage extends StatefulWidget {
  final String stringkey;
  const SearchPage({Key? key, required this.stringkey}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    searchController.text = widget.stringkey;
    context.read<SearchresepBloc>().add(SearchResep(searchController.text));
    super.initState();
  }

  Widget search() {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(21))),
      margin: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 20),
      child: TextField(
          controller: searchController,
          onEditingComplete: () {
            if (searchController.text != '') {
              setState(() {
                context
                    .read<SearchresepBloc>()
                    .add(SearchResep(searchController.text));
              });
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

  Widget listSearch() {
    return BlocBuilder<SearchresepBloc, SearchresepState>(
        builder: (context, state) {
      if (state is SearchresepLoaded) {
        if (state.resep.results!.isNotEmpty) {
          return Column(
            children: state.resep.results!
                .map((e) => Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: defaultMargin, vertical: 10),
                    child: ResepCard(resep: e, height: 80, width: 80)))
                .toList(),
          );
        } else {
          return Center(
            child: Column(
              children: [
                Text(
                  '\'' + searchController.text + '\' Tidak ditemukan',
                  style: blackTextStyle.copyWith(),
                ),
              ],
            ),
          );
        }
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
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
            color: Colors.grey[100],
          )),
          SafeArea(
            child: ListView(
              children: [search(), listSearch()],
            ),
          )
        ],
      ),
    );
  }
}
