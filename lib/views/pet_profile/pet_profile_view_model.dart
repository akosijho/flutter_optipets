import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_optipets/models/pet_object.dart';
import 'package:stacked/stacked.dart';

class PetProfileViewModel extends BaseViewModel{
  PetProfileViewModel({required this.petId});

  final String petId;
  final CollectionReference thisPet = FirebaseFirestore.instance.collection('pets');

  void init() async {
    // thisPet.doc(petId).listen()
  }

  PetObject petObject(DocumentSnapshot documentSnapshot){
    return PetObject.fromJson(documentSnapshot.data() as Map<String, dynamic>);
  }

  Stream<PetObject> get pet{
    return thisPet.doc(petId).snapshots().map(petObject);
  }
} 