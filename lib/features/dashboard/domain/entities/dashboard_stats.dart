import 'package:equatable/equatable.dart';

class MonthlyData extends Equatable {
  final String month;
  final int value;
  const MonthlyData(this.month, this.value);
  @override
  List<Object?> get props => [month, value];
}

class DashboardStats extends Equatable {
  final int totalPatients;
  final int totalDoctors;
  final int todayAppointments;
  final int totalConsultations;
  final int pendingAppointments;
  final int lowStockItems;
  final List<MonthlyData> monthlyAppointments;

  const DashboardStats({required this.totalPatients, required this.totalDoctors, required this.todayAppointments, required this.totalConsultations, required this.pendingAppointments, required this.lowStockItems, required this.monthlyAppointments});

  @override
  List<Object?> get props => [totalPatients, totalDoctors, todayAppointments, totalConsultations, pendingAppointments, lowStockItems, monthlyAppointments];
}
