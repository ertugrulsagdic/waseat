import 'package:flutter/material.dart';

import '../../../core/base/view/base_widget.dart';
import '../viewmodel/profile_view_model.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
      viewModel: ProfileViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, ProfileViewModel viewModel) =>
          Scaffold(
        body: Container(
          child: Center(
            child: Text('Profile'),
          ),
        ),
      ),
    );
  }
}
