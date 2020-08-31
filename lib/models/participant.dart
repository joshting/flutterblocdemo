import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Participant extends Equatable {
  final String firstName;
  final String lastName;
  final String gender;

  Participant(
      {@required this.firstName,
      @required this.lastName,
      @required this.gender});

  @override
  List<Object> get props => [firstName, lastName, gender];

  @override
  String toString() {
    return 'Participant { firstName: $firstName, lastName: $lastName, gender: $gender }';
  }
}
