import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/src/context_extension.dart';
import 'package:waseat/core/constants/image/image_constants.dart';
import 'package:waseat/core/constants/image/svg_constants.dart';
import 'package:waseat/view/_product/enum/search_tab_enum.dart';

import '../../../core/base/view/base_widget.dart';
import '../../../core/components/avatar/custom_avatar_button.dart';
import '../../../core/extension/string_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/foot_print_view_model.dart';

class FootPrintView extends StatelessWidget {
  FootPrintView({Key? key}) : super(key: key);

  List<String> iconList = [
    'WALKING',
    'TRANSIT',
  ];

  @override
  Widget build(BuildContext context) {
    return BaseView<FootPrintViewModel>(
      viewModel: FootPrintViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, FootPrintViewModel viewModel) =>
          Scaffold(
        body: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              actions: [
                CustomAvatarButton(
                  onPressed: () {},
                  imageUrl:
                      'https://media-exp1.licdn.com/dms/image/C5103AQEzZdQRZXIq2Q/profile-displayphoto-shrink_800_800/0/1585745479635?e=1649894400&v=beta&t=HggvYozuU_2nVcLzN3B5CJySe6aCL1S_kZ8616RSmNU',
                  radius: context.dynamicWidth(0.12),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: context.paddingNormal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: LocaleKeys.footprint_hello.locale + ', ',
                            style: context.textTheme.headline3,
                          ),
                          // Get the username from sevice and show it here
                          TextSpan(
                            text: 'Ertugrul' + '!',
                            style: context.textTheme.headline3,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: context.lowValue),
                    Text(
                      LocaleKeys.footprint_history.locale
                          .replaceAll('@number', 3.toString()),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: context.normalValue),
                child: Container(
                  // alignment: Alignment.centerLeft,
                  height: context.dynamicHeight(0.23),
                  // width: double.infinity,
                  decoration: BoxDecoration(
                    color: context.colorScheme.secondary,
                    image: DecorationImage(
                      alignment: Alignment.centerRight,
                      image: AssetImage(
                        ImageConstants.instance.homeBackground,
                      ),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: context.mediumValue,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'CO2',
                                style: context.textTheme.headline5!.copyWith(
                                  color: context.colorScheme.surface,
                                ),
                              ),
                              SizedBox(height: context.lowValue / 2),
                              Text(
                                '32,028.00',
                                style: context.textTheme.headline3!.copyWith(
                                  color: context.colorScheme.surface,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                LocaleKeys.footprint_totalSteps.tr(),
                                style: context.textTheme.headline5!.copyWith(
                                  color: context.colorScheme.surface,
                                ),
                              ),
                              SizedBox(height: context.lowValue / 2),
                              Row(
                                children: [
                                  Text(
                                    '18,920.00',
                                    style:
                                        context.textTheme.headline3!.copyWith(
                                      color: context.colorScheme.surface,
                                    ),
                                  ),
                                  SizedBox(width: context.normalValue),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: context.normalValue / 2,
                                      vertical: context.lowValue / 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: context.colorScheme.surface,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15)),
                                    ),
                                    child: Text(
                                      '+12%',
                                      style:
                                          context.textTheme.caption!.copyWith(
                                        color: context.colorScheme.onBackground,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: context.paddingNormal,
                child: Text(
                  LocaleKeys.footprint_carbonHistory.locale,
                  style: context.textTheme.headline3,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, index) => Padding(
                  padding: context.horizontalPaddingNormal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '22 şubat',
                            style: context.textTheme.headline6!.copyWith(
                              color: context.colorScheme.primaryVariant,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: context.normalValue),
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
                                value.searchCardName +
                                    ((index < iconList.length - 1) ? ', ' : ''),
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
                      // SizedBox(height: context.normalValue),
                      SizedBox(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: index + 1,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                bottom: context.lowValue,
                              ),
                              height: context.dynamicWidth(0.18),
                              decoration: BoxDecoration(
                                color: context.colorScheme.onSecondary
                                    .withOpacity(0.3),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
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
                                          color: context.colorScheme.onSurface,
                                        ),
                                      ),
                                      SizedBox(height: context.lowValue),
                                      Text(
                                        100.toString() + ' km',
                                        style: context.textTheme.headline6!
                                            .copyWith(
                                          color: context.colorScheme.onSurface,
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
                      index != 2
                          ? Padding(
                              padding: context.verticalPaddingNormal,
                              child: Divider(
                                color: context.colorScheme.onSecondary,
                              ),
                            )
                          : SizedBox(
                              height: context.normalValue,
                            )
                    ],
                  ),
                ),
                childCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
