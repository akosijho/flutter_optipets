import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_optipets/app/app.locator.dart';
import 'package:flutter_optipets/utils/constants.dart';
import 'package:flutter_optipets/utils/my_colors.dart';
import 'package:flutter_optipets/views/application/application_view_model.dart';
import 'package:getwidget/getwidget.dart';
import 'package:stacked/stacked.dart';

class PhotoUploader extends StatelessWidget {
  PhotoUploader({super.key, required this.imagePath, required this.docId});

  final String imagePath;
  final String docId;
  final ApplicationViewModel applicationViewModel =
      locator<ApplicationViewModel>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PhotoUploaderViewModel>.reactive(
        viewModelBuilder: () =>
            PhotoUploaderViewModel(path: imagePath, docId: docId),
        disposeViewModel: false,
        onModelReady: (model) => model.init(),
        builder: (context, model, child) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(16),
            title: const Text('Save Image'),
            content: model.isBusy
                ? const Center(
                    heightFactor: 80,
                    widthFactor: 80,
                    child: CircularProgressIndicator(
                        color: MyColors.blueButtonColor),
                  )
                : Image.file(
                    model.img!,
                    fit: BoxFit.contain,
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
                    await model.uploadImage();
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
  PhotoUploaderViewModel({required this.path, required this.docId});
  File? img;
  final String path;
  String? docId;
  void init() {
    setBusy(true);
    img = File(path);
    setBusy(false);
  }

  Future<void> uploadImage() async {
    setBusy(true);
    final ref = storageRef.child('$docId').child('display');
    await ref.putFile(img!);
    await userRef
        .doc(docId!)
        .update({"displayImage": await ref.getDownloadURL()});
    setBusy(false);
  }
}
