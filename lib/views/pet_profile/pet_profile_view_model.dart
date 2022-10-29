import 'package:flutter_optipets/models/pet_object.dart';
import 'package:flutter_optipets/utils/constants.dart';
import 'package:stacked/stacked.dart';

class PetProfileViewModel extends BaseViewModel {
  PetProfileViewModel({required this.pet});

  final PetObject pet;

  void init() async {
    // thisPet.doc(petId).listen()
  }

  Stream<PetObject> petObject() => petRef
      .doc(pet.id)
      .snapshots()
      .map((event) => PetObject.fromJson(event.data()!));
}
