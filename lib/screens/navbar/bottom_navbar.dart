import 'package:bite_buddies/screens/menu/menuScreen.dart';
import 'package:bite_buddies/screens/more/moreScreen.dart';
import 'package:bite_buddies/screens/offers/offerScreen.dart';
import 'package:bite_buddies/screens/profile/profileScreen.dart';
import 'package:custom_top_navigator/custom_top_navigator.dart';
import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../home/homeScreen.dart';

GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

class BottomNavigation extends StatefulWidget {
  static const routeName = "/BottomNavigation";
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  int _currentIndex = 0;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Widget> _children = [
    HomeScreen(),
    OfferScreen(),
    MenuScreen(),
    ProfileScreen(),
    MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // MediaQueryData queryData;
    // queryData = MediaQuery.of(context);
    // var screenWidth = queryData.size.width / 100;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.bright,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColor.bright,
          currentIndex: _currentIndex,
          items: const [
            // Home
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: "Home",
            ),
            // Offers
            BottomNavigationBarItem(
              icon: Icon(
                Icons.local_offer_outlined,
              ),
              label: "Offers",
              activeIcon: Icon(
                Icons.local_offer,
              ),
            ),
            // Menu
            BottomNavigationBarItem(
              icon: Icon(
                Icons.menu_book_outlined,
              ),
              activeIcon: Icon(
                Icons.menu_book,
              ),
              label: "Menu",
            ),
            // Profile
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              activeIcon: Icon(
                Icons.person,
              ),
              label: "Profile",
            ),
            // More
            BottomNavigationBarItem(
              icon: Icon(
                Icons.more_horiz_outlined,
              ),
              activeIcon: Icon(
                Icons.more_horiz,
              ),
              label: "More",
            ),
          ],
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColor.main,
          unselectedItemColor: AppColor.disabled,
          onTap: (index) {
            mainNavigatorKey.currentState?.maybePop();
            setState(() {
              _children[_currentIndex];
              _currentIndex = index;
            });
          },
        ),
        body: CustomTopNavigator(
          navigatorKey: mainNavigatorKey,
          home: _children[_currentIndex],
          pageRoute: PageRoutes.materialPageRoute,
        ),
      ),
    );
  }
}
