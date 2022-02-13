import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:kartal/src/context_extension.dart';
import 'package:waseat/core/constants/image/image_constants.dart';

import '../../../core/base/view/base_widget.dart';
import '../../../core/components/avatar/custom_avatar_button.dart';
import '../../../core/extension/string_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/foot_print_view_model.dart';

class FootPrintView extends StatelessWidget {
  const FootPrintView({Key? key}) : super(key: key);

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
            // SliverToBoxAdapter(
            //   child: ,
            // )
          ],
        ),
      ),
    );
  }
}
