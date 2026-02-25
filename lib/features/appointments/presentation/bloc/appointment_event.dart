part of 'appointment_bloc.dart';

abstract class AppointmentEvent extends Equatable {
  const AppointmentEvent();
  @override
  List<Object?> get props => [];
}

class LoadAppointments extends AppointmentEvent {}

class FilterAppointments extends AppointmentEvent {
  final AppointmentStatus? status;
  const FilterAppointments(this.status);
}

class CancelAppointment extends AppointmentEvent {
  final String id;
  const CancelAppointment(this.id);
}
