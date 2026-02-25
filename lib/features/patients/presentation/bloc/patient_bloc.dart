import 'package:doctorpoint/features/patients/domain/entities/patient.dart';
import 'package:doctorpoint/shared/mock_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'patient_event.dart';
part 'patient_state.dart';

class PatientBloc extends Bloc<PatientEvent, PatientState> {
  PatientBloc() : super(PatientInitial()) {
    on<LoadPatients>((event, emit) {
      emit(PatientLoading());
      final q = event.search?.toLowerCase() ?? '';
      emit(PatientLoaded(mockPatients.where((p) => p.fullName.toLowerCase().contains(q)).toList()));
    });
    on<DeletePatient>((event, emit) => add(const LoadPatients()));
  }
}
