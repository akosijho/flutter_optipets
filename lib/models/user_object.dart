import 'package:equatable/equatable.dart';

class UserObject extends Equatable{
  UserObject({required this.uid});

  final String uid;

  factory UserObject.fromJson(Map<String, dynamic> json) {
    return UserObject(uid: json['uid'] as String);
  }
  
  @override
  List<Object?> get props => [uid,];
}