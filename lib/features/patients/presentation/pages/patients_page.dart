import 'package:doctorpoint/core/widgets/widgets.dart';
import 'package:doctorpoint/features/patients/presentation/bloc/patient_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PatientsPage extends StatelessWidget {
  const PatientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Patients')),
      floatingActionButton: FloatingActionButton.extended(onPressed: () => context.push('/patients/create'), label: const Text('Nouveau Patient')),
      body: Column(children: [
        Padding(padding: const EdgeInsets.all(12), child: TextField(onChanged: (v) => context.read<PatientBloc>().add(LoadPatients(search: v)), decoration: const InputDecoration(prefixIcon: Icon(Icons.search), hintText: 'Rechercher'))),
        Expanded(child: BlocBuilder<PatientBloc, PatientState>(builder: (_, state) {
          if (state is PatientInitial) context.read<PatientBloc>().add(const LoadPatients());
          if (state is PatientLoading || state is PatientInitial) return const DPLoading();
          if (state is PatientLoaded) {
            return ListView.builder(itemCount: state.patients.length, itemBuilder: (_, i) {
              final p = state.patients[i];
              return ListTile(onTap: ()=> context.push('/patients/${p.id}'), leading: DPAvatar(initials: p.initials), title: Text(p.fullName), subtitle: Text('${p.age} ans • ${p.gender} • ${p.bloodType}'), trailing: Column(mainAxisAlignment: MainAxisAlignment.center, children: [if (p.chronicDiseases.isNotEmpty) const DPBadge(label: 'Chronique', variant: DPBadgeVariant.warning), DPBadge(label: p.isActive ? 'Actif' : 'Inactif', variant: p.isActive ? DPBadgeVariant.success : DPBadgeVariant.neutral)]));
            });
          }
          return const SizedBox.shrink();
        }))
      ]),
    );
  }
}
