import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_optipets/app/app.locator.dart';
import 'package:flutter_optipets/models/pet_object.dart';
import 'package:flutter_optipets/models/user_object.dart';
import 'package:flutter_optipets/views/application/application_view_model.dart';
import 'package:stacked/stacked.dart';

class PetScreenVieModel extends BaseViewModel {
  final ApplicationViewModel applicationViewModel =
      locator<ApplicationViewModel>();

  String name = "My name";

  List<PetObject> myPets =[];

  late UserObject user = applicationViewModel.userObject!;

  late Stream<QuerySnapshot> pets = FirebaseFirestore.instance
      .collection('pets')
      .where('owner', isEqualTo: user.uid)
      .snapshots();

  void init() {
    user = applicationViewModel.userObject!;
    pets = FirebaseFirestore.instance
        .collection('pets')
        .where('owner', isEqualTo: user.uid)
        .snapshots();
       
    notifyListeners();
  }
}
