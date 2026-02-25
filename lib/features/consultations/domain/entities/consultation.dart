import 'package:equatable/equatable.dart';

class Consultation extends Equatable {
  final String id;
  final String patientName;
  final String doctorName;
  final String diagnosis;
  final DateTime date;
  final List<String> medications;

  const Consultation({required this.id, required this.patientName, required this.doctorName, required this.diagnosis, required this.date, required this.medications});

  @override
  List<Object?> get props => [id, patientName, doctorName, diagnosis, date, medications];
}
