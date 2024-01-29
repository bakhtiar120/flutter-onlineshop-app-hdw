import 'package:bloc/bloc.dart';
import 'package:flutter_onlineshop_app/data/datasource/category_remote_datasource.dart';
import 'package:flutter_onlineshop_app/data/models/responses/category_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_event.dart';
part 'category_state.dart';
part 'category_bloc.freezed.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRemoteDataSource _categoryRemoteDataSource;
  CategoryBloc(
    this._categoryRemoteDataSource,
  ) : super(const _Initial()) {
    on<_GetCategories>((event, emit) async {
      final response = await _categoryRemoteDataSource.getCategories();
      response.fold(
       (l) => emit(const CategoryState.error('Internal Server Error')),
       (r) => emit(CategoryState.loaded(r.data!)),
      );
    });
  }
}
