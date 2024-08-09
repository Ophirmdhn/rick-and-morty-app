class Failure {
  final String message;

  const Failure(this.message);

  @override
  String toString() => message;
}

class GeneralFailure extends Failure {
  const GeneralFailure({required String message}) : super(message);
}
