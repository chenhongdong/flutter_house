import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final String title;
  final bool isActive;
  final void Function(BuildContext context)? onTap;

  const Item(
      {super.key,
      required this.title,
      required this.isActive,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    var color = isActive ? Colors.green : Colors.black87;
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!(context);
        }
      },
      child: Container(
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, color: color),
            ),
            Icon(Icons.arrow_drop_down, size: 20, color: color)
          ],
        ),
      ),
    );
  }
}
