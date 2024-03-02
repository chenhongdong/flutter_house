import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

// 编写正则判断网络图片or本地图片
final networkUrlReg = RegExp('^http');
final localUrlReg = RegExp('^static');

class CommonImage extends StatelessWidget {
  final String src;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const CommonImage(
      {super.key, required this.src, this.width, this.height, this.fit});

  @override
  Widget build(BuildContext context) {
    if (networkUrlReg.hasMatch(src)) {
      return CachedNetworkImage(
          imageUrl: src, width: width, height: height, fit: fit);
    }
    if (localUrlReg.hasMatch(src)) {
      return Image.asset(src, width: width, height: height, fit: fit);
    }
    assert(false, '图片地址不合法');
    return Container();
  }
}
