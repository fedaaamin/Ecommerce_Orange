import 'package:animations/animations.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:counter/core/constants/app_color.dart';
import 'package:counter/feature/auth/data/text_field_icon.dart';
import 'package:counter/feature/home/data/product_Item/data/model/grid_view_vertical.dart';
import 'package:counter/feature/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../core/widgets/custom_button.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  int _value = 50;
  double _startValue = 10;
  double _endValue = 80;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getProducts(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return ConditionalBuilder(
              condition: context.read<HomeCubit>().products.isNotEmpty,
              builder: (context) => PageTransitionSwitcher(
                duration: Duration(milliseconds: 500),
                transitionBuilder: (child, animation, secondaryAnimation) {
                  return SharedAxisTransition(
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: SharedAxisTransitionType.horizontal,
                    child: child,
                  );
                },
                child: SingleChildScrollView(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 50, left: 10, right: 10, bottom: 10),
                          child: TextFieldIcon(
                            keyboardType: TextInputType.text,
                            iconColor: Colors.white,
                            icon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            hint: "Search laptop, headset..",
                          ),
                        ),
                        GridViewVertical(data: context.read<HomeCubit>().products),
                      ],
                    ),
                  ),
                ),
              ),
              fallback: (context) => Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
        floatingActionButton: Container(
          width: 100,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  int sliderValue = _value;

                  return StatefulBuilder(
                    builder: (context, setModalState) {
                      return SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Container(
                            height: 290.h,
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
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 120.h),
                                  child: Divider(
                                    height: 1.h,
                                    thickness: 2,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Filter",
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "Reset",
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          color: Colors.blue),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                Divider(
                                  height: 1.h,
                                  color: Colors.grey[300],
                                ),
                                Text(
                                  "Price range",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 24.h),
                                SfRangeSlider(
                                  min: 0.0,
                                  max: 100.0,
                                  values: SfRangeValues(_startValue, _endValue),
                                  interval: 10,
                                  showTicks: false,
                                  showLabels: false,
                                  enableTooltip: true,
                                  activeColor: Colors.deepOrangeAccent,
                                  inactiveColor: Colors.grey.shade300,
                                  onChanged: (SfRangeValues newValues) {
                                    setModalState(() {
                                      _startValue = newValues.start;
                                      _endValue = newValues.end;
                                    });
                                  },
                                ),
                                SizedBox(height: 40.h),
                                CustomButton(
                                  label: "Apply filter",
                                  onPressed: () {
                                    setState(() {
                                      _value = sliderValue;
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
            backgroundColor: AppColor.buttonColor,
            child: Row(
              children: [
                Icon(
                  Icons.filter_list_alt,
                  color: Colors.white,
                  size: 50,
                ),
                Text(
                  "Filter",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
