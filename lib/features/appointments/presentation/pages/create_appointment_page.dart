import 'package:doctorpoint/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CreateAppointmentPage extends StatefulWidget { const CreateAppointmentPage({super.key}); @override State<CreateAppointmentPage> createState() => _CreateAppointmentPageState(); }
class _CreateAppointmentPageState extends State<CreateAppointmentPage> {
  DateTime? date; TimeOfDay? time;
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Créer un RDV')), body: ListView(padding: const EdgeInsets.all(16), children: [
    DropdownButtonFormField(items: const [DropdownMenuItem(value: 'Aminata Sow', child: Text('Aminata Sow')), DropdownMenuItem(value: 'Cheikh Ndiaye', child: Text('Cheikh Ndiaye'))], onChanged: (_) {}, decoration: const InputDecoration(labelText: 'Patient')),
    const SizedBox(height: 8),
    DropdownButtonFormField(items: const [DropdownMenuItem(value: 'Dr. Fatou Ndiaye', child: Text('Dr. Fatou Ndiaye')), DropdownMenuItem(value: 'Dr. Moussa Diop', child: Text('Dr. Moussa Diop'))], onChanged: (_) {}, decoration: const InputDecoration(labelText: 'Médecin')),
    const SizedBox(height: 8),
    DropdownButtonFormField(items: const [DropdownMenuItem(value: 'Cardiologie', child: Text('Cardiologie')), DropdownMenuItem(value: 'Neurologie', child: Text('Neurologie'))], onChanged: (_) {}, decoration: const InputDecoration(labelText: 'Spécialité')),
    ListTile(title: Text(date == null ? 'Choisir la date' : '${date!.day}/${date!.month}/${date!.year}'), trailing: const Icon(Icons.calendar_today), onTap: () async => setState(() => date = (DateTime.now()))),
    ListTile(title: Text(time == null ? 'Choisir l\'heure' : time!.format(context)), trailing: const Icon(Icons.access_time), onTap: () async => setState(() => time = TimeOfDay.now())),
    const SizedBox(height: 8),
    const DPTextField(label: 'Motif', maxLines: 3), const SizedBox(height: 14), DPButton(label: 'Créer', onPressed: () => Navigator.pop(context)),
  ]));
}
