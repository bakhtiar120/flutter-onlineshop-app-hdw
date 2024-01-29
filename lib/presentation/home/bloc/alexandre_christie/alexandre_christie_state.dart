part of 'alexandre_christie_bloc.dart';

@freezed
class AlexandreChristieState with _$AlexandreChristieState {
  const factory AlexandreChristieState.initial() = _Initial;
   const factory AlexandreChristieState.loading() = _Loading;
  const factory AlexandreChristieState.loaded(List<Product> products) = _Loaded;
  const factory AlexandreChristieState.error(String message) = _Error;
}
