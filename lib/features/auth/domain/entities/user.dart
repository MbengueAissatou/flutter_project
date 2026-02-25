import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String role;
  final String? avatarUrl;
  final String? phone;
  final String? speciality;
  final String? licenseNumber;

  const User({required this.id, required this.name, required this.email, required this.role, this.avatarUrl, this.phone, this.speciality, this.licenseNumber});

  @override
  List<Object?> get props => [id, name, email, role, avatarUrl, phone, speciality, licenseNumber];
}
