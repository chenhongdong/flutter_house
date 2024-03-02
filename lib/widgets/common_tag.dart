import 'package:flutter/material.dart';

class CommonTag extends StatelessWidget {
  final String title;
  final Color color;
  final Color backgroundColor;

  const CommonTag.origin(
      {super.key,
      required this.title,
      this.color = Colors.black,
      this.backgroundColor = Colors.grey});

  factory CommonTag(String title) {
    switch (title) {
      case '近地铁':
        return CommonTag.origin(
            title: title,
            color: Colors.purple,
            backgroundColor: Colors.purple.shade100);
      case '集中供暖':
        return CommonTag.origin(
            title: title,
            color: Colors.red,
            backgroundColor: Colors.red.shade100);
      case '随时看房':
        return CommonTag.origin(
            title: title,
            color: Colors.green,
            backgroundColor: Colors.green.shade100);
      case '新上':
        return CommonTag.origin(
            title: title,
            color: Colors.blue,
            backgroundColor: Colors.blue.shade100);
      default:
        return CommonTag.origin(title: title);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.only(right: 4),
      child: Text(
        title,
        style: TextStyle(color: color, fontSize: 12),
      ),
    );
  }
}