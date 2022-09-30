import 'package:flutter/material.dart';
import 'package:flutter_optipets/utils/svg_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyBottomAppBar extends StatelessWidget {
  const MyBottomAppBar(
      {Key? key, this.isPets, this.isAppointment, this.isProfile})
      : super(key: key);

  final bool? isPets;
  final bool? isAppointment;
  final bool? isProfile;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 88,
      decoration: BoxDecoration(
        color: Theme.of(context).bottomAppBarColor,
        shape: BoxShape.rectangle,
        border: const Border(
          top: BorderSide(
            width: 1,
            style: BorderStyle.solid,
            color: Colors.grey,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            iconButton("Pets", SvgIcons.pawIcon, isPets?? false),
            iconButton("Appointment", SvgIcons.appointmentIcon, isAppointment?? false),
            iconButton("Me", SvgIcons.profileIcon, isProfile?? false),
          ],
        ),
      ),
    );
  }

  Widget iconButton(String label, String icon, bool isSelected) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(icon,
                color: isSelected
                    ? Theme.of(Get.context!).toggleableActiveColor
                    : Theme.of(Get.context!).disabledColor)),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: isSelected
                  ? Theme.of(Get.context!).toggleableActiveColor
                  : Theme.of(Get.context!).disabledColor,
            ),
          ),
        )
      ],
    );
  }
}
