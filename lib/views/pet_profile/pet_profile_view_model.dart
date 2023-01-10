import 'dart:io';
import 'package:flutter_optipets/app/app.locator.dart';
import 'package:flutter_optipets/models/pet_object.dart';
import 'package:flutter_optipets/utils/constants.dart';
import 'package:flutter_optipets/views/application/application_view_model.dart';
import 'package:flutter_optipets/views/widgets/show_snackbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

class PetProfileViewModel extends BaseViewModel {
  PetProfileViewModel({required this.pet});

  final ApplicationViewModel applicationViewModel =
      locator<ApplicationViewModel>();
  PetObject pet;
  File? img;

  bool ongoing = false;

  void init() async {
    // thisPet.doc(petId).listen()
  }

  Stream<PetObject> petObject() => petRef
      .doc(pet.id)
      .snapshots()
      .map((event) => PetObject.fromJson(event.data()!));

  Future<void> pickImage() async {
    final pick = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pick != null) {
      img = File(pick.path);
      // uploads the imge after selecteing
      ongoing = true;
      setBusy(true);
      final ref = storageRef.child(pet.id!).child('display');
      try {
        await ref.putFile(img!);
        await petRef
            .doc(pet.id!)
            .update({"displayImage": await ref.getDownloadURL()});
        await petRef.doc(pet.id!).get().then(
          (doc) {
            pet = PetObject.fromJson(doc.data()!);
          },
        );
        showSnackbar(title: "Changes saved", message: "");
      } catch (e) {
        showSnackbar(
            title: "Uh oh. Something went wrong", message: "Please try again");
        rethrow;
      }
      setBusy(false);
      ongoing = false;
    } else {
      showSnackbar(title: "No file selected", message: '');
    }
    notifyListeners();
  }
}
