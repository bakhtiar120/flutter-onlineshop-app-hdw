import 'package:bloc/bloc.dart';
import 'package:flutter_onlineshop_app/data/datasource/product_remote_datasoure.dart';
import 'package:flutter_onlineshop_app/data/models/responses/product_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lanccelot_event.dart';
part 'lanccelot_state.dart';
part 'lanccelot_bloc.freezed.dart';

class LanccelotBloc extends Bloc<LanccelotEvent, LanccelotState> {
  final ProductRemoteDataSource _productRemoteDataSource;
    
    LanccelotBloc(
    this._productRemoteDataSource,
  ) : super(const _Initial()) {
    on<_GetAllLanccelots>((event, emit) async {
      emit(const LanccelotState.loading());
      final response = await _productRemoteDataSource.getProductByCategory(2);
      response.fold(
       (l) => emit(const LanccelotState.error('Internal Server Error')),
       (r) => emit(LanccelotState.loaded(r.data!.data!)),
      );
    });
  }
}
