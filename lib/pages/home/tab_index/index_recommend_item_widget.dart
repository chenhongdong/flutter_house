import 'package:flutter/material.dart';
import 'package:flutter_rent_house/pages/home/tab_index/index_recommend_item.dart';
import 'package:flutter_rent_house/widgets/common_image.dart';

var textStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w500);

class IndexRecommendItemWidget extends StatelessWidget {
  final IndexRecommendItem data;

  const IndexRecommendItemWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(data.navigateUrl);
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        width: (MediaQuery.of(context).size.width - 10 * 3) / 2,
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(data.title, style: textStyle),
                Text(data.subTitle, style: textStyle)
              ],
            ),
            CommonImage(
              src: data.imageUrl,
              width: 55,
            )
          ],
        ),
      ),
    );
  }
}
