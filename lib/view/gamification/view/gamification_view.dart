import 'package:flutter/material.dart';

import '../../../core/base/view/base_widget.dart';
import '../viewmodel/gamification_view_model.dart';

class GamificationView extends StatelessWidget {
  const GamificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<GamificationViewModel>(
      viewModel: GamificationViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, GamificationViewModel viewModel) =>
          Scaffold(
        body: Container(
          child: Center(
            child: Text('Gamification'),
          ),
        ),
      ),
    );
  }
}
