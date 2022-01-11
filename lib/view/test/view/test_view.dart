import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../../core/base/view/base_widget.dart';
import '../viewmodel/test_view_model.dart';
import 'package:easy_localization/easy_localization.dart';

class TestView extends StatefulWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
      viewModel: TestViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, TestViewModel viewModel) =>
          Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.welcome.tr()),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  LocaleKeys.lorem.tr(),
                  textAlign: TextAlign.center,
                ),
                Observer(builder: (_) {
                  return Text(
                    viewModel.number.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                }),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: viewModel.incrementNumber,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
