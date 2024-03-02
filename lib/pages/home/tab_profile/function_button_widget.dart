import 'package:flutter/material.dart';
import 'package:flutter_rent_house/pages/home/tab_profile/function_button_data.dart';
import 'package:flutter_rent_house/widgets/common_image.dart';

class FunctionButtonWidget extends StatelessWidget {
  final FunctionButtonItem data;

  const FunctionButtonWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (data.onTap != null) {
          data.onTap!(context);
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.33,
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            CommonImage(
              src: data.imageUrl,
              width: 60,
              height: 60,
            ),
            Text(data.title)
          ],
        ),
      ),
    );
  }
}
