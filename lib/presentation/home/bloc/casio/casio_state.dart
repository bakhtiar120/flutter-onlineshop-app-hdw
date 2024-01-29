part of 'casio_bloc.dart';

@freezed
class CasioState with _$CasioState {
  const factory CasioState.initial() = _Initial;
  const factory CasioState.loading() = _Loading;
  const factory CasioState.loaded(List<Product> products) = _Loaded;
  const factory CasioState.error(String message) = _Error;
}
