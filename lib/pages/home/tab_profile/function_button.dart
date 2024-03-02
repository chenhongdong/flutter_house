import 'package:flutter/material.dart';
import 'package:flutter_rent_house/pages/home/tab_profile/function_button_data.dart';
import 'package:flutter_rent_house/pages/home/tab_profile/function_button_widget.dart';

class FunctionButton extends StatelessWidget {
  const FunctionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 1,
      runSpacing: 1,
      children: list
          .map((item) => FunctionButtonWidget(
                data: item,
              ))
          .toList(),
    );
  }
}
