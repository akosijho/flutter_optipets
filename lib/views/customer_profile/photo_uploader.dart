import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optipets/app/app.locator.dart';
import 'package:flutter_optipets/models/user_object.dart';
import 'package:flutter_optipets/utils/constants.dart';
import 'package:flutter_optipets/utils/my_colors.dart';
import 'package:flutter_optipets/views/application/application_view_model.dart';
import 'package:flutter_optipets/views/widgets/my_circular_progress.dart';
import 'package:flutter_optipets/views/widgets/show_snackbar.dart';
import 'package:getwidget/getwidget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

class PhotoUploader extends StatelessWidget {
  const PhotoUploader(
      {super.key,
      // required this.imagePath,
      required this.docId,
      required this.contact,
      required this.imageUrl});

  // final String imagePath;
  final String docId;
  final String contact;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final ApplicationViewModel applicationViewModel =
        locator<ApplicationViewModel>();
    String contactField = contact;
    return ViewModelBuilder<PhotoUploaderViewModel>.reactive(
        viewModelBuilder: () => PhotoUploaderViewModel(
            // path: imagePath,
            docId: docId),
        disposeViewModel: false,
        // onModelReady: (model) => model.init(),
        builder: (context, model, child) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(16),
            title: const Text('Save Image'),
            content: SizedBox(
              height: 400,
              child: model.isBusy
                  ? SizedBox(
                    height: 40,
                    width: 40,
                    child: myCircularProgress(),
                  )
                  : Column(
                      children: [
                        Expanded(
                          child: model.img != null
                              ? Image.file(
                                  model.img!,
                                  fit: BoxFit.contain,
                                )
                              : imageUrl != null
                                  ? CachedNetworkImage(
                                      imageUrl: imageUrl!,
                                      progressIndicatorBuilder:
                                          ((context, url, progress) =>
                                              const Center(
                                                  child: Text('Loading...'))),
                                    )
                                  : Center(
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.add_a_photo_outlined,
                                            color: MyColors.blueButtonColor,
                                          )),
                                    ),
                        ),
                        const SizedBox(height: 8),
                        imageUrl != null
                            ? GFButton(
                                onPressed: () async {
                                  await model.pickImage();
                                },
                                shape: GFButtonShape.pills,
                                type: GFButtonType.outline,
                                text: 'Add Image',
                                textStyle: const TextStyle(
                                    fontSize: 20, color: MyColors.blue2),
                              )
                            : Container(),
                        const SizedBox(height: 16),
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Contact no')),
                        const SizedBox(height: 8),
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          initialValue: contact,
                          onChanged: (val) => contactField = val,
                        )
                      ],
                    ),
            ),
            actions: [
              SizedBox(
                width: 120,
                height: 54,
                child: GFButton(
                  onPressed: () {
                    applicationViewModel.navigationService.pop();
                  },
                  shape: GFButtonShape.pills,
                  type: GFButtonType.outline,
                  text: 'Cancel',
                  textStyle: const TextStyle(
                      fontSize: 20, color: MyColors.blueButtonColor),
                ),
              ),
              SizedBox(
                width: 120,
                height: 54,
                child: GFButton(
                  onPressed: () async {
                    await model.uploadImage(contact: contactField);
                    applicationViewModel.navigationService.pop();
                  },
                  shape: GFButtonShape.pills,
                  type: GFButtonType.solid,
                  text: 'Save',
                  textStyle:
                      const TextStyle(fontSize: 20, color: GFColors.WHITE),
                ),
              )
            ],
          );
        });
  }
}

class PhotoUploaderViewModel extends BaseViewModel {
  PhotoUploaderViewModel(
      {
      // required this.path,
      required this.docId});
  final ApplicationViewModel applicationViewModel =
      locator<ApplicationViewModel>();
  File? img;
  // final String path;
  String? docId;
  void init() {
    setBusy(true);
    // img = File(path);
    setBusy(false);
  }

  Future<void> uploadImage({required String contact}) async {
    setBusy(true);
    final ref = storageRef.child('$docId').child('display');
    try {
      if (img != null) {
        await ref.putFile(img!);
        await userRef.doc(docId!).update(
            {"displayImage": await ref.getDownloadURL(), "contacts": contact});
        await userRef.doc(docId).get().then(
          (doc) {
            applicationViewModel.userObject =
                UserObject.fromJson(doc.data() as Map<String, dynamic>);
          },
        );
      } else {
        await userRef.doc(docId!).update({"contacts": contact});
      }
      applicationViewModel.navigationService.pop();
      showSnackbar(title: "Changes saved", message: "");
    } catch (e) {
      showSnackbar(
          title: "Uh oh. Something went wrong", message: "Please try again");
      rethrow;
    }
    setBusy(false);
  }

  //pick image
  Future<void> pickImage() async {
    final pick = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pick != null) {
      img = File(pick.path);
    } else {
      showSnackbar(title: "No file selected", message: '');
    }
    notifyListeners();
  }
}
