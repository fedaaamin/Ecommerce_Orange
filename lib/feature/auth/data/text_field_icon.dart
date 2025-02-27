import 'package:flutter/material.dart';

class TextFieldIcon extends StatelessWidget {
 final TextInputType keyboardType;
 final Color iconColor;
 final Widget icon;
 final String hint;

  const TextFieldIcon({Key? key, required this.keyboardType, required this.iconColor, required this.icon, required this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(
                horizontal: 8),
            decoration: BoxDecoration(
              color:iconColor,
              borderRadius:
              BorderRadius.circular(10),
            ),
            child: icon),
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.grey[300] as Color,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.grey[300] as Color,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.grey[300] as Color,
              width: 1,
            ),
          ),
        ));
  }
}
