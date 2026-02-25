import 'package:equatable/equatable.dart';

enum AppointmentStatus { pending, confirmed, cancelled, completed }

class Appointment extends Equatable {
  final String id;
  final String patientId;
  final String patientName;
  final String doctorId;
  final String doctorName;
  final String speciality;
  final DateTime dateTime;
  final AppointmentStatus status;
  final String notes;
  final String reason;

  const Appointment({required this.id, required this.patientId, required this.patientName, required this.doctorId, required this.doctorName, required this.speciality, required this.dateTime, required this.status, required this.notes, required this.reason});

  @override
  List<Object?> get props => [id, patientId, patientName, doctorId, doctorName, speciality, dateTime, status, notes, reason];
}
