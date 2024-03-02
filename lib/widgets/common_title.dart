import 'package:flutter/material.dart';

class CommonTitle extends StatelessWidget {
  final String title;

  const CommonTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 10),
      height: 50,
      child: Text(title,
          style: const TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600)),
    );
  }
}
