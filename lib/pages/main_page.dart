import 'package:flutter/material.dart';
import 'package:flutter_resep_makanan/bloc/newresep/newresep_bloc.dart';
import 'package:flutter_resep_makanan/bloc/resep/resep_bloc.dart';
import 'package:flutter_resep_makanan/bloc/resepcategory/resepcategory_bloc.dart';
import 'package:flutter_resep_makanan/pages/favorite_page.dart';
import 'package:flutter_resep_makanan/pages/home_page.dart';
import 'package:flutter_resep_makanan/shared/theme.dart';
import 'package:flutter_resep_makanan/widgets/bottom_navbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  final int bottomNavbarIndex;
  const MainPage({Key? key, this.bottomNavbarIndex = 0}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int bottomNavbarIndex;
  late PageController pageController;

  @override
  void initState() {
    super.initState();

    context.read<NewresepBloc>().add(FetchNewResep());
    context.read<ResepcategoryBloc>().add(FetchCategory());
    context.read<ResepBloc>().add(FetchResep());

    bottomNavbarIndex = widget.bottomNavbarIndex;
    pageController = PageController(initialPage: bottomNavbarIndex);
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
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  bottomNavbarIndex = index;
                });
              },
              children: const [HomePage(), FavoritePage()],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavbar(
                selectedIndex: bottomNavbarIndex,
                onTap: (index) {
                  setState(() {
                    bottomNavbarIndex = index;
                  });
                  pageController.jumpToPage(bottomNavbarIndex);
                }),
          )
        ],
      ),
    );
  }
}
