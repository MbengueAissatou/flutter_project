import 'package:doctorpoint/core/widgets/widgets.dart';
import 'package:doctorpoint/features/stock/domain/entities/medical_item.dart';
import 'package:doctorpoint/features/stock/presentation/bloc/stock_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class StockPage extends StatelessWidget {
  const StockPage({super.key});

  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 3,
    child: Scaffold(
      appBar: AppBar(title: const Text('Stock médical'), bottom: const TabBar(tabs: [Tab(text: 'Médicaments'), Tab(text: 'Équipements'), Tab(text: 'Consommables')])),
      floatingActionButton: FloatingActionButton.extended(onPressed: () => context.push('/stock/add'), label: const Text('Ajouter')),
      body: BlocBuilder<StockBloc, StockState>(builder: (_, state) {
        if (state is StockInitial) context.read<StockBloc>().add(const LoadStock());
        if (state is StockLoading || state is StockInitial) return const DPLoading();
        final data = (state as StockLoaded).items;
        final low = data.where((e) => e.status == StockStatus.low).length;
        final expired = data.where((e) => e.status == StockStatus.expired).length;
        return Column(children: [
          if (low > 0) ListTile(tileColor: Colors.orange.withOpacity(.1), title: Text('$low articles en stock faible')),
          if (expired > 0) ListTile(tileColor: Colors.red.withOpacity(.1), title: Text('$expired articles périmés')),
          Expanded(child: TabBarView(children: [
            _list(context, data.where((e) => e.type == MedicalItemType.medication).toList()),
            _list(context, data.where((e) => e.type == MedicalItemType.equipment).toList()),
            _list(context, data.where((e) => e.type == MedicalItemType.consumable).toList()),
          ]))
        ]);
      }),
    ),
  );

  Widget _list(BuildContext context, List<MedicalItem> items) => ListView.builder(itemCount: items.length, itemBuilder: (_, i) {
    final e = items[i];
    final color = switch (e.status) { StockStatus.ok => Colors.green, StockStatus.low => Colors.orange, StockStatus.expired || StockStatus.outOfStock => Colors.red };
    return Card(child: ListTile(leading: Icon(Icons.inventory, color: color), title: Text(e.name), subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(e.manufacturer ?? '-'), Text('Stock actuel: ${e.quantity} ${e.unit}'), LinearProgressIndicator(value: e.minQuantity == 0 ? 1 : (e.quantity / (e.minQuantity * 2)).clamp(0, 1), color: color)]), trailing: DPBadge(label: e.status.name, variant: e.status == StockStatus.ok ? DPBadgeVariant.success : DPBadgeVariant.warning)));
  });
}
