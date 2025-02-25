import 'package:counter/core/db/cache/cache_helper.dart';
import 'package:counter/core/db/local_db/local_db_helper.dart';
import 'package:counter/core/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'feature/intro/splash_screen.dart';


Future<void>main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await SQLHelper.initDb();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (_ , child) {
      return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white
          )
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      );
    }
    );
  }
}


