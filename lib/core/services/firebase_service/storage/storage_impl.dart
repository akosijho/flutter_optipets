import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_optipets/core/services/firebase_service/storage/storage.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton(asType: Storage)
class StorageImpl implements Storage{

  //create firebase storage instance
  final _storage = FirebaseStorage.instance;

  @override
  late Reference ref = _storage.ref().child('images');
}