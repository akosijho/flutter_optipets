import 'package:flutter/material.dart';
import 'package:flutter_optipets/utils/svg_icons.dart';
import 'package:flutter_optipets/views/appointment_screen/appointment_view.dart';
import 'package:flutter_optipets/views/customer_profile/customer_profile_view.dart';
import 'package:flutter_optipets/views/pets_screen/pet_screen_view.dart';
import 'package:flutter_optipets/views/widgets/bottom_appbar_actions.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class MyBottomAppBar extends StatelessWidget {
  const MyBottomAppBar(
      {Key? key, this.isPets, this.isAppointment, this.isProfile})
      : super(key: key);

  final bool? isPets;
  final bool? isAppointment;
  final bool? isProfile;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyBottomAppBarActions>.reactive(
        viewModelBuilder: () => MyBottomAppBarActions(),
        disposeViewModel: false,
        builder: (context, viewModel, child) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: 72,
            decoration: BoxDecoration(
              color: Theme.of(context).bottomAppBarColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                width: 0.1,
                style: BorderStyle.solid,
                color: Colors.grey,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), //color of shadow
                  // spreadRadius: 5, //spread radius
                  blurRadius: 7, // blur radius
                  offset: const Offset(0, 20),
                ),
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  iconButton("Pets", SvgIcons.pawIcon, isPets ?? false,
                      () => const PetScreenView(), viewModel),
                  iconButton(
                      "Appointment",
                      SvgIcons.appointmentIcon,
                      isAppointment ?? false,
                      () => const AppointmentView(),
                      viewModel),
                  iconButton("Me", SvgIcons.profileIcon, isProfile ?? false,
                      () => const CustomerProfileView(), viewModel),
                ],
              ),
            ),
          );
        });
  }

  Widget iconButton(String label, String icon, bool isSelected, dynamic route,
      MyBottomAppBarActions myBottomAppBarActions) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            myBottomAppBarActions.routeTo(route);
          },
          icon: SvgPicture.asset(
            icon,
            color: isSelected
                ? Theme.of(Get.context!).toggleableActiveColor
                : Theme.of(Get.context!).disabledColor,
            width: 48,
          ),
        ),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
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
