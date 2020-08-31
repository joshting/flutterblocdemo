part of 'participant_bloc.dart';

abstract class ParticipantEvent extends Equatable {
  const ParticipantEvent();

  @override
  List<Object> get props => [];
}

class ListParticipant extends ParticipantEvent {
  final DateTime lastFetch;

  const ListParticipant({@required this.lastFetch});

  @override
  List<Object> get props => [lastFetch];
}
