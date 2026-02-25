part of 'doctor_bloc.dart';

abstract class DoctorState extends Equatable { const DoctorState(); @override List<Object?> get props => []; }
class DoctorInitial extends DoctorState {}
class DoctorLoading extends DoctorState {}
class DoctorError extends DoctorState { final String message; const DoctorError(this.message); }
class DoctorLoaded extends DoctorState { final List<Doctor> doctors; const DoctorLoaded(this.doctors); @override List<Object?> get props => [doctors]; }
