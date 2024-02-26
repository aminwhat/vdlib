import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;
  final StackTrace stackTrace;
  final DateTime dateTime = DateTime.now();

  Failure(this.message, this.stackTrace);

  @override
  List<Object> get props => [message, stackTrace, dateTime];
}
