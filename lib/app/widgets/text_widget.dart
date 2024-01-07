import 'package:flutter/material.dart';

import '../constant/app_size.dart';

final AppSize appSize = AppSize();
final AppFontWeight appFontWeight = AppFontWeight();

class AppText extends StatelessWidget {
  final bool isSelectableText;
  final String strText;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  const AppText({
    super.key,
    required this.isSelectableText,
    required this.strText,
    this.fontSize,
    this.fontWeight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return isSelectableText
        ? SelectableText(
            strText,
            style: appTextStyle(),
          )
        : Text(
            strText,
            style: appTextStyle(),
          );
  }

  TextStyle appTextStyle() {
    return TextStyle(
      fontSize: fontSize ?? appSize.s10,
      fontWeight: fontWeight ?? appFontWeight.normal,
      color: color ?? Colors.black,
    );
  }
}
