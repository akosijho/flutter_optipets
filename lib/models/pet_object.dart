import 'package:equatable/equatable.dart';

class PetObject extends Equatable {
  const PetObject(
      {this.id,
      this.name,
      this.specie,
      this.breed,
      this.color,
      this.birthday,
      this.sex,
      this.owner});

  final String? id;
  final String? name;
  final String? specie;
  final String? breed;
  final String? color;
  final String? birthday;
  final String? sex;
  final String? owner;

  factory PetObject.fromJson(Map<String, dynamic> json) => PetObject(
        id: json['id'] as String?,
        name: json['name'] as String?,
        specie: json['specie'] as String?,
        breed: json['breed'] as String?,
        color: json['color'] as String?,
        birthday: json['birthday'] as String?,
        sex: json['sex'] as String?,
        owner: json['owner'] as String?,
      );

  Map<String, dynamic> toFireStore() {
    return {
      if (name != null) "name": name,
      if (specie != null) "specie": specie,
      if (breed != null) "breed": breed,
      if (color != null) "color": color,
      if (birthday != null) "birthday": birthday,
      if (sex != null) "sex": sex,
      if (owner != null) "owner": owner,
    };
  }

  @override
  List<Object?> get props =>
      [id, name, specie, breed, color, birthday, sex, owner];
}
