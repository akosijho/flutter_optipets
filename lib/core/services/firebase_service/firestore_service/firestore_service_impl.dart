import 'package:flutter_optipets/core/services/firebase_service/firestore_service/firestore_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

@LazySingleton(asType: FirestoreService)
class FirestoreServiceImpl implements FirestoreService{

  
  // initialize firestore instance
  final _db = FirebaseFirestore.instance;

  // initialize firestore instance
  @override
  late CollectionReference<Object?> petRef = _db.collection('pets');

  // initialize firestore instance
  @override
  late CollectionReference<Object?> userRef  = _db.collection('users');



}