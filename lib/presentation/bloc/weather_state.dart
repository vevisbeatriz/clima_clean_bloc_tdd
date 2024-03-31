import 'package:equatable/equatable.dart';
import 'package:clima_clean_bloc_tdd/domain/entities/weather.dart';

/// `WeatherState` is an abstract class that extends `Equatable`.
/// It represents the different types of states that can occur in the weather feature of the application.
abstract class WeatherState extends Equatable {
  const WeatherState();

  /// The `props` getter is overridden from the `Equatable` class.
  /// It returns a list of the properties that should be considered when comparing instances of `WeatherState`.
  @override
  List<Object?> get props => [];
}

/// It represents the state when no weather data is available.
class WeatherEmpty extends WeatherState {}

/// It represents the state when the application is fetching weather data.
class WeatherLoading extends WeatherState {}

/// It represents the state when the application has successfully fetched weather data.
class WeatherLoaded extends WeatherState {
  final WeatherEntity result;

  const WeatherLoaded(this.result);

  /// The `props` getter is overridden from the `Equatable` class.
  /// It returns a list of the properties that should be considered when comparing instances of `WeatherLoaded`.
  /// In this case, the `result` is the only property that is considered.
  @override
  List<Object?> get props => [result];
}

/// It represents the state when the application has failed to fetch weather data.
class WeatherLoadFailure extends WeatherState {
  final String message;

  const WeatherLoadFailure(this.message);

  /// The `props` getter is overridden from the `Equatable` class.
  /// It returns a list of the properties that should be considered when comparing instances of `WeatherLoadFailure`.
  /// In this case, the `message` is the only property that is considered.
  @override
  List<Object?> get props => [message];
}