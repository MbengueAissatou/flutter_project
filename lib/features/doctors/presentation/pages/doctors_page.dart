import 'package:doctorpoint/core/constants/app_colors.dart';
import 'package:doctorpoint/core/widgets/widgets.dart';
import 'package:doctorpoint/features/doctors/domain/entities/doctor.dart';
import 'package:doctorpoint/features/doctors/presentation/bloc/doctor_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DoctorsPage extends StatelessWidget {
  const DoctorsPage({super.key});

  static const specialities = ['Tous', 'Cardiologie', 'Neurologie', 'Pédiatrie', 'Gynécologie', 'Orthopédie', 'Dermatologie', 'Psychiatrie', 'Ophtalmologie'];

  Color _colorBySpeciality(String s) => switch (s) { 'Cardiologie' => const Color(0xFFE53935), 'Neurologie' => const Color(0xFF8E24AA), 'Pédiatrie' => const Color(0xFF039BE5), 'Gynécologie' => const Color(0xFFE91E8C), 'Orthopédie' => const Color(0xFF00897B), 'Dermatologie' => const Color(0xFFFF8F00), _ => AppColors.primary };

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Médecins')), body: Column(children: [
      Padding(padding: const EdgeInsets.all(10), child: TextField(onChanged: (v) => context.read<DoctorBloc>().add(LoadDoctors(search: v)), decoration: const InputDecoration(prefixIcon: Icon(Icons.search), hintText: 'Rechercher médecin'))),
      SizedBox(height: 40, child: ListView(scrollDirection: Axis.horizontal, children: specialities.map((s) => Padding(padding: const EdgeInsets.symmetric(horizontal: 4), child: FilterChip(label: Text(s), selected: false, onSelected: (_) => context.read<DoctorBloc>().add(LoadDoctors(speciality: s))))).toList())),
      Expanded(child: BlocBuilder<DoctorBloc, DoctorState>(builder: (_, state) {
        if (state is DoctorInitial) context.read<DoctorBloc>().add(const LoadDoctors());
        if (state is DoctorLoading || state is DoctorInitial) return const DPLoading();
        if (state is DoctorLoaded) {
          return ListView.builder(itemCount: state.doctors.length, itemBuilder: (_, i) {
            final d = state.doctors[i];
            return Card(child: Padding(padding: const EdgeInsets.all(12), child: Column(children: [
              ListTile(onTap: ()=> context.push('/doctors/${d.id}'), leading: DPAvatar(initials: d.initials, backgroundColor: _colorBySpeciality(d.speciality).withOpacity(.2)), title: Text(d.name), subtitle: Text('${d.speciality}\nLicence: ${d.licenseNumber}'), trailing: DPBadge(label: d.isAvailable ? 'Disponible' : 'Occupé', variant: d.isAvailable ? DPBadgeVariant.success : DPBadgeVariant.warning)),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [Text('⭐ ${d.rating}'), Text('👥 ${d.patientCount}'), Text('🏆 ${d.yearsExperience} ans')]),
              const SizedBox(height: 8),
              DPButton(label: 'Prendre rendez-vous', onPressed: d.isAvailable ? () {} : null, variant: DPButtonVariant.secondary),
            ]));
          });
        }
        return const SizedBox.shrink();
      }))
    ]));
  }
}
