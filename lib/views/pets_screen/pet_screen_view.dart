import 'package:flutter/material.dart';
import 'package:flutter_optipets/utils/svg_images.dart';
import 'package:flutter_optipets/views/pets_screen/pet_item.dart';
import 'package:flutter_optipets/views/pets_screen/pet_screen_view_model.dart';
import 'package:flutter_optipets/views/widgets/bottom_appbar.dart';
import 'package:flutter_optipets/views/widgets/scroll_to_hide_widget.dart';
import 'package:flutter_optipets/views/widgets/top_appbar.dart';
import 'package:stacked/stacked.dart';

class PetScreenView extends StatelessWidget {
  const PetScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PetScreenVieModel>.reactive(
        viewModelBuilder: () => PetScreenVieModel(),
        disposeViewModel: false,
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: myAppBar("Pets"),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            extendBody: true,
            body: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                  controller: viewModel.applicationViewModel.scrollController,
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => PetItem(
                        showActions: true,
                        isInChatPage: false,
                        name: "Pet Name",
                        breed: "Poodle", image: SvgImages.temp,
                      ),
                  separatorBuilder: (context, _) => const SizedBox(height: 2),
                  itemCount: 20),
            ),
            bottomNavigationBar: ScrollToHide(
              controller: viewModel.applicationViewModel.scrollController,
              widget: const MyBottomAppBar(
                isPets: true
              ), duration: const Duration(milliseconds: 200), 
              height: 96,
            ),
          );
        });
  }
}
