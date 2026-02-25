part of 'doctor_bloc.dart';

abstract class DoctorEvent extends Equatable { const DoctorEvent(); @override List<Object?> get props => []; }
class LoadDoctors extends DoctorEvent {
  final String? speciality;
  final String? search;
  const LoadDoctors({this.speciality, this.search});
}
