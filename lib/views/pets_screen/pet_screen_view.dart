import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optipets/models/pet_object.dart';
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
        onModelReady: (model) => model.init,
        builder: (context, viewModel, child) {
          return StreamBuilder<QuerySnapshot>(
              stream: viewModel.pets,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  return Scaffold(
                    appBar: myAppBar("Pets"),
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    extendBody: true,
                    body: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child:
                          ListView.separated(
                              controller: viewModel.applicationViewModel.scrollController,
                              padding: const EdgeInsets.all(8),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                final petData = snapshot.data!.docs[index];
                                PetObject pet = PetObject.fromJson(petData.data() as Map<String, dynamic>);
                                return PetItem(
                                    showActions: true,
                                    isInChatPage: false,
                                    petId: petData.id,
                                    petObject: pet,
                                  );
                              },
                              separatorBuilder: (context, _) => const SizedBox(height: 8),
                              itemCount:  snapshot.data!.docs.length),
                    ),
                    bottomNavigationBar: ScrollToHide(
                      controller:
                          viewModel.applicationViewModel.scrollController,
                      widget: const MyBottomAppBar(isPets: true),
                      duration: const Duration(milliseconds: 200),
                      height: 80,
                    ),
                  );
                }else{
                  Scaffold(body: myCircularProgress());
                }
                  return Scaffold(body: myCircularProgress());
              });
        });
  }
}
