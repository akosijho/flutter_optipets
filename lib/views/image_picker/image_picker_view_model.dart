import 'dart:io';
import 'package:flutter_optipets/views/widgets/show_snackbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

class ImagePickerViewMdodel extends BaseViewModel{
  
  // some initialization code
  File? imageFile;
  final ImagePicker imagePicker = ImagePicker();

  //image picker
  Future picker() async {
    //picks the file
    final pick = await imagePicker.pickImage(source: ImageSource.gallery);

    if(pick != null){
      imageFile = File(pick.path);
    }else{
      showSnackbar(title: "", message: 'No file selected');
    }
    notifyListeners();
  }
  
}