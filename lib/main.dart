import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_resep_makanan/bloc/newresep/newresep_bloc.dart';
import 'package:flutter_resep_makanan/bloc/resep/resep_bloc.dart';
import 'package:flutter_resep_makanan/bloc/resepcategory/resepcategory_bloc.dart';
import 'package:flutter_resep_makanan/pages/home_page.dart';
import 'package:flutter_resep_makanan/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ResepBloc()),
        BlocProvider(
          create: (context) => NewresepBloc(),
        ),
        BlocProvider(create: (context) => ResepcategoryBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food Recipes',
        theme: ThemeData(),
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => const HomePage(),
        },
      ),
    );
  }
}
