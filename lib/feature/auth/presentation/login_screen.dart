import 'package:counter/core/constants/app_color.dart';
import 'package:counter/feature/auth/data/social_container.dart';
import 'package:counter/feature/auth/data/text_field_icon.dart';
import 'package:counter/feature/auth/logic/auth_cubit.dart';
import 'package:counter/feature/auth/presentation/otp.dart';
import 'package:counter/feature/auth/presentation/register_screen.dart';
import 'package:counter/feature/home/presentation/custom_nav_bar.dart';
import 'package:counter/feature/home/presentation/home_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_input.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLoginLoading) {
              showDialog(
                  context: context,
                  builder: (context) =>
                      Center(child: CircularProgressIndicator()));
            }

            if (state is AuthLoginSuccess) {
              Navigator.pop(context);
              Navigator.push(context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    duration: Duration(milliseconds: 500),
                    child: CustomNavBar(initialIndex: 0),
                  ));
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Success Login"),
              ));
            }

            if (state is AuthLoginFailure) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message),
              ));
            }
          },
          builder: (context, state) {
            return SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),
                    Text(
                      "Login to your \naccount.",
                      style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    CustomTextInput(
                      hintText: 'Email address',
                      labelText: "Email Address",
                      controller: userNameController,
                    ),
                    SizedBox(height: 24.h),
                    CustomTextInput(
                      hintText: "Password",
                      labelText: 'Password',
                      controller: passwordController,
                      isPassword: true,
                    ),
                    SizedBox(height: 15.h),
                    Center(
                      child: TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    child: Container(
                                      height: 334.h,
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
                                          )),
                                      child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            Text("Forget Password",
                                                style: TextStyle(
                                                    fontSize: 24.sp,
                                                     fontWeight: FontWeight.w500,
                                                  color: Colors.grey
                                                )),
                                            SizedBox(height: 12.h),
                                            Text(
                                              "Select which contact details should we use to reset your password",
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  color: Colors.grey),
                                            ),
                                            SizedBox(height: 10.h),
                                            TextFieldIcon(
                                              hint: "Send via Email",
                                                keyboardType: TextInputType.emailAddress,
                                                iconColor: Colors.grey[300] as Color,
                                                icon: Icon(Icons.email,
                                                color: AppColor.buttonColor,),
                                            ),
                                            SizedBox(height: 24.h),
                                            CustomButton(
                                                label: "Continue",
                                                onPressed: (){
                                                  Navigator.push(
                                                      context,
                                                      PageTransition(
                                                        type: PageTransitionType.fade,
                                                        duration: Duration(milliseconds: 500),
                                                        child: Otp(),
                                                      )
                                                     );
                                                })
                                          ]
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Text(
                              "Forget Password?",
                            style: TextStyle(
                              color: Colors.black
                            ),
                          )),
                    ),
                    SizedBox(height: 20.h),
                    CustomButton(
                        label: 'Login',
                        onPressed: () {
                          context.read<AuthCubit>().login(
                              userNameController.text, passwordController.text);
                        }),
                    SizedBox(height: 20.h),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Divider(
                          height: 1.h,
                          thickness: 2,
                          color: Colors.grey[300],
                        ),
                        Center(
                          child: Container(
                            padding: EdgeInsets.all(8),
                            color:Colors.white,
                            child: Text(
                                "or continue with",
                                style:TextStyle(
                                  color: Colors.grey
                                )
                          ))
                        )
                      ],

                    ),
                    SocialContainer(label: "Continue with Google", icon: Image.asset("assets/images/img.png")),
                    SocialContainer(label:"Continue with Facebook", icon: Icon(
                        Icons.facebook,
                        color: Colors.blue)),
                   Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                        Text("Don't have an account?",
                        style: TextStyle(
                          color: Colors.grey
                        ),),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 500),
                                    child: RegisterScreen(),
                                  ));
                            },
                          child: Text("Register",
                            style: TextStyle(
                              color: Colors.blue
                              ),
                        ),
                        )
                     ],
                   ),
                  ],
                ),
              ),
            ));
          },
        ),
      ),
    );
  }
}
