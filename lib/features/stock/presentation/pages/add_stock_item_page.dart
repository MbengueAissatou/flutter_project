import 'package:doctorpoint/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AddStockItemPage extends StatelessWidget {
  const AddStockItemPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Ajouter article')), body: ListView(padding: const EdgeInsets.all(16), children: [const DPTextField(label: 'Nom'), const SizedBox(height: 8), DropdownButtonFormField(items: const [DropdownMenuItem(value: 'med', child: Text('Médicament')), DropdownMenuItem(value: 'eq', child: Text('Équipement')), DropdownMenuItem(value: 'cons', child: Text('Consommable'))], onChanged: (_) {}, decoration: const InputDecoration(labelText: 'Type')), const SizedBox(height: 8), const DPTextField(label: 'Quantité'), const SizedBox(height: 8), const DPTextField(label: 'Quantité minimale'), const SizedBox(height: 8), const DPTextField(label: 'Unité'), const SizedBox(height: 8), const DPTextField(label: 'Fabricant'), const SizedBox(height: 8), const DPTextField(label: 'Date de péremption'), const SizedBox(height: 8), const DPTextField(label: 'Prix'), const SizedBox(height: 12), DPButton(label: 'Ajouter', onPressed: () => Navigator.pop(context))]));
}
