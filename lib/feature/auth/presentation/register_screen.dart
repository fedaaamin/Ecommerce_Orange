import 'package:counter/feature/auth/data/social_container.dart';
import 'package:counter/feature/auth/logic/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_input.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  TextEditingController passwordController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthRegisterLoading) {
              showDialog(
                  context: context,
                  builder: (context) =>
                      Center(child: CircularProgressIndicator()));
            }

            if (state is AuthRegisterSuccess) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Success Registeration"),
              ));
              Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    duration: Duration(milliseconds: 500),
                    child: LoginScreen(),
                  ));
            }

            if (state is AuthRegisterFailure) {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  Text(
                    "Create your new \n account",
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  CustomTextInput(
                    hintText: ' Email Address',
                    labelText: 'Email Address',
                    controller: emailController,
                  ),
                  SizedBox(height: 24.h),
                  CustomTextInput(
                    hintText: ' Password',
                    labelText: 'Password',
                    controller: passwordController,
                    isPassword: true,
                  ),
                  SizedBox(height: 24.h),
                  CustomTextInput(
                    hintText: 'Confirm Password',
                    labelText: 'Password',
                    controller: passwordController,
                    isPassword: true,
                  ),
                  SizedBox(height: 24),
                  CustomButton(
                      label: 'Register',
                      onPressed: () {
                        context.read<AuthCubit>().register(
                              passwordController.text,
                              emailController.text,
                            );
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
                              color: Colors.white,
                              child: Text("or continue with",
                                  style: TextStyle(color: Colors.grey))))
                    ],
                  ),
                  SocialContainer(
                      label: "Continue with Google",
                      icon: Image.asset("assets/images/img.png")),
                  SocialContainer(
                      label: "Continue with Facebook",
                      icon: Icon(Icons.facebook, color: Colors.blue)),
                ],
              ),
            ));
          },
        ),
      ),
    );
  }
}
