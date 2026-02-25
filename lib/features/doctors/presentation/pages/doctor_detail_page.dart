import 'package:doctorpoint/shared/mock_data.dart';
import 'package:flutter/material.dart';

class DoctorDetailPage extends StatelessWidget {
  final String id;
  const DoctorDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final d = mockDoctors.firstWhere((e) => e.id == id);
    return Scaffold(appBar: AppBar(title: Text(d.name)), body: ListView(children: [ListTile(title: const Text('Spécialité'), subtitle: Text(d.speciality)), ListTile(title: const Text('Email'), subtitle: Text(d.email)), ListTile(title: const Text('Téléphone'), subtitle: Text(d.phone)), ListTile(title: const Text('Jours disponibles'), subtitle: Text(d.availableDays.join(', ')))]));
  }
}
