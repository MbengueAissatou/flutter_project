import 'package:doctorpoint/features/doctors/domain/entities/doctor.dart';
import 'package:doctorpoint/shared/mock_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'doctor_event.dart';
part 'doctor_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  DoctorBloc() : super(DoctorInitial()) {
    on<LoadDoctors>((event, emit) {
      emit(DoctorLoading());
      var data = mockDoctors;
      if (event.speciality != null && event.speciality != 'Tous') {
        data = data.where((d) => d.speciality == event.speciality).toList();
      }
      if (event.search != null && event.search!.isNotEmpty) {
        data = data.where((d) => d.name.toLowerCase().contains(event.search!.toLowerCase())).toList();
      }
      emit(DoctorLoaded(data));
    });
  }
}
