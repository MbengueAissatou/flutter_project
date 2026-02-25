import 'package:doctorpoint/shared/mock_data.dart';
import 'package:flutter/material.dart';

class ConsultationDetailPage extends StatelessWidget {
  final String id;
  const ConsultationDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final c = mockConsultations.firstWhere((e) => e.id == id);
    return Scaffold(appBar: AppBar(title: Text('Consultation #$id')), body: ListView(padding: const EdgeInsets.all(16), children: [Card(child: ListTile(leading: const Icon(Icons.person), title: const Text('Patient'), subtitle: Text(c.patientName))), Card(child: ListTile(leading: const Icon(Icons.medical_services), title: const Text('Médecin'), subtitle: Text(c.doctorName))), Card(child: ListTile(leading: const Icon(Icons.description), title: const Text('Diagnostic'), subtitle: Text(c.diagnosis))), Card(child: ListTile(leading: const Icon(Icons.medication), title: const Text('Ordonnance'), subtitle: Text(c.medications.join(', '))))]));
  }
}
