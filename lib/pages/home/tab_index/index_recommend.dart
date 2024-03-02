import 'package:flutter/material.dart';
import 'package:flutter_rent_house/pages/home/tab_index/index_recommend_item.dart';
import 'package:flutter_rent_house/pages/home/tab_index/index_recommend_item_widget.dart';

class IndexRecommend extends StatelessWidget {
  final List<IndexRecommendItem> dataList;

  const IndexRecommend({super.key, this.dataList = indexRecommendData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Color(0x08000000),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '房屋推荐',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    '更多',
                    style: TextStyle(color: Colors.black54),
                  ))
            ],
          ),
          Wrap(
            runSpacing: 10, // 换行后的间距
            spacing: 10, // 每个item之间的间距
            children: dataList
                .map((item) => IndexRecommendItemWidget(data: item))
                .toList(),
          )
        ],
      ),
    );
  }
}
