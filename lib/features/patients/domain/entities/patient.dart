import 'package:equatable/equatable.dart';

class Patient extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final DateTime birthDate;
  final String gender;
  final String phone;
  final String email;
  final String address;
  final String bloodType;
  final List<String> allergies;
  final List<String> chronicDiseases;
  final String insuranceId;
  final String? avatarUrl;
  final bool isActive;

  const Patient({required this.id, required this.firstName, required this.lastName, required this.birthDate, required this.gender, required this.phone, required this.email, required this.address, required this.bloodType, required this.allergies, required this.chronicDiseases, required this.insuranceId, this.avatarUrl, required this.isActive});

  String get fullName => '$firstName $lastName';
  String get initials => '${firstName[0]}${lastName[0]}';
  int get age => DateTime.now().year - birthDate.year;

  @override
  List<Object?> get props => [id, firstName, lastName, birthDate, gender, phone, email, address, bloodType, allergies, chronicDiseases, insuranceId, avatarUrl, isActive];
}
