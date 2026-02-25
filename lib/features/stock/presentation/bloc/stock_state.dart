part of 'stock_bloc.dart';

abstract class StockState extends Equatable { const StockState(); @override List<Object?> get props => []; }
class StockInitial extends StockState {}
class StockLoading extends StockState {}
class StockError extends StockState { final String message; const StockError(this.message); }
class StockLoaded extends StockState { final List<MedicalItem> items; final MedicalItemType? activeType; const StockLoaded({required this.items, this.activeType}); @override List<Object?> get props => [items, activeType]; }
