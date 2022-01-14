import 'package:flutter/material.dart';
import 'package:flutter_resep_makanan/bloc/resepdetail/resepdetail_bloc.dart';
import 'package:flutter_resep_makanan/models/resep.dart';
import 'package:flutter_resep_makanan/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class ResepDetail extends StatefulWidget {
  final Resep resep;
  const ResepDetail({Key? key, required this.resep}) : super(key: key);

  @override
  State<ResepDetail> createState() => _ResepDetailState();
}

class _ResepDetailState extends State<ResepDetail> {
  @override
  void initState() {
    context.read<ResepdetailBloc>().add(FetchResepDetail(widget.resep.key));
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
          BlocBuilder<ResepdetailBloc, ResepdetailState>(
            builder: (context, state) {
              if (state is ResepdetailLoaded) {
                return SafeArea(
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                (state.resep.results!.thumb != null)
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
          ),
          SafeArea(
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
                  padding: EdgeInsets.symmetric(
                      horizontal: defaultMargin, vertical: 26),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(38.2),
                          topRight: Radius.circular(38.2)),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.resep.title,
                        style: blackTextStyle.copyWith(
                            fontWeight: bold, fontSize: 20),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
