part of 'lanccelot_bloc.dart';

@freezed
class LanccelotState with _$LanccelotState {
  const factory LanccelotState.initial() = _Initial;
  const factory LanccelotState.loading() = _Loading;
  const factory LanccelotState.loaded(List<Product> products) = _Loaded;
  const factory LanccelotState.error(String message) = _Error;
}
