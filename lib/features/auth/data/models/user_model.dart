import 'package:doctorpoint/features/auth/domain/entities/user.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String role;
  final String? avatarUrl;
  final String? phone;
  final String? speciality;
  final String? licenseNumber;

  const UserModel({required this.id, required this.name, required this.email, required this.role, this.avatarUrl, this.phone, this.speciality, this.licenseNumber});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        role: json['role'],
        avatarUrl: json['avatarUrl'],
        phone: json['phone'],
        speciality: json['speciality'],
        licenseNumber: json['licenseNumber'],
      );

  User toEntity() => User(id: id, name: name, email: email, role: role, avatarUrl: avatarUrl, phone: phone, speciality: speciality, licenseNumber: licenseNumber);
}
