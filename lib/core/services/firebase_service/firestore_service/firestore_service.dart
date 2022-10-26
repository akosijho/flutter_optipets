import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirestoreService {
  
// initialize firestore instance
  late CollectionReference userRef;
  // petReference
  late CollectionReference petRef;
}