import 'package:doctorpoint/core/widgets/widgets.dart';
import 'package:doctorpoint/shared/mock_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ConsultationsPage extends StatelessWidget {
  const ConsultationsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Consultations')), body: ListView.builder(itemCount: mockConsultations.length, itemBuilder: (_, i) { final c = mockConsultations[i]; return Card(child: ListTile(onTap: ()=> context.push('/consultations/${c.id}'), leading: DPAvatar(initials: c.patientName.substring(0, 2)), title: Text(c.patientName), subtitle: Text('${c.doctorName} • ${DateFormat('dd/MM/yyyy').format(c.date)}\n${c.diagnosis}'), trailing: Wrap(spacing: 4, children: c.medications.map((e) => Chip(label: Text(e))).toList()))); }));
}
