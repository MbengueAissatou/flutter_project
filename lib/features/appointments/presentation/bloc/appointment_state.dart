part of 'appointment_bloc.dart';

abstract class AppointmentState extends Equatable {
  const AppointmentState();

  @override
  List<Object?> get props => [];
}

class AppointmentInitial extends AppointmentState {}
class AppointmentLoading extends AppointmentState {}
class AppointmentCancelled extends AppointmentState {}
class AppointmentError extends AppointmentState { final String message; const AppointmentError(this.message); }

class AppointmentLoaded extends AppointmentState {
  final List<Appointment> appointments;
  final List<Appointment> filtered;
  final AppointmentStatus? activeFilter;
  const AppointmentLoaded({required this.appointments, required this.filtered, required this.activeFilter});

  AppointmentLoaded copyWith({List<Appointment>? filtered, AppointmentStatus? activeFilter}) => AppointmentLoaded(
      appointments: appointments, filtered: filtered ?? this.filtered, activeFilter: activeFilter);

  @override
  List<Object?> get props => [appointments, filtered, activeFilter];
}
