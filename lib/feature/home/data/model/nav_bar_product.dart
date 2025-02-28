import 'package:counter/feature/cart/presentation/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../core/widgets/custom_button.dart' show CustomButton;

class NavBarProduct extends StatelessWidget {
   final VoidCallback onTap;
  const NavBarProduct({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: onTap,
                icon: Icon(Icons.shopping_bag_outlined)),
            CustomButton(
                label: "Checkout", onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                  child: CartScreen(),
                  type: PageTransitionType.fade,
                ),
              );
            })
          ],
        );
  }
}
