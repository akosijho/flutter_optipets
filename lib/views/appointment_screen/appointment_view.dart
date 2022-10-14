import 'package:flutter/material.dart';
import 'package:flutter_optipets/views/appointment_screen/appoinment_list.dart';
import 'package:flutter_optipets/views/appointment_screen/appointments_screen_view_model.dart';
import 'package:flutter_optipets/views/widgets/bottom_appbar.dart';
import 'package:flutter_optipets/views/widgets/scroll_to_hide_widget.dart';
import 'package:flutter_optipets/views/widgets/top_appbar.dart';
import 'package:stacked/stacked.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppointmentViewModel>.reactive(
        viewModelBuilder: () => AppointmentViewModel(),
        builder: (context, viewModel, child) {
          return DefaultTabController(
            length: viewModel.tabs.length,
            child: Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              appBar: myAppBar("Appointments",
                  tabs: viewModel.tabs, isAppointment: true),
              extendBody: true,
              body: const TabBarView(
                children: [
                  AppointmentList(),
                  AppointmentList(),
                ],
              ),
              bottomNavigationBar: ScrollToHide(
                widget: const MyBottomAppBar(
                  isAppointment: true,
                ),
                controller: viewModel.applicationViewModel.scrollController,
                duration: const Duration(milliseconds: 200),
                height: 80,
              ),
            ),
          );
        });
  }
}
