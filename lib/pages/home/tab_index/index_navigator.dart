import 'package:flutter/material.dart';
import 'package:flutter_rent_house/widgets/common_image.dart';
import './index_navigator_item.dart';

class IndexNavigator extends StatelessWidget {
  const IndexNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 6, bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: indexNavigatorItemList
            .map((item) => InkWell(
                  onTap: () {
                    item.onTap(context);
                  },
                  child: Column(children: [
                    CommonImage(
                      src: item.imageUrl,
                      width: 30.5,
                    ),
                    Text(item.title,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14))
                  ]),
                ))
            .toList(),
      ),
    );
  }
}
