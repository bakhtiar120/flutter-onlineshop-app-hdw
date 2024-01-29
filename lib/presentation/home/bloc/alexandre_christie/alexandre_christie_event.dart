part of 'alexandre_christie_bloc.dart';

@freezed
class AlexandreChristieEvent with _$AlexandreChristieEvent {
  const factory AlexandreChristieEvent.started() = _Started;
  const factory AlexandreChristieEvent.getAllAlexandreChristies() = _GetAllAlexandreChristies;
}