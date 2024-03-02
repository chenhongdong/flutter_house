import 'package:flutter/material.dart';

class CommonFormItem extends StatelessWidget {
  final String label;
  final Widget Function(BuildContext context)? contentBuilder;
  final Widget? suffix;
  final String? suffixText;
  final String? hintText;
  final ValueChanged? onChanged;
  final TextEditingController? controller;

  const CommonFormItem(
      {super.key,
      required this.label,
      this.contentBuilder,
      this.suffix,
      this.suffixText,
      this.hintText,
      this.onChanged,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 14, right: 14),
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 1, color: Theme.of(context).dividerColor))),
      child: Row(
        children: [
          Container(
            width: 100,
            child: Text(
              label,
              style: TextStyle(color: Colors.black87, fontSize: 16),
            ),
          ),
          Expanded(
              child: contentBuilder != null
                  ? contentBuilder!(context)
                  : TextField(
                      decoration: InputDecoration(
                          hintText: hintText, border: InputBorder.none),
                      controller: controller,
                    )),
          if (suffix != null) suffix ?? const SizedBox(),
          if (suffix == null && suffixText != null) Text(suffixText ?? '')
        ],
      ),
    );
  }
}
