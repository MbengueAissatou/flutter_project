part of 'patient_bloc.dart';

abstract class PatientEvent extends Equatable {
  const PatientEvent();
  @override
  List<Object?> get props => [];
}

class LoadPatients extends PatientEvent {
  final String? search;
  const LoadPatients({this.search});
}

class DeletePatient extends PatientEvent {
  final String id;
  const DeletePatient(this.id);
}
