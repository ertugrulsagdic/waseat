import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/src/context_extension.dart';

import '../../../core/constants/image/svg_constants.dart';
import '../../../core/init/lang/locale_keys.g.dart';

class SearchInput extends StatefulWidget {
  final bool filterIcon;
  final Function()? onTap;
  final TextEditingController? searchController;
  final Function(String value)? onChanged;
  final String? hintText;
  const SearchInput({
    Key? key,
    required this.filterIcon,
    this.onTap,
    required this.searchController,
    this.onChanged,
    this.hintText,
  }) : super(key: key);

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
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
            child: TextField(
              controller: widget.searchController,
              style: TextStyle(
                fontSize: 13,
                color: context.colorScheme.primary,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: context.colorScheme.surface,
                hintStyle: TextStyle(
                  fontSize: 13,
                  color: context.colorScheme.primaryVariant,
                ),
                contentPadding: EdgeInsets.zero,
                prefixIcon: SvgPicture.asset(
                  SVGImageConstants.instance.search,
                  fit: BoxFit.scaleDown,
                ),
                suffixIcon: isEmpty
                    ? const SizedBox()
                    : GestureDetector(
                        onTap: () {
                          widget.onChanged!('');
                          widget.searchController!.text = '';
                          setState(() {
                            isEmpty = true;
                          });
                        },
                        child: Icon(
                          Icons.close,
                          color: context.colorScheme.primaryVariant,
                          size: context.normalValue,
                        ),
                      ),
                hintText: widget.hintText ?? LocaleKeys.map_whereto.tr(),
                focusColor: context.colorScheme.primaryVariant,
                labelStyle: const TextStyle(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.5,
                    color: context.colorScheme.primaryVariant,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: context.colorScheme.primaryVariant,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: context.colorScheme.primaryVariant,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: context.colorScheme.error,
                  ),
                ),
                errorStyle: context.textTheme.caption!.copyWith(
                  color: context.colorScheme.error,
                ),
              ),
              onChanged: (String value) {
                widget.onChanged!(value);
                if (value.isNotEmpty) {
                  setState(() {
                    isEmpty = false;
                  });
                } else {
                  setState(() {
                    isEmpty = true;
                  });
                }
              },
            ),
          ),
        ),
        SizedBox(width: context.dynamicWidth(0.02)),
        widget.filterIcon
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
