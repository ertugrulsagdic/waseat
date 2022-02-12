import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kartal/kartal.dart';

import '../../../core/base/view/base_widget.dart';
import '../../../core/constants/image/svg_constants.dart';
import '../viewmodel/bottom_tab_view_model.dart';

class BottomTabView extends StatelessWidget {
  const BottomTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<BottomTabViewModel>(
        viewModel: BottomTabViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, BottomTabViewModel viewModel) =>
            Observer(builder: (_) {
              return Scaffold(
                body: viewModel.tabs[viewModel.tabIndex],
                bottomNavigationBar: Container(
                  decoration: const BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Color(0xFFB2B1B7),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    // borderRadius: const BorderRadius.only(
                    //   topLeft: Radius.circular(20),
                    //   topRight: Radius.circular(20),
                    // ),
                    child: SizedBox(
                      height: context.dynamicHeight(0.1) +
                          (MediaQuery.of(context).padding.bottom / 2),
                      child: BottomNavigationBar(
                        showSelectedLabels: false,
                        showUnselectedLabels: false,
                        type: BottomNavigationBarType.fixed,
                        // selectedItemColor: context.colorScheme.primary,
                        // unselectedItemColor: context.colorScheme.secondary,
                        items: <BottomNavigationBarItem>[
                          BottomNavigationBarItem(
                            icon: SvgPicture.asset(
                              SVGImageConstants.instance.footprint,
                              color: viewModel.tabIndex == 0
                                  ? context.colorScheme.secondary
                                  : context.colorScheme.onSecondary,
                            ),
                            label: '',
                          ),
                          BottomNavigationBarItem(
                            icon: SvgPicture.asset(
                              SVGImageConstants.instance.map,
                              color: viewModel.tabIndex == 1
                                  ? context.colorScheme.secondary
                                  : context.colorScheme.onSecondary,
                            ),
                            label: '',
                          ),
                          BottomNavigationBarItem(
                            icon: SvgPicture.asset(
                              SVGImageConstants.instance.gamification,
                              color: viewModel.tabIndex == 2
                                  ? context.colorScheme.secondary
                                  : context.colorScheme.onSecondary,
                            ),
                            label: '',
                          ),
                          BottomNavigationBarItem(
                            icon: SvgPicture.asset(
                              SVGImageConstants.instance.profile,
                              color: viewModel.tabIndex == 3
                                  ? context.colorScheme.secondary
                                  : context.colorScheme.onSecondary,
                            ),
                            label: '',
                          ),
                        ],
                        currentIndex: viewModel.tabIndex,
                        onTap: viewModel.changeTabIndex,
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
