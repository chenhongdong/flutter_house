import 'package:flutter/material.dart';
import 'package:flutter_rent_house/widgets/common_form_item.dart';

class CommonRadioFormItem extends StatelessWidget {
  final String label;
  final List<String> options;
  final int value;
  final ValueChanged<int?> onChange;

  const CommonRadioFormItem(
      {super.key,
      required this.label,
      required this.options,
      required this.value,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return CommonFormItem(
      label: label,
      contentBuilder: (context) {
        return Container(
          child: Row(
              children: List.generate(
                  options.length,
                  (index) => Row(
                        children: [
                          Radio(
                              value: index,
                              groupValue: value,
                              onChanged: onChange,
                              activeColor: Colors.green),
                          Text(options[index])
                        ],
                      ))),
        );
      },
    );
  }
}
