import 'package:counter/feature/home/data/model/product_model.dart';
import 'package:counter/feature/home/data/product_Item/data/model/grid_view_horizontal.dart';
import 'package:counter/feature/home/data/product_Item/data/model/grid_view_vertical.dart';
import 'package:counter/feature/home/logic/home_cubit.dart';
import 'package:counter/feature/home/presentation/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'gridview_item.dart';

class GridviewComponent extends StatelessWidget {
  final List<ProductModel> data;

  const GridviewComponent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (contextC) => HomeCubit(),
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridViewHorizontal(data: data),
              Padding(
                padding: const EdgeInsets.only(
                    left: 8
                ),
                child: Text("Categories",
                    style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500)),

              ),
              GridViewVertical(data: data)
            ],
          ),
        ),

      ),
    );
  }
}
