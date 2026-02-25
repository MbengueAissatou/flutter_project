import 'package:equatable/equatable.dart';

class Doctor extends Equatable {
  final String id;
  final String name;
  final String speciality;
  final String email;
  final String licenseNumber;
  final String phone;
  final String? avatarUrl;
  final double rating;
  final int yearsExperience;
  final int patientCount;
  final bool isAvailable;
  final List<String> availableDays;

  const Doctor({required this.id, required this.name, required this.speciality, required this.email, required this.licenseNumber, required this.phone, this.avatarUrl, required this.rating, required this.yearsExperience, required this.patientCount, required this.isAvailable, required this.availableDays});

  String get initials {
    final clean = name.replaceFirst('Dr. ', '');
    final p = clean.split(' ');
    return p.length > 1 ? '${p[0][0]}${p[1][0]}' : p[0][0];
  }

  @override
  List<Object?> get props => [id, name, speciality, email, licenseNumber, phone, avatarUrl, rating, yearsExperience, patientCount, isAvailable, availableDays];
}
