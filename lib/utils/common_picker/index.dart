import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CommonPicker {
  static Future<int?> showPicker(
      {required BuildContext context,
      required List<String> options,
      required int value,
      double? height = 300}) {
    return showCupertinoModalPopup<int?>(
        context: context,
        builder: (BuildContext context) {
          var btnTextStyle = TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600);
          var controller = FixedExtentScrollController(initialItem: value);

          return Container(
            color: Colors.grey,
            height: height,
            child: Column(children: [
              Container(
                height: 40,
                color: Colors.grey[200],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('取消', style: btnTextStyle)),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(controller.selectedItem);
                        },
                        child: Text('确定', style: btnTextStyle))
                  ],
                ),
              ),
              Expanded(
                  child: CupertinoPicker(
                      scrollController: controller,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      itemExtent: 32,
                      onSelectedItemChanged: (val) {},
                      children: options.map((item) => Text(item)).toList()))
            ]),
          );
        });
  }
}
