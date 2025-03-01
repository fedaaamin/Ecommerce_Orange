import 'package:animations/animations.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/logic/home_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getUserData(),
      child: Scaffold(
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var user = context.watch<HomeCubit>().userData;
            return ConditionalBuilder(
                condition: context.read<HomeCubit>().userData !=null,
                builder: (context) => PageTransitionSwitcher(
                      duration: Duration(milliseconds: 500),
                      transitionBuilder:
                          (child, animation, secondaryAnimation) {
                        return SharedAxisTransition(
                          animation: animation,
                          secondaryAnimation: secondaryAnimation,
                          transitionType: SharedAxisTransitionType.horizontal,
                          child: child,
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 371,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xffE2F3F8),
                                  Color(0xffE5F4F8),
                                  Color(0xffEEF8FB),
                                  Color(0xffF1F8FA),
                                  Colors.white,
                                  Colors.white,
                                ],
                                stops: [0.0, 0.25, 0.5, 0.7, 0.85, 1.0],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                          ),
                          Positioned(
                              top: 30,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  SizedBox(
                                    width: 100,
                                  ),
                                  Text("Profile",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    width: 90,
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.person_search,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              )),
                          Positioned(
                            top: 100,
                            left: 50,
                            right: 50,
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage(
                                      "https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg"),
                                ),
                                Text(
                                  "${user!.name!.firstname!} ${user.name!.lastname!}",
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  user.email!,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                              child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    topLeft: Radius.circular(15))),
                          ))
                        ],
                      ),
                    ),
                fallback: (context) => Center(
                      child: CircularProgressIndicator(),
                    ));
          },
        ),
      ),
    );
  }
}
