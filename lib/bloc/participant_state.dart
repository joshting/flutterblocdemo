part of 'participant_bloc.dart';

abstract class ParticipantState extends Equatable {
  final List<Participant> participantList;
  const ParticipantState({this.participantList});

  @override
  List<Object> get props => [];
}

class ParticipantInitial extends ParticipantState {
  ParticipantInitial() : super(participantList: <Participant>[]);
}

class ParticipantListReady extends ParticipantState {
  final List<Participant> participantList;
  ParticipantListReady({@required this.participantList})
      : super(participantList: participantList);
}
