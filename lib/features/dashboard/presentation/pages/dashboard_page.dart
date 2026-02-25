import 'package:doctorpoint/core/constants/app_colors.dart';
import 'package:doctorpoint/core/widgets/widgets.dart';
import 'package:doctorpoint/features/dashboard/domain/entities/dashboard_stats.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final stats = const DashboardStats(
    totalPatients: 1248,
    totalDoctors: 47,
    todayAppointments: 36,
    totalConsultations: 892,
    pendingAppointments: 9,
    lowStockItems: 3,
    monthlyAppointments: [MonthlyData('Jan', 30), MonthlyData('Fév', 45), MonthlyData('Mar', 52), MonthlyData('Avr', 48), MonthlyData('Mai', 60), MonthlyData('Jun', 65)],
  );

  String greeting() {
    final h = DateTime.now().hour;
    if (h < 12) return 'Bonjour';
    if (h < 18) return 'Bon après-midi';
    return 'Bonsoir';
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      const SliverAppBar(title: Text('DoctorPoint'), floating: true, actions: [Icon(Icons.notifications)]),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(gradient: const LinearGradient(colors: [AppColors.primary, AppColors.primaryLight]), borderRadius: BorderRadius.circular(16)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('${greeting()}, Awa Fall', style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)), Text(DateFormat('dd MMM yyyy').format(DateTime.now()), style: const TextStyle(color: Colors.white70))])),
            const SizedBox(height: 16),
            GridView.count(crossAxisCount: 2, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), childAspectRatio: 1.3, children: [
              DPStatCard(title: 'Patients', value: '${stats.totalPatients}', icon: Icons.people, color: AppColors.primary, trend: '+12%'),
              DPStatCard(title: 'Médecins', value: '${stats.totalDoctors}', icon: Icons.medical_services, color: AppColors.secondary, trend: '+3%'),
              DPStatCard(title: 'RDV Aujourd\'hui', value: '${stats.todayAppointments}', icon: Icons.calendar_month, color: AppColors.warning, trend: '+8%'),
              DPStatCard(title: 'Consultations', value: '${stats.totalConsultations}', icon: Icons.monitor_heart, color: AppColors.success, trend: '+21%'),
            ]),
            const SizedBox(height: 8),
            ListTile(tileColor: Colors.orange.withOpacity(.12), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), title: Text('Stock faible (${stats.lowStockItems})'), trailing: const Icon(Icons.chevron_right)),
            const SizedBox(height: 8),
            ListTile(tileColor: Colors.blue.withOpacity(.12), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), title: Text('RDV en attente (${stats.pendingAppointments})'), trailing: const Icon(Icons.chevron_right)),
            const SizedBox(height: 14),
            const DPSectionHeader(title: 'Rendez-vous mensuels'),
            SizedBox(
              height: 220,
              child: BarChart(BarChartData(
                gridData: const FlGridData(show: false),
                titlesData: FlTitlesData(bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, getTitlesWidget: (value, meta) => Text(stats.monthlyAppointments[value.toInt()].month))), leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)), rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)), topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false))),
                borderData: FlBorderData(show: false),
                barGroups: List.generate(stats.monthlyAppointments.length, (i) {
                  final isCurrent = i == stats.monthlyAppointments.length - 1;
                  return BarChartGroupData(x: i, barRods: [BarChartRodData(toY: stats.monthlyAppointments[i].value.toDouble(), color: isCurrent ? AppColors.primary : AppColors.primary.withOpacity(.35), width: 18, borderRadius: BorderRadius.circular(6))]);
                }),
              )),
            ),
          ]),
        ),
      )
    ]);
  }
}
