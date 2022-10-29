import 'package:flutter_optipets/core/services/firebase_service/firestore_service/firestore_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

@LazySingleton(asType: FirestoreService)
class FirestoreServiceImpl implements FirestoreService{

  // initialize firestore instance
  @override
  CollectionReference<Object?> get petRef => FirebaseFirestore.instance.collection('users');


  // petReference
  @override
  CollectionReference<Object?> get userRef => FirebaseFirestore.instance.collection('pets');

}