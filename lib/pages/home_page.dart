import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_resep_makanan/bloc/resep_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<ResepBloc>().add(FetchResep());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 50, left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Resep Makanan',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Temukan Resep Makanan Terbaikmu Disini',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<ResepBloc, ResepState>(builder: (context, state) {
                    if (state is ResepLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is ResepLoaded) {
                      return Column(
                        children: state.reseplist.results!.map((e) => Text(e.title)).toList(),
                      );
                    } else if (state is ResepFailed) {
                      return const Text('asdsd');
                    } else {
                       return const CircularProgressIndicator();
                    }
                  })
                ],
              )),
        ],
      ),
    );
  }
}
