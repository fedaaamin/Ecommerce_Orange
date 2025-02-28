import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:counter/core/db/local_db/local_db_helper.dart';
import 'package:counter/core/widgets/custom_button.dart';
import 'package:counter/feature/cart/presentation/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../data/product_Item/data/model/grid_view_horizontal.dart';
import '../logic/home_cubit.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int index;

  const ProductDetailsScreen({super.key, required this.index});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool fav = false;
  bool cart = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) =>HomeCubit()..getProducts()..getSingleProduct(widget.index),
  child: BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: ConditionalBuilder(
            condition: context.read<HomeCubit>().product != null,
            builder: (BuildContext context) {
              return SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.black,
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      fav = !fav;
                                      setState(() {});
                                      var data =
                                          context.read<HomeCubit>().product!;
                                      if (fav == true) {
                                        SQLHelper.add(
                                            data.id.toString(),
                                            data.title!,
                                            data.description ?? "",
                                            data.image!,
                                            1,
                                            data.price!.toDouble());
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text("Added to Wishlist"),
                                        ));
                                      } else {
                                        SQLHelper.delete(data.id.toString());
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content:
                                              Text("deleted from Wishlist"),
                                        ));
                                      }
                                    },
                                    icon: Icon(fav == true
                                        ? Icons.favorite
                                        : Icons.favorite_border))
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              decoration: BoxDecoration(
                                color: widget.index % 4 < 2
                                    ? Colors.orange
                                    : Colors.grey,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                widget.index % 4 < 2
                                    ? "NEW ARRIVAL"
                                    : "POPULAR",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            context.read<HomeCubit>().product!.title!,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          Center(
                            child: Text(
                              "\$${context.read<HomeCubit>().product!.price!.toString()}",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: SizedBox(
                              height: 200,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                      context.read<HomeCubit>().product!.image!)),
                            ),
                          ),
                          SizedBox(height: 20),
                          Divider(
                            height: 1,
                            thickness: 3,
                            color: Colors.grey[300],
                          ),
                          SizedBox(height: 10),
                          Text("Product Description",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              )),
                          Text(
                            context.read<HomeCubit>().product!.description!,
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          SizedBox(height: 10),
                          Text("Related Products",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              )),
                          SizedBox(
                            height: 200,
                            child: GridViewHorizontal(
                                data: context.read<HomeCubit>().products),
                          ),
                          SizedBox(
                            height:10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: NavigationBar(
                                backgroundColor: Colors.white,
                                height: 50,
                                destinations: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.grey[400] as Color),
                                    ),
                                    child: IconButton(
                                        onPressed: () async {
                                          cart = !cart;
                                          setState(() {});
                                          var data =
                                              context.read<HomeCubit>().product!;
                                          if (cart == true) {
                                            SQLHelper.add(
                                                data.id.toString(),
                                                data.title!,
                                                data.description ?? "",
                                                data.image!,
                                                1,
                                                data.price!.toDouble());
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text("Added to Cart"),
                                            ));
                                          } else {
                                            SQLHelper.delete(data.id.toString());
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content:
                                                  Text("deleted from Cart"),
                                            ));
                                          }
                                        },
                                        icon: Icon(
                                          cart==true?Icons.shopping_bag:Icons.shopping_bag_outlined,
                                          size: 35,
                                        )),
                                  ),
                                  CustomButton(
                                      label: "Checkout",
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          PageTransition(
                                            child: CartScreen(),
                                            type: PageTransitionType.fade,
                                          ),
                                        );
                                      })
                                ]),
                          )
                        ])),
              );
            },
            fallback: (BuildContext context) {
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        );
      },
    ),
);
  }
}
