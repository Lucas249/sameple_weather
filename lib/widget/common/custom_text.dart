import 'package:flutter/material.dart';

import '../../base/base.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final String? fontFamily;

  const CustomText({
    Key? key,
    required this.text,
    this.style,
    this.textAlign,
    this.fontFamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      textAlign: textAlign ?? TextAlign.start,
      style: style ??
          TextStyle(
            fontFamily: fontFamily,
            fontSize: NumberConstants.size16,
          ),
    );
  }
}
