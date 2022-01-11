import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class LocaleText extends StatelessWidget {
  final String value;

  const LocaleText({Key? key, required this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(value.tr());
  }
}
