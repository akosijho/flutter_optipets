import 'package:flutter/material.dart';
import 'package:flutter_optipets/utils/svg_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

AppBar myAppBar(String title) {
  return AppBar(
    toolbarHeight: 60,
    title: Text(
      title,
      style: Theme.of(Get.context!).textTheme.headline2,
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right:8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: SvgPicture.asset(SvgIcons.searchIcon)),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  SvgIcons.chatIcon,
                )),
          ],
        ),
      ),
    ],
  );
}
