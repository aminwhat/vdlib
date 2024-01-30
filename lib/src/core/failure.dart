class Failure {
  final String message;
  final StackTrace stackTrace;
  final DateTime dateTime = DateTime.now();

  Failure(this.message, this.stackTrace);
}
