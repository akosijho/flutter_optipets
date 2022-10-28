import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optipets/models/pet_object.dart';
import 'package:flutter_optipets/utils/constants.dart';
import 'package:flutter_optipets/utils/svg_icons.dart';
import 'package:flutter_optipets/utils/svg_images.dart';
import 'package:flutter_optipets/views/pet_profile/deworn_tab.dart';
import 'package:flutter_optipets/views/pet_profile/pet_profile_view_model.dart';
import 'package:flutter_optipets/views/pet_profile/vaccination_tab.dart';
import 'package:flutter_optipets/views/widgets/my_circular_progress.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class PetProfileView extends StatelessWidget {
  const PetProfileView({Key? key, required this.petId, required this.petObject})
      : super(key: key);

  final String petId;
  final PetObject petObject;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PetProfileViewModel>.reactive(
      viewModelBuilder: () => PetProfileViewModel(petId: petId),
      disposeViewModel: false,
      builder: ((context, model, child) {
        return StreamBuilder<DocumentSnapshot>(
            stream: model.petData,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                return Scaffold(
                  appBar: thisAppbar(),
                  backgroundColor:
                      Theme.of(context).scaffoldBackgroundColor.withAlpha(235),
                  body: ListView(
                    scrollDirection: Axis.vertical,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shrinkWrap: true,
                    children: [
                      petStats(
                          SvgIcons.pawOutlined,
                          petObject.breed ?? '',
                          petObject.weight ?? "10.3 kg",
                          petObject.birthday ?? '',
                          petObject.sex ?? ''),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 340,
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.4), //color of shadow
                              blurRadius: 4, // blur radius
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: DefaultTabController(
                            length: 2,
                            initialIndex: 0,
                            child: Column(
                              children: [
                                TabBar(
                                    indicatorColor:
                                        Theme.of(context).primaryColor,
                                    physics: const BouncingScrollPhysics(),
                                    tabs: [
                                      Tab(
                                        child: Text(
                                          'Deworming',
                                          style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      Tab(
                                        child: Text(
                                          'Vaccination',
                                          style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      )
                                    ]),
                                SizedBox(
                                  height: 288,
                                  child: TabBarView(
                                      physics: const BouncingScrollPhysics(),
                                      children: [
                                        DewormTab(),
                                        VaccinationTab()
                                      ]),
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                );
              } else {
                return Scaffold(
                  body: Center(child: myCircularProgress()),
                );
              }
            });
      }),
    );
  }

  PreferredSize thisAppbar() {
    return PreferredSize(
      preferredSize: Size(MediaQuery.of(Get.context!).size.width, 80),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: Theme.of(Get.context!).scaffoldBackgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    petObject.name ?? '',
                    style: TextStyle(
                      fontSize: 24,
                      color: Theme.of(Get.context!).primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "September 2022",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color:
                          Theme.of(Get.context!).primaryColor.withOpacity(0.7),
                    ),
                  ),
                ]),
            Container(
                width: 56,
                height: 56,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Image.asset(SvgImages.temp)),
          ],
        ),
      ),
    );
  }

  Widget petStats(String specieIcon, String breed, String weight,
      String birthday, String gender) {
    return Container(
      width: MediaQuery.of(Get.context!).size.width,
      height: 104,
      decoration: BoxDecoration(
        color: Theme.of(getContext).scaffoldBackgroundColor,
        shape: BoxShape.rectangle,
        // border: Border.all(color: Theme.of(Get.context!).disabledColor),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4), //color of shadow
            blurRadius: 4, // blur radius
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  breed,
                  style: TextStyle(
                      color: Theme.of(Get.context!).primaryColor, fontSize: 12),
                ),
                const SizedBox(
                  height: 8,
                ),
                SvgPicture.asset(specieIcon),
              ]),
          Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  weight,
                  style: TextStyle(
                      color: Theme.of(Get.context!).primaryColor, fontSize: 12),
                ),
                const SizedBox(
                  height: 8,
                ),
                SvgPicture.asset(SvgIcons.weighOutlined),
              ]),
          Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  birthday,
                  style: TextStyle(
                      color: Theme.of(Get.context!).primaryColor, fontSize: 12),
                ),
                const SizedBox(
                  height: 8,
                ),
                SvgPicture.asset(SvgIcons.cakeOutlined),
              ]),
          Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  gender,
                  style: TextStyle(
                      color: Theme.of(Get.context!).primaryColor, fontSize: 12),
                ),
                const SizedBox(
                  height: 8,
                ),
                SvgPicture.asset(SvgIcons.genderOutlined),
              ]),
        ],
      ),
    );
  }
}
