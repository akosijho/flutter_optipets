import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_optipets/views/appointment_screen/appointments_screen_view_model.dart';
import 'package:stacked/stacked.dart';

class AppointmentItem extends ViewModelWidget<AppointmentViewModel>{
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
    );
  }

}