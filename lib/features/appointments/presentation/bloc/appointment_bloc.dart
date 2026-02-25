import 'package:doctorpoint/features/appointments/domain/entities/appointment.dart';
import 'package:doctorpoint/shared/mock_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'appointment_event.dart';
part 'appointment_state.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  AppointmentBloc() : super(AppointmentInitial()) {
    on<LoadAppointments>((event, emit) {
      emit(AppointmentLoading());
      emit(AppointmentLoaded(appointments: mockAppointments, filtered: mockAppointments, activeFilter: null));
    });
    on<FilterAppointments>((event, emit) {
      final current = state;
      if (current is AppointmentLoaded) {
        final filtered = event.status == null ? current.appointments : current.appointments.where((a) => a.status == event.status).toList();
        emit(current.copyWith(filtered: filtered, activeFilter: event.status));
      }
    });
    on<CancelAppointment>((event, emit) {
      emit(AppointmentCancelled());
      add(LoadAppointments());
    });
  }
}
