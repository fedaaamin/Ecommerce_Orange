
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:counter/core/db/cache/cache_helper.dart';
import 'package:counter/feature/home/presentation/home_screen.dart';
import 'package:counter/feature/intro/onBoard/view/onBoard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  bool isLogin = false;
  String? token;
  @override
  void initState() {
    CacheHelper.init();
    token = CacheHelper.getData(key: "token");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: FlutterSplashScreen.fadeIn(
          nextScreen: token != null ? HomeScreen() : OnboardScreen(),
          backgroundColor: Colors.white,
          duration: const Duration(milliseconds: 3515),
          childWidget:
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: 72.w, height: 72.h,),
                SizedBox(height: 34.h),
                Text("E-Commerce.",
                  style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ]
          ),
        ),
      );
  }
}
