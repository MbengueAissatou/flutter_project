import 'package:doctorpoint/core/widgets/dp_badge.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final notifications = [
    {'title': 'Rappel RDV', 'message': 'RDV dans 1h avec Dr. Ndiaye', 'type': 'blue', 'new': true},
    {'title': 'Stock critique', 'message': 'Insuline presque en rupture', 'type': 'orange', 'new': true},
    {'title': 'Nouveau patient', 'message': 'Khady Diouf ajoutée', 'type': 'teal', 'new': false},
    {'title': 'RDV annulé', 'message': 'Mamadou Diallo a annulé', 'type': 'red', 'new': false},
    {'title': 'Consultation terminée', 'message': 'Consultation #C1 finalisée', 'type': 'green', 'new': false},
  ];

  @override
  Widget build(BuildContext context) {
    final unread = notifications.where((e) => e['new'] == true).length;
    return Scaffold(appBar: AppBar(title: Text('Notifications ($unread)'), actions: [TextButton(onPressed: () => setState(() {for (final n in notifications) {n['new'] = false;}}), child: const Text('Tout lire'))]), body: ListView.builder(itemCount: notifications.length, itemBuilder: (_, i) { final n = notifications[i]; final isNew = n['new'] == true; return ListTile(tileColor: isNew ? Colors.blue.withOpacity(.06) : null, leading: Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(12)), child: const Icon(Icons.notifications)), title: Row(children: [Expanded(child: Text(n['title']! as String)), if (isNew) const DPBadge(label: 'Nouveau', variant: DPBadgeVariant.info)]), subtitle: Text(n['message']! as String, maxLines: 2), trailing: isNew ? const Icon(Icons.circle, color: Colors.blue, size: 10) : null); }));
  }
}
