import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_resep_makanan/bloc/resepcategory/resepcategory_bloc.dart';
import 'package:flutter_resep_makanan/models/resep_category.dart';

class ResepByCategory extends StatefulWidget {
  final ResepCategory resepCategory;

  const ResepByCategory({Key? key, required this.resepCategory})
      : super(key: key);

  @override
  State<ResepByCategory> createState() => _ResepByCategoryState();
}

class _ResepByCategoryState extends State<ResepByCategory> {
  @override
  void initState() {
    context
        .read<ResepcategoryBloc>()
        .add(FetchResepByCategory(widget.resepCategory.key));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
