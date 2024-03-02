import 'package:flutter/material.dart';
import 'package:flutter_rent_house/widgets/common_image.dart';

import 'data.dart';

var textStyle = TextStyle(color: Colors.black54);

class ItemWidget extends StatelessWidget {
  final InfoItem data;

  const ItemWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      height: 100,
      child: Row(
        children: [
          CommonImage(src: data.imgUrl, width: 120, height: 90),
          Padding(padding: EdgeInsets.only(left: 10)),
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(data.title,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(data.source, style: textStyle),
                    Text(data.time, style: textStyle)
                  ],
                )
              ]))
        ],
      ),
    );
  }
}
