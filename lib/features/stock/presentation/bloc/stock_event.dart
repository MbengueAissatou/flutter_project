part of 'stock_bloc.dart';

abstract class StockEvent extends Equatable { const StockEvent(); @override List<Object?> get props => []; }
class LoadStock extends StockEvent { final MedicalItemType? type; const LoadStock({this.type}); }
