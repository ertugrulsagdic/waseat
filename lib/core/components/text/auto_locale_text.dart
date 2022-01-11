import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class AutoLocaleText extends StatelessWidget {
  final String value;
  final TextAlign? textAlign;
  final TextStyle? style;

  const AutoLocaleText(
      {Key? key, required this.value, this.textAlign, this.style})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      value.tr(),
      textAlign: textAlign,
      style: style,
    );
  }
}
