
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardModel extends StatelessWidget {
  String imgPath;
  String title;
  String subTitle;

  OnBoardModel(
      {super.key,
      required this.imgPath,
      required this.title,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imgPath),
            SizedBox(height: 40.h),
            Padding(
              padding: const EdgeInsets.only(
                right: 35,
                left: 35,
    ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    subTitle,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),

          ],
        );
  }
}
