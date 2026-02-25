import 'package:doctorpoint/core/widgets/widgets.dart';
import 'package:doctorpoint/features/appointments/domain/entities/appointment.dart';
import 'package:doctorpoint/features/appointments/presentation/bloc/appointment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class AppointmentsPage extends StatelessWidget {
  const AppointmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rendez-vous')),
      floatingActionButton: FloatingActionButton.extended(onPressed: () => context.push('/appointments/create'), label: const Text('Nouveau RDV'), icon: const Icon(Icons.add)),
      body: BlocBuilder<AppointmentBloc, AppointmentState>(
        builder: (context, state) {
          if (state is AppointmentInitial) context.read<AppointmentBloc>().add(LoadAppointments());
          if (state is AppointmentLoading || state is AppointmentInitial) return const DPLoading();
          if (state is AppointmentLoaded) {
            return Column(children: [
              SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(children: [
                _chip(context, 'Tous', null, state.activeFilter),
                _chip(context, 'Confirmés', AppointmentStatus.confirmed, state.activeFilter),
                _chip(context, 'En attente', AppointmentStatus.pending, state.activeFilter),
                _chip(context, 'Terminés', AppointmentStatus.completed, state.activeFilter),
                _chip(context, 'Annulés', AppointmentStatus.cancelled, state.activeFilter),
              ])),
              Expanded(child: ListView.builder(itemCount: state.filtered.length, itemBuilder: (_, i) {
                final a = state.filtered[i];
                return Card(child: ListTile(onTap: ()=> context.push('/appointments/${a.id}'), leading: DPAvatar(initials: a.patientName.substring(0, 2).toUpperCase()), title: Text(a.patientName), subtitle: Text('${a.doctorName} • ${a.speciality}\n${DateFormat('dd/MM HH:mm').format(a.dateTime)}'), trailing: DPBadge(label: a.status.name, variant: switch (a.status) {AppointmentStatus.confirmed => DPBadgeVariant.success, AppointmentStatus.pending => DPBadgeVariant.warning, AppointmentStatus.cancelled => DPBadgeVariant.error, AppointmentStatus.completed => DPBadgeVariant.info}))); }))
            ]);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _chip(BuildContext context, String label, AppointmentStatus? status, AppointmentStatus? active) => Padding(
    padding: const EdgeInsets.only(left: 8),
    child: FilterChip(label: Text(label), selected: active == status, onSelected: (_) => context.read<AppointmentBloc>().add(FilterAppointments(status))),
  );
}
