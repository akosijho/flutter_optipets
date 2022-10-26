import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_optipets/app/app.locator.dart';
import 'package:flutter_optipets/utils/my_colors.dart';
import 'package:flutter_optipets/views/application/application_view_model.dart';
import 'package:flutter_optipets/views/widgets/my_circular_progress.dart';
import 'package:getwidget/getwidget.dart';
import 'package:stacked/stacked.dart';

class PhotoUploader extends StatelessWidget {
  PhotoUploader({super.key, required this.imagePath});

  final String imagePath;
  final ApplicationViewModel applicationViewModel =
      locator<ApplicationViewModel>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PhotoUploaderViewModel>.reactive(
        viewModelBuilder: () => PhotoUploaderViewModel(path: imagePath),
        onModelReady: (model) => model.init(),
        builder: (context, model, child) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(16),
            title: const Text('Save Image'),
            content: model.isBusy
                ? myCircularProgress()
                : Image.file(
                    model.img!,
                    // fit: BoxFit.fill,
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
                  textStyle:const TextStyle(fontSize: 20,
                  color: MyColors.blueButtonColor),),
              ),
              SizedBox(
                width: 120,
                height: 54,
                child:  GFButton(
                  onPressed: () {
                     applicationViewModel.navigationService.pop();
                  },
                  shape: GFButtonShape.pills,
                  type: GFButtonType.solid,
                  text: 'Save',
                  textStyle:const TextStyle(fontSize: 20,
                  color: GFColors.WHITE),),
              )
            ],
          );
        });
  }
}

class PhotoUploaderViewModel extends BaseViewModel {
  PhotoUploaderViewModel({required this.path});
  File? img;
  final String path;
  void init() {
    setBusy(true);
    img = File(path);
    setBusy(false);
  }
}
