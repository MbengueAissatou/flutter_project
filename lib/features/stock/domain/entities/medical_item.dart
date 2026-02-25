import 'package:equatable/equatable.dart';

enum MedicalItemType { medication, equipment, consumable }
enum StockStatus { ok, low, expired, outOfStock }

class MedicalItem extends Equatable {
  final String id;
  final String name;
  final String unit;
  final MedicalItemType type;
  final int quantity;
  final int minQuantity;
  final DateTime? expiryDate;
  final String? manufacturer;
  final String? location;

  const MedicalItem({required this.id, required this.name, required this.unit, required this.type, required this.quantity, required this.minQuantity, this.expiryDate, this.manufacturer, this.location});

  StockStatus get status {
    if (quantity == 0) return StockStatus.outOfStock;
    if (expiryDate != null && expiryDate!.isBefore(DateTime.now())) return StockStatus.expired;
    if (quantity <= minQuantity) return StockStatus.low;
    return StockStatus.ok;
  }

  @override
  List<Object?> get props => [id, name, unit, type, quantity, minQuantity, expiryDate, manufacturer, location];
}
