import 'package:flutter/material.dart';
import 'package:flutter_optipets/models/pet_object.dart';
import 'package:flutter_optipets/utils/constants.dart';
import 'package:flutter_optipets/views/pets_screen/pet_item.dart';
import 'package:flutter_optipets/views/pets_screen/pet_screen_view_model.dart';
import 'package:flutter_optipets/views/widgets/bottom_appbar.dart';
import 'package:flutter_optipets/views/widgets/my_circular_progress.dart';
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
        onModelReady: (model) => model.init(),
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: myAppBar("Pets"),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            extendBody: true,
            body: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: deviceHeight,
              child:
                  StreamBuilder<List<PetObject>>(
                      key: key,
                      stream: viewModel.petStream(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          viewModel.thisPets = snapshot.data!;
                          return ListView.separated(
                              controller: viewModel
                                  .applicationViewModel.scrollController,
                              padding: const EdgeInsets.all(8),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                
                                return PetItem(
                                  petId: 'qwe', 
                                  petObject: snapshot.data![index], 
                                  isInChatPage: false,
                                  showActions: true,);
                              },
                              separatorBuilder: (context, _) =>
                                  const SizedBox(height: 8),
                              itemCount: snapshot.data!.length);
                        } else {
                          return Scaffold(body: myCircularProgress());
                        }
                      }),
            ),
            bottomNavigationBar: ScrollToHide(
              controller: viewModel.applicationViewModel.scrollController,
              widget: const MyBottomAppBar(isPets: true),
              duration: const Duration(milliseconds: 200),
              height: 80,
            ),
          );
        });
  }
}
