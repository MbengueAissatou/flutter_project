import 'package:doctorpoint/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AppointmentDetailPage extends StatelessWidget {
  final String id;
  const AppointmentDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text('RDV #$id')), body: Padding(padding: const EdgeInsets.all(16), child: Column(children: [const ListTile(title: Text('Patient'), subtitle: Text('Aminata Sow')), const ListTile(title: Text('Médecin'), subtitle: Text('Dr. Fatou Ndiaye')), const ListTile(title: Text('Spécialité'), subtitle: Text('Cardiologie')), const Spacer(), DPButton(label: 'Modifier', variant: DPButtonVariant.secondary, onPressed: () {}), const SizedBox(height: 8), DPButton(label: 'Annuler', variant: DPButtonVariant.danger, onPressed: () {})])));
}
