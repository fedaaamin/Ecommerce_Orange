import 'package:flutter/material.dart';
import 'package:counter/notification/data/model/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 40,
            floating: false,
            pinned: false,
            leading: Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey[400] as Color),
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Your Notifications",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text("Today",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey)),
              ),
              NotificationItem(
                title: "30% Special Discount!",
                subtitle: "Special promotion only valid today",
                icon: Icons.discount,
              ),
              Divider(color: Colors.grey[300]),
              NotificationItem(
                title: "New Product Available!",
                subtitle: "Check out our new product",
                icon: Icons.shopping_bag,
              ),
              Divider(color: Colors.grey[300], thickness: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text("Yesterday",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey)),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), // عشان التمرير يكون بس من CustomScrollView
                padding: EdgeInsets.all(10),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return NotificationItem(
                    title: index % 4 < 2 ? "30% Special Discount!" : "Credit Card Connected",
                    subtitle: index % 4 < 2
                        ? "Special promotion only valid today"
                        : "Your credit card was successfully connected.",
                    icon: index % 4 < 1 ? Icons.discount : Icons.credit_card,
                    index: index,
                  );
                },
                separatorBuilder: (context, index) => Divider(),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
