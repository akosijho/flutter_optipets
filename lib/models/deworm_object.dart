import 'package:equatable/equatable.dart';

class DewormObject extends Equatable {
  const DewormObject(
      {this.id,
      this.date,
      this.brand,
      this.genericName,
      this.doctor,
      this.license});

  final String? id;
  final String? date;
  final String? brand;
  final String? genericName;
  final String? doctor;
  final String? license;

  @override
  List<Object?> get props => [id, date, brand, genericName, doctor, license];
}
