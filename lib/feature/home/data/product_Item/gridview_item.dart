import 'package:flutter/material.dart';

class GridviewItem extends StatelessWidget {
  final String title;
  final num price;
  final String imagePath;
 final int index;
  const GridviewItem({super.key ,   required this.title, required this.price, required this.imagePath, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200] as Color,
            blurRadius: 15,
            spreadRadius:1,
          ),
        ],
      ),
      child:
          Stack(
            children: [
              Positioned(
                top: 3,
                left: 0,
                right: 0,
                child: Image.network(imagePath,
                width: 100,
                height: 100,),
              ),
              Positioned(
                bottom: 0,
                left: 4,
                right: 4,
                top: 105,
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
              Positioned(
                top: 125,
                right: 50,
                child: Text(
                  "\$ $price",
                  style: TextStyle(
                      fontSize: 15, color: Colors.blue,
                    fontWeight: FontWeight.w500
                  ),

                ),
              ),
              SizedBox(
                height: 10,
              ),
              Positioned(
                top: 152,
                right: 35,
                child: Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                    color: index % 4 < 2 ? Colors.orange:Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    index % 4 < 2 ? "NEW ARRIVAL":"POPULAR",
                    style: TextStyle(fontSize: 10, color: Colors.white,
                    fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),




    );
  }
}
