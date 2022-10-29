import 'package:flutter/material.dart';
import 'package:flutter_optipets/utils/svg_icons.dart';
import 'package:flutter_optipets/views/customer_profile/customer_profile_view_model.dart';
import 'package:flutter_optipets/views/customer_profile/profile_image.dart';
import 'package:flutter_optipets/views/widgets/bottom_appbar.dart';
import 'package:flutter_optipets/views/widgets/top_appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class CustomerProfileView extends StatelessWidget {
  const CustomerProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomerProfileViewModel>.reactive(
        viewModelBuilder: () => CustomerProfileViewModel(),
        disposeViewModel: false,
        onModelReady: (model) => model.init(),
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            resizeToAvoidBottomInset: false,
            appBar: myAppBar("Me"),
            body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ProfileImage(viewModel: viewModel,),
                    const SizedBox(
                      height: 32,
                    ),
                    InkWell(
                      highlightColor: Theme.of(Get.context!)
                          .highlightColor
                          .withOpacity(0.1),
                      child:
                          _buildOption(label: "Pets", icon: SvgIcons.pawTilted),
                      onTap: () {
                        viewModel.signOut();
                      },
                    ),
                    InkWell(
                      highlightColor: Theme.of(Get.context!)
                          .highlightColor
                          .withOpacity(0.1),
                      child: _buildOption(
                          label: "Edit Profile",
                          icon: SvgIcons.pencilBlackOutlined),
                      onTap: () {
                        viewModel.signOut();
                      },
                    ),
                    InkWell(
                      highlightColor: Theme.of(Get.context!)
                          .highlightColor
                          .withOpacity(0.1),
                      child:
                          _buildOption(label: "About", icon: SvgIcons.question),
                      onTap: () {
                        viewModel.signOut();
                      },
                    ),
                    InkWell(
                      highlightColor: Theme.of(Get.context!)
                          .highlightColor
                          .withOpacity(0.1),
                      child: _buildOption(
                          label: "Sign Out", icon: SvgIcons.signOut),
                      onTap: () {
                        viewModel.signOut();
                      },
                    ),
                  ],
                )),
            bottomNavigationBar: const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: MyBottomAppBar(
                isProfile: true,
              ),
            ),
          );
        });
  }

  Widget _buildOption({required String label, required String icon}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(Get.context!).size.width / 8, vertical: 4),
      child: Row(
        children: [
          Container(
              width: 48,
              height: 48,
              decoration: label != "Sign Out"
                  ? BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      border: Border.all(
                        width: 2,
                        color: Colors.black,
                        style: BorderStyle.solid,
                      ),
                    )
                  : null,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(icon),
                ),
              )),
          const SizedBox(
            width: 16,
          ),
          Column(
            children: [
              Text(label, style: Theme.of(Get.context!).textTheme.headline1),
            ],
          ),
        ],
      ),
    );
  }
}
