import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:elwatn/core/utils/app_colors.dart';
import 'package:elwatn/features/home_page/presentation/screens/home_page.dart';
import 'package:elwatn/features/location/presentation/screens/location_screen.dart';
import 'package:elwatn/features/profile/presentation/screens/user_profile.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../add/presentation/screens/add_screen.dart';
import '../../../favorite/presentation/screens/favorite.dart';
import '../widgets/drawer_widget.dart';

class NavigatorBar extends StatefulWidget {
  const NavigatorBar({Key? key}) : super(key: key);

  @override
  State<NavigatorBar> createState() => _NavigatorBarState();
}

class _NavigatorBarState extends State<NavigatorBar> {
  int _page = 2;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer:  DrawerWidget(closeDrawer: (){
        _scaffoldKey.currentState!.closeDrawer();
      }),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 2,
        height: 50.0,
        items: [
          _page != 0
              ? const Icon(Icons.favorite_border, size: 30)
              : const Icon(Icons.favorite_border,
                  size: 40, color: Colors.white),
          _page != 1
              ? const Icon(Icons.person, size: 30)
              : const Icon(Icons.person, size: 40, color: Colors.white),
          _page != 2
              ? const Icon(Icons.home, size: 30)
              : const Icon(Icons.home, size: 40, color: Colors.white),
          _page != 3
              ? const Icon(Icons.location_on, size: 30)
              : const Icon(Icons.location_on, size: 40, color: Colors.white),
          _page != 4
              ? const Icon(Icons.add_box_sharp, size: 30)
              : const Icon(Icons.add_box_sharp, size: 40, color: Colors.white),
        ],
        color: Colors.white,
        buttonBackgroundColor: AppColors.primary,
        backgroundColor: AppColors.scaffoldBackground,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(openMyDrawer: (){
                _scaffoldKey.currentState!.openDrawer();
              }),
              pages(),
            ],
          ),
        ),
      ),
    );
  }

  Widget pages() {
    if (_page == 0) {
      return const FavoriteScreen();
    } else if (_page == 1) {
      return const UserProfile();
    } else if (_page == 2) {
      return const HomePage();
    } else if (_page == 3) {
      return const LocationScreen();
    } else {
      return const AddScreen();
    }
  }
}
