import 'package:flutter/material.dart';
import 'package:flutter_rent_house/widgets/common_image.dart';

class AdsWidget extends StatelessWidget {
  const AdsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, bottom: 20, left: 10, right: 10),
      child: const CommonImage(
          src:
              'https://tva1.sinaimg.cn/large/006y8mN6ly1g6te62n8f4j30j603vgou.jpg'),
    );
  }
}
