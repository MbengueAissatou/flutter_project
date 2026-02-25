part of 'patient_bloc.dart';

abstract class PatientState extends Equatable {
  const PatientState();

  @override
  List<Object?> get props => [];
}

class PatientInitial extends PatientState {}
class PatientLoading extends PatientState {}
class PatientError extends PatientState { final String message; const PatientError(this.message); }
class PatientLoaded extends PatientState { final List<Patient> patients; const PatientLoaded(this.patients); @override List<Object?> get props => [patients]; }
