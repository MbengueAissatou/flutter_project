import 'package:doctorpoint/features/stock/domain/entities/medical_item.dart';
import 'package:doctorpoint/shared/mock_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'stock_event.dart';
part 'stock_state.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  StockBloc() : super(StockInitial()) {
    on<LoadStock>((event, emit) {
      emit(StockLoading());
      final items = event.type == null ? mockStock : mockStock.where((e) => e.type == event.type).toList();
      emit(StockLoaded(items: items, activeType: event.type));
    });
  }
}
