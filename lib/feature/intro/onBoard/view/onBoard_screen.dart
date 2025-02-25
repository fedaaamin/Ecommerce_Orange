import 'package:counter/core/constants/app_color.dart';
import 'package:counter/feature/auth/presentation/login_screen.dart';
import 'package:counter/feature/intro/onBoard/data/model/onBoard_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardScreen extends StatefulWidget {
   const OnboardScreen({super.key});
  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  double progress = 1/3;
  int currentIndex = 0;
  List<OnBoardModel> data = [
    OnBoardModel(
      imgPath:"assets/images/onBoard1.png" ,
      title:"Find the item you've been looking for" ,
      subTitle:" Here you'll see rich varieties of goods, carefully classified for seamless browsing experience",
    ),
    OnBoardModel(
      imgPath:"assets/images/onBoard2.png" ,
      title:"Get those shopping bags filled " ,
      subTitle:"Add any item you want to your cart or save it on your wishlist, so you don't miss it in your future purchase."),
    OnBoardModel(
      imgPath:"assets/images/onBoard3.png" ,
      title:"Fast & Secure payment",
      subTitle:"There are many payment options available to speed up and simplify your payment process."
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Text("Skip",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           data[currentIndex],
        SizedBox(height:25.h),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 84.w,
              height: 84.h,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 3,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation(AppColor.buttonColor
              ),
            ),
            ),
            ElevatedButton(
              onPressed: () {
                if (progress == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                } else {
                  setState(() {
                    progress += 1 / 3;
                    currentIndex++;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(13),
                backgroundColor: AppColor.buttonColor
              ),
              child: Icon(Icons.arrow_forward, size: 30, color: Colors.white),
            ),
          ],
        ),

        ],
      ),
    );
  }
}
