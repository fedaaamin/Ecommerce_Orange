import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:counter/core/constants/app_color.dart';
import 'package:counter/feature/home/data/product_Item/gridview_component.dart';
import 'package:counter/feature/home/data/time_design.dart';
import 'package:counter/feature/home/logic/home_cubit.dart';
import 'package:counter/notification/view/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';


class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () {
                return context.read<HomeCubit>().getHomeData();
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 371,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xffFEB5AE),
                                Color(0xffFF3D68),
                                Color(0xffFD6C8A),
                                Color(0xffFFE6EA),
                                Colors.white,
                                Colors.white,
                              ],
                              stops: [0.0, 0.25, 0.5, 0.7, 0.85, 1.0],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                        ),
                        Positioned.fill(
                            bottom: .05,
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                color: Colors.white.withOpacity(.1),
                              ),
                            )),
                        Positioned(
                            top: 7,
                            left: 20,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 30,
                              ),
                              child: Row(children: [
                                CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.white38,
                                    child: Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                                SizedBox(
                                  width: 14,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Location",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                    Text("Cairo, Egypt",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                SizedBox(
                                  width: 65,
                                ),
                                CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.white38,
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 500),
                                              child: NotificationScreen(),
                                            ));
                                      },
                                      icon: Icon(
                                        Icons.notifications_rounded,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(
                                      "https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg"),
                                ),
                              ]),
                            )),
                        Positioned(
                          top: 110,
                          right: 10,
                          left: 35,
                          child: Text(
                            "Find best device for \n your setup!",
                            style: TextStyle(
                                fontSize: 23,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Positioned(
                          top: 200,
                          right: 10,
                          left: 30,
                          bottom: 13,
                          child: Stack(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    "assets/images/homeBackGround.png",
                                  )),
                              Positioned(
                                  top: 5,
                                  right: 150,
                                  left: 30,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "New Bing \nWireless \nEarphone",
                                        style: TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "see offer >",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                        Positioned(
                          top: 183,
                          right: 1,
                          bottom: 20,
                          child: Image.asset(
                            "assets/images/img_1.png",
                            width: 200,
                            height: 200,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Hot deals🔥",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TimeDesign(),
                          )
                        ],
                      ),
                    ),
                    ConditionalBuilder(
                        condition:
                            context.read<HomeCubit>().products.isNotEmpty,
                        builder: (context) => PageTransitionSwitcher(
                              duration: Duration(milliseconds: 500),
                              transitionBuilder:
                                  (child, animation, secondaryAnimation) {
                                return SharedAxisTransition(
                                  animation: animation,
                                  secondaryAnimation: secondaryAnimation,
                                  transitionType:
                                      SharedAxisTransitionType.horizontal,
                                  child: child,
                                );
                              },
                              child: GridviewComponent(
                                  data: context.read<HomeCubit>().products),
                            ),
                        fallback: (context) => Center(
                              child: CircularProgressIndicator(),
                            )),
                  ],
                ),
              ),
            );
          },
        ),

      ),
    );
  }
}
