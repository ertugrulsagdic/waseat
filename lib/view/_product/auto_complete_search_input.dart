import 'dart:developer';

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/src/context_extension.dart';

import '../../../core/constants/image/svg_constants.dart';
import '../../../core/init/lang/locale_keys.g.dart';

class AutoCompleteSearchInput extends StatefulWidget {
  final bool icon;
  final Function()? onTap;
  final Function(String value) onChanged;
  final Function(String value) onSelected;
  final String? hintText;
  final List<String> list;
  const AutoCompleteSearchInput({
    Key? key,
    required this.icon,
    this.onTap,
    required this.list,
    required this.onChanged,
    required this.onSelected,
    this.hintText,
  }) : super(key: key);

  @override
  State<AutoCompleteSearchInput> createState() =>
      _AutoCompleteSearchInputState();
}

class _AutoCompleteSearchInputState extends State<AutoCompleteSearchInput> {
  bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: SizedBox(
            width: double.infinity,
            height: context.dynamicHeight(0.045),
            child: Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                widget.onChanged(textEditingValue.text);
                // if (textEditingValue.text == '') {
                //   return const Iterable<String>.empty();
                // }
                inspect(widget.list);
                return widget.list;
                return widget.list.where((String option) {
                  String sss = option.toLowerCase();
                  inspect(option);
                  inspect(textEditingValue.text);
                  return option
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase());
                });
              },
              onSelected: (String selection) {
                widget.onSelected(selection);
                debugPrint('You just selected $selection');
              },
            ),
          ),
        ),
        SizedBox(width: context.dynamicWidth(0.02)),
        widget.icon
            ? GestureDetector(
                onTap: widget.onTap,
                child: Container(
                  decoration: BoxDecoration(
                      color: context.colorScheme.secondary,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  width: context.dynamicWidth(0.1),
                  height: context.dynamicWidth(0.1),
                  child: SvgPicture.asset(
                    SVGImageConstants.instance.check,
                    color: context.colorScheme.surface,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
