import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../core/constants/app_color.dart';
import '../../browse/view/BrowseScreen.dart';
import '../../cart/presentation/cart_screen.dart';
import '../../profile/view/profile_screen.dart';
import '../../wishlist/view/wishlist_screen.dart';
import 'home_page_screen.dart';

class CustomNavBar extends StatefulWidget {
  final int initialIndex;
  const CustomNavBar({Key? key, required this.initialIndex}) : super(key: key);


  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  late int _currentIndex;
  final List<Widget> screens = [
    HomePageScreen(),
    BrowseScreen(),
    WishlistScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }
  void onItemTapped(int index) {
    if (index != _currentIndex) {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child:CustomNavBar(initialIndex: index),
          duration: Duration(milliseconds: 500),
        ),
      ).then((_) {
        setState(() {
          _currentIndex = index;
        });
      });
    }
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: _currentIndex,
            children: screens,
          ),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: screens[_currentIndex],
            transitionBuilder: (child, animation) => PageTransition(
              type: PageTransitionType.fade,
              duration: Duration(milliseconds: 300),
              child: child,
            ).child!,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        elevation: 0,
        backgroundColor: Colors.white,
        fixedColor: AppColor.buttonColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined), label: "Browse"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: "Wishlist"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity), label: "Profile"),
        ],
      ),
    );
  }
}