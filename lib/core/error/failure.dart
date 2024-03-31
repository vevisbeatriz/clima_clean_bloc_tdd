import 'package:equatable/equatable.dart';

/// `Failure` is an abstract class that represents a failure in the application.
/// It extends the `Equatable` class to allow for value comparison.
/// It contains a `message` that describes the failure.
abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

/// `ServerFailure` is a class that represents a server failure.
class ServerFailure extends Failure {
  ServerFailure(String message) : super(message);
}

/// `ConnectionFailure` is a class that represents a connection failure.
class ConnectionFailure extends Failure {
  ConnectionFailure(String message) : super(message);
}

/// `DatabaseFailure` is a class that represents a database failure.
class DatabaseFailure extends Failure {
  DatabaseFailure(String message) : super(message);
}