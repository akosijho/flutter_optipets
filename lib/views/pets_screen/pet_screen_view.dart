import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optipets/app/app.router.dart';
import 'package:flutter_optipets/models/pet_object.dart';
import 'package:flutter_optipets/utils/constants.dart';
import 'package:flutter_optipets/utils/svg_icons.dart';
import 'package:flutter_optipets/utils/svg_images.dart';
import 'package:flutter_optipets/views/pets_screen/pet_item.dart';
import 'package:flutter_optipets/views/pets_screen/pet_screen_view_model.dart';
import 'package:flutter_optipets/views/widgets/bottom_appbar.dart';
import 'package:flutter_optipets/views/widgets/my_circular_progress.dart';
import 'package:flutter_optipets/views/widgets/scroll_to_hide_widget.dart';
import 'package:flutter_optipets/views/widgets/top_appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                  // Column(
                  //   children: [
                  StreamBuilder<List<PetObject>>(
                      key: key,
                      stream: viewModel.petStream(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          viewModel.thisPets = snapshot.data!;
                          // viewModel.thisPets.addAll(snapshot.data!.docs
                          //     .map((DocumentSnapshot e) => PetObject.fromJson(
                          //         e.data() as Map<String, dynamic>))
                          //     .toList());
                          // viewModel.petId.addAll(snapshot.data!.docs
                          //     .map((DocumentSnapshot e) => e.id)
                          //     .toList());

                          // if (viewModel.prevCount == false) {
                          //   viewModel.thisPets
                          //       .removeRange(0, snapshot.data!.size+1);
                          //   viewModel.petId.removeRange(0, snapshot.data!.size+1);
                          // } else {
                          //   viewModel.prevCount = false;
                          // }
                          // return ListView(
                          //   padding: const EdgeInsets.symmetric(
                          //       horizontal: 8, vertical: 8),
                          //   controller:
                          //       viewModel.applicationViewModel.scrollController,
                          //   children: snapshot.data!
                          //       .map((e) => Column(
                          //             children: [
                          //               const SizedBox(
                          //                 height: 4,
                          //               ),
                          //               Container(
                          //                 height: 72,
                          //                 width: double.infinity,
                          //                 decoration: BoxDecoration(
                          //                   color: Theme.of(context)
                          //                       .scaffoldBackgroundColor,
                          //                   shape: BoxShape.rectangle,
                          //                   borderRadius:
                          //                       BorderRadius.circular(16),
                          //                   // border: Border.all(
                          //                   //   width: 2,
                          //                   //   style: BorderStyle.solid,
                          //                   //   color: Colors.grey,
                          //                   // ),
                          //                   boxShadow: [
                          //                     BoxShadow(
                          //                       color: Colors.grey.withOpacity(
                          //                           0.4), //color of shadow
                          //                       // spreadRadius: 5, //spread radius
                          //                       blurRadius: 4, // blur radius
                          //                       offset: const Offset(0, 4),
                          //                     ),
                          //                   ],
                          //                 ),
                          //                 child: ListTile(
                          //                     onTap: () => viewModel
                          //                         .applicationViewModel
                          //                         .navigationService
                          //                         .pushNamed(Routes.petProfile,
                          //                             arguments:
                          //                                 PetProfileViewArguments(
                          //                                     petId: 'qwe',
                          //                                     petObject: e)),
                          //                     style: ListTileStyle.list,
                          //                     leading: Container(
                          //                         width: 56,
                          //                         height: 56,
                          //                         decoration:
                          //                             const BoxDecoration(
                          //                                 shape:
                          //                                     BoxShape.circle),
                          //                         child: Image.asset(
                          //                             SvgImages.temp)),
                          //                     title: Text(
                          //                       e.name!,
                          //                       style: Theme.of(context)
                          //                           .textTheme
                          //                           .headline5,
                          //                       textAlign: TextAlign.left,
                          //                     ),
                          //                     subtitle: Text(
                          //                       e.breed!,
                          //                       style: Theme.of(context)
                          //                           .textTheme
                          //                           .bodyText1,
                          //                       textAlign: TextAlign.left,
                          //                     ),
                          //                     trailing: IconButton(
                          //                       icon: SvgPicture.asset(
                          //                         SvgIcons.infoIcon,
                          //                         width: 24,
                          //                       ),
                          //                       onPressed: () {},
                          //                     )),
                          //               ),
                          //               const SizedBox(
                          //                 height: 4,
                          //               ),
                          //             ],
                          //           ))
                          //       .toList(),
                          // );

                          return ListView.separated(
                              controller: viewModel
                                  .applicationViewModel.scrollController,
                              padding: const EdgeInsets.all(8),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                // final petData = snapshot.data!.docs[index];
                                // PetObject pet = PetObject.fromJson(
                                //     petData.data() as Map<String, dynamic>);
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
              //     TextFormField(
              //       onChanged: (va) => viewModel.name = va,
              //     ),
              //     TextFormField(
              //       onChanged: (va) => viewModel.breed = va,
              //     ),
              //     ElevatedButton(
              //         onPressed: () async {
              //           await viewModel.save();
              //         },
              //         child: Text('save'))
              //   ],
              // ),
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

  Widget petItem(
      {required String petId,
      required PetObject petObject,
      bool showActions = false,
      bool isInChatPage = false,
      required dynamic viewModel}) {
    return InkWell(
      onTap: () async {
        isInChatPage
            ? await viewModel.applicationViewModel.navigationService
                .pushNamed(Routes.conversationView)
            : await viewModel.applicationViewModel.navigationService.pushNamed(
                Routes.petProfile,
                arguments: PetProfileViewArguments(
                    petId: petId, petObject: petObject));
      },
      child: Container(
        height: 72,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(getContext).scaffoldBackgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
          // border: Border.all(
          //   width: 2,
          //   style: BorderStyle.solid,
          //   color: Colors.grey,
          // ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4), //color of shadow
              // spreadRadius: 5, //spread radius
              blurRadius: 4, // blur radius
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                      width: 56,
                      height: 56,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: Image.asset(SvgImages.temp)),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        petObject.name!,
                        style: Theme.of(getContext).textTheme.headline5,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        petObject.breed!,
                        style: Theme.of(getContext).textTheme.bodyText1,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ],
              ),
              showActions
                  ? IconButton(
                      icon: SvgPicture.asset(
                        SvgIcons.infoIcon,
                        width: 24,
                      ),
                      onPressed: () {},
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
