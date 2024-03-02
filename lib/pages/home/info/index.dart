import 'package:flutter/material.dart';
import 'package:flutter_rent_house/pages/home/info/data.dart';
import 'package:flutter_rent_house/pages/home/info/item_widget.dart';

class Info extends StatelessWidget {
  final bool showTitle;
  final List<InfoItem> dataList;
  const Info({super.key, this.showTitle = false, this.dataList = infoData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        if (showTitle)
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: const Text(
              '最新资讯',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ),
        Column(
          children: dataList.map((item) => ItemWidget(data: item)).toList(),
        )
      ]),
    );
  }
}
