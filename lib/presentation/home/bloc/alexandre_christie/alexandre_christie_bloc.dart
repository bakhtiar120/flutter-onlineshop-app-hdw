import 'package:bloc/bloc.dart';
import 'package:flutter_onlineshop_app/data/datasource/product_remote_datasoure.dart';
import 'package:flutter_onlineshop_app/data/models/responses/product_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'alexandre_christie_event.dart';
part 'alexandre_christie_state.dart';
part 'alexandre_christie_bloc.freezed.dart';

class AlexandreChristieBloc extends Bloc<AlexandreChristieEvent, AlexandreChristieState> {
    final ProductRemoteDataSource _productRemoteDataSource;
    
    AlexandreChristieBloc(
    this._productRemoteDataSource,
  ) : super(const _Initial()) {
    on<_GetAllAlexandreChristies>((event, emit) async {
      emit(const AlexandreChristieState.loading());
      final response = await _productRemoteDataSource.getProductByCategory(2);
      response.fold(
       (l) => emit(const AlexandreChristieState.error('Internal Server Error')),
       (r) => emit(AlexandreChristieState.loaded(r.data!.data!)),
      );
    });
  }
}
