import 'package:flutter/material.dart';
import 'package:flutter_optipets/views/appointment_screen/appointment_item.dart';
import 'package:flutter_optipets/views/appointment_screen/appointments_screen_view_model.dart';
import 'package:stacked/stacked.dart';

class AppointmentList extends ViewModelWidget<AppointmentViewModel> {
  const AppointmentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AppointmentViewModel viewModel) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) => const AppointmentItem(),
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 8,),
    );
  }
}
