import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_resep_makanan/bloc/resep_bloc.dart';
import 'package:flutter_resep_makanan/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ResepBloc())],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Food Recipes',
          theme: ThemeData(),
          home: const HomePage()),
    );
  }
}
