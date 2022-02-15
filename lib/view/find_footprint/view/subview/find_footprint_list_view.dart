import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/src/context_extension.dart';
import 'package:waseat/core/constants/image/svg_constants.dart';
import 'package:waseat/core/init/lang/locale_keys.g.dart';
import 'package:waseat/view/_product/enum/search_tab_enum.dart';
import 'package:waseat/view/find_footprint/viewmodel/find_footprint_view_model.dart';

class FindFootprintListView extends StatelessWidget {
  final FindFootprintViewModel viewModel;
  FindFootprintListView({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  List<String> iconList = [
    'WALKING',
    'TRANSIT',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: context.normalValue,
            right: context.normalValue,
            top: context.normalValue,
          ),
          child: Text(
            LocaleKeys.findfootprint_routes.tr(),
            style: context.textTheme.headline6!.copyWith(
              color: context.colorScheme.primaryVariant,
            ),
          ),
        ),
        SizedBox(height: context.lowValue),
        Padding(
          padding: context.horizontalPaddingNormal,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Padding(
                padding: context.verticalPaddingNormal,
                child: Divider(
                  color: context.colorScheme.onSecondary,
                ),
              );
            },
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10 + 1,
            itemBuilder: (context, index) {
              return index < 10
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              children: iconList.asMap().entries.map(
                                (e) {
                                  int index = e.key;
                                  String value = e.value;
                                  return Container(
                                    width: context.dynamicWidth(0.11),
                                    height: context.dynamicWidth(0.11),
                                    margin: EdgeInsets.only(
                                      left: context.mediumValue * index,
                                    ),
                                    decoration: BoxDecoration(
                                      color: context.colorScheme.onPrimary,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: context.colorScheme.surface,
                                        width: 2,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: context.paddingLow,
                                      child: SvgPicture.asset(
                                        value.searchCardIcon,
                                        fit: BoxFit.scaleDown,
                                        color: context.colorScheme.secondary,
                                      ),
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                            Row(
                              children: iconList.asMap().entries.map((e) {
                                int index = e.key;
                                String value = e.value;
                                return Text(
                                  e.value.searchCardName +
                                      ((index < iconList.length - 1)
                                          ? ', '
                                          : ''),
                                  style: context.textTheme.headline5,
                                );
                              }).toList(),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: context.dynamicWidth(0.05),
                                  height: context.dynamicWidth(0.05),
                                  child: SvgPicture.asset(
                                    SVGImageConstants.instance.location,
                                    fit: BoxFit.scaleDown,
                                    color: context.colorScheme.onSecondary,
                                  ),
                                ),
                                SizedBox(width: context.lowValue / 2),
                                Text(
                                  1.2.toString() + ' km',
                                  style: context.textTheme.bodyText1!.copyWith(
                                    color: context.colorScheme.primaryVariant,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: context.normalValue),
                        SizedBox(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(
                                  bottom: context.lowValue,
                                ),
                                height: context.dynamicWidth(0.18),
                                decoration: BoxDecoration(
                                  color: context.colorScheme.onSecondary
                                      .withOpacity(0.3),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12)),
                                ),
                                padding: context.horizontalPaddingNormal,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'WALKING'.searchCardIcon,
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          '3793 Triston Lights Apt. 229',
                                          style: context.textTheme.headline6!
                                              .copyWith(
                                            color: context
                                                .colorScheme.primaryVariant,
                                          ),
                                        ),
                                        SizedBox(height: context.lowValue),
                                        Text(
                                          '3793 Triston Lights Apt. 229',
                                          style: context.textTheme.headline6!
                                              .copyWith(
                                            color: context
                                                .colorScheme.primaryVariant,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          100.toString() + ' CO2',
                                          style: context.textTheme.headline6!
                                              .copyWith(
                                            color:
                                                context.colorScheme.onSurface,
                                          ),
                                        ),
                                        SizedBox(height: context.lowValue),
                                        Text(
                                          100.toString() + ' km',
                                          style: context.textTheme.headline6!
                                              .copyWith(
                                            color:
                                                context.colorScheme.onSurface,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            physics: const NeverScrollableScrollPhysics(),
                          ),
                        ),
                        SizedBox(height: context.lowValue),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 1000.toString() + ' C02 ',
                                    style:
                                        context.textTheme.headline3!.copyWith(
                                      color: context.colorScheme.secondary,
                                    ),
                                  ),
                                  // Get the username from sevice and show it here
                                  TextSpan(
                                    text: 'Total',
                                    style:
                                        context.textTheme.headline6!.copyWith(
                                      color: context.colorScheme.primaryVariant,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            buildButton(
                              context,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              title: LocaleKeys.button_save.tr(),
                              rounded: false,
                            )
                          ],
                        )
                      ],
                    )
                  : SizedBox(height: context.dynamicHeight(0.1));
            },
          ),
        ),
      ],
    );
  }

  MaterialButton buildButton(
    BuildContext context, {
    required Function() onPressed,
    required String title,
    required bool rounded,
  }) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        padding: context.paddingNormal,
        alignment: Alignment.center,
        width: context.dynamicWidth(0.37),
        decoration: BoxDecoration(
          color: rounded ? Colors.transparent : context.colorScheme.secondary,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: rounded
              ? Border.all(
                  color: context.colorScheme.onSecondary,
                  width: 2,
                )
              : null,
        ),
        child: Text(
          title,
          style: context.textTheme.headline6!.copyWith(
            color: rounded
                ? context.colorScheme.primary
                : context.colorScheme.surface,
          ),
        ),
      ),
    );
  }
}
