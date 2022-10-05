import 'package:flutter/material.dart';
import 'package:flutter_optipets/app/app.locator.dart';
import 'package:flutter_optipets/app/app.router.dart';
import 'package:flutter_optipets/utils/constants.dart';
import 'package:flutter_optipets/utils/svg_icons.dart';
import 'package:flutter_optipets/views/application/application_view_model.dart';
import 'package:flutter_optipets/views/search/search_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

AppBar myAppBar(
  String title, {
  List<Widget>? tabs,
  bool? isAppointment,
  bool? isChats
}) {
  final ApplicationViewModel applicationViewModel = locator<ApplicationViewModel>();
  return AppBar(
      toolbarHeight: 48,
      title: Text(
        title,
        style: Theme.of(Get.context!).textTheme.headline2,
      ),
      automaticallyImplyLeading: isChats != null ? true : false,
      actions: isChats == null ?  [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    showSearch(context: getContext, delegate: SearchViewDelegate(), useRootNavigator: true);
                  },
                  icon: SvgPicture.asset(SvgIcons.searchIcon,
                  width: 24,
                  height: 24,)),
              IconButton(
                  onPressed: () {
                    applicationViewModel.navigationService.pushNamed(Routes.chatsView);
                  },
                  icon: SvgPicture.asset(
                    SvgIcons.chatIcon,
                  width: 24,
                  height: 24,
                  )),
            ],
          ),
        ),
      ] : null,
      bottom: isAppointment != null ? myTabBar(tabs) : null);
}

PreferredSize myTabBar(
  List<Widget>? tabs,
) {
  return PreferredSize(
    preferredSize: Size(MediaQuery.of(Get.context!).size.width, 34),
    child: TabBar(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      indicator: myTabIndicator(),
      indicatorSize: TabBarIndicatorSize.tab,
      tabs: tabs!,
    ),
  );
}

BoxDecoration myTabIndicator() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(50),
    color: Theme.of(Get.context!).highlightColor,
  );
}
