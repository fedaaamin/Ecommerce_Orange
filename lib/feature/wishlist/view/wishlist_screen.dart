import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/data/product_Item/data/model/grid_view_vertical.dart';
import '../logic/wish_list_cubit.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishListCubit()..getWishListData(),
      child: BlocConsumer<WishListCubit, WishListState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('WishList'),
              centerTitle: true,
            ),
            body: ConditionalBuilder(
                condition: context.read<WishListCubit>().products.isNotEmpty,
                builder: (context) {
                  return GridViewVertical(
                    data: context.read<WishListCubit>().products,
                  );
                },
                fallback: (context) {
                  return Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        Image.asset("assets/images/img_2.png"),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Your WishList is an empty!",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Looks like you haven't added anything \nto your WishList yet",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  );
                }),
          );
        },
      ),
    );
  }
}
