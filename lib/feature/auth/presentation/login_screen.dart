import 'package:counter/feature/auth/logic/auth_cubit.dart';
import 'package:counter/feature/auth/presentation/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_input.dart';
import '../../home/presentation/home_screen.dart';

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
                  MaterialPageRoute(builder: (context) => HomeScreen()));
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
                        SizedBox(height: 24.h),
                        CustomButton(
                            label: 'Login',
                            onPressed: () {
                              context.read<AuthCubit>().login(
                                  userNameController.text,
                                  passwordController.text);
                            }),
                        TextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: 334.h,
                                    width: double.infinity,
                                    padding: EdgeInsets.only(
                                        top: 15.h,
                                        left: 20.w,
                                        right: 20.w
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        )
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
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
                                  SizedBox(
                                  height: 10.h
                                  ),
                                  Text("Forget Password",
                                  style: TextStyle(
                                  fontSize:24.sp ,
                                  fontWeight: FontWeight.w500
                                  )
                                  ),
                                  SizedBox(
                                  height: 12.h
                                  ),
                                  Text("Select which contact details should we use to reset your password",
                                  style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.grey
                                  ),
                                  ),
                                  SizedBox(height: 10.h),
                                  TextFeild(
                                  decoration: InputDecoration(
                                  hintText: hintText,
                                  hintStyle: TextStyle(
                                  color: Colors.grey[500],
                                  ),
                                  )
                                  ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text("إغلاق"),
                                  ),
                                  ],
                                  ),
                                  );
                                },
                              );
                            },
                            child: Text("Forget Password?")),
                        SizedBox(height: 24),
                        CustomButton(
                            label: 'Register',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()));
                            }),


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
