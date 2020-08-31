import 'dart:async';

import 'package:Bloc_Demo/models/participant.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'participant_event.dart';
part 'participant_state.dart';

class ParticipantBloc extends Bloc<ParticipantEvent, ParticipantState> {
  ParticipantBloc() : super(ParticipantInitial());

  @override
  Stream<ParticipantState> mapEventToState(
    ParticipantEvent event,
  ) async* {
    if (event is ListParticipant) {
      final List<Participant> participantList = new List<Participant>();
      // await participantRepository.getParticipants();
      yield new ParticipantListReady(participantList: participantList);
    }
  }
}
