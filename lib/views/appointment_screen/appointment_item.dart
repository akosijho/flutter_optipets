import 'package:flutter/material.dart';
import 'package:flutter_optipets/views/appointment_screen/appointments_screen_view_model.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class AppointmentItem extends ViewModelWidget<AppointmentViewModel> {
  const AppointmentItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AppointmentViewModel viewModel) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: viewModel.cardColors[viewModel.selectRandomColor()],
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          dateContainer(),
        ],
      ),
    );
  }

  Widget dateContainer() {
    return Positioned(
      right: 0,
      top: 21,
      child: Container(
        width: 73,
        height: 44,
        decoration: BoxDecoration(
          color: const Color(0xff21ABA5).withOpacity(0.6),
        ),
        child: Center(
          child:
              Text('OCT 10', style: Theme.of(Get.context!).textTheme.bodyText2),
        ),
      ),
    );
  }
}
