import 'package:flutter/material.dart';
import 'package:flutter_optipets/utils/svg_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({Key? key, required this.label}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Theme.of(context).appBarTheme.backgroundColor,
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.headline2,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {}, icon: SvgPicture.asset(SvgIcons.searchIcon)),
              IconButton(
                  onPressed: () {}, icon: SvgPicture.asset(SvgIcons.chatIcon,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
