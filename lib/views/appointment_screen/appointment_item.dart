import 'package:flutter/material.dart';
import 'package:flutter_optipets/views/appointment_screen/appointments_screen_view_model.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class AppointmentItem extends ViewModelWidget<AppointmentViewModel> {
  const AppointmentItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AppointmentViewModel viewModel) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: viewModel.cardColors[viewModel.selectRandomColor()],
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          dateContainer(),
          textChildren()
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
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          ),
        ),
        child: Center(
          child:
              Text('OCT 10', style: Theme.of(Get.context!).textTheme.bodyText2),
        ),
      ),
    );
  }

  Widget textChildren(){
    return Positioned(
      top: 16,
      left: 16,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Visit Status",
                style: Theme.of(Get.context!).textTheme.caption,
              ),
              Text("Vaccination",
                style: Theme.of(Get.context!).textTheme.headline6,
              ),
            ],
          ),
          const SizedBox(height: 24,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Attending Personnel",
                style: Theme.of(Get.context!).textTheme.caption,
              ),
              Text("John Doe",
                style: Theme.of(Get.context!).textTheme.headline6,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
