part of 'casio_bloc.dart';

@freezed
class CasioEvent with _$CasioEvent {
  const factory CasioEvent.started() = _Started;
  const factory CasioEvent.getAllCasios() = _GetAllCasios;
}