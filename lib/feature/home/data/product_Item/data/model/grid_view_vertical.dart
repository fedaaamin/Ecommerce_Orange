import 'package:counter/feature/home/data/model/product_model.dart';
import 'package:counter/feature/home/data/product_Item/gridview_item.dart';
import 'package:counter/feature/home/logic/home_cubit.dart';
import 'package:counter/feature/home/presentation/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GridViewVertical extends StatelessWidget {
  final List<dynamic> data;
  const GridViewVertical({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
        childAspectRatio: (140 / 170),
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (contextC, animation, secondaryAnimation) {
                    return BlocProvider.value(
                      value: BlocProvider.of<HomeCubit>(context)
                        ..getSingleProduct(data[index].id!),
                      child: ProductDetailsScreen(index: index,),
                    );
                  },
                  transitionDuration: Duration(milliseconds: 500),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                ),
              );
            },
            child: GridviewItem(
              title: data[index].title!,
              price: data[index].price!,
              imagePath: data[index].image!,
              index: index,
            ),
          );
      },
    );
  }
}
