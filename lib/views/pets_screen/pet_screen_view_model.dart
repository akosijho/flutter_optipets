import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_optipets/app/app.locator.dart';
import 'package:flutter_optipets/core/services/firebase_service/firestore_service/firestore_service.dart';
import 'package:flutter_optipets/models/pet_object.dart';
import 'package:flutter_optipets/models/user_object.dart';
import 'package:flutter_optipets/views/application/application_view_model.dart';
import 'package:stacked/stacked.dart';

class PetScreenVieModel extends BaseViewModel {
  final ApplicationViewModel applicationViewModel =
      locator<ApplicationViewModel>();
  final FirestoreService firestoreService = locator<FirestoreService>();
  String name = "";
  String breed ='';
  bool prevCount = true;

  List<PetObject> thisPets =[];
  List<String> petId = [];

  UserObject? user;

  Stream<QuerySnapshot>? pets;


  void init() {
    user = applicationViewModel.userObject!;
    pets = firestoreService.petRef
      .where('owner', isEqualTo: user!.uid)
      .snapshots();
      notifyListeners();
  }

  Future<void> save()async {
      await firestoreService.petRef.add({'name': name, 'breed': breed, 'owner':user!.uid});
  }

  Stream<List<PetObject>> petStream() => firestoreService.petRef.where('owner', isEqualTo: user!.uid)
      .snapshots().map((event) => event.docs.map((e) => PetObject.fromJson(e.data() as Map<String, dynamic>)).toList());
  
}
