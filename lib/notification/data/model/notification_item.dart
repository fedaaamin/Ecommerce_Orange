import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final int index;
  const NotificationItem({super.key, required this.title, required this.subtitle, required this.icon, this.index=0});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle,
      style: TextStyle(
        color: Colors.grey,
      ),),
      leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
              color: Colors.grey[300],
          ),
          child: Icon(icon,color:index % 4 < 2 ? Colors.red:Colors.black,),),
    );
  }
}
