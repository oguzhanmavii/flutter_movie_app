
import 'package:flutter/material.dart';
import 'package:flutter_application/res/color.dart';
import 'package:flutter_application/res/style/text_style.dart';

class RedBorderWidget extends StatelessWidget {
  final String text;
  const RedBorderWidget(
      {Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: AppColors.redColor,
              width: 2)),
      child: Text(text,
          style: AppStyle.instance.bodyMedium
              .copyWith(
                  color: AppColors.whiteColor)),
    );
  }
}
