import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirestoreService {
  
// initialize firestore instance
  final CollectionReference userRef = FirebaseFirestore.instance.collection('users');
  // petReference
  final CollectionReference petRef = FirebaseFirestore.instance.collection('pets');
}