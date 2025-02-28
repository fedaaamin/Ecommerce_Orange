import 'package:counter/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'login_screen.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:
      SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 24.h),
              Text("OTP"
              ,style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold
                )
              ),
              SizedBox(height: 24.h),
              Image.asset("assets/images/otp.png",),
              SizedBox(height: 24.h),
              Text("Verification code",
                style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold
                )
              ),
              SizedBox(height: 12.h),
              Text(
                  "We have sent the code verification \n to you Email Address ",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey
              ),),
              SizedBox(height: 30.h),
              PinCodeTextField(
                cursorColor: Colors.black,
                length: 4,
                obscureText: false,
                 animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  fieldHeight: 53.h,
                  fieldWidth: 50.w,
                  activeColor: Colors.grey,
                  activeFillColor: Colors.white,
                  selectedColor: Colors.grey,
                  selectedFillColor: Colors.white,
                  inactiveColor: Colors.grey[400],
                  inactiveFillColor: Colors.white,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldOuterPadding: EdgeInsets.symmetric(horizontal: 20.w),
                ),
                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: true,
                 appContext: context,
              ),
              Text("Recent code in 32s"),
              SizedBox(height: 24.h),
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustomButton(
                    label: "Continue",
                    onPressed: (){
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 700.h,
                            width: double.infinity,
                            padding: EdgeInsets.only(
                              top: 15.h,
                              left: 20.w,
                              right: 20.w,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),

                                ),
                              color: Colors.white
                            ),
                            child: Column(

                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 120.h,
                                    ),
                                    child: Divider(
                                      height: 1.h,
                                      thickness: 2,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Image.asset(
                                      "assets/images/congrat.png",
                                    width: 200.w,
                                    height:
                                    200.h,
                                  ),
                                  Text("Congratulations!",
                                      style: TextStyle(
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.w500,

                                      )),
                                  SizedBox(height: 12.h),
                                  Text(
                                    "Your account is ready to use. You will be redirected to the Homepage in a few seconds.",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        color: Colors.grey),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 13.h),
                                  CustomButton(
                                      label: "Continue",
                                      onPressed: (){
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.fade,
                                              duration: Duration(milliseconds: 500),
                                              child: LoginScreen(),
                                            ));
                                      })
                                ]
                            ),
                          );
                        },
                      );
                    }),
              )
        
        
            ],
          ),
        ),
      )),
    );
  }
}
