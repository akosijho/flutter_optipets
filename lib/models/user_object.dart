import 'package:equatable/equatable.dart';

class UserObject extends Equatable{
  const UserObject({required this.uid, this.role, this.name, this.address, this.contacts, });

  final String? uid;
  final String? name;
  final String? address;
  final String? contacts;
  final String? role;

   factory UserObject.fromJson(Map<String, dynamic> json) {
    return UserObject(
      uid: json['uid'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      contacts: json['contacts'] as String,
      role: json['role'] as String,
    );
  }

  Map<String, dynamic> toFirestore() => {
        if (name != null) "name": name,
        if (address != null) "address": address,
        if (contacts != null) "contacts": contacts,
        if (role != null) "role": role,
      };

  @override
  List<Object?> get props => [uid, name, address, contacts, role];
}