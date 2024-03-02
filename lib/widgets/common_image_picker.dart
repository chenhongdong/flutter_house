import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

const List<String> defautImages = [
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tdgve1j30ku0bsn75.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2whp87sj30ku0bstec.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tl1v3bj30ku0bs77z.jpg',
];
// 图片宽750px，高424px
var imgW = 750;
var imgH = 424;
var imgRatio = imgW / imgW; // 图片宽高比

class CommonImagePicker extends StatefulWidget {
  final ValueChanged<List<File>> onChange;

  const CommonImagePicker({super.key, required this.onChange});

  @override
  State<CommonImagePicker> createState() => _CommonImagePickerState();
}

class _CommonImagePickerState extends State<CommonImagePicker> {
  List<File> files = [];

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    var xImage = await picker.pickImage(source: ImageSource.gallery);
    // 如果没选择图片就为null啥也不做
    if (xImage == null) return;
    File image = File(xImage.path);
    setState(() {
      files = files..add(image);
    });
    if (widget.onChange != null) {
      widget.onChange(files);
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = (MediaQuery.of(context).size.width - 10 * 4) / 3;
    var height = width / imgRatio;

    Widget addButton = GestureDetector(
      onTap: () {
        _pickImage();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: width,
        height: height,
        color: Colors.grey,
        child: const Center(
            child: Text(
          '+',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
        )),
      ),
    );
    Widget wrapper(File file) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Image.file(
            file,
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
          Positioned(
              right: -20,
              top: -20,
              child: IconButton(
                icon: const Icon(Icons.delete_forever),
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    files = files..remove(file); // ..两个点作用是返回删除之后的那个file
                  });
                  // 通知父级调用一下onChange方法更新
                  if (widget.onChange != null) {
                    widget.onChange(files);
                  }
                },
              ))
        ],
      );
    }

    List<Widget> list = files.map((item) => wrapper(item)).toList()
      ..add(addButton);

    return Container(
      padding: const EdgeInsets.all(10),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: list,
      ),
    );
  }
}
