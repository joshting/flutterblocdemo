import 'package:Bloc_Demo/bloc/participant_bloc.dart';
import 'package:Bloc_Demo/models/participant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParticipantListPage extends StatefulWidget {
  final String data;

  ParticipantListPage({Key key, @required this.data}) : super(key: key);

  @override
  _ParticipantListPageState createState() => _ParticipantListPageState();
}

class _ParticipantListPageState extends State<ParticipantListPage> {
  ParticipantBloc _participantBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _participantBloc = BlocProvider.of<ParticipantBloc>(context);
    DateTime _now = DateTime.now();
    _participantBloc.add(new ListParticipant(lastFetch: _now));
    return BlocProvider<ParticipantBloc>(
        create: (_) => _participantBloc,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Participant List'),
          ),
          body: Container(
            child: BlocConsumer<ParticipantBloc, ParticipantState>(
                builder: (context, pList) {
              return ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  Participant p = pList.participantList[index];
                  return ListTile(
                    title: Text(p.firstName, style: TextStyle(fontSize: 30)),
                    subtitle: Text(
                      "Gender: ${p.gender}",
                      style: TextStyle(fontSize: 20),
                    ),
                    // onTap: () => showParticipantDialog(context, p, index)
                  );
                },
                itemCount: pList.participantList.length,
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(color: Colors.black),
              );
            }, listener: (context, pList) {
              print('something changed - :' +
                  pList.participantList.length.toString());
            }),
          ),
        ));
  }
}
