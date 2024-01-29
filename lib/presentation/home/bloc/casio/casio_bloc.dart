import 'package:bloc/bloc.dart';
import 'package:flutter_onlineshop_app/data/datasource/product_remote_datasoure.dart';
import 'package:flutter_onlineshop_app/data/models/responses/product_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'casio_event.dart';
part 'casio_state.dart';
part 'casio_bloc.freezed.dart';

class CasioBloc extends Bloc<CasioEvent, CasioState> {
  final ProductRemoteDataSource _productRemoteDataSource;
 CasioBloc(
    this._productRemoteDataSource,
  ) : super(const _Initial()) {
    on<_GetAllCasios>((event, emit) async {
      emit(const CasioState.loading());
      final response = await _productRemoteDataSource.getProductByCategory(1);
      response.fold(
       (l) => emit(const CasioState.error('Internal Server Error')),
       (r) => emit(CasioState.loaded(r.data!.data!)),
      );
    });
  }
}
