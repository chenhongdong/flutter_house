import 'package:flutter/material.dart';
import 'package:flutter_rent_house/widgets/common_image.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

const List<String> defaultImages = [
  'https://pics3.baidu.com/feed/f636afc379310a55b98f76c46da03aa48326104d.jpeg',
  'https://img0.baidu.com/it/u=462355561,1664493984&fm=253&fmt=auto&app=138&f=JPEG?w=555&h=369',
  'https://img0.baidu.com/it/u=3001153371,1596350348&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=375'
];
// 图片宽750px，高424px
var imgW = 750;
var imgH = 424;

class CommonSwiper extends StatelessWidget {
  final List<String> images;
  // images接收传入的参数，如果没有传就使用默认的
  const CommonSwiper({super.key, this.images = defaultImages});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.width / imgW * imgH;

    return SizedBox(
      height: height,
      child: Swiper(
          itemBuilder: (context, index) {
            return CommonImage(
              src: images[index],
              fit: BoxFit.fill,
            );
          },
          itemCount: images.length,
          autoplay: true,
          pagination: const SwiperPagination()),
    );

    // 利用16:9的比例，AspectRatio组件实现
    /* return AspectRatio(
        aspectRatio: 16 / 9,
        child: Swiper(
            itemBuilder: (context, index) {
              return Image.network(
                images[index],
                fit: BoxFit.fill,
              );
            },
            itemCount: images.length,
            pagination: const SwiperPagination())); */
  }
}
