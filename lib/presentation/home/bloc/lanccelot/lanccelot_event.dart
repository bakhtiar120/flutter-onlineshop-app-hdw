part of 'lanccelot_bloc.dart';

@freezed
class LanccelotEvent with _$LanccelotEvent {
  const factory LanccelotEvent.started() = _Started;
  const factory LanccelotEvent.getAllLanccelots() = _GetAllLanccelots;
}