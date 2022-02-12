import 'package:flutter/material.dart';
import 'package:kartal/src/context_extension.dart';

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
        appBar: AppBar(
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
        body: Column(
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
    );
  }
}
