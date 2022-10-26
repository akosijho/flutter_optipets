import 'package:equatable/equatable.dart';

class UserObject extends Equatable {
  const UserObject({
    required this.uid,
    this.role,
    this.firstName,
    this.middleName,
    this.lastName,
    this.address,
    this.contacts,
  });

  final String? uid;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? address;
  final String? contacts;
  final String? role;

  factory UserObject.fromJson(Map<String, dynamic> json) {
    return UserObject(
      uid: json['uid'] as String,
      firstName: json['firstName'] as String,
      middleName: json["middleName"] as String,
      lastName: json["lastName"] as String,
      address: json['address'] as String,
      contacts: json['contacts'] as String,
    );
  }

  Map<String, dynamic> toFirestore() => {
        if (uid != null) "uid": uid,
        if (firstName != null) "firstName": firstName,
        if (middleName != null) "middleName": middleName,
        if (lastName != null) "lastName": lastName,
        if (address != null) "address": address,
        if (contacts != null) "contacts": contacts,
        if (role != null) "role": role
      };

  @override
  List<Object?> get props => [uid, firstName, middleName, lastName, address, contacts, role];
}
