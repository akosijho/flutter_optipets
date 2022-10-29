import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_optipets/app/app.locator.dart';
import 'package:flutter_optipets/app/app.router.dart';
import 'package:flutter_optipets/models/user_object.dart';
import 'package:flutter_optipets/views/application/application_view_model.dart';
import 'package:flutter_optipets/views/widgets/photo_uploader.dart';
import 'package:flutter_optipets/views/widgets/show_snackbar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CustomerProfileViewModel extends ChangeNotifier{

  final ApplicationViewModel applicationViewModel = locator<ApplicationViewModel>();
  
  UserObject? user ;

  void signOut() async{
    await applicationViewModel.auth.signOut();
    await applicationViewModel.navigationService.pushReplacementNamed(Routes.login);
    notifyListeners();
  }

  void init(){
    user = applicationViewModel.userObject!;
    notifyListeners();
  }

   // some initialization code
  File? imageFile;
  final ImagePicker imagePicker = ImagePicker();
  bool picked = false;

  //image picker
  Future<void> picker() async {
    //picks the file
    final pick = await imagePicker.pickImage(source: ImageSource.gallery);

    if(pick != null){
      imageFile = File(pick.path);
      picked = true;
      applicationViewModel.navigationService.pop();
      await Get.dialog( PhotoUploader(imagePath: imageFile!.path,),
      barrierDismissible: false);
    }else{
      showSnackbar(title: "No file selected", message: '');
    }
    notifyListeners();
  }
}