import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:waseat/core/constants/image/svg_constants.dart';
import 'package:waseat/core/init/lang/locale_keys.g.dart';
import 'package:waseat/view/_product/enum/search_tab_enum.dart';
import 'package:waseat/view/find_footprint/view/subview/find_footprint_list_view.dart';
import 'package:waseat/view/find_footprint/view/subview/find_footprint_map_view.dart';

import '../../../core/base/view/base_widget.dart';
import '../viewmodel/find_footprint_view_model.dart';

class FindFootprintView extends StatelessWidget {
  FindFootprintView({Key? key}) : super(key: key);

  List<Widget> pages = [];

  @override
  Widget build(BuildContext context) {
    return BaseView<FindFootprintViewModel>(
      viewModel: FindFootprintViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        pages = [
          FindFootprintMapView(viewModel: model),
          FindFootprintListView(viewModel: model),
        ];
      },
      onPageBuilder: (BuildContext context, FindFootprintViewModel viewModel) =>
          Scaffold(
        appBar: AppBar(
          leading: MaterialButton(
            onPressed: () {
              viewModel.page == 0
                  ? Navigator.pop(context)
                  : viewModel.changePage(0);
            },
            child: Icon(
              Icons.arrow_back,
              color: context.colorScheme.primary,
            ),
          ),
          actions: [
            MaterialButton(
              padding: EdgeInsets.zero,
              shape: const CircleBorder(),
              onPressed: () {},
              child: Icon(
                Icons.menu,
                color: context.colorScheme.primary,
              ),
            ),
          ],
          title: Text(
            LocaleKeys.findfootprint_title.tr(),
            style: context.textTheme.headline4,
          ),
        ),
        body: Container(
          color: context.colorScheme.surface,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildSearchArea(context, viewModel),
              Expanded(
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  // onPageChanged: (int value) {
                  //   viewModel.changePage(value);
                  // },
                  itemCount: pages.length,
                  itemBuilder: (context, index) {
                    return Observer(builder: (_) {
                      return pages[viewModel.page];
                    });
                  },
                ),
              ),
              // FindFootprintMapView(viewModel: viewModel),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSearchArea(
      BuildContext context, FindFootprintViewModel viewModel) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color(0xFFB2B1B7),
            blurRadius: 10,
          ),
        ],
      ),
      height: context.dynamicHeight(0.2),
      child: Column(
        children: [
          searchBox(context, viewModel),
          SizedBox(height: context.lowValue),
          Container(
            padding: EdgeInsets.only(left: context.lowValue),
            height: context.dynamicWidth(0.12),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: viewModel.tabs.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    viewModel.changeSelectedTab(index);
                  },
                  child: Observer(builder: (_) {
                    return Container(
                      margin: EdgeInsets.only(
                        right: context.lowValue,
                      ),
                      alignment: Alignment.center,
                      width: context.dynamicWidth(0.3),
                      height: context.dynamicWidth(0.12),
                      decoration: BoxDecoration(
                        color: viewModel.selectedTab == index
                            ? context.colorScheme.onSecondary.withOpacity(0.5)
                            : context.colorScheme.onSecondary.withOpacity(0.2),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: context.dynamicWidth(0.065),
                            height: context.dynamicWidth(0.065),
                            child: SvgPicture.asset(
                              viewModel.tabs[index].index.searchTabIcon,
                              fit: BoxFit.scaleDown,
                              color: context.colorScheme.secondary,
                            ),
                          ),
                          SizedBox(width: context.lowValue),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                // width: context
                                //     .dynamicWidth(0.15),
                                child: AutoSizeText(
                                  '30 min',
                                  style: context.textTheme.bodyText1!.copyWith(
                                    color: context.colorScheme.primaryVariant,
                                  ),
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                // width: context
                                //     .dynamicWidth(0.15),
                                child: AutoSizeText(
                                  '0 CO2',
                                  style: context.textTheme.bodyText1!.copyWith(
                                    color: context.colorScheme.primaryVariant,
                                  ),
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Arama kutusu
  Widget searchBox(BuildContext context, FindFootprintViewModel viewModel) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.lowValue,
        ),
        child: Container(
          height: context.dynamicHeight(0.12),
          decoration: BoxDecoration(
            color: context.colorScheme.onSecondary.withOpacity(0.3),
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Padding(
            padding: context.horizontalPaddingNormal,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // üst
                  _searchTop(context),
                  // orta
                  _searchCenter(context),
                  // alt
                  _searchBottom(context),
                ],
              ),
            ),
          ),
          width: context.width,
        ),
      );

  // Arama kutusunun üst kısmı
  Widget _searchTop(BuildContext context) => Row(
        children: <Widget>[
          SizedBox(
            width: 20,
            height: 20,
            child: Icon(
              Icons.trip_origin,
              size: 18,
              color: context.colorScheme.secondary,
            ),
          ),
          SizedBox(width: context.normalValue),
          Expanded(
            child: SizedBox(
              height: context.mediumValue,
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      );
  // Arama kutusunun orta kısmı
  Widget _searchCenter(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            width: 20,
            child: Icon(
              Icons.more_vert,
              color: Colors.black54,
              size: 18,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: context.normalValue,
            ),
            width: context.dynamicWidth(0.65),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: context.colorScheme.primaryVariant,
                  width: 1,
                ),
              ),
            ),
          ),
          SizedBox(width: context.normalValue),
          InkWell(
            child: Center(
              child: SvgPicture.asset(
                SVGImageConstants.instance.switchRoute,
              ),
            ),
            onTap: () => print('clicked!'),
          ),
        ],
      );

  // Aram kutusunun alt kısmı
  Widget _searchBottom(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 20,
            height: 20,
            child: Icon(
              Icons.place,
              size: 18,
              color: context.colorScheme.secondary,
            ),
          ),
          SizedBox(width: context.normalValue),
          Expanded(
            child: SizedBox(
              height: context.mediumValue,
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      );
}
