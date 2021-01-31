class ServerFailure {
  // Use something like "int code;" if you want to translate error messages
  final String message;

  ServerFailure(this.message);

  @override
  String toString() => message;
}
